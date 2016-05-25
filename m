From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: Wed, 25 May 2016 10:56:53 +0200
Message-ID: <20160525085653.GA9917@frolo.macqel>
References: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com> <20160525073455.5709.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160525073455.5709.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, torvalds@linux-foundation.org, tglx@linutronix.de

On Wed, May 25, 2016 at 03:34:55AM -0400, George Spelvin wrote:
> +static inline u32 __attribute_const__ __hash_32(u32 x)
> +{
> +	u32 a, b;
> +
> +	asm(   "move.l %2,%0"	/* 0x0001 */
> +	"\n	lsl.l #2,%0"	/* 0x0004 */
> +	"\n	move.l %0,%1"
> +	"\n	lsl.l #7,%0"	/* 0x0200 */
> +	"\n	add.l %2,%0"	/* 0x0201 */
> +	"\n	add.l %0,%1"	/* 0x0205 */
> +	"\n	add.l %0,%0"	/* 0x0402 */
> +	"\n	add.l %0,%1"	/* 0x0607 */
> +	"\n	lsl.l #5,%0"	/* 0x8040 */
> +				/* 0x8647 */

There is no standard way to write asm in the kernel, but I prefer
a simple semicolon after each insn

	asm("move.l	%2,%0;"	/* 0x0001 */
	    "lsl.l	#2,%0;"	/* 0x0004 */
	    "move.l	%0,%1;"
	    "lsl.l	#7,%0;"	/* 0x0200 */
	    "add.l	%2,%0;"	/* 0x0201 */
	    "add.l	%0,%1;"	/* 0x0205 */
	    "add.l	%0,%0;"	/* 0x0402 */
	    "add.l	%0,%1;"	/* 0x0607 */
	    "lsl.l	#5,%0"	/* 0x8040 */
				/* 0x8647 */

Also, it took me some time to understand the hexadecimal constants
in the comments (and the last one predicts a future event :)).

> +	: "=&d" (a), "=&r" (b)
> +	: "g" (x));
> +
> +	return ((u16)(x*0x61c8) << 16) + a + b;
> +}

Just my two cents

Philippe
