Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AADEDEC62
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241237AbjIMOJA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241260AbjIMOI4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:08:56 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C541BD0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by xavier.telenet-ops.be with bizsmtp
        id lS8m2A00f3fvA4V01S8m2Z; Wed, 13 Sep 2023 16:08:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXd-003crP-Dv;
        Wed, 13 Sep 2023 16:08:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXu-00FV3z-PK;
        Wed, 13 Sep 2023 16:08:46 +0200
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
Subject: [PATCH v2 08/52] m68k: kernel: Add and use "signal.h"
Date:   Wed, 13 Sep 2023 16:07:58 +0200
Message-Id: <25cecda80698829cec18721a9d0f058cc69df0cc.1694613528.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613528.git.geert@linux-m68k.org>
References: <cover.1694613528.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/kernel/signal.c:756:18: warning: no previous prototype for ‘do_sigreturn’ [-Wmissing-prototypes]
      756 | asmlinkage void *do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
	  |                  ^~~~~~~~~~~~
    arch/m68k/kernel/signal.c:783:18: warning: no previous prototype for ‘do_rt_sigreturn’ [-Wmissing-prototypes]
      783 | asmlinkage void *do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
	  |                  ^~~~~~~~~~~~~~~
    arch/m68k/kernel/signal.c:1112:17: warning: no previous prototype for ‘do_notify_resume’ [-Wmissing-prototypes]
     1112 | asmlinkage void do_notify_resume(struct pt_regs *regs)
	  |                 ^~~~~~~~~~~~~~~~

Fix this by introducing a new header file "signal.h" for holding the
prototypes of functions implemented in arch/m68k/kernel/signal.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/kernel/signal.c | 2 ++
 arch/m68k/kernel/signal.h | 7 +++++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/m68k/kernel/signal.h

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index 459c5ff69fcfa126..e628b859ef21beaf 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -51,6 +51,8 @@
 #include <asm/ucontext.h>
 #include <asm/cacheflush.h>
 
+#include "signal.h"
+
 #ifdef CONFIG_MMU
 
 /*
diff --git a/arch/m68k/kernel/signal.h b/arch/m68k/kernel/signal.h
new file mode 100644
index 0000000000000000..498d84f828202541
--- /dev/null
+++ b/arch/m68k/kernel/signal.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+
+asmlinkage void do_notify_resume(struct pt_regs *regs);
+asmlinkage void *do_sigreturn(struct pt_regs *regs, struct switch_stack *sw);
+asmlinkage void *do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw);
-- 
2.34.1

