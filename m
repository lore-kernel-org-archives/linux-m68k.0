From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Platform code merge for 68000 core cpus
Date: Tue, 23 Oct 2012 16:58:17 +1000
Message-ID: <50864009.8070708@snapgear.com>
References: <1350953556-9759-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:12663 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752355Ab2JWG40 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Oct 2012 02:56:26 -0400
In-Reply-To: <1350953556-9759-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 23/10/12 10:52, Luis Alves wrote:
> Finnaly I've found some time to get back to the 68k.
>
> This patch merges all 68000 core cpus in one directory.
> Patch was generated using -B and -M and checked with
> scricts/checkpatch.pl
>
> It doesn't include the MC68000 code. I expect the next
> patch to include the 68k board definition and mc68000
> related code.
> Also I expect to merge all entry*.S into a single file.

This looks pretty good. I am happy with the way the common
68000 code all falls out. Nice.It sure is a big patch on its
own though.

Couple of minor things I single out below. And they are just
minor.


> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> diff --git a/arch/m68k/platform/68000/Makefile b/arch/m68k/platform/68000/Makefile
> new file mode 100644
> index 0000000..e1777ee
> --- /dev/null
> +++ b/arch/m68k/platform/68000/Makefile
> @@ -0,0 +1,23 @@
> +##################################################
> +#
> +# Makefile for arch/m68k/platform/68000
> +#
> +# 2012.10.21, Luis Alves <ljalvs@gmail.com>
> +#             Merged all 68000 based cpu's configuration
> +#             files into a single directory.
> +#
> +
> +# 68328, 68EZ328, 68VZ328
> +
> +obj-y				+= entry.o ints.o timers.o
> +obj-$(CONFIG_M68328)		+= config.o
> +obj-$(CONFIG_M68EZ328)		+= config-ez.o
> +obj-$(CONFIG_M68VZ328)		+= config-vz.o
> +obj-$(CONFIG_ROM)		+= romvec.o
> +
> +model-y				:= ram
> +model-$(CONFIG_ROMKERNEL)	:= rom

Is this model-* still needed?


> diff --git a/arch/m68k/platform/68328/config.c b/arch/m68k/platform/68000/config.c
> similarity index 100%
> rename from arch/m68k/platform/68328/config.c
> rename to arch/m68k/platform/68000/config.c
> diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68000/entry.S
> similarity index 100%
> rename from arch/m68k/platform/68328/entry.S
> rename to arch/m68k/platform/68000/entry.S
> diff --git a/arch/m68k/platform/68000/head.S b/arch/m68k/platform/68000/head.S
> new file mode 100644
> index 0000000..6e0e2de
> --- /dev/null
> +++ b/arch/m68k/platform/68000/head.S
> @@ -0,0 +1,317 @@
> +/*
> + * linux/arch/m68k/platform/68000/head.S

Having the full path name here is mostly frowned upon these days.
It eventually goes stale, if/when files get moved.


> + *
> + * Common startup code for 68000 core based CPU's
> + *
> + * 2012.10.21, Luis Alves <ljalvs@gmail.com>, Single head.S file for all
> + *             68000 core based CPU's. Based on the sources from:
> + *             Coldfire by Greg Ungerer <gerg@snapgear.com>
> + *             68328 by D. Jeff Dionne <jeff@ryeham.ee.ryerson.ca>,
> + *                      Kenneth Albanowski <kjahds@kjahds.com>,
> + *                      The Silver Hammer Group, Ltd.
> + *
> + */
> +
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/thread_info.h>
> +
> +
> +/*****************************************************************************
> + *
> + * UCSIMM and UCDIMM use CONFIG_MEMORY_RESERVE to reserve some RAM
> + *
> + *****************************************************************************/
> +
> +#ifdef CONFIG_MEMORY_RESERVE
> +#define RAMEND	(CONFIG_RAMBASE + CONFIG_RAMSIZE) - (CONFIG_MEMORY_RESERVE * 0x100000)
> +#else
> +#define RAMEND	(CONFIG_RAMBASE + CONFIG_RAMSIZE)
> +#endif
> +
> +/*****************************************************************************/
> +
> +.global	_start
> +.global _rambase
> +.global _ramvec
> +.global	_ramstart
> +.global	_ramend

Inconsistent indenting?


> +#if defined(CONFIG_PILOT) || defined(CONFIG_INIT_LCD)
> +.global bootlogo_bits
> +#endif
> +
> +/* Defining DEBUG_HEAD_CODE, serial port in 68x328 is inited */
> +#undef DEBUG_HEAD_CODE
> +//#define DEBUG_HEAD_CODE

