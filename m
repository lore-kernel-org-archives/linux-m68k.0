Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B484EC8726
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbjIGRha (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243575AbjIGRh3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 13:37:29 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5631BEA
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 10:37:00 -0700 (PDT)
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4RhL6D09fLz4x2LJ
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:43:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by michel.telenet-ops.be with bizsmtp
        id j1hx2A00L2mGBSJ061hxu2; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGQ-002m85-3F;
        Thu, 07 Sep 2023 15:41:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGf-00CMfU-BQ;
        Thu, 07 Sep 2023 15:41:57 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 06/52] m68k: kernel: Add and use "process.h"
Date:   Thu,  7 Sep 2023 15:41:07 +0200
Message-Id: <6894409da1a0d8667bf74b9100067485ce3c37ac.1694093327.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694093327.git.geert@linux-m68k.org>
References: <cover.1694093327.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/kernel/process.c:115:16: warning: no previous prototype for ‘m68k_clone’ [-Wmissing-prototypes]
      115 | asmlinkage int m68k_clone(struct pt_regs *regs)
	  |                ^~~~~~~~~~
    arch/m68k/kernel/process.c:136:16: warning: no previous prototype for ‘m68k_clone3’ [-Wmissing-prototypes]
      136 | asmlinkage int m68k_clone3(struct pt_regs *regs)
	  |                ^~~~~~~~~~~

Fix this by introducing a new header file "process.h" for holding the
prototypes of functions implemented in arch/m68k/kernel/process.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/process.c | 1 +
 arch/m68k/kernel/process.h | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/m68k/kernel/process.h

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index e06ce147c0b7fcf2..d2d6a57356502e5b 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -38,6 +38,7 @@
 #include <asm/machdep.h>
 #include <asm/setup.h>
 
+#include <process.h>
 
 asmlinkage void ret_from_fork(void);
 asmlinkage void ret_from_kernel_thread(void);
diff --git a/arch/m68k/kernel/process.h b/arch/m68k/kernel/process.h
new file mode 100644
index 0000000000000000..d31745f2e64bebab
--- /dev/null
+++ b/arch/m68k/kernel/process.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/linkage.h>
+
+struct pt_regs;
+
+asmlinkage int m68k_clone(struct pt_regs *regs);
+asmlinkage int m68k_clone3(struct pt_regs *regs);
-- 
2.34.1

