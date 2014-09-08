From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Mon, 08 Sep 2014 20:47:59 +1200
Message-ID: <540D6D3F.8070009@gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org> <540127EE.7080900@gmail.com> <CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,
> Hi Michael,
>
> On Sat, Aug 30, 2014 at 3:25 AM, Michael Schmitz <schmitzmic@gmail.co=
m> wrote:
>> that's certainly correct - the EtherNAT version of the USB driver di=
dn't
>> need the ROM accessors but the version including NetUSBee support do=
es for
>> sure.
>>
>> Thanks!
>>
>> Ack'ed-by: Michael Schmitz <schmitzmic@gmail.com>
>>
>>> If CONFIG_ATARI_ROM_ISA=3Dn:
>>>
>>> drivers/usb/host/isp116x.h: In function =91isp116x_write_addr=92:
>>> drivers/usb/host/isp116x.h:382: error: implicit declaration of func=
tion
>>> =91isa_rom_writew_raw=92
>>> drivers/usb/host/isp116x.h: In function =91isp116x_raw_write_data16=
=92:
>>> drivers/usb/host/isp116x.h:394: error: implicit declaration of func=
tion
>>> =91isa_rom_writew=92
>>> drivers/usb/host/isp116x.h: In function =91isp116x_read_data16=92:
>>> drivers/usb/host/isp116x.h:402: error: implicit declaration of func=
tion
>>> =91isa_rom_readw_raw=92
>>> drivers/usb/host/isp116x.h: In function =91isp116x_raw_read_data16=92=
:
>>> drivers/usb/host/isp116x.h:411: error: implicit declaration of func=
tion
>>> =91isa_rom_readw=92
>>>
>>> The isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA instead=
 of
>>> on CONFIG_ATARI.
> Upon closer look, I think I broke the NetUSBee support if CONFIG_ATAR=
I_ROM_ISA
> is not set, as the mapping from isp_*() to low-level I/O accessors is
> different.

That is right - CONFIG_ATARI_ROM_ISA is required for proper function of=
=20
the NetUSBee. The option should have been set by Kconfig magic anyway -=
=20
need to check that but obviously you did succeed to configure it=20
without... That option ensures that the correct bus accessor is availab=
le.

BTW, what I have in this case is:

#ifdef CONFIG_ATARI
/*
* 16 bit data bus byte swapped in hardware on both Atari variants.
* EtherNAT variant of ISP1160 integration is memory mapped at 0x800000X=
X,
* and uses regular readw/__raw_readw (but semantics swapped).
* NetUSBee variant is hooked up through ROM port and uses ROM port
* IO access, with fake IO address of 0x3XX.
* Selection of the appropriate accessors relies on ioremapped addresses=
=20
still
* retaining the 0x3XX bit.
*/
#define isp_readw(p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=3D=20
0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
#define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=3D=
=20
0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p=
)))
#define isp_raw_readw(p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=3D=
=20
0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
#define isp_raw_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00)=20
=3D=3D 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
#else
/* sane hardware */
#define isp_readw readw
#define isp_writew writew
#define isp_raw_readw __raw_readw
#define isp_raw_writew __raw_writew
#endif

Much messier than yours due to the ioremap stuff.

>
> On NetUSBee with CONFIG_ATARI_ROM_ISA=3Dy, we now have:
>
> #ifdef CONFIG_ATARI_ROM_ISA
> #define isp_readw(p)            (__raw_readw((p)))
> #define isp_writew(v, p)        (__raw_writew((v), (p)))
> #define isp_raw_readw(p)        (readw((p)))
> #define isp_raw_writew(v, p)    (writew((v), (p)))
> #else
>    /* sane hardware */
> #define isp_readw               readw
> #define isp_writew              writew
> #define isp_raw_readw           __raw_readw
> #define isp_raw_writew          __raw_writew
> #endif
>
> Before my patch, there was an "#ifdef CONFIG_ATARI", so the plain isp=
_*()
> mapped to the raw ops on Atari, but to the plain ones elsewhere, whil=
e the
> isp_raw_*() mapped to the plain ops on Atari, but the raw ops elsewhe=
re.

Correct - the semantics of raw vs. normal access is reversed on _both_=20
the Atari variants of the ISP1160 due to byte-swapping in the bus=20
interface.

Now, if NetUSBee is _not_ configured, and CONFIG_ATARI_ROM_ISA is not=20
set, your patch selects the 'sane' option for Atari (the EtherNAT=20
interface). That won't work - the weird vs. sane selection needs to be=20
done based on platform not bus type. I missed that earlier.

> The plain ops do byteswapping on m68k. If you change the mapping, per=
haps
> you can get rid of some of the #ifdefs in drivers/usb/host/isp116x-hc=
d.c?

We had tried that to no avail. The #ifdefs are there only for cases=20
where the buffer is not aligned properly to a 16-bit boundary, so swaps=
=20
of the first and last word would be messed up.

The original driver uses normal reads for everything but sending USB=20
data to the chip, assuming a native endian bus interface for the chip s=
o=20
byte swapping is done by the readw / writew. USB data are prepared as=20
little endian in the memory buffer, so no swapping must be done there.

The Atari implementation has the wires (bytes) crossed in hardware (jus=
t=20
like with the IDE interface - why stop once you've made a stupid design=
=20
mistake). No swapping by readw/writew must be done in software (taken=20
care by hardware) but we must swap the USB packet data (to cancel the=20
swap done in hardware).

I've pondered this many times and seen no way to avoid the defines.

> P.S. Shall I revert my patch for now?

Yes, please. I forgot about the consequences for the EtherNAT earlier.=20
Still need to ensure CONFIG_ATARI_ROM_ISA is set for NetUSBee though.=20
Maybe select ATARI_ROM_ISA if ATARI_USB is selected in Kconfig.bus, jus=
t=20
to be safe?

The help text there could use an update as well - mention NetUSBee as=20
user of ATARI_ROM_ISA in addition to EtherNEC, and mention the need for=
=20
ATARI_ROM_ISA for the NetUSBee in the ATARI_USB section, if you rather=20
not pre-select ATARI_ROM_ISA there. Does this make sense?


Cheers,

Michael
