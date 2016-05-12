From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: 12 May 2016 04:04:29 -0400
Message-ID: <20160512080429.31536.qmail@ns.horizon.com>
References: <573327E1.3060408@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:44175 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751614AbcELIEc (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 May 2016 04:04:32 -0400
In-Reply-To: <573327E1.3060408@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux@horizon.com

Thanks for the response!

> That mulsi3.S code was taken directly from gcc's lb1sf68.S (and that
> was lb1sf68.asm in older versions of gcc). It has always had that
> coldfire conditional code in it. Not sure why it was in there though.

I went digging through a lot of ColdFire documentation to see if
there were ever any that needed it, and apparently it's been in there
since the beginning.

It did occur to me that perhaps someone wanted to support tne
intersection of all 68k family CPUs, so that meant only MULU.W
and ADD.L.  But I can't see a gcc option to ask for that.


Mostly I just thought that saving a few cycles was a nice win.


This is tangential to some work I'm doing on the hash functions.
in <linux/hash.h>, there are hash_32(x, bits) and hash_64(x, bits)
which basically do "return (x * CONSTANT) >> (32 - bits)", or
64 - bits for the 64-bit version.

The CONSTANTs were chosen to be efficient when computed using
shift-and-add sequences, but that made them less effective hashes.

The 64-bit constant was recently revised to avoid a bad case found when
hashing page-aligned pointers, since it's a pointless optimization;
all 64-bit processors have fast multipliers.  But 32 bits was left alone
for fear of breaking performance.

After some research (partly by searching for __mulsi3), I found that m68k
is the only platform that doesn't have a fast multiplier.  SPARC used
to be in that boat too, but SPARCv7 syupport was dropped a few years
ago.

That led to me optimizing the multiply-by-constant code for m68k.



Do you have any interest in the matter?  Basically, the options are
to optimize the implementation of the multiplication, or come up with
a different hash function that works better in that environment.


