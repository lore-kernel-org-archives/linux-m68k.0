From: mohamed nabil <m.nabil.hafez@gmail.com>
Subject: Re: [PATCH 21/22] m68knommu: simplify the ColdFire
 532x GPIO struct setup
Date: Thu, 26 Apr 2012 02:36:20 +0200
Message-ID: <CAECAou69e8KJ53SqEO1e_J4dmkVRhKV=Z5fUEz6tzyxKrzXCDA@mail.gmail.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
 <1335399962-10308-22-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5153607924967324510=="
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1335399962-10308-22-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

--===============5153607924967324510==
Content-Type: multipart/alternative; boundary=bcaec554001a351cfd04be8a2d07

--bcaec554001a351cfd04be8a2d07
Content-Type: text/plain; charset=ISO-8859-1

that's a Fucking spam man !!

On Thu, Apr 26, 2012 at 2:26 AM, <gerg@snapgear.com> wrote:

> From: Greg Ungerer <gerg@uclinux.org>
>
> The GPIO data struct setup is now the only remaining code in the platform
> gpio.c file. So move it to the platform config.c code and remove the gpio.c
> file.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
>  arch/m68k/platform/532x/Makefile |    2 +-
>  arch/m68k/platform/532x/config.c |   25 ++++++++++++++++++++++
>  arch/m68k/platform/532x/gpio.c   |   43
> --------------------------------------
>  3 files changed, 26 insertions(+), 44 deletions(-)
>  delete mode 100644 arch/m68k/platform/532x/gpio.c
>
> diff --git a/arch/m68k/platform/532x/Makefile
> b/arch/m68k/platform/532x/Makefile
> index ce01669..c0d8cf8 100644
> --- a/arch/m68k/platform/532x/Makefile
> +++ b/arch/m68k/platform/532x/Makefile
> @@ -15,4 +15,4 @@
>  asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
>
>  #obj-y := config.o usb-mcf532x.o spi-mcf532x.o
> -obj-y := config.o gpio.o
> +obj-y := config.o
> diff --git a/arch/m68k/platform/532x/config.c
> b/arch/m68k/platform/532x/config.c
> index 2bec347..a4dd3d8 100644
> --- a/arch/m68k/platform/532x/config.c
> +++ b/arch/m68k/platform/532x/config.c
> @@ -26,10 +26,35 @@
>  #include <asm/mcfsim.h>
>  #include <asm/mcfuart.h>
>  #include <asm/mcfdma.h>
> +#include <asm/mcfgpio.h>
>  #include <asm/mcfwdebug.h>
>
>
>  /***************************************************************************/
>
> +struct mcf_gpio_chip mcf_gpio_chips[] = {
> +       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
> +       MCFGPF(FECH, 8, 8),
> +       MCFGPF(FECL, 16, 8),
> +       MCFGPF(SSI, 24, 5),
> +       MCFGPF(BUSCTL, 32, 4),
> +       MCFGPF(BE, 40, 4),
> +       MCFGPF(CS, 49, 5),
> +       MCFGPF(PWM, 58, 4),
> +       MCFGPF(FECI2C, 64, 4),
> +       MCFGPF(UART, 72, 8),
> +       MCFGPF(QSPI, 80, 6),
> +       MCFGPF(TIMER, 88, 4),
> +       MCFGPF(LCDDATAH, 96, 2),
> +       MCFGPF(LCDDATAM, 104, 8),
> +       MCFGPF(LCDDATAL, 112, 8),
> +       MCFGPF(LCDCTLH, 120, 1),
> +       MCFGPF(LCDCTLL, 128, 8),
> +};
> +
> +unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
> +
>
> +/***************************************************************************/
> +
>  #ifdef CONFIG_SPI_COLDFIRE_QSPI
>
>  static void __init m532x_qspi_init(void)
> diff --git a/arch/m68k/platform/532x/gpio.c
> b/arch/m68k/platform/532x/gpio.c
> deleted file mode 100644
> index 3e1b71d..0000000
> --- a/arch/m68k/platform/532x/gpio.c
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -/*
> - * Coldfire generic GPIO support
> - *
> - * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; version 2 of the License.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> -*/
> -
> -#include <linux/kernel.h>
> -#include <linux/init.h>
> -
> -#include <asm/coldfire.h>
> -#include <asm/mcfsim.h>
> -#include <asm/mcfgpio.h>
> -
> -struct mcf_gpio_chip mcf_gpio_chips[] = {
> -       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
> -       MCFGPF(FECH, 8, 8),
> -       MCFGPF(FECL, 16, 8),
> -       MCFGPF(SSI, 24, 5),
> -       MCFGPF(BUSCTL, 32, 4),
> -       MCFGPF(BE, 40, 4),
> -       MCFGPF(CS, 49, 5),
> -       MCFGPF(PWM, 58, 4),
> -       MCFGPF(FECI2C, 64, 4),
> -       MCFGPF(UART, 72, 8),
> -       MCFGPF(QSPI, 80, 6),
> -       MCFGPF(TIMER, 88, 4),
> -       MCFGPF(LCDDATAH, 96, 2),
> -       MCFGPF(LCDDATAM, 104, 8),
> -       MCFGPF(LCDDATAL, 112, 8),
> -       MCFGPF(LCDCTLH, 120, 1),
> -       MCFGPF(LCDCTLL, 128, 8),
> -};
> -
> -unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
> --
> 1.7.0.4
>
> _______________________________________________
> uClinux-dev mailing list
> uClinux-dev@uclinux.org
> http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
> This message was resent by uclinux-dev@uclinux.org
> To unsubscribe see:
> http://mailman.uclinux.org/mailman/options/uclinux-dev
>



