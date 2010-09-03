From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix missing linker segments
Date: Fri, 3 Sep 2010 11:15:19 +1000
Message-ID: <201009030115.o831FJN0011687@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:63327 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751900Ab0ICBPz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Sep 2010 21:15:55 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Recent changes to linker segments that hold per-cpu data broke linking
for m68knommu targets:

  LD      vmlinux
/usr/local/bin/m68k-uclinux-ld.real: error: no memory region specified for loadable section `.data..shared_aligned'

Add missing segments into the m68knommu linker script.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>


diff --git a/arch/m68knommu/kernel/vmlinux.lds.S b/arch/m68knommu/kernel/vmlinux.lds.S
index a91b271..ef33213 100644
--- a/arch/m68knommu/kernel/vmlinux.lds.S
+++ b/arch/m68knommu/kernel/vmlinux.lds.S
@@ -150,6 +150,8 @@ SECTIONS {
 		_sdata = . ;
 		DATA_DATA
 		CACHELINE_ALIGNED_DATA(32)
+		PAGE_ALIGNED_DATA(PAGE_SIZE)
+		*(.data..shared_aligned)
 		INIT_TASK_DATA(THREAD_SIZE)
 		_edata = . ;
 	} > DATA
