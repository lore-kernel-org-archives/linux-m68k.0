From: mohamed nabil <m.nabil.hafez@gmail.com>
Subject: Re: [PATCH 21/22] m68knommu: simplify the ColdFire
 532x GPIO struct setup
Date: Thu, 26 Apr 2012 03:10:45 +0200
Message-ID: <CAECAou40HhdZL5EvySwF4bxw71ahpdjM2DEfty4r7N7fsPJfbg@mail.gmail.com>
References: <BLU0-SMTP466FE400E21A67A2EC82F91D9240@phx.gbl>
 <4F989FE1.1090109@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3675241749378684453=="
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <4F989FE1.1090109@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

--===============3675241749378684453==
Content-Type: multipart/alternative; boundary=bcaec553fefa516efa04be8aa8a6

--bcaec553fefa516efa04be8aa8a6
Content-Type: text/plain; charset=ISO-8859-1

Ah , Bloody Hell , we should punish this "reflecter"
but still 23 emails are too much for 1 bloody min ?  no ?

On Thu, Apr 26, 2012 at 3:07 AM, Greg Ungerer <gerg@snapgear.com> wrote:

> Hi Alex,
>
>
> On 04/26/2012 10:53 AM, Alex LI wrote:
>
>> You sent 50 mails in 1 min.
>>
>
> I sent 23. And both list archives (linux-m68k and uclinux-dev) only
> show the 23 emails.
>
> Maybe the uclinux-dev reflecter is sending dupes to list recpients?
>
> Regards
> Greg
>
>
>
>  Sent from my Sony Ericsson Xperia arc S
>>
>> Greg Ungerer<gerg@snapgear.com>  ?:
>>
>>
>>  On 04/26/2012 10:36 AM, mohamed nabil wrote:
>>>
>>>> that's a Fucking spam man !!
>>>>
>>>
>>> Huh?
>>>
>>> Thats how open source development works. If you don't like it don't
>>> subscribe to a developers list.
>>>
>>> Regards
>>> Greg
>>>
>>>
>>>
>>>  On Thu, Apr 26, 2012 at 2:26 AM,<gerg@snapgear.com
>>>> <mailto:gerg@snapgear.com>>  wrote:
>>>>
>>>>     From: Greg Ungerer<gerg@uclinux.org<**mailto:gerg@uclinux.org>>
>>>>
>>>>     The GPIO data struct setup is now the only remaining code in the
>>>>     platform
>>>>     gpio.c file. So move it to the platform config.c code and remove the
>>>>     gpio.c
>>>>     file.
>>>>
>>>>     Signed-off-by: Greg Ungerer<gerg@uclinux.org<**mailto:
>>>> gerg@uclinux.org>>
>>>>     ---
>>>>       arch/m68k/platform/532x/**Makefile |    2 +-
>>>>       arch/m68k/platform/532x/**config.c |   25 ++++++++++++++++++++++
>>>>       arch/m68k/platform/532x/gpio.c   |   43
>>>>     ------------------------------**--------
>>>>       3 files changed, 26 insertions(+), 44 deletions(-)
>>>>       delete mode 100644 arch/m68k/platform/532x/gpio.c
>>>>
>>>>     diff --git a/arch/m68k/platform/532x/**Makefile
>>>>     b/arch/m68k/platform/532x/**Makefile
>>>>     index ce01669..c0d8cf8 100644
>>>>     --- a/arch/m68k/platform/532x/**Makefile
>>>>     +++ b/arch/m68k/platform/532x/**Makefile
>>>>     @@ -15,4 +15,4 @@
>>>>       asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
>>>>
>>>>       #obj-y := config.o usb-mcf532x.o spi-mcf532x.o
>>>>     -obj-y := config.o gpio.o
>>>>     +obj-y := config.o
>>>>     diff --git a/arch/m68k/platform/532x/**config.c
>>>>     b/arch/m68k/platform/532x/**config.c
>>>>     index 2bec347..a4dd3d8 100644
>>>>     --- a/arch/m68k/platform/532x/**config.c
>>>>     +++ b/arch/m68k/platform/532x/**config.c
>>>>     @@ -26,10 +26,35 @@
>>>>       #include<asm/mcfsim.h>
>>>>       #include<asm/mcfuart.h>
>>>>       #include<asm/mcfdma.h>
>>>>     +#include<asm/mcfgpio.h>
>>>>       #include<asm/mcfwdebug.h>
>>>>
>>>>       /***************************************************************
>>>> ****************/
>>>>
>>>>     +struct mcf_gpio_chip mcf_gpio_chips[] = {
>>>>     +       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,
>>>>     MCFEPORT_EPPDR),
>>>>     +       MCFGPF(FECH, 8, 8),
>>>>     +       MCFGPF(FECL, 16, 8),
>>>>     +       MCFGPF(SSI, 24, 5),
>>>>     +       MCFGPF(BUSCTL, 32, 4),
>>>>     +       MCFGPF(BE, 40, 4),
>>>>     +       MCFGPF(CS, 49, 5),
>>>>     +       MCFGPF(PWM, 58, 4),
>>>>     +       MCFGPF(FECI2C, 64, 4),
>>>>     +       MCFGPF(UART, 72, 8),
>>>>     +       MCFGPF(QSPI, 80, 6),
>>>>     +       MCFGPF(TIMER, 88, 4),
>>>>     +       MCFGPF(LCDDATAH, 96, 2),
>>>>     +       MCFGPF(LCDDATAM, 104, 8),
>>>>     +       MCFGPF(LCDDATAL, 112, 8),
>>>>     +       MCFGPF(LCDCTLH, 120, 1),
>>>>     +       MCFGPF(LCDCTLL, 128, 8),
>>>>     +};
>>>>     +
>>>>     +unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
>>>>     +
>>>>     +/**************************************************************
>>>> *****************/
>>>>     +
>>>>       #ifdef CONFIG_SPI_COLDFIRE_QSPI
>>>>
>>>>       static void __init m532x_qspi_init(void)
>>>>     diff --git a/arch/m68k/platform/532x/**gpio.c
>>>>     b/arch/m68k/platform/532x/**gpio.c
>>>>     deleted file mode 100644
>>>>     index 3e1b71d..0000000
>>>>     --- a/arch/m68k/platform/532x/**gpio.c
>>>>     +++ /dev/null
>>>>     @@ -1,43 +0,0 @@
>>>>     -/*
>>>>     - * Coldfire generic GPIO support
>>>>     - *
>>>>     - * (C) Copyright 2009, Steven King<sfking@fdwdc.com
>>>>     <mailto:sfking@fdwdc.com>>
>>>>     - *
>>>>     - * This program is free software; you can redistribute it and/or
>>>> modify
>>>>     - * it under the terms of the GNU General Public License as
>>>> published by
>>>>     - * the Free Software Foundation; version 2 of the License.
>>>>     - *
>>>>     - * This program is distributed in the hope that it will be useful,
>>>>     - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>     - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>     - * GNU General Public License for more details.
>>>>     -*/
>>>>     -
>>>>     -#include<linux/kernel.h>
>>>>     -#include<linux/init.h>
>>>>     -
>>>>     -#include<asm/coldfire.h>
>>>>     -#include<asm/mcfsim.h>
>>>>     -#include<asm/mcfgpio.h>
>>>>     -
>>>>     -struct mcf_gpio_chip mcf_gpio_chips[] = {
>>>>     -       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,
>>>>     MCFEPORT_EPPDR),
>>>>     -       MCFGPF(FECH, 8, 8),
>>>>     -       MCFGPF(FECL, 16, 8),
>>>>     -       MCFGPF(SSI, 24, 5),
>>>>     -       MCFGPF(BUSCTL, 32, 4),
>>>>     -       MCFGPF(BE, 40, 4),
>>>>     -       MCFGPF(CS, 49, 5),
>>>>     -       MCFGPF(PWM, 58, 4),
>>>>     -       MCFGPF(FECI2C, 64, 4),
>>>>     -       MCFGPF(UART, 72, 8),
>>>>     -       MCFGPF(QSPI, 80, 6),
>>>>     -       MCFGPF(TIMER, 88, 4),
>>>>     -       MCFGPF(LCDDATAH, 96, 2),
>>>>     -       MCFGPF(LCDDATAM, 104, 8),
>>>>     -       MCFGPF(LCDDATAL, 112, 8),
>>>>     -       MCFGPF(LCDCTLH, 120, 1),
>>>>     -       MCFGPF(LCDCTLL, 128, 8),
>>>>     -};
>>>>     -
>>>>     -unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
>>>>     --
>>>>     1.7.0.4
>>>>
>>>>     ______________________________**_________________
>>>>     uClinux-dev mailing list
>>>>     uClinux-dev@uclinux.org<**mailto:uClinux-dev@uclinux.org**>
>>>>     http://mailman.uclinux.org/**mailman/listinfo/uclinux-dev<http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>
>>>>     This message was resent by uclinux-dev@uclinux.org
>>>>     <mailto:uclinux-dev@uclinux.**org <uclinux-dev@uclinux.org>>
>>>>     To unsubscribe see:
>>>>     http://mailman.uclinux.org/**mailman/options/uclinux-dev<http://mailman.uclinux.org/mailman/options/uclinux-dev>
>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> ______
>>>> Mohamed Nabil Hafez
>>>> Embedded Software Engineer
>>>>
>>>>
>>>
>>> --
>>> ------------------------------**------------------------------**
>>> ------------
>>> Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
>>> SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
>>> 8 Gardner Close,                            FAX:         +61 7 3891 3630
>>> Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
>>> ______________________________**_________________
>>> uClinux-dev mailing list
>>> uClinux-dev@uclinux.org
>>> http://mailman.uclinux.org/**mailman/listinfo/uclinux-dev<http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>
>>> This message was resent by uclinux-dev@uclinux.org
>>> To unsubscribe see:
>>> http://mailman.uclinux.org/**mailman/options/uclinux-dev<http://mailman.uclinux.org/mailman/options/uclinux-dev>
>>>
>>>   ??? ?&?~?&? ??+-??? ??w??????m?b??f??"??^n?r???z? ??h????&?? ?G???h?
>> (????j"?? ? m?????z?????f???h???~?m?
>>
>>
>>
>
> --
> ------------------------------**------------------------------**
> ------------
> Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
> SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
> 8 Gardner Close,                            FAX:         +61 7 3891 3630
> Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
>



-- 
______
Mohamed Nabil Hafez
Embedded Software Engineer

--bcaec553fefa516efa04be8aa8a6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_extra" styl=
e>Ah , Bloody Hell , we should punish this &quot;reflecter&quot;=A0</div><d=
iv class=3D"gmail_extra" style>but still 23 emails are too much for 1 blood=
y min ? =A0no ?</div>
<br><div class=3D"gmail_quote">On Thu, Apr 26, 2012 at 3:07 AM, Greg Ungere=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:gerg@snapgear.com" target=3D"_bla=
nk">gerg@snapgear.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Hi Alex,<div class=3D"im"><br>
<br>
On 04/26/2012 10:53 AM, Alex LI wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
You sent 50 mails in 1 min.<br>
</blockquote>
<br></div>
I sent 23. And both list archives (linux-m68k and uclinux-dev) only<br>
show the 23 emails.<br>
<br>
Maybe the uclinux-dev reflecter is sending dupes to list recpients?<br>
<br>
Regards<br>
Greg<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
Sent from my Sony Ericsson Xperia arc S<br>
<br></div>
Greg Ungerer&lt;<a href=3D"mailto:gerg@snapgear.com" target=3D"_blank">gerg=
@snapgear.com</a>&gt; =A0?:<div><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/26/2012 10:36 AM, mohamed nabil wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
that&#39;s a Fucking spam man !!<br>
</blockquote>
<br>
Huh?<br>
<br>
Thats how open source development works. If you don&#39;t like it don&#39;t=
<br>
subscribe to a developers list.<br>
<br>
Regards<br>
Greg<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Apr 26, 2012 at 2:26 AM,&lt;<a href=3D"mailto:gerg@snapgear.com" ta=
rget=3D"_blank">gerg@snapgear.com</a><br>
&lt;mailto:<a href=3D"mailto:gerg@snapgear.com" target=3D"_blank">gerg@snap=
gear.com</a>&gt;&gt; =A0wrote:<br>
<br>
 =A0 =A0 From: Greg Ungerer&lt;<a href=3D"mailto:gerg@uclinux.org" target=
=3D"_blank">gerg@uclinux.org</a>&lt;<u></u>mailto:<a href=3D"mailto:gerg@uc=
linux.org" target=3D"_blank">gerg@uclinux.org</a>&gt;&gt;<br>
<br>
 =A0 =A0 The GPIO data struct setup is now the only remaining code in the<b=
r>
 =A0 =A0 platform<br>
 =A0 =A0 gpio.c file. So move it to the platform config.c code and remove t=
he<br>
 =A0 =A0 gpio.c<br>
 =A0 =A0 file.<br>
<br>
 =A0 =A0 Signed-off-by: Greg Ungerer&lt;<a href=3D"mailto:gerg@uclinux.org"=
 target=3D"_blank">gerg@uclinux.org</a>&lt;<u></u>mailto:<a href=3D"mailto:=
gerg@uclinux.org" target=3D"_blank">gerg@uclinux.org</a>&gt;&gt;<br>
 =A0 =A0 ---<br>
 =A0 =A0 =A0 arch/m68k/platform/532x/<u></u>Makefile | =A0 =A02 +-<br>
 =A0 =A0 =A0 arch/m68k/platform/532x/<u></u>config.c | =A0 25 +++++++++++++=
+++++++++<br>
 =A0 =A0 =A0 arch/m68k/platform/532x/gpio.c =A0 | =A0 43<br>
 =A0 =A0 ------------------------------<u></u>--------<br>
 =A0 =A0 =A0 3 files changed, 26 insertions(+), 44 deletions(-)<br>
 =A0 =A0 =A0 delete mode 100644 arch/m68k/platform/532x/gpio.c<br>
<br>
 =A0 =A0 diff --git a/arch/m68k/platform/532x/<u></u>Makefile<br>
 =A0 =A0 b/arch/m68k/platform/532x/<u></u>Makefile<br>
 =A0 =A0 index ce01669..c0d8cf8 100644<br>
 =A0 =A0 --- a/arch/m68k/platform/532x/<u></u>Makefile<br>
 =A0 =A0 +++ b/arch/m68k/platform/532x/<u></u>Makefile<br>
 =A0 =A0 @@ -15,4 +15,4 @@<br>
 =A0 =A0 =A0 asflags-$(CONFIG_FULLDEBUG) :=3D -DDEBUGGER_COMPATIBLE_CACHE=
=3D1<br>
<br>
 =A0 =A0 =A0 #obj-y :=3D config.o usb-mcf532x.o spi-mcf532x.o<br>
 =A0 =A0 -obj-y :=3D config.o gpio.o<br>
 =A0 =A0 +obj-y :=3D config.o<br>
 =A0 =A0 diff --git a/arch/m68k/platform/532x/<u></u>config.c<br>
 =A0 =A0 b/arch/m68k/platform/532x/<u></u>config.c<br>
 =A0 =A0 index 2bec347..a4dd3d8 100644<br>
 =A0 =A0 --- a/arch/m68k/platform/532x/<u></u>config.c<br>
 =A0 =A0 +++ b/arch/m68k/platform/532x/<u></u>config.c<br>
 =A0 =A0 @@ -26,10 +26,35 @@<br>
 =A0 =A0 =A0 #include&lt;asm/mcfsim.h&gt;<br>
 =A0 =A0 =A0 #include&lt;asm/mcfuart.h&gt;<br>
 =A0 =A0 =A0 #include&lt;asm/mcfdma.h&gt;<br>
 =A0 =A0 +#include&lt;asm/mcfgpio.h&gt;<br>
 =A0 =A0 =A0 #include&lt;asm/mcfwdebug.h&gt;<br>
<br>
 =A0 =A0 =A0 /*****************************<u></u>*************************=
*****<u></u>****************/<br>
<br>
 =A0 =A0 +struct mcf_gpio_chip mcf_gpio_chips[] =3D {<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,<br=
>
 =A0 =A0 MCFEPORT_EPPDR),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(FECH, 8, 8),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(FECL, 16, 8),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(SSI, 24, 5),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(BUSCTL, 32, 4),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(BE, 40, 4),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(CS, 49, 5),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(PWM, 58, 4),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(FECI2C, 64, 4),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(UART, 72, 8),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(QSPI, 80, 6),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(TIMER, 88, 4),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(LCDDATAH, 96, 2),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(LCDDATAM, 104, 8),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(LCDDATAL, 112, 8),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(LCDCTLH, 120, 1),<br>
 =A0 =A0 + =A0 =A0 =A0 MCFGPF(LCDCTLL, 128, 8),<br>
 =A0 =A0 +};<br>
 =A0 =A0 +<br>
 =A0 =A0 +unsigned int mcf_gpio_chips_size =3D ARRAY_SIZE(mcf_gpio_chips);<=