-- 
______
Mohamed Nabil Hafez
Embedded Software Engineer

--bcaec554001a351cfd04be8a2d07
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">that&#39;s a Fucking spam man !=
!<br><br><div class=3D"gmail_quote">On Thu, Apr 26, 2012 at 2:26 AM,  <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:gerg@snapgear.com" target=3D"_blank">ger=
g@snapgear.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Greg Ungerer &lt;<a href=3D"mailto:ger=
g@uclinux.org">gerg@uclinux.org</a>&gt;<br>
<br>
The GPIO data struct setup is now the only remaining code in the platform<b=
r>
gpio.c file. So move it to the platform config.c code and remove the gpio.c=
<br>
file.<br>
<br>
Signed-off-by: Greg Ungerer &lt;<a href=3D"mailto:gerg@uclinux.org">gerg@uc=
linux.org</a>&gt;<br>
---<br>
=A0arch/m68k/platform/532x/Makefile | =A0 =A02 +-<br>
=A0arch/m68k/platform/532x/config.c | =A0 25 ++++++++++++++++++++++<br>
=A0arch/m68k/platform/532x/gpio.c =A0 | =A0 43 ----------------------------=
----------<br>
=A03 files changed, 26 insertions(+), 44 deletions(-)<br>
=A0delete mode 100644 arch/m68k/platform/532x/gpio.c<br>
<br>
diff --git a/arch/m68k/platform/532x/Makefile b/arch/m68k/platform/532x/Mak=
efile<br>
index ce01669..c0d8cf8 100644<br>
--- a/arch/m68k/platform/532x/Makefile<br>
+++ b/arch/m68k/platform/532x/Makefile<br>
@@ -15,4 +15,4 @@<br>
=A0asflags-$(CONFIG_FULLDEBUG) :=3D -DDEBUGGER_COMPATIBLE_CACHE=3D1<br>
<br>
=A0#obj-y :=3D config.o usb-mcf532x.o spi-mcf532x.o<br>
-obj-y :=3D config.o gpio.o<br>
+obj-y :=3D config.o<br>
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/con=
fig.c<br>
index 2bec347..a4dd3d8 100644<br>
--- a/arch/m68k/platform/532x/config.c<br>
+++ b/arch/m68k/platform/532x/config.c<br>
@@ -26,10 +26,35 @@<br>
=A0#include &lt;asm/mcfsim.h&gt;<br>
=A0#include &lt;asm/mcfuart.h&gt;<br>
=A0#include &lt;asm/mcfdma.h&gt;<br>
+#include &lt;asm/mcfgpio.h&gt;<br>
=A0#include &lt;asm/mcfwdebug.h&gt;<br>
<br>
=A0/***********************************************************************=
****/<br>
<br>
+struct mcf_gpio_chip mcf_gpio_chips[] =3D {<br>
+ =A0 =A0 =A0 MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EP=
PDR),<br>
+ =A0 =A0 =A0 MCFGPF(FECH, 8, 8),<br>
+ =A0 =A0 =A0 MCFGPF(FECL, 16, 8),<br>
+ =A0 =A0 =A0 MCFGPF(SSI, 24, 5),<br>
+ =A0 =A0 =A0 MCFGPF(BUSCTL, 32, 4),<br>
+ =A0 =A0 =A0 MCFGPF(BE, 40, 4),<br>
+ =A0 =A0 =A0 MCFGPF(CS, 49, 5),<br>
+ =A0 =A0 =A0 MCFGPF(PWM, 58, 4),<br>
+ =A0 =A0 =A0 MCFGPF(FECI2C, 64, 4),<br>
+ =A0 =A0 =A0 MCFGPF(UART, 72, 8),<br>
+ =A0 =A0 =A0 MCFGPF(QSPI, 80, 6),<br>
+ =A0 =A0 =A0 MCFGPF(TIMER, 88, 4),<br>
+ =A0 =A0 =A0 MCFGPF(LCDDATAH, 96, 2),<br>
+ =A0 =A0 =A0 MCFGPF(LCDDATAM, 104, 8),<br>
+ =A0 =A0 =A0 MCFGPF(LCDDATAL, 112, 8),<br>
+ =A0 =A0 =A0 MCFGPF(LCDCTLH, 120, 1),<br>
+ =A0 =A0 =A0 MCFGPF(LCDCTLL, 128, 8),<br>
+};<br>
+<br>
+unsigned int mcf_gpio_chips_size =3D ARRAY_SIZE(mcf_gpio_chips);<br>
+<br>
+/*************************************************************************=
**/<br>
+<br>
=A0#ifdef CONFIG_SPI_COLDFIRE_QSPI<br>
<br>
=A0static void __init m532x_qspi_init(void)<br>
diff --git a/arch/m68k/platform/532x/gpio.c b/arch/m68k/platform/532x/gpio.=
c<br>
deleted file mode 100644<br>
index 3e1b71d..0000000<br>
--- a/arch/m68k/platform/532x/gpio.c<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-/*<br>
- * Coldfire generic GPIO support<br>
- *<br>
- * (C) Copyright 2009, Steven King &lt;<a href=3D"mailto:sfking@fdwdc.com"=
>sfking@fdwdc.com</a>&gt;<br>
- *<br>
- * This program is free software; you can redistribute it and/or modify<br=
>
- * it under the terms of the GNU General Public License as published by<br=
>
- * the Free Software Foundation; version 2 of the License.<br>
- *<br>
- * This program is distributed in the hope that it will be useful,<br>
- * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the<br>
- * GNU General Public License for more details.<br>
-*/<br>
-<br>
-#include &lt;linux/kernel.h&gt;<br>
-#include &lt;linux/init.h&gt;<br>
-<br>
-#include &lt;asm/coldfire.h&gt;<br>
-#include &lt;asm/mcfsim.h&gt;<br>
-#include &lt;asm/mcfgpio.h&gt;<br>
-<br>
-struct mcf_gpio_chip mcf_gpio_chips[] =3D {<br>
- =A0 =A0 =A0 MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EP=
PDR),<br>
- =A0 =A0 =A0 MCFGPF(FECH, 8, 8),<br>
- =A0 =A0 =A0 MCFGPF(FECL, 16, 8),<br>
- =A0 =A0 =A0 MCFGPF(SSI, 24, 5),<br>
- =A0 =A0 =A0 MCFGPF(BUSCTL, 32, 4),<br>
- =A0 =A0 =A0 MCFGPF(BE, 40, 4),<br>
- =A0 =A0 =A0 MCFGPF(CS, 49, 5),<br>
- =A0 =A0 =A0 MCFGPF(PWM, 58, 4),<br>
- =A0 =A0 =A0 MCFGPF(FECI2C, 64, 4),<br>
- =A0 =A0 =A0 MCFGPF(UART, 72, 8),<br>
- =A0 =A0 =A0 MCFGPF(QSPI, 80, 6),<br>
- =A0 =A0 =A0 MCFGPF(TIMER, 88, 4),<br>
- =A0 =A0 =A0 MCFGPF(LCDDATAH, 96, 2),<br>
- =A0 =A0 =A0 MCFGPF(LCDDATAM, 104, 8),<br>
- =A0 =A0 =A0 MCFGPF(LCDDATAL, 112, 8),<br>
- =A0 =A0 =A0 MCFGPF(LCDCTLH, 120, 1),<br>
- =A0 =A0 =A0 MCFGPF(LCDCTLL, 128, 8),<br>
-};<br>
-<br>
-unsigned int mcf_gpio_chips_size =3D ARRAY_SIZE(mcf_gpio_chips);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.0.4<br>
<br>
_______________________________________________<br>
uClinux-dev mailing list<br>
<a href=3D"mailto:uClinux-dev@uclinux.org">uClinux-dev@uclinux.org</a><br>
<a href=3D"http://mailman.uclinux.org/mailman/listinfo/uclinux-dev" target=
=3D"_blank">http://mailman.uclinux.org/mailman/listinfo/uclinux-dev</a><br>
This message was resent by <a href=3D"mailto:uclinux-dev@uclinux.org">uclin=
ux-dev@uclinux.org</a><br>
To unsubscribe see:<br>
<a href=3D"http://mailman.uclinux.org/mailman/options/uclinux-dev" target=
=3D"_blank">http://mailman.uclinux.org/mailman/options/uclinux-dev</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>______<br>Mohamed Nabil Hafez<br>Embedded Software Engineer <br><br>
</div></div>

--bcaec554001a351cfd04be8a2d07--

--===============5153607924967324510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
--===============5153607924967324510==--
