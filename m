Return-Path: <SRS0=yKKv=A5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76929C433DF
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5769E2080D
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jul 2020 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595089622;
	bh=I+irXVBaKYK/GaEKnFA6n5TpwjqOt7J1sF39r7baGqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kCSlE4EbEymkbOTF0yK62EHLg3gHOwPkcrauU4ubVr55KYdUSIy+ZycTMMCbxtVOp
	 X65zMddoy6TxoJ3d8LLRWTeu35ZVXP+ynZIkpTmc9oMqNzy8Ad1/SmdIrCogHQZS97
	 Gn0LaiiX7aslk2gmPWdUfNl8cWdTBCV1sfWH6J9Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgGRQ1C (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 18 Jul 2020 12:27:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgGRQ1B (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 18 Jul 2020 12:27:01 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2D622073E;
        Sat, 18 Jul 2020 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595089621;
        bh=I+irXVBaKYK/GaEKnFA6n5TpwjqOt7J1sF39r7baGqI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qmRz1ag4cdAiyh6dxG6dyNJ7RD5iv16qDbrwId1Eqvwehg8bPJX7QBLngFG0uoG5U
         0bH1m4sqjQbEx29FW2ylxBec8Ut7IHTnEaaD58K08X1gvFRBco25ZO1wW3JF02KJnb
         YJa2ZDFtU6cPtEgKmN/US71dUFY30avTMTwKFa5M=
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v3 1/3] m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
Date:   Sat, 18 Jul 2020 19:26:49 +0300
Message-Id: <20200718162651.26538-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718162651.26538-1-rppt@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The pg_data_t node structures and their initialization currently depends on
!CONFIG_SINGLE_MEMORY_CHUNK. Since their are required only for DISCONTIGMEM
make this dependency explicit and replace usage of
CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.

The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
variant, although it always presumed a single memory bank. As there is no
actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/Kconfig.cpu           | 6 +++---
 arch/m68k/include/asm/page_mm.h | 2 +-
 arch/m68k/mm/init.c             | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 694c4fca9f5d..3af0fca03803 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -20,6 +20,7 @@ choice
 
 config M68KCLASSIC
 	bool "Classic M68K CPU family support"
+	select NEED_MULTIPLE_NODES if DISCONTIGMEM
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
@@ -373,8 +374,7 @@ config RMW_INSNS
 config SINGLE_MEMORY_CHUNK
 	bool "Use one physical chunk of memory only" if ADVANCED && !SUN3
 	depends on MMU
-	default y if SUN3
-	select NEED_MULTIPLE_NODES
+	default y if SUN3 || MMU_COLDFIRE
 	help
 	  Ignore all but the first contiguous chunk of physical memory for VM
 	  purposes.  This will save a few bytes kernel size and may speed up
@@ -406,7 +406,7 @@ config M68K_L2_CACHE
 config NODES_SHIFT
 	int
 	default "3"
-	depends on !SINGLE_MEMORY_CHUNK
+	depends on DISCONTIGMEM
 
 config CPU_HAS_NO_BITFIELDS
 	bool
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e6b75992192b..0e794051d3bb 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -126,7 +126,7 @@ static inline void *__va(unsigned long x)
 
 extern int m68k_virt_to_node_shift;
 
-#ifdef CONFIG_SINGLE_MEMORY_CHUNK
+#ifndef CONFIG_DISCONTIGMEM
 #define __virt_to_node(addr)	(&pg_data_map[0])
 #else
 extern struct pglist_data *pg_data_table[];
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 53040857a9ed..4b46ceace3d3 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -47,14 +47,14 @@ EXPORT_SYMBOL(pg_data_map);
 
 int m68k_virt_to_node_shift;
 
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+#ifdef CONFIG_DISCONTIGMEM
 pg_data_t *pg_data_table[65];
 EXPORT_SYMBOL(pg_data_table);
 #endif
 
 void __init m68k_setup_node(int node)
 {
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+#ifdef CONFIG_DISCONTIGMEM
 	struct m68k_mem_info *info = m68k_memory + node;
 	int i, end;
 
-- 
2.26.2