br>
 =A0 =A0 +<br>
 =A0 =A0 +/****************************<u></u>*****************************=
*<u></u>*****************/<br>
 =A0 =A0 +<br>
 =A0 =A0 =A0 #ifdef CONFIG_SPI_COLDFIRE_QSPI<br>
<br>
 =A0 =A0 =A0 static void __init m532x_qspi_init(void)<br>
 =A0 =A0 diff --git a/arch/m68k/platform/532x/<u></u>gpio.c<br>
 =A0 =A0 b/arch/m68k/platform/532x/<u></u>gpio.c<br>
 =A0 =A0 deleted file mode 100644<br>
 =A0 =A0 index 3e1b71d..0000000<br>
 =A0 =A0 --- a/arch/m68k/platform/532x/<u></u>gpio.c<br>
 =A0 =A0 +++ /dev/null<br>
 =A0 =A0 @@ -1,43 +0,0 @@<br>
 =A0 =A0 -/*<br>
 =A0 =A0 - * Coldfire generic GPIO support<br>
 =A0 =A0 - *<br>
 =A0 =A0 - * (C) Copyright 2009, Steven King&lt;<a href=3D"mailto:sfking@fd=
wdc.com" target=3D"_blank">sfking@fdwdc.com</a><br>
 =A0 =A0 &lt;mailto:<a href=3D"mailto:sfking@fdwdc.com" target=3D"_blank">s=
fking@fdwdc.com</a>&gt;&gt;<br>
 =A0 =A0 - *<br>
 =A0 =A0 - * This program is free software; you can redistribute it and/or =
modify<br>
 =A0 =A0 - * it under the terms of the GNU General Public License as publis=
hed by<br>
 =A0 =A0 - * the Free Software Foundation; version 2 of the License.<br>
 =A0 =A0 - *<br>
 =A0 =A0 - * This program is distributed in the hope that it will be useful=
,<br>
 =A0 =A0 - * but WITHOUT ANY WARRANTY; without even the implied warranty of=
<br>
 =A0 =A0 - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See th=
e<br>
 =A0 =A0 - * GNU General Public License for more details.<br>
 =A0 =A0 -*/<br>
 =A0 =A0 -<br>
 =A0 =A0 -#include&lt;linux/kernel.h&gt;<br>
 =A0 =A0 -#include&lt;linux/init.h&gt;<br>
 =A0 =A0 -<br>
 =A0 =A0 -#include&lt;asm/coldfire.h&gt;<br>
 =A0 =A0 -#include&lt;asm/mcfsim.h&gt;<br>
 =A0 =A0 -#include&lt;asm/mcfgpio.h&gt;<br>
 =A0 =A0 -<br>
 =A0 =A0 -struct mcf_gpio_chip mcf_gpio_chips[] =3D {<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,<br=
>
 =A0 =A0 MCFEPORT_EPPDR),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(FECH, 8, 8),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(FECL, 16, 8),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(SSI, 24, 5),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(BUSCTL, 32, 4),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(BE, 40, 4),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(CS, 49, 5),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(PWM, 58, 4),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(FECI2C, 64, 4),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(UART, 72, 8),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(QSPI, 80, 6),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(TIMER, 88, 4),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(LCDDATAH, 96, 2),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(LCDDATAM, 104, 8),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(LCDDATAL, 112, 8),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(LCDCTLH, 120, 1),<br>
 =A0 =A0 - =A0 =A0 =A0 MCFGPF(LCDCTLL, 128, 8),<br>
 =A0 =A0 -};<br>
 =A0 =A0 -<br>
 =A0 =A0 -unsigned int mcf_gpio_chips_size =3D ARRAY_SIZE(mcf_gpio_chips);<=
