From: "George Spelvin" <linux@sciencehorizons.net>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: 25 May 2016 05:14:35 -0400
Message-ID: <20160525091435.9218.qmail@ns.sciencehorizons.net>
References: <20160525085653.GA9917@frolo.macqel>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:14840 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1753089AbcEYJOh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 May 2016 05:14:37 -0400
In-Reply-To: <20160525085653.GA9917@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux@sciencehorizons.net, phdm@macq.eu
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, tglx@linutronix.de, torvalds@linux-foundation.org

> On Wed, May 25, 2016 at 03:34:55AM -0400, George Spelvin wrote:
>> +static inline u32 __attribute_const__ __hash_32(u32 x)
>> +{
>> +	u32 a, b;
>> +
>> +	asm(   "move.l %2,%0"	/* 0x0001 */
>> +	"\n	lsl.l #2,%0"	/* 0x0004 */
>> +	"\n	move.l %0,%1"
>> +	"\n	lsl.l #7,%0"	/* 0x0200 */
>> +	"\n	add.l %2,%0"	/* 0x0201 */
>> +	"\n	add.l %0,%1"	/* 0x0205 */
>> +	"\n	add.l %0,%0"	/* 0x0402 */
>> +	"\n	add.l %0,%1"	/* 0x0607 */
>> +	"\n	lsl.l #5,%0"	/* 0x8040 */
>> +				/* 0x8647 */

> There is no standard way to write asm in the kernel, but I prefer
> a simple semicolon after each insn

I did it the way I did above because it makes the gcc -S output very
legible.  Just like I put a space before the perands on m68k but a tab
on h8300: that's what GCC does on those platforms.

I started with the "\n\t" suffixes on each line like so much other
kernel code, but then figured out the format above which is legible
both in C source and compiler output.

>>	asm("move.l	%2,%0;"	/* 0x0001 */
>>	    "lsl.l	#2,%0;"	/* 0x0004 */
>>	    "move.l	%0,%1;"
>>	    "lsl.l	#7,%0;"	/* 0x0200 */
>>	    "add.l	%2,%0;"	/* 0x0201 */
>>	    "add.l	%0,%1;"	/* 0x0205 */
>>	    "add.l	%0,%0;"	/* 0x0402 */
>>	    "add.l	%0,%1;"	/* 0x0607 */
>>	    "lsl.l	#5,%0"	/* 0x8040 */
>>				/* 0x8647 */

> Also, it took me some time to understand the hexadecimal constants
> in the comments (and the last one predicts a future event :)).


Can you recmmend a better way to comment this?  My nose is so deep
in the code it's hard for me to judge.

> Just my two cents

And thank you very much for them!
