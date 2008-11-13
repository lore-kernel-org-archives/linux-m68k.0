From: Stephen N Chivers <schivers@csc.com.au>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Fri, 14 Nov 2008 09:59:09 +1000
Message-ID: <OF5B7AD7F9.7094DDB7-ONCA257500.008363C6-CA257500.0083C21C@csc.com>
References: <Pine.LNX.4.64.0811111055100.19341@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail164.messagelabs.com ([216.82.253.131]:64103 "EHLO
	mail164.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943AbYKMX7E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Nov 2008 18:59:04 -0500
In-Reply-To: <Pine.LNX.4.64.0811111055100.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: Debian GNU/Linux m68k <debian-68k@lists.debian.org>, geert@linux-m68k.org, Linux/m68k <linux-m68k@vger.kernel.org>, Stephen N Chivers <schivers@csc.com.au>, Andreas Schwab <schwab@suse.de>, Roman Zippel <zippel@linux-m68k.org>

On Tue, 11 Nov 2008, Geert Uytterhoeven wrote:
   >On Tue, 11 Nov 2008, Stephen N Chivers wrote:
   >> In the past few days I have attempted to get 2.6 kernels booting on
   my
   >> diskless MVME167 boards.
   >> I have tried several kernels, including:
   >> linux-image-2.6.26-1-mvme16x_2.6.26-9_m68k.deb.
   >>
   >> None of them appear to continue beyond the initialisation code in:
   >>
   >>       arch/m68k/kernel/head.S
   >>
   >> They load normally via tftplilo and commence executing, apparently
   stopping
   >> with the only
   >> diagnostic available at the console being the magic:
   >>
   >>       ABCGHIJK
   >>
   >> In frustration, I compiled my own 2.6.24 kernel from clean source
   using a
   >> cross compilation
   >> system based on binutils-2.18 and gcc-4.1.2. The linking of vmlinux
   failed
   >> with the infamous:
   >>
   >>       m68k-linux-gnu-ld: .tmp_vmlinux1: Not enough room for program
   >> headers, try linking with -N
   >>
   >> I applied the patch for vmlinux-std.lds provided by Andreas Schwab:
   >>
   >>        http://marc.info/?l=linux-m68k&m=120596505621019&w=2
   >>
   >That patch is not in the m68k tree. It also doesn't apply anymore, as
   we
   >already have a NOTES somewhere else now.
   >
   >Do you still need it on e.g. 2.6.27?
   >
   Thanks, but no. I had found that the NOTES section was in a later
   kernel version. I use 2.6.24 here as it is my 'configuration baseline'
   for
   x86 and ppc. I have a number of MVME5110 PPC boards running 2.6 kernels
   in VME racks as well as the MVME167. I have tried compiling 2.6.27 but
   it failed with my toolchain.
   >> I traced the "freeze" of the kernel to the 'BUG_ON' test in
   >> 'm68k_setup_user_interrupt' in file
   >> arch/m68k/ints.c:
   >>
   >>       BUG_ON(IRQ_USER + cnt >= NR_IRQS);
   >>
   >> Now, for the VME boards, IRQ_USER is 8, cnt is 192 and NR_IRQS is
   200. So
   >> this test will
   >> trigger the BUG_ON action, and so the kernel appears to stop without
   >> logging any diagnostics.
   >>
   >Oops, that looks like an off-by-one error.  It has been introduced by
   commit
   >69961c375288bdab7604e0bb1c8d22999bb8a347 ("[PATCH] m68k/Atari:
   Interrupt
   >updates").
   >
   >I'll fix it.
   Yes, please, I would appreciate it. I am not comfortable with
   submitting patches to the kernel and feel that it is better left
   to those with more experience.
   >
   >Gr{oetje,eeting}s

   Stephen Chivers,
   CSC  Australia, Pty. Ltd.

