From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 21/22] m68knommu: simplify the ColdFire
 532x GPIO struct setup
Date: Thu, 26 Apr 2012 10:45:51 +1000
Message-ID: <4F989ABF.3020500@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
 <1335399962-10308-22-git-send-email-gerg@snapgear.com>
 <CAECAou69e8KJ53SqEO1e_J4dmkVRhKV=Z5fUEz6tzyxKrzXCDA@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <CAECAou69e8KJ53SqEO1e_J4dmkVRhKV=Z5fUEz6tzyxKrzXCDA@mail.gmail.com>
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
Cc: mohamed nabil <m.nabil.hafez@gmail.com>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On 04/26/2012 10:36 AM, mohamed nabil wrote:
> that's a Fucking spam man !!

Huh?

Thats how open source development works. If you don't like it don't
subscribe to a developers list.

Regards
Greg



> On Thu, Apr 26, 2012 at 2:26 AM, <gerg@snapgear.com
> <mailto:gerg@snapgear.com>> wrote:
>
>     From: Greg Ungerer <gerg@uclinux.org <mailto:gerg@uclinux.org>>
>
>     The GPIO data struct setup is now the only remaining code in the
>     platform
>     gpio.c file. So move it to the platform config.c code and remove the
>     gpio.c
>     file.
>
>     Signed-off-by: Greg Ungerer <gerg@uclinux.org <mailto:gerg@uclinux.org>>
>     ---
>       arch/m68k/platform/532x/Makefile |    2 +-
>       arch/m68k/platform/532x/config.c |   25 ++++++++++++++++++++++
>       arch/m68k/platform/532x/gpio.c   |   43
>     --------------------------------------
>       3 files changed, 26 insertions(+), 44 deletions(-)
>       delete mode 100644 arch/m68k/platform/532x/gpio.c
>
>     diff --git a/arch/m68k/platform/532x/Makefile
>     b/arch/m68k/platform/532x/Makefile
>     index ce01669..c0d8cf8 100644
>     --- a/arch/m68k/platform/532x/Makefile
>     +++ b/arch/m68k/platform/532x/Makefile
>     @@ -15,4 +15,4 @@
>       asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
>
>       #obj-y := config.o usb-mcf532x.o spi-mcf532x.o
>     -obj-y := config.o gpio.o
>     +obj-y := config.o
>     diff --git a/arch/m68k/platform/532x/config.c
>     b/arch/m68k/platform/532x/config.c
>     index 2bec347..a4dd3d8 100644
>     --- a/arch/m68k/platform/532x/config.c
>     +++ b/arch/m68k/platform/532x/config.c
>     @@ -26,10 +26,35 @@
>       #include <asm/mcfsim.h>
>       #include <asm/mcfuart.h>
>       #include <asm/mcfdma.h>
>     +#include <asm/mcfgpio.h>
>       #include <asm/mcfwdebug.h>
>
>       /***************************************************************************/
>
>     +struct mcf_gpio_chip mcf_gpio_chips[] = {
>     +       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,
>     MCFEPORT_EPPDR),
>     +       MCFGPF(FECH, 8, 8),
>     +       MCFGPF(FECL, 16, 8),
>     +       MCFGPF(SSI, 24, 5),
>     +       MCFGPF(BUSCTL, 32, 4),
>     +       MCFGPF(BE, 40, 4),
>     +       MCFGPF(CS, 49, 5),
>     +       MCFGPF(PWM, 58, 4),
>     +       MCFGPF(FECI2C, 64, 4),
>     +       MCFGPF(UART, 72, 8),
>     +       MCFGPF(QSPI, 80, 6),
>     +       MCFGPF(TIMER, 88, 4),
>     +       MCFGPF(LCDDATAH, 96, 2),
>     +       MCFGPF(LCDDATAM, 104, 8),
>     +       MCFGPF(LCDDATAL, 112, 8),
>     +       MCFGPF(LCDCTLH, 120, 1),
>     +       MCFGPF(LCDCTLL, 128, 8),
>     +};
>     +
>     +unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
>     +
>     +/***************************************************************************/
>     +
>       #ifdef CONFIG_SPI_COLDFIRE_QSPI
>
>       static void __init m532x_qspi_init(void)
>     diff --git a/arch/m68k/platform/532x/gpio.c
>     b/arch/m68k/platform/532x/gpio.c
>     deleted file mode 100644
>     index 3e1b71d..0000000
>     --- a/arch/m68k/platform/532x/gpio.c
>     +++ /dev/null
>     @@ -1,43 +0,0 @@
>     -/*
>     - * Coldfire generic GPIO support
>     - *
>     - * (C) Copyright 2009, Steven King <sfking@fdwdc.com
>     <mailto:sfking@fdwdc.com>>
>     - *
>     - * This program is free software; you can redistribute it and/or modify
>     - * it under the terms of the GNU General Public License as published by
>     - * the Free Software Foundation; version 2 of the License.
>     - *
>     - * This program is distributed in the hope that it will be useful,
>     - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>     - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     - * GNU General Public License for more details.
>     -*/
>     -
>     -#include <linux/kernel.h>
>     -#include <linux/init.h>
>     -
>     -#include <asm/coldfire.h>
>     -#include <asm/mcfsim.h>
>     -#include <asm/mcfgpio.h>
>     -
>     -struct mcf_gpio_chip mcf_gpio_chips[] = {
>     -       MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR,
>     MCFEPORT_EPPDR),
>     -       MCFGPF(FECH, 8, 8),
>     -       MCFGPF(FECL, 16, 8),
>     -       MCFGPF(SSI, 24, 5),
>     -       MCFGPF(BUSCTL, 32, 4),
>     -       MCFGPF(BE, 40, 4),
>     -       MCFGPF(CS, 49, 5),
>     -       MCFGPF(PWM, 58, 4),
>     -       MCFGPF(FECI2C, 64, 4),
>     -       MCFGPF(UART, 72, 8),
>     -       MCFGPF(QSPI, 80, 6),
>     -       MCFGPF(TIMER, 88, 4),
>     -       MCFGPF(LCDDATAH, 96, 2),
>     -       MCFGPF(LCDDATAM, 104, 8),
>     -       MCFGPF(LCDDATAL, 112, 8),
>     -       MCFGPF(LCDCTLH, 120, 1),
>     -       MCFGPF(LCDCTLL, 128, 8),
>     -};
>     -
>     -unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
>     --
>     1.7.0.4
>
>     _______________________________________________
>     uClinux-dev mailing list
>     uClinux-dev@uclinux.org <mailto:uClinux-dev@uclinux.org>
>     http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
>     This message was resent by uclinux-dev@uclinux.org
>     <mailto:uclinux-dev@uclinux.org>
>     To unsubscribe see:
>     http://mailman.uclinux.org/mailman/options/uclinux-dev
>
>
>
>
> --
> ______
> Mohamed Nabil Hafez
> Embedded Software Engineer
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
