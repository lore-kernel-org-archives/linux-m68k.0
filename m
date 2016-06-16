From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH -v2 14/33] locking,m68k: Implement atomic_fetch_{add,sub,and,or,xor}()
Date: Thu, 16 Jun 2016 14:43:29 +0200
Message-ID: <mvmk2hpxq1a.fsf__38620.9833938212$1466081065$gmane$org@hawking.suse.de>
References: <20160531101925.702692792@infradead.org>
	<20160531102642.333689893@infradead.org>
	<CAMuHMdXG4veEOqr5vcZQEQH55=CT6CPXOfqrc_m=fpXEseAdLA@mail.gmail.com>
	<20160616101309.GD30921@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160616101309.GD30921@twins.programming.kicks-ass.net> (Peter
	Zijlstra's message of "Thu, 16 Jun 2016 12:13:09 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>, Paul McKenney <paulmck@linux.vnet.ibm.com>, boqun.feng@gmail.com, waiman.long@hpe.com, =?utf-8?B?RnLDqWTDqXJpYw==?= Weisbecker <fweisbec@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, Miao Steven <realmz6@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Kuo <rkuo@codeaurora.org>, Tony Luck <tony.luck@intel.com>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, David Howells <dhowells@redhat.com>Ja

Peter Zijlstra <peterz@infradead.org> writes:

> On Thu, Jun 16, 2016 at 12:08:27PM +0200, Geert Uytterhoeven wrote:
>
>> >  #ifdef CONFIG_RMW_INSNS
>> >
>> > +/*
>> > + * Am I reading these CAS loops right in that %2 is the old value and the first
>> > + * iteration uses an uninitialized value?
>> > + *
>> > + * Would it not make sense to add: tmp = atomic_read(v); to avoid this?
>> > + */
>> > +
>> >  #define ATOMIC_OP_RETURN(op, c_op, asm_op)                             \
>> >  static inline int atomic_##op##_return(int i, atomic_t *v)             \
>> >  {                                                                      \
>> 
>> Do we want the above comment in the code?
>
> I figured it would not hurt; is this indeed the case, do we want to fix
> it?

No, there is nothing to fix here.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
