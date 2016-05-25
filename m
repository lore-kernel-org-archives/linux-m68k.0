From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: Wed, 25 May 2016 11:51:39 +0200
Message-ID: <20160525095139.GA19910__38413.4701606401$1464169926$gmane$org@frolo.macqel>
References: <20160525085653.GA9917@frolo.macqel> <20160525091435.9218.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160525091435.9218.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de, torvalds@linux-foundation.org

On Wed, May 25, 2016 at 05:14:35AM -0400, George Spelvin wrote:
> 
> I did it the way I did above because it makes the gcc -S output very
> legible.  Just like I put a space before the perands on m68k but a tab
> on h8300: that's what GCC does on those platforms.
> 
> I started with the "\n\t" suffixes on each line like so much other
> kernel code, but then figured out the format above which is legible
> both in C source and compiler output.

OK thanks.

> 
> >>	asm("move.l	%2,%0;"	/* 0x0001 */
> >>	    "lsl.l	#2,%0;"	/* 0x0004 */
> >>	    "move.l	%0,%1;"
> >>	    "lsl.l	#7,%0;"	/* 0x0200 */
> >>	    "add.l	%2,%0;"	/* 0x0201 */
> >>	    "add.l	%0,%1;"	/* 0x0205 */
> >>	    "add.l	%0,%0;"	/* 0x0402 */
> >>	    "add.l	%0,%1;"	/* 0x0607 */
> >>	    "lsl.l	#5,%0"	/* 0x8040 */
> >>				/* 0x8647 */
> 
> > Also, it took me some time to understand the hexadecimal constants
> > in the comments (and the last one predicts a future event :)).
> 
> 
> Can you recmmend a better way to comment this?  My nose is so deep
> in the code it's hard for me to judge.

I second Andreas' suggestion.

Philippe
-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
