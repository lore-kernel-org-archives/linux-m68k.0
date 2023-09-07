Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F48EC8726
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 17:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243989AbjIGRdW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245266AbjIGRdQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 13:33:16 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B141FE4
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 10:32:47 -0700 (PDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4RhLyj0ZcFz4x0cf
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 16:21:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by laurent.telenet-ops.be with bizsmtp
        id j2MX2A00S2mGBSJ012MXea; Thu, 07 Sep 2023 16:21:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFsi-002mG9-FE;
        Thu, 07 Sep 2023 16:21:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFsx-00CNCC-NO;
        Thu, 07 Sep 2023 16:21:31 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate by SPDX
Date:   Thu,  7 Sep 2023 16:21:30 +0200
Message-Id: <2349faf484969a86be141f6d90e45657e692d3a5.1694095086.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694095086.git.geert@linux-m68k.org>
References: <cover.1694095086.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Upstream Linux never had a "README.legal" file, but it was present
in early source releases of Linux/m68k.  It contained a simple copyright
notice and a link to a version of the "COPYING" file that predated the
addition of the "only valid GPL version is v2" clause.

Get rid of the references to non-existant files by replacing the
boilerplate with SPDX license identifiers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 5 +----
 arch/powerpc/kernel/signal.c        | 5 +----
 arch/powerpc/kernel/signal.h        | 7 ++-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 5d7a72b41ae71158..727ed4a145451356 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  PowerPC version
  *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
@@ -9,10 +10,6 @@
  *
  * Modified by Cort Dougan (cort@hq.fsmlabs.com)
  * and Paul Mackerras (paulus@samba.org).
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #include <linux/regset.h>
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 68a91e553e14cea2..aa17e62f37547a79 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Common signal handling code for both 32 and 64 bits
  *
  *    Copyright (c) 2007 Benjamin Herrenschmidt, IBM Corporation
  *    Extracted from signal_32.c and signal_64.c
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #include <linux/resume_user_mode.h>
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index a429c57ed4331805..58ecea1cdc27ae80 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -1,10 +1,7 @@
-/*
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *    Copyright (c) 2007 Benjamin Herrenschmidt, IBM Corporation
  *    Extracted from signal_32.c and signal_64.c
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #ifndef _POWERPC_ARCH_SIGNAL_H
-- 
2.34.1

