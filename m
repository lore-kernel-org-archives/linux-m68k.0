From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Fri, 06 May 2011 10:24:04 +0200
Message-ID: <m38vuk9qzf.fsf@linux-m68k.org>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
	<201105052237.11656.arnd@arndb.de>
	<BANLkTinqouGVWH8CmfM038TKFvhpJEczUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTinqouGVWH8CmfM038TKFvhpJEczUQ@mail.gmail.com> (Geert
	Uytterhoeven's message of "Fri, 6 May 2011 07:11:42 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> BTW, we have a hole at 218/219. I don't remember why, but it may have been
> a placeholder for pselect6 and ppoll when that implementation was still in flux.
> Couldn't find anything about it in git/cvs archives, so I'll check
> have to check my
> old mailing list archives...

Probably it originated from the time when it was still deemed useful to
keep the numbers in sync with the x86 ones.  The hole is filled with
mincore and madvice there (pselect6 and ppoll came much later).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
