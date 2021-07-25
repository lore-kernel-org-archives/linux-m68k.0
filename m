Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223FDC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 13:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0320E60BD3
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 13:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhGYMUi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhGYMUi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 08:20:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADDDC061757
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 06:01:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:fcbf:bbc7:105a:68c4])
        by albert.telenet-ops.be with bizsmtp
        id ZR132500S1nuCSN06R13s9; Sun, 25 Jul 2021 15:01:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m7dkd-000iIZ-EI; Sun, 25 Jul 2021 15:01:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m7bcL-001LgM-HJ; Sun, 25 Jul 2021 12:44:21 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@uclinux.org>
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Fix invalid RMW_INSNS on CPUs that lack CAS
Date:   Sun, 25 Jul 2021 12:44:13 +0200
Message-Id: <20210725104413.318932-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When enabling CONFIG_RMW_INSNS in e.g. a Coldfire build:

    {standard input}:3068: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d4,%d0,(%a6)' ignored

Fix this by (a) adding a new config symbol to track if support for any
CPU that lacks the CAS instruction is enabled, and (b) making
CONFIG_RMW_INSNS depend on the new symbol not being set.

Fixes: 0e152d80507b75c0 ("m68k: reorganize Kconfig options to improve mmu/non-mmu selections")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 29e946394fdb4017..277d61a094637ce3 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -26,6 +26,7 @@ config COLDFIRE
 	bool "Coldfire CPU family support"
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_CAS
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
@@ -39,6 +40,7 @@ config M68000
 	bool
 	depends on !MMU
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_CAS
 	select CPU_HAS_NO_MULDIV64
 	select CPU_HAS_NO_UNALIGNED
 	select GENERIC_CSUM
@@ -54,6 +56,7 @@ config M68000
 config MCPU32
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_CAS
 	select CPU_HAS_NO_UNALIGNED
 	select CPU_NO_EFFICIENT_FFS
 	help
@@ -383,7 +386,7 @@ config ADVANCED
 
 config RMW_INSNS
 	bool "Use read-modify-write instructions"
-	depends on ADVANCED
+	depends on ADVANCED && !CPU_HAS_NO_CAS
 	help
 	  This allows to use certain instructions that work with indivisible
 	  read-modify-write bus cycles. While this is faster than the
@@ -450,6 +453,9 @@ config M68K_L2_CACHE
 config CPU_HAS_NO_BITFIELDS
 	bool
 
+config CPU_HAS_NO_CAS
+	bool
+
 config CPU_HAS_NO_MULDIV64
 	bool
 
-- 
2.25.1