The current multiply by 0x9e370001 compiles to, depending on compiler
flags, either a call to __mulsi3 or (omitting prologue & epilogue,
since it's designed as an in-line function):

	move.l	%d0,%d1		 4
	lsl.l	#6,%d1		20  24
	move.l	%d1,%d2		 4  28
	lsl.l	#3,%d2		14  42
	sub.l	%d1,%d2		 8  50
	sub.l	%d0,%d2		 8  58
	move.l	%d2,%d1		 4  62
	lsl.l	#3,%d1		14  76
	sub.l	%d2,%d1		 8  84
	lsl.l	#3,%d1		14  98
	add.l	%d0,%d1		 8 106
	swap	%d1		 4 110
	clr.w	%d1		 4 114
	sub.l	%d1,%d0		 8 122

(The columns on the right are cycle counts.)

Tangent: I'm surprised I can't coax it into the equivalent:
	move.w %d0,%d1		 4
	mulu.w #0x9e37,%d1	58  62
	add.l %d1,%d0		 8  70

Anyway, the problem is the low Hamming weight of the low 16 bits,
which has to be solved somehow.  The "more random" high 16 bits of the
multiplier are only multiplied by the low 16 bits of the argument.
The high 16 bits of the argument are just multiplied by 1.  If the
argument is a page-aligned pointer, with 12 low-order bits zero, we have
very poor mixing.

Using the better constant 0x61C88647 (both this and the previous one are
chosen to be close to phi, the golden ratio (sqrt(5)-1)/2, but this is
the negative), gcc struggles.

I searched for an efficient shift-and-add sequence,
and came up with the 68000-optimized:

/* Multiply by 0x61C88647 */
unsigned hash_32(unsigned x)
{
	unsigned a, b, c;

	a = b = c = x;	
	c <<= 19;
	a += c;		/* a = (x << 19) + x */
	b <<= 9;
	b += a;		/* b = (x << 9) + a */
	c <<= 4;
	c += b;		/* c = (x << 23) + b */
	b <<= 5;
	b += c;		/* (b << 5) + c */
	b <<= 3;
	b += a;		/* ((b << 5) + c << 3) + a */
	b <<= 3;
	b -= c;		/* (((b << 5) + c << 3) + a << 3) - c */
	return x;
}

which gcc turns into:
	move.l	%d1,%d2		 4
	lsl.w	#3,%d2		12  16
	swap	%d2		 4  20
	clr.w	%d2		 4  24
	move.l	%d1,%a1		 4  28
	add.l	%d2,%a1		 8  36
	moveq	#9,%d0		 4  40
	lsl.l	%d0,%d1		26  66
	add.l	%a1,%d1		 8  74
	lsl.l	#4,%d2		16  90
	move.l	%d1,%a0		 4  94
	add.l	%d2,%a0		 8 102
	lsl.l	#5,%d1		18 120
	move.l	%a0,%d0		 4 124
	add.l	%d1,%d0		 8 132
	move.l	%d0,%d1		 4 136
	lsl.l	#3,%d1		14 150
	move.l	%a1,%d0		 4 154
	add.l	%d1,%d0		 8 162
	lsl.l	#3,%d0		14 176
	sub.l	%a0,%d0		 8 184

I can shave a few cycles with hand-optimized code, but the result is
barely faster than the much smaller multiply-based:

	; y = #k * x, with z as a temp
	move.w  #klow, y        ;  8
	move.w  x, z            ;  4     12
	swap    x               ;  4     16
	mulu.w  y, x            ; 52     68	(Using klow = 0x8647)
	mulu.w  z, y            ; 54    122	(Assuming 50% ones)
	mulu.w  #khigh, z       ; 54    176	(Using khigh = 0x61C8)
	swap    y               ;  4    180
	add.w   x, y            ;  4    184
	add.w   z, y            ;  4    188
	swap    y               ;  4    192
	;; 12 words

Another way to divide it up is to compute xlow * khigh with a multiply,
and x * klow with shifts and adds.  x * 0x8647 can be evauated as:

	unsigned a = (x << 9) + x;
	unsigned b = (x << 1) + a;
	unsigned c = (b << 1) + (a << 6) + a;
	return c + ((uint16_t)(x * 0x61C8) << 16);

If I write it in the following form:
	register unsigned a, b;

	b = x << 1;
	asm("" : "=g" (a) : "0" (b));	/* "a = b, DAMN IT" */
	a <<= 8;
	a += x;
	b += a;
	b += b;
	b += a;
	a <<= 6;
	return a + b + ((uint16_t)(x * 0x61c8) << 16);

The gcc can be coaxed into generating the desired code.
(The "asm" is the only way I found to stop GCC from collapsing
"(x << 1) << 8" to "x << 9", which is slower.)

baz:
	move.l 4(%sp),%d1
	move.l %d1,%a0		 4
	add.l %d1,%a0		 8  12
	move.l %a0,%d0		 4  16
	lsl.l #8,%d0		24  40
	add.l %d1,%d0		 8  48
	add.l %d0,%a0		 8  56
	muls.w #25032,%d1	56 112
	swap %d1		 4 116
	clr.w %d1		 4 120
	add.l %d0,%d1		 8 128
	add.l %a0,%d1		 8 136
	add.l %a0,%d1		 8 144
	lsl.l #6,%d0		20 164
	add.l %d1,%d0		 8 172
	rts

Well, that's a *little* bit faster.



Alternatively, I could just invent a whole different hash function for
the case.  One idea is to use two, rather than three, 16-bit multiplies.
Split the input into two 16-bit halves, multiply them by separate
constants, sum the results, and then swap the halves.

	move.w	x, y		 4
	swap	x		 4   8
	mulu.w	#K1, y		58  66
	mulu.w	#K2, x		58 124
	add.l	y, x		 8 132
	swap	x		 4 136

The swap is important; hash_32() is documented as putting the "most mixed"
bits in the most significant bits, as hash tables are indexed by the most
significant bits.

If you have any thoughts on the matter, they'd definitely be appreciated.