No use of '//' for comments please :-)


> +.data
> +
> +/*****************************************************************************
> + *
> + * RAM setup pointers. Used by the kernel to determine RAM location and size.
> + *
> + *****************************************************************************/
> +
> +_rambase:
> +	.long	0
> +_ramvec:
> +	.long	0
> +_ramstart:
> +	.long	0
> +_ramend:
> +	.long	0
> +
> +
> +__HEAD
> +
> +
> +/*****************************************************************************
> + *
> + * Entry point, where all begins!
> + *
> + *****************************************************************************/
> +
> +_start:
> +
> +
> +/*****************************************************************************
> + *
> + * Pilot need this specific signature at the start of ROM
> + *
> + *****************************************************************************/
> +
> +#ifdef CONFIG_PILOT
> +	.byte 0x4e, 0xfa, 0x00, 0x0a /* bra opcode (jump 10 bytes ahead) */
> +	.byte 'b', 'o', 'o', 't'
> +	.word 10000
> +	nop
> +	moveq	#0, %d0
> +	movew   %d0, 0xfffff618 /* Watchdog off */
> +	movel	#0x00011f07, 0xfffff114 /* CS A1 Mask */
> +#endif /* CONFIG_PILOT */
> +
> +
> +	movew	#0x2700, %sr			/* disable all interrupts */
> +
> +
> +/*****************************************************************************
> + *
> + * Setup PLL and wait for it to settle (in 68x328 cpu's).
> + * Also, if enabled, init serial port.
> + *
> + *****************************************************************************/
> +
> +#if defined(CONFIG_M68328) || \
> +    defined(CONFIG_M68EZ328) || \
> +    defined(CONFIG_M68VZ328)
> +
> +/* Serial port setup. Should only be needed if debugging this startup code. */
> +#ifdef DEBUG_HEAD_CODE
> +	movew	#0x0800, 0xfffff906		/* Ignore CTS */
> +	movew	#0x010b, 0xfffff902		/* BAUD to 9600 */
> +	movew	#0xe100, 0xfffff900		/* enable */
> +#endif /* DEBUG_HEAD */
> +
> +#ifdef CONFIG_PILOT
> +	movew	#0x2410, 0xfffff200		/* PLLCR */
> +#else
> +	movew   #0x2400, 0xfffff200		/* PLLCR */
> +#endif
> +	movew	#0x0123, 0xfffff202		/* PLLFSR */
> +
> +	moveq   #0,%d0
> +	movew	#16384, %d0			/* PLL settle wait loop */
> +_pll_settle:
> +	subw	#1, %d0
> +	bne	_pll_settle
> +
> +#endif /* CONFIG_M68x328 */
> +
> +
> +
> +

Probably a bit too much white space used in a number of places in
this file :-)