br>
 =A0 =A0 --<br>
 =A0 =A0 1.7.0.4<br>
<br>
 =A0 =A0 ______________________________<u></u>_________________<br>
 =A0 =A0 uClinux-dev mailing list<br>
 =A0 =A0 <a href=3D"mailto:uClinux-dev@uclinux.org" target=3D"_blank">uClin=
ux-dev@uclinux.org</a>&lt;<u></u>mailto:<a href=3D"mailto:uClinux-dev@uclin=
ux.org" target=3D"_blank">uClinux-dev@uclinux.org</a><u></u>&gt;<br>
 =A0 =A0 <a href=3D"http://mailman.uclinux.org/mailman/listinfo/uclinux-dev=
" target=3D"_blank">http://mailman.uclinux.org/<u></u>mailman/listinfo/ucli=
nux-dev</a><br>
 =A0 =A0 This message was resent by <a href=3D"mailto:uclinux-dev@uclinux.o=
rg" target=3D"_blank">uclinux-dev@uclinux.org</a><br>
 =A0 =A0 &lt;mailto:<a href=3D"mailto:uclinux-dev@uclinux.org" target=3D"_b=
lank">uclinux-dev@uclinux.<u></u>org</a>&gt;<br>
 =A0 =A0 To unsubscribe see:<br>
 =A0 =A0 <a href=3D"http://mailman.uclinux.org/mailman/options/uclinux-dev"=
 target=3D"_blank">http://mailman.uclinux.org/<u></u>mailman/options/uclinu=
