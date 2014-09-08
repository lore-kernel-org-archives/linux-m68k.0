From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Mon, 8 Sep 2014 11:04:58 +0200
Message-ID: <CAMuHMdWZGpbVTvJypNXejpEQRUrSQbqbMCx=-Sy=7zQiPPsAFQ@mail.gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
	<540127EE.7080900@gmail.com>
	<CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com>
	<540D6D3F.8070009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <540D6D3F.8070009@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Michael,

On Mon, Sep 8, 2014 at 10:47 AM, Michael Schmitz <schmitzmic@gmail.com>=
 wrote:
>> On Sat, Aug 30, 2014 at 3:25 AM, Michael Schmitz <schmitzmic@gmail.c=
om>
>> wrote:
>>>
>>> that's certainly correct - the EtherNAT version of the USB driver d=
idn't
>>> need the ROM accessors but the version including NetUSBee support d=
oes
>>> for
>>> sure.
>>>
>>> Thanks!
>>>
>>> Ack'ed-by: Michael Schmitz <schmitzmic@gmail.com>
>>>
>>>> If CONFIG_ATARI_ROM_ISA=3Dn:
>>>>
>>>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_write_add=
r=E2=80=99:
>>>> drivers/usb/host/isp116x.h:382: error: implicit declaration of fun=
ction
>>>> =E2=80=98isa_rom_writew_raw=E2=80=99
>>>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_write=
_data16=E2=80=99:
>>>> drivers/usb/host/isp116x.h:394: error: implicit declaration of fun=
ction
>>>> =E2=80=98isa_rom_writew=E2=80=99
>>>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_read_data=
16=E2=80=99:
>>>> drivers/usb/host/isp116x.h:402: error: implicit declaration of fun=
ction
>>>> =E2=80=98isa_rom_readw_raw=E2=80=99
>>>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_read_=
data16=E2=80=99:
>>>> drivers/usb/host/isp116x.h:411: error: implicit declaration of fun=
ction
>>>> =E2=80=98isa_rom_readw=E2=80=99
>>>>
>>>> The isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA instea=
d of
>>>> on CONFIG_ATARI.
>>
>> Upon closer look, I think I broke the NetUSBee support if

Aarghl, I meant EtherNAT. Sorry, I misread who's using ATARI ROM ISA an=
d
who's using memory mapped I/O.

>> CONFIG_ATARI_ROM_ISA
>> is not set, as the mapping from isp_*() to low-level I/O accessors i=
s
>> different.
>
> That is right - CONFIG_ATARI_ROM_ISA is required for proper function =
of the
> NetUSBee. The option should have been set by Kconfig magic anyway - n=
eed to
> check that but obviously you did succeed to configure it without... T=
hat
> option ensures that the correct bus accessor is available.
>
> BTW, what I have in this case is:
>
> #ifdef CONFIG_ATARI
> /*
> * 16 bit data bus byte swapped in hardware on both Atari variants.
> * EtherNAT variant of ISP1160 integration is memory mapped at 0x80000=
0XX,
> * and uses regular readw/__raw_readw (but semantics swapped).
> * NetUSBee variant is hooked up through ROM port and uses ROM port
> * IO access, with fake IO address of 0x3XX.
> * Selection of the appropriate accessors relies on ioremapped address=
es
> still
> * retaining the 0x3XX bit.
> */
> #define isp_readw(p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=3D
> 0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
> #define isp_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=
=3D
> 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), =
(p)))
> #define isp_raw_readw(p) ((((unsigned long)(__pa(p)) & 0x00000F00) =3D=
=3D
> 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
> #define isp_raw_writew(v, p) ((((unsigned long)(__pa(p)) & 0x00000F00=
) =3D=3D
> 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
> #else
> /* sane hardware */
> #define isp_readw readw
> #define isp_writew writew
> #define isp_raw_readw __raw_readw
> #define isp_raw_writew __raw_writew
> #endif
>
> Much messier than yours due to the ioremap stuff.

I had left out the isa_rom_*() clutter, as I was really talking about
EtherNAT.

>> On NetUSBee with CONFIG_ATARI_ROM_ISA=3Dy, we now have:
>>
>> #ifdef CONFIG_ATARI_ROM_ISA
>> #define isp_readw(p)            (__raw_readw((p)))
>> #define isp_writew(v, p)        (__raw_writew((v), (p)))
>> #define isp_raw_readw(p)        (readw((p)))
>> #define isp_raw_writew(v, p)    (writew((v), (p)))
>> #else
>>    /* sane hardware */
>> #define isp_readw               readw
>> #define isp_writew              writew
>> #define isp_raw_readw           __raw_readw
>> #define isp_raw_writew          __raw_writew
>> #endif
>>
>> Before my patch, there was an "#ifdef CONFIG_ATARI", so the plain is=
p_*()
>> mapped to the raw ops on Atari, but to the plain ones elsewhere, whi=
le the
>> isp_raw_*() mapped to the plain ops on Atari, but the raw ops elsewh=
ere.
>
> Correct - the semantics of raw vs. normal access is reversed on _both=
_ the
> Atari variants of the ISP1160 due to byte-swapping in the bus interfa=
ce.

OK.

> Now, if NetUSBee is _not_ configured, and CONFIG_ATARI_ROM_ISA is not=
 set,
> your patch selects the 'sane' option for Atari (the EtherNAT interfac=
e).
> That won't work - the weird vs. sane selection needs to be done based=
 on
> platform not bus type. I missed that earlier.

OK.

>> The plain ops do byteswapping on m68k. If you change the mapping, pe=
rhaps
>> you can get rid of some of the #ifdefs in drivers/usb/host/isp116x-h=
cd.c?
>
> We had tried that to no avail. The #ifdefs are there only for cases w=
here
> the buffer is not aligned properly to a 16-bit boundary, so swaps of =
the
> first and last word would be messed up.
>
> The original driver uses normal reads for everything but sending USB =
data to
> the chip, assuming a native endian bus interface for the chip so byte
> swapping is done by the readw / writew. USB data are prepared as litt=
le
> endian in the memory buffer, so no swapping must be done there.
>
> The Atari implementation has the wires (bytes) crossed in hardware (j=
ust
> like with the IDE interface - why stop once you've made a stupid desi=
gn
> mistake). No swapping by readw/writew must be done in software (taken=
 care
> by hardware) but we must swap the USB packet data (to cancel the swap=
 done
> in hardware).
>
> I've pondered this many times and seen no way to avoid the defines.

OK.

>> P.S. Shall I revert my patch for now?
>
> Yes, please. I forgot about the consequences for the EtherNAT earlier=
=2E Still

OK, will do.

> need to ensure CONFIG_ATARI_ROM_ISA is set for NetUSBee though. Maybe=
 select
> ATARI_ROM_ISA if ATARI_USB is selected in Kconfig.bus, just to be saf=
e?

But ATARI_ROM_ISA is not needed for EtherNAT? So I'd rather not add thi=
s
dependency.

This does mean we have to distinguish in isp116x.h between three case, =
right?
  - #ifdef CONFIG_ATARI_ROM_ISA=3Dy: handle both
  - elif defined(CONFIG_ATARI): handle EtherNAT only
  - else: others

> The help text there could use an update as well - mention NetUSBee as=
 user
> of ATARI_ROM_ISA in addition to EtherNEC, and mention the need for
> ATARI_ROM_ISA for the NetUSBee in the ATARI_USB section, if you rathe=
r not
> pre-select ATARI_ROM_ISA there. Does this make sense?

Yes it does.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
