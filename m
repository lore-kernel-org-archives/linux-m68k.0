From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 07 Apr 2011 10:39:33 +0200
Message-ID: <m3vcyqbgl6.fsf@linux-m68k.org>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
	<20110406220510.GA17350@frolo.macqel> <4D9D0AF3.9070100@snapgear.com>
	<000301cbf4c9$40339fc0$c09adf40$@com> <4D9D24BB.3060804@snapgear.com>
	<000d01cbf4d1$d50e2f90$7f2a8eb0$@com> <4D9D3A28.9060104@snapgear.com>
	<BANLkTi=ay0o=QH_cUffcC=HDm=2iLcFrog@mail.gmail.com>
	<m3zko2bh19.fsf@linux-m68k.org> <20110407083519.GA10282@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110407083519.GA10282@frolo.macqel> (Philippe De Muyter's
	message of "Thu, 7 Apr 2011 10:35:19 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@snapgear.com>, Gavin Lambert <gavinl@compacsort.com>, uClinux development list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Philippe De Muyter <phdm@macqel.be> writes:

> On Thu, Apr 07, 2011 at 10:29:54AM +0200, Andreas Schwab wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> 
>> > Isn't there a reason it was read-write on m68k, like the table may be changed
>> > at runtime (to install rootkits :-)? Have to check what the other arches do...
>> 
>> Initially the syscall_table in Linux has always been writable, bb152f53
>> ("x86/x86_64: mark rodata section read-only: make some datastructures
>> const") made it read-only on x86.  Apparently nobody bothered to do the
>> equivalent change on m68k (I don't think anything makes the kernel text
>> segment write protected anyway).
>
> Except, of course, ld config files who put text and rodata in ROM/FLASH for XIP
> on embedded systems.

I'm only talking about m68k here, not m68knommu.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