x-dev</a><br>
<br>
<br>
<br>
<br>
--<br>
______<br>
Mohamed Nabil Hafez<br>
Embedded Software Engineer<br>
<br>
</blockquote>
<br>
<br>
--<br>
------------------------------<u></u>------------------------------<u></u>-=
-----------<br>
Greg Ungerer =A0-- =A0Principal Engineer =A0 =A0 =A0 =A0EMAIL: =A0 =A0 <a h=
ref=3D"mailto:gerg@snapgear.com" target=3D"_blank">gerg@snapgear.com</a><br=
>
SnapGear Group, McAfee =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PHONE: =
=A0 =A0 =A0 +61 7 3435 2888<br>
8 Gardner Close, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FAX=
: =A0 =A0 =A0 =A0 +61 7 3891 3630<br>
Milton, QLD, 4064, Australia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WEB: <a href=3D=
"http://www.SnapGear.com" target=3D"_blank">http://www.SnapGear.com</a><br>
______________________________<u></u>_________________<br>
uClinux-dev mailing list<br>
<a href=3D"mailto:uClinux-dev@uclinux.org" target=3D"_blank">uClinux-dev@uc=
linux.org</a><br>
<a href=3D"http://mailman.uclinux.org/mailman/listinfo/uclinux-dev" target=
=3D"_blank">http://mailman.uclinux.org/<u></u>mailman/listinfo/uclinux-dev<=
/a><br>
This message was resent by <a href=3D"mailto:uclinux-dev@uclinux.org" targe=
t=3D"_blank">uclinux-dev@uclinux.org</a><br>
To unsubscribe see:<br>
<a href=3D"http://mailman.uclinux.org/mailman/options/uclinux-dev" target=
=3D"_blank">http://mailman.uclinux.org/<u></u>mailman/options/uclinux-dev</=
a><br>
<br>
</blockquote></div></div>
=A0??? ?&amp;?~?&amp;? ??+-??? ??w??????m?b??f??&quot;??^n?r???z? ??h????&a=
mp;?? ?G???h? (????j&quot;?? ? m?????z?????f???h???~?m?<br>
<br>
<br>
</blockquote><div class=3D"HOEnZb"><div class=3D"h5">
<br>
<br>
-- <br>
------------------------------<u></u>------------------------------<u></u>-=
-----------<br>
Greg Ungerer =A0-- =A0Principal Engineer =A0 =A0 =A0 =A0EMAIL: =A0 =A0 <a h=
ref=3D"mailto:gerg@snapgear.com" target=3D"_blank">gerg@snapgear.com</a><br=
>
SnapGear Group, McAfee =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PHONE: =
=A0 =A0 =A0 +61 7 3435 2888<br>
8 Gardner Close, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FAX=
: =A0 =A0 =A0 =A0 +61 7 3891 3630<br>
Milton, QLD, 4064, Australia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WEB: <a href=3D=
"http://www.SnapGear.com" target=3D"_blank">http://www.SnapGear.com</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
______<br>Mohamed Nabil Hafez<br>Embedded Software Engineer <br><br>
</div></div>

--bcaec553fefa516efa04be8aa8a6--

--===============3675241749378684453==
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
--===============3675241749378684453==--
