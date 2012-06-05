From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/11] Atari: fix EtherNAT interrupt; conditonal platform
 device register
Date: Tue, 5 Jun 2012 22:07:59 +0200
Message-ID: <CAMuHMdUrFzgjRmB6B9N7u9M2pT3Ta_D3eAmXX68oXQK5KZD7Rw@mail.gmail.com>
References: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:52949 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752372Ab2FEUIA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:08:00 -0400
Received: by gglu4 with SMTP id u4so4371750ggl.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:07:59 -0700 (PDT)
In-Reply-To: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:48 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -662,7 +662,7 @@ static void atari_get_hardware_list(struct seq_fi=
le *m)
> =C2=A0*/
>
> =C2=A0#define ATARI_ETHERNAT_PHYS_ADDR =C2=A0 =C2=A0 =C2=A0 0x8000000=
0
> -#define ATARI_ETHERNAT_IRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0xc3
> +#define ATARI_ETHERNAT_IRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 140

So the EtherNAT does have a working interrupt line?

> @@ -686,16 +686,27 @@ static struct platform_device smc91x_device =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.resource =C2=A0 =C2=A0 =C2=A0 =3D smc91x_=
resources,
> =C2=A0};
>
> -static struct platform_device *atari_platform_devices[] __initdata =3D=
 {
> +static struct platform_device *atari_ethernat_devices[] __initdata =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&smc91x_device
> =C2=A0};
>
> =C2=A0int __init atari_platform_init(void)
> =C2=A0{
> + =C2=A0 =C2=A0 =C2=A0 unsigned char *enatc_virt;
> + =C2=A0 =C2=A0 =C2=A0 int rv =3D -ENODEV;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!MACH_IS_ATARI)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;
>
> - =C2=A0 =C2=A0 =C2=A0 return platform_add_devices(atari_platform_dev=
ices, ARRAY_SIZE(atari_platform_devices));
> +#if IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
> + =C2=A0 =C2=A0 =C2=A0 enatc_virt =3D (unsigned char *)ioremap((ATARI=
_ETHERNAT_PHYS_ADDR+0x23), 0xf);
> + =C2=A0 =C2=A0 =C2=A0 if (hwreg_present(enatc_virt)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *enatc_virt |=3D 0=
x2; =C2=A0 =C2=A0 /* enable SMC91C111 interrupt */

Do you really want to do that here?
Typically this is done by the driver itself, in its probe() routine.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv =3D platform_ad=
d_devices(atari_ethernat_devices, ARRAY_SIZE(atari_ethernat_devices));
> + =C2=A0 =C2=A0 =C2=A0 }
> +#endif
> +
> + =C2=A0 =C2=A0 =C2=A0 return rv;
> =C2=A0}
>
> =C2=A0arch_initcall(atari_platform_init);

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
