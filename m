From: "Gavin Lambert" <gavinl@compacsort.com>
Subject: RE: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 7 Apr 2011 15:13:56 +1200
Message-ID: <000d01cbf4d1$d50e2f90$7f2a8eb0$@com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>	<20110406220510.GA17350@frolo.macqel>	<4D9D0AF3.9070100@snapgear.com> <000301cbf4c9$40339fc0$c09adf40$@com> <4D9D24BB.3060804@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4D9D24BB.3060804@snapgear.com>
Content-Language: en-nz
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: 'Greg Ungerer' <gerg@snapgear.com>, 'uClinux development list' <uclinux-dev@uclinux.org>
Cc: 'Philippe De Muyter' <phdm@macqel.be>, 'Geert Uytterhoeven' <geert@linux-m68k.org>, 'Linux/m68k' <linux-m68k@lists.linux-m68k.org>

Quoth Greg Ungerer:
>> Doesn't that have XIP consequences?  .text (and presumably .rodata) 
>> can be stored and executed from ROM, since they can't be changed at 
>> runtime.  .data has to be in RAM, since it can be.
>
> Yes, but even in the kernel XIP case the very early startup code
> moves the kernels data to RAM. Well before the system call table
> will be needed.

But presumably if the syscall table was previously in .text, it was not
subject to this.  And now it will be.

I doubt this would actually break anything (as you've already confirmed),
since it's only a tiny RAM usage increase, but unless there's some reason
for the syscall table to be read-write it seems a bit odd.
