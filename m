From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Mon, 8 Sep 2014 09:45:16 +0200
Message-ID: <CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
	<540127EE.7080900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <540127EE.7080900@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Michael,

On Sat, Aug 30, 2014 at 3:25 AM, Michael Schmitz <schmitzmic@gmail.com>=
 wrote:
> that's certainly correct - the EtherNAT version of the USB driver did=
n't
> need the ROM accessors but the version including NetUSBee support doe=
s for
> sure.
>
> Thanks!
>
> Ack'ed-by: Michael Schmitz <schmitzmic@gmail.com>
>
>> If CONFIG_ATARI_ROM_ISA=3Dn:
>>
>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_write_addr=E2=
=80=99:
>> drivers/usb/host/isp116x.h:382: error: implicit declaration of funct=
ion
>> =E2=80=98isa_rom_writew_raw=E2=80=99
>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_write_d=
ata16=E2=80=99:
>> drivers/usb/host/isp116x.h:394: error: implicit declaration of funct=
ion
>> =E2=80=98isa_rom_writew=E2=80=99
>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_read_data16=
=E2=80=99:
>> drivers/usb/host/isp116x.h:402: error: implicit declaration of funct=
ion
>> =E2=80=98isa_rom_readw_raw=E2=80=99
>> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_read_da=
ta16=E2=80=99:
>> drivers/usb/host/isp116x.h:411: error: implicit declaration of funct=
ion
>> =E2=80=98isa_rom_readw=E2=80=99
>>
>> The isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA instead =
of
>> on CONFIG_ATARI.

Upon closer look, I think I broke the NetUSBee support if CONFIG_ATARI_=
ROM_ISA
is not set, as the mapping from isp_*() to low-level I/O accessors is
different.

On NetUSBee with CONFIG_ATARI_ROM_ISA=3Dy, we now have:

#ifdef CONFIG_ATARI_ROM_ISA
#define isp_readw(p)            (__raw_readw((p)))
#define isp_writew(v, p)        (__raw_writew((v), (p)))
#define isp_raw_readw(p)        (readw((p)))
#define isp_raw_writew(v, p)    (writew((v), (p)))
#else
  /* sane hardware */
#define isp_readw               readw
#define isp_writew              writew
#define isp_raw_readw           __raw_readw
#define isp_raw_writew          __raw_writew
#endif

Before my patch, there was an "#ifdef CONFIG_ATARI", so the plain isp_*=
()
mapped to the raw ops on Atari, but to the plain ones elsewhere, while =
the
isp_raw_*() mapped to the plain ops on Atari, but the raw ops elsewhere=
=2E

The plain ops do byteswapping on m68k. If you change the mapping, perha=
ps
you can get rid of some of the #ifdefs in drivers/usb/host/isp116x-hcd.=
c?

P.S. Shall I revert my patch for now?

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
