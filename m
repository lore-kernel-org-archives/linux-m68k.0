Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2868EDEC5C
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241299AbjIMOI6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241253AbjIMOI4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:08:56 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5801E1BD6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by baptiste.telenet-ops.be with bizsmtp
        id lS8m2A00P3fvA4V01S8mqA; Wed, 13 Sep 2023 16:08:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXd-003crF-BD;
        Wed, 13 Sep 2023 16:08:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXu-00FV3j-Me;
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
Subject: [PATCH v2 05/52] m68k: kernel: Add and use "ints.h"
Date:   Wed, 13 Sep 2023 16:07:55 +0200
Message-Id: <dc65d01ca4c7de94ce814e5b5e1f726fff97566b.1694613528.git.geert@linux-m68k.org>
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

    arch/m68k/kernel/ints.c:165:17: warning: no previous prototype for ‘handle_badint’ [-Wmissing-prototypes]
      165 | asmlinkage void handle_badint(struct pt_regs *regs)
	  |                 ^~~~~~~~~~~~~

Fix this by introducing a new header file "ints.h" for holding the
prototypes of functions implemented in arch/m68k/kernel/ints.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/kernel/ints.c | 2 ++
 arch/m68k/kernel/ints.h | 7 +++++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/m68k/kernel/ints.h

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index 5b8d66fbf3832a2c..cf2b13488476c8c6 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -26,6 +26,8 @@
 #include <asm/q40ints.h>
 #endif
 
+#include "ints.h"
+
 extern u32 auto_irqhandler_fixup[];
 extern u16 user_irqvec_fixup[];
 
diff --git a/arch/m68k/kernel/ints.h b/arch/m68k/kernel/ints.h
new file mode 100644
index 0000000000000000..ecac6011c1a45489
--- /dev/null
+++ b/arch/m68k/kernel/ints.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+
+struct pt_regs;
+
+asmlinkage void handle_badint(struct pt_regs *regs);
-- 
2.34.1