> +/*****************************************************************************
> + *
> + * If running kernel from ROM/FLASH some specific initialization has
> + * to be done.
> + * (Assuming that everything is already init'ed when running from RAM)
> + *
> + *****************************************************************************/
> +
> +#ifdef CONFIG_ROMKERNEL
> +
> +
> +/*****************************************************************************
> + *
> + * Init chip registers (uCsimm specific)
> + *
> + *****************************************************************************/
> +#ifdef CONFIG_UCSIMM
> +	moveb	#0x00,   0xfffffb0b	/* Watchdog off */
> +	moveb	#0x10,   0xfffff000	/* SCR */
> +
> +	moveb	#0x00,   0xfffff40b	/* enable chip select */
> +	moveb	#0x00,   0xfffff423	/* enable /DWE */
> +	moveb	#0x08,   0xfffffd0d	/* disable hardmap */
> +	moveb	#0x07,   0xfffffd0e	/* level 7 interrupt clear */
> +
> +	movew	#0x8600, 0xfffff100	/* FLASH at 0x10c00000 */
> +	movew	#0x018b, 0xfffff110	/* 2Meg, enable, 0ws */
> +
> +	movew	#0x8f00, 0xfffffc00	/* DRAM configuration */
> +	movew	#0x9667, 0xfffffc02	/* DRAM control */
> +	movew	#0x0000, 0xfffff106	/* DRAM at 0x00000000 */
> +	movew	#0x068f, 0xfffff116	/* 8Meg, enable, 0ws */
> +
> +	moveb	#0x40,   0xfffff300	/* IVR */
> +	movel	#0x007FFFFF, %d0	/* IMR */
> +	movel	%d0,     0xfffff304
> +
> +	moveb	0xfffff42b, %d0
> +	andb	#0xe0,	 %d0
> +	moveb	%d0,	 0xfffff42b
> +#endif
> +
> +
> +/*****************************************************************************
> + *
> + * Init LCD controller.
> + *
> + * NOTE: Assuming that LCD controller is already init'ed
> + *       when running from RAM.
> + *
> + *****************************************************************************/
> +#ifdef CONFIG_INIT_LCD
> +
> +#ifdef CONFIG_PILOT
> +	moveb	#0, 0xfffffA27			/* LCKCON */
> +	movel   #_start, 0xfffffA00		/* LSSA */
> +	moveb   #0xa, 0xfffffA05		/* LVPW */
> +	movew	#0x9f, 0xFFFFFa08		/* LXMAX */
> +	movew	#0x9f, 0xFFFFFa0a		/* LYMAX */
> +	moveb   #9, 0xfffffa29			/* LBAR */
> +	moveb   #0, 0xfffffa25			/* LPXCD */
> +	moveb	#0x04, 0xFFFFFa20		/* LPICF */
> +	moveb	#0x58, 0xfffffA27		/* LCKCON */
> +	moveb	#0x85, 0xfffff429		/* PFDATA */
> +	moveb	#0xd8, 0xfffffA27		/* LCKCON */
> +	moveb	#0xc5, 0xfffff429		/* PFDATA */
> +	moveb	#0xd5, 0xfffff429		/* PFDATA */
> +
> +	movel	#bootlogo_bits, 0xFFFFFA00	/* LSSA */
> +	moveb	#10, 0xFFFFFA05			/* LVPW */
> +	movew	#160, 0xFFFFFA08		/* LXMAX */
> +	movew	#160, 0xFFFFFA0A		/* LYMAX */
> +
> +#else /* CONFIG_PILOT */
> +
> +	movel	#bootlogo_bits, 0xfffffA00	/* LSSA */
> +	moveb	#0x28,   0xfffffA05		/* LVPW */
> +	movew	#0x280,  0xFFFFFa08		/* LXMAX */
> +	movew	#0x1df,  0xFFFFFa0a		/* LYMAX */
> +	moveb	#0,      0xfffffa29		/* LBAR */
> +	moveb	#0,      0xfffffa25		/* LPXCD */
> +	moveb	#0x08,   0xFFFFFa20		/* LPICF */
> +	moveb	#0x01,   0xFFFFFA21		/* -ve pol */
> +	moveb	#0x81,   0xfffffA27		/* LCKCON */
> +	movew	#0xff00, 0xfffff412		/* LCD pins */

Inconsistent spacing used on args throughout this file. I know some
of this came strait from the older files. But lets use this chance
to at least make it consistent now.


> +#endif /* CONFIG_PILOT */
> +
> +#endif /* CONFIG_INIT_LCD */
> +
> +
> +
> +/*****************************************************************************
> + *
> + * Kernel is running from FLASH/ROM (XIP)
> + * Copy init text & data to RAM
> + *
> + *****************************************************************************/
> +
> +	moveal	#_etext, %a0
> +	moveal	#_sdata, %a1
> +	moveal	#_sbss, %a2
> +_copy_initmem:
> +	movel	%a0@+, %a1@+
> +	cmpal	%a1, %a2
> +	bhi	_copy_initmem
> +
> +#endif /* CONFIG_ROMKERNEL */
> +
> +
> +
> +/*****************************************************************************
> + *
> + * Setup basic memory information for kernel
> + *
> + *****************************************************************************/
> +
> +	movel	#CONFIG_VECTORBASE,_ramvec	/* set vector base location */
> +	movel	#CONFIG_RAMBASE,_rambase	/* set the base of RAM */
> +	movel	#RAMEND, _ramend		/* set end ram addr */
> +	lea	_ebss,%a1
> +	movel	%a1,_ramstart
> +
> +
> +/*****************************************************************************
> + *
> + * If the kernel is in RAM, move romfs to right above bss and
> + * adjust _ramstart to where romfs ends.
> + *
> + * (Do this only if CONFIG_MTD_UCLINUX_EBSS is true)
> + *
> + *****************************************************************************/
> +
> +#if defined(CONFIG_ROMFS_FS) && defined(CONFIG_RAMKERNEL) && \
> +    defined(CONFIG_MTD_UCLINUX_EBSS)

There is no CONFIG_MTD_UCLINUX_EBSS in mainline kernels. Just use
CONFIG_MTD_UCLINUX.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
