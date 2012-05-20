From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: What ISA hardware is integrated into m68k bridges
Date: Sun, 20 May 2012 12:31:05 -0400
Message-ID: <20120520163105.GC21177@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:61253 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753049Ab2ETQbN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 12:31:13 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Hi Geert,

A discussion is underway with respect to the future of the various ISA
drivers[1], and Alan suggested checking with the m68k folks:

  Check with the M68K people however. 3c501 won't matter to them but I'm
  not sure which of the other chips ended up on Amiga ISA bridges. I know
  NE2000 clones did.
  
I know you've currently got that "almost ne2k" driver that runs IRQ-less.  Are
there other "ISA-like" onboard devices in the M68k harware scope that rely on 
existing (x86) ISA drivers?

Thanks,
Paul.

[1] http://patchwork.ozlabs.org/patch/160144/

--
