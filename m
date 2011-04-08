From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 0/5] m68k: merge mmu and non-mmu kernel/m68k_ksyms.c files
Date: Fri, 8 Apr 2011 22:16:57 +1000
Message-ID: <1302265022-6614-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:16812 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756088Ab1DHMVM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Apr 2011 08:21:12 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


The following patch series cleans up and merges the m68k and m68knommu
m68k_syms.c file. Most of the work is in re-organizing and cleaning up
the m68knommu parts. The final file merge is pretty simple then.

 a/arch/m68k/kernel/m68k_ksyms_no.c  |   44 ------------------------------------
 arch/m68k/kernel/m68k_ksyms_mm.c    |   16 -------------
 arch/m68k/kernel/m68k_ksyms_no.c    |   21 -----------------
 arch/m68k/kernel/process_no.c       |    1 
 b/arch/m68k/kernel/m68k_ksyms.c     |   35 +++++++++++++++++++++++++---
 b/arch/m68k/kernel/m68k_ksyms_no.c  |    4 ---
 b/arch/m68k/kernel/process_no.c     |    1 
 b/arch/m68k/lib/checksum_no.c       |    3 ++
 b/arch/m68k/platform/coldfire/dma.c |    3 ++
 9 files changed, 39 insertions(+), 89 deletions(-)
