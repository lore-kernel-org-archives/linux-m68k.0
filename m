From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Fri, 17 Jun 2011 19:22:35 +0200
Message-ID: <m2sjr8gyp0.fsf__28741.3156162531$1308331388$gmane$org@igel.home>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com> (Geert
	Uytterhoeven's message of "Thu, 16 Jun 2011 21:45:11 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> This is the WARN_ONCE(!irqs_disabled()) check.
>
> static inline bool arch_irqs_disabled_flags(unsigned long flags)
> {
>         return (flags & ~ALLOWINT) != 0;

That should be

          return (flags & 0x700) == 0x700;

It doesn't make sense to use ALLOWINT here, since arch_local_irq_disable
doesn't use it either.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
