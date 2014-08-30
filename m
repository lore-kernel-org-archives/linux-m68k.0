From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Sat, 30 Aug 2014 13:25:02 +1200
Message-ID: <540127EE.7080900@gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

Hi Geert,

that's certainly correct - the EtherNAT version of the USB driver didn'=
t=20
need the ROM accessors but the version including NetUSBee support does=20
for sure.

Thanks!

Ack'ed-by: Michael Schmitz <schmitzmic@gmail.com>

> If CONFIG_ATARI_ROM_ISA=3Dn:
>
> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_write_addr=E2=
=80=99:
> drivers/usb/host/isp116x.h:382: error: implicit declaration of functi=
on =E2=80=98isa_rom_writew_raw=E2=80=99
> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_write_da=
ta16=E2=80=99:
> drivers/usb/host/isp116x.h:394: error: implicit declaration of functi=
on =E2=80=98isa_rom_writew=E2=80=99
> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_read_data16=E2=
=80=99:
> drivers/usb/host/isp116x.h:402: error: implicit declaration of functi=
on =E2=80=98isa_rom_readw_raw=E2=80=99
> drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_read_dat=
a16=E2=80=99:
> drivers/usb/host/isp116x.h:411: error: implicit declaration of functi=
on =E2=80=98isa_rom_readw=E2=80=99
>
> The isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA instead o=
f
> on CONFIG_ATARI.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> To be folded into "m68k/atari: USB - add ISP1160 USB host controller
> support"
> ---
>   drivers/usb/host/isp116x.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
> index c436f55f2882..634258df159b 100644
> --- a/drivers/usb/host/isp116x.h
> +++ b/drivers/usb/host/isp116x.h
> @@ -355,7 +355,7 @@ struct isp116x_ep {
>   #endif
>  =20
>  =20
> -#ifdef CONFIG_ATARI
> +#ifdef CONFIG_ATARI_ROM_ISA
>     /*
>      * 16 bit data bus byte swapped in hardware on both Atari variant=
s.
>      * EtherNAT variant of ISP1160 integration is memory mapped at 0x=
800000XX,
