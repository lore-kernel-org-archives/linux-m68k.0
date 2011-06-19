From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Sun, 19 Jun 2011 13:19:05 +0200
Message-ID: <m2mxhejcgm.fsf__35791.0570958213$1308482380$gmane$org@igel.home>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com>
	<m2sjr8gyp0.fsf@igel.home>
	<BANLkTikxzQSXLfr81q+b1rScW8YCcoJZRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTikxzQSXLfr81q+b1rScW8YCcoJZRQ@mail.gmail.com> (Geert
	Uytterhoeven's message of "Sun, 19 Jun 2011 12:17:34 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> BUG_ON(!irqs_disabled()) triggers as flags is 0x2619 there.

Which is correct, since arch_local_irq_disable would set it to 2719.
You need to find out why arch_local_irq_disable wasn't called.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
