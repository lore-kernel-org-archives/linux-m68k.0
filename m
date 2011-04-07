From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 07 Apr 2011 10:29:54 +0200
Message-ID: <m3zko2bh19.fsf@linux-m68k.org>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
	<20110406220510.GA17350@frolo.macqel> <4D9D0AF3.9070100@snapgear.com>
	<000301cbf4c9$40339fc0$c09adf40$@com> <4D9D24BB.3060804@snapgear.com>
	<000d01cbf4d1$d50e2f90$7f2a8eb0$@com> <4D9D3A28.9060104@snapgear.com>
	<BANLkTi=ay0o=QH_cUffcC=HDm=2iLcFrog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=ay0o=QH_cUffcC=HDm=2iLcFrog@mail.gmail.com> (Geert
	Uytterhoeven's message of "Thu, 7 Apr 2011 09:04:10 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Gavin Lambert <gavinl@compacsort.com>, uClinux development list <uclinux-dev@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Isn't there a reason it was read-write on m68k, like the table may be changed
> at runtime (to install rootkits :-)? Have to check what the other arches do...

Initially the syscall_table in Linux has always been writable, bb152f53
("x86/x86_64: mark rodata section read-only: make some datastructures
const") made it read-only on x86.  Apparently nobody bothered to do the
equivalent change on m68k (I don't think anything makes the kernel text
segment write protected anyway).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
