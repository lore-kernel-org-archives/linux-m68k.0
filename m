From: "Gavin Lambert" <gavinl@compacsort.com>
Subject: RE: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of	sys_call_table
Date: Thu, 7 Apr 2011 14:12:31 +1200
Message-ID: <000301cbf4c9$40339fc0$c09adf40$__11715.2388128035$1302143146$gmane$org@com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>	<20110406220510.GA17350@frolo.macqel> <4D9D0AF3.9070100@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4D9D0AF3.9070100@snapgear.com>
Content-Language: en-nz
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: 'uClinux development list' <uclinux-dev@uclinux.org>, 'Philippe De Muyter' <phdm@macqel.be>, 'Geert Uytterhoeven' <geert@linux-m68k.org>
Cc: 'Linux/m68k' <linux-m68k@lists.linux-m68k.org>

Quoth Greg Ungerer:
> >> Impact for m68knommu:
> >>    - The table is now stored in .data instead of .text,
> >
> > Do you mean .rodata ?
[...]
> Yes, I suspect that was the original thinking. It has been that way
> for a very long time (it is in .text in the 2.4 kernel patches for
> this too).
> 
> I will test them on m68knommu today, I am sure moving to .data (really
> rodata) will be fine.

Doesn't that have XIP consequences?  .text (and presumably .rodata) can be
stored and executed from ROM, since they can't be changed at runtime.  .data
has to be in RAM, since it can be.
