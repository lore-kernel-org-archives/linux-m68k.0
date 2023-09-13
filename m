Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD42EDEC4D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241060AbjIMNpV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241160AbjIMNpS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:18 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B111BC3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B163ECE1F1B;
        Wed, 13 Sep 2023 13:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FA8C433C8;
        Wed, 13 Sep 2023 13:45:09 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 6/7] m68knommu: 68000: fix warnings in 68000 interrupt handling
Date:   Wed, 13 Sep 2023 23:44:24 +1000
Message-Id: <20230913134425.2610927-7-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

      CC      arch/m68k/68000/ints.o
    arch/m68k/68000/ints.c:77:6: warning: no previous prototype for ‘process_int’ [-Wmissing-prototypes]
     void process_int(int vec, struct pt_regs *fp)
          ^~~~~~~~~~~
    arch/m68k/68000/ints.c:153:13: warning: no previous prototype for ‘trap_init’ [-Wmissing-prototypes]
     void __init trap_init(void)
                 ^~~~~~~~~

Include linux/cpu.h to get the prototype for trap_init().
Create a local ints.h for prototype of process_int(). Also mark
process_int() as asmlinkage, since it is called from the first level
interrupt assembly handler.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/68000/ints.c | 5 ++++-
 arch/m68k/68000/ints.h | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/68000/ints.h

diff --git a/arch/m68k/68000/ints.c b/arch/m68k/68000/ints.c
index f9a5ec781408..2ba9926e91ae 100644
--- a/arch/m68k/68000/ints.c
+++ b/arch/m68k/68000/ints.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/cpu.h>
 #include <asm/traps.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
@@ -26,6 +27,8 @@
 #include <asm/MC68328.h>
 #endif
 
+#include "ints.h"
+
 /* assembler routines */
 asmlinkage void system_call(void);
 asmlinkage void buserr(void);
@@ -74,7 +77,7 @@ asmlinkage irqreturn_t inthandler7(void);
  * into one vector and look in the blasted mask register...
  * This code is designed to be fast, almost constant time, not clean!
  */
-void process_int(int vec, struct pt_regs *fp)
+asmlinkage void process_int(int vec, struct pt_regs *fp)
 {
 	int irq;
 	int mask;
diff --git a/arch/m68k/68000/ints.h b/arch/m68k/68000/ints.h
new file mode 100644
index 000000000000..d9cfd0eb9ffe
--- /dev/null
+++ b/arch/m68k/68000/ints.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+
+struct pt_regs;
+
+asmlinkage void process_int(int vec, struct pt_regs *fp);
-- 
2.25.1

