Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CCFEC874B
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 18:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245711AbjIGSDA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245686AbjIGSC6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 14:02:58 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C171FE2
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 11:02:35 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4RhL6D1NMRz4x7dd
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:43:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by baptiste.telenet-ops.be with bizsmtp
        id j1hx2A00N2mGBSJ011hxWz; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGQ-002m8N-7y;
        Thu, 07 Sep 2023 15:41:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGf-00CMfp-FP;
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
Subject: [PATCH 10/52] m68k: kernel: Add and use "vectors.h"
Date:   Thu,  7 Sep 2023 15:41:11 +0200
Message-Id: <dbdef83afaebc06ef5dd7642f0885b0d17e7b91e.1694093327.git.geert@linux-m68k.org>
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

    arch/m68k/kernel/vectors.c:52:13: warning: no previous prototype for ‘base_trap_init’ [-Wmissing-prototypes]
       52 | void __init base_trap_init(void)
	  |             ^~~~~~~~~~~~~~

Fix this by introducing a new header file "vectors.h" for holding the
prototypes of functions implemented in arch/m68k/kernel/vectors.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/vectors.c | 2 ++
 arch/m68k/kernel/vectors.h | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 arch/m68k/kernel/vectors.h

diff --git a/arch/m68k/kernel/vectors.c b/arch/m68k/kernel/vectors.c
index 68762fc1dc97b4e1..667e848070f4d3d7 100644
--- a/arch/m68k/kernel/vectors.c
+++ b/arch/m68k/kernel/vectors.c
@@ -28,6 +28,8 @@
 #include <asm/fpu.h>
 #include <asm/traps.h>
 
+#include "vectors.h"
+
 /* assembler routines */
 asmlinkage void system_call(void);
 asmlinkage void buserr(void);
diff --git a/arch/m68k/kernel/vectors.h b/arch/m68k/kernel/vectors.h
new file mode 100644
index 0000000000000000..897330737ec570a5
--- /dev/null
+++ b/arch/m68k/kernel/vectors.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+void base_trap_init(void);
-- 
2.34.1

