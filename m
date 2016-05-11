From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: Wed, 11 May 2016 22:38:57 +1000
Message-ID: <573327E1.3060408@linux-m68k.org>
References: <20160511102414.3631.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160511102414.3631.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Hi George,

On 11/05/16 20:24, George Spelvin wrote:
> The __mulsi3 function implements 32x32-bit multiply when the processor
> (mc68000 or mc68010) does not have native support.
>
> This rewrite shrinks the code from 16 words to 13 (32 bytes to 26), and
> eliminates one stack frame access, saving in total 4 words and 16 cycles.
>
> The improvement is small (about 1/16 of the cost of the call overall),
> but multiply is a popular enough operation that it's nice to have.
>
> One open question is why the code includes a ColdFire option.
> Every ColdFire processor back to the original ISA A includes a 32x32-bit
> multiply, and so does not need this routine at all.

That mulsi3.S code was taken directly from gcc's lb1sf68.S (and that
was lb1sf68.asm in older versions of gcc). It has always had that
coldfire conditional code in it. Not sure why it was in there though.

Regards
Greg


> Signed-off-by: George Spelvin <linux@horizon.com>
> ---
>   arch/m68k/lib/mulsi3.S | 132 ++++++++++++-------------------------------------
>   1 file changed, 31 insertions(+), 101 deletions(-)
>
> diff --git a/arch/m68k/lib/mulsi3.S b/arch/m68k/lib/mulsi3.S
> index c39ad4e..b4204fc 100644
> --- a/arch/m68k/lib/mulsi3.S
> +++ b/arch/m68k/lib/mulsi3.S
> @@ -1,105 +1,35 @@
> -/* libgcc1 routines for 68000 w/o floating-point hardware.
> -   Copyright (C) 1994, 1996, 1997, 1998 Free Software Foundation, Inc.
> -
> -This file is part of GNU CC.
> -
> -GNU CC is free software; you can redistribute it and/or modify it
> -under the terms of the GNU General Public License as published by the
> -Free Software Foundation; either version 2, or (at your option) any
> -later version.
> -
> -In addition to the permissions in the GNU General Public License, the
> -Free Software Foundation gives you unlimited permission to link the
> -compiled version of this file with other programs, and to distribute
> -those programs without any restriction coming from the use of this
> -file.  (The General Public License restrictions do apply in other
> -respects; for example, they cover modification of the file, and
> -distribution when not linked into another program.)
> -
> -This file is distributed in the hope that it will be useful, but
> -WITHOUT ANY WARRANTY; without even the implied warranty of
> -MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -General Public License for more details. */
> -
> -/* As a special exception, if you link this library with files
> -   compiled with GCC to produce an executable, this does not cause
> -   the resulting executable to be covered by the GNU General Public License.
> -   This exception does not however invalidate any other reasons why
> -   the executable file might be covered by the GNU General Public License.  */
> -
> -/* Use this one for any 680x0; assumes no floating point hardware.
> -   The trailing " '" appearing on some lines is for ANSI preprocessors.  Yuk.
> -   Some of this code comes from MINIX, via the folks at ericsson.
> -   D. V. Henkel-Wallace (gumby@cygnus.com) Fete Bastille, 1992
> -*/
> -
> -/* These are predefined by new versions of GNU cpp.  */
> -
> -#ifndef __USER_LABEL_PREFIX__
> -#define __USER_LABEL_PREFIX__ _
> -#endif
> -
> -#ifndef __REGISTER_PREFIX__
> -#define __REGISTER_PREFIX__
> -#endif
> -
> -#ifndef __IMMEDIATE_PREFIX__
> -#define __IMMEDIATE_PREFIX__ #
> -#endif
> -
> -/* ANSI concatenation macros.  */
> -
> -#define CONCAT1(a, b) CONCAT2(a, b)
> -#define CONCAT2(a, b) a ## b
> -
> -/* Use the right prefix for global labels.  */
> -
> -#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
> -
> -/* Use the right prefix for registers.  */
> -
> -#define REG(x) CONCAT1 (__REGISTER_PREFIX__, x)
> -
> -/* Use the right prefix for immediate values.  */
> -
> -#define IMM(x) CONCAT1 (__IMMEDIATE_PREFIX__, x)
> -
> -#define d0 REG (d0)
> -#define d1 REG (d1)
> -#define d2 REG (d2)
> -#define d3 REG (d3)
> -#define d4 REG (d4)
> -#define d5 REG (d5)
> -#define d6 REG (d6)
> -#define d7 REG (d7)
> -#define a0 REG (a0)
> -#define a1 REG (a1)
> -#define a2 REG (a2)
> -#define a3 REG (a3)
> -#define a4 REG (a4)
> -#define a5 REG (a5)
> -#define a6 REG (a6)
> -#define fp REG (fp)
> -#define sp REG (sp)
> -
> +/*
> + * 32x32->32-bit multiply.  This is made up of three 16x16->32-bit
> + * partial products.
> + *
> + * Assuming the average argument has half its bits set, this takes
> + * 238 68000 cycles.
> + */
>   	.text
>   	.proc
> -	.globl	SYM (__mulsi3)
> -SYM (__mulsi3):
> -	movew	sp@(4), d0	/* x0 -> d0 */
> -	muluw	sp@(10), d0	/* x0*y1 */
> -	movew	sp@(6), d1	/* x1 -> d1 */
> -	muluw	sp@(8), d1	/* x1*y0 */
> -#if !(defined(__mcf5200__) || defined(__mcoldfire__))
> -	addw	d1, d0
> -#else
> -	addl	d1, d0
> -#endif
> +	.globl	___mulsi3
> +___mulsi3:
> +	lea	4(sp), a0
> +	move.w	(a0)+, d0	/* xhigh */
> +	move.w	(a0)+, d1	/* xlow */
> +	move.w	d1, a1
> +	mulu.w	(a0)+, d1	/* yhigh */
> +	mulu.w	(a0),  d0	/* ylow */
> +
> +#if defined(__mcf5200__) || defined(__mcoldfire__)
> +	/* Why do we need this?  All ColdFire have MULU.L */
> +	add.l	d0, d1
> +	move.w	a1, d0		/* xlow */
> +	mulu.w	(a0),d0		/* ylow */
> +	swap	d1
> +	clr.w	d1
> +	add.l	d1, d0
> +#else /* 68000 or 68010 */
> +	add.w	d0, d1
> +	move.w	a1, d0		/* xlow */
> +	mulu.w	(a0),d0		/* ylow */
>   	swap	d0
> -	clrw	d0
> -	movew	sp@(6), d1	/* x1 -> d1 */
> -	muluw	sp@(10), d1	/* x1*y1 */
> -	addl	d1, d0
> -
> +	add.w	d1, d0
> +	swap	d0
> +#endif
>   	rts
> -
>
