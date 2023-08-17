Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F0DC30627
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 14:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbjHQOpH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352228AbjHQOpE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 17 Aug 2023 10:45:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168BF10EC
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Aug 2023 07:45:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
        by albert.telenet-ops.be with bizsmtp
        id aeky2A00g4QHFyo06eky8J; Thu, 17 Aug 2023 16:44:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWeF1-000u8h-6m;
        Thu, 17 Aug 2023 16:44:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qWeF8-007SBU-NT;
        Thu, 17 Aug 2023 16:44:58 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/6] m68k: math-emu: Make multi_arith.h self-contained
Date:   Thu, 17 Aug 2023 16:44:50 +0200
Message-Id: <2efd6610e97dd1621e7d28bf87cb79173285545d.1692283195.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692283195.git.geert@linux-m68k.org>
References: <cover.1692283195.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add the missing #include "fp_emu.h".

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/math-emu/multi_arith.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/math-emu/multi_arith.h b/arch/m68k/math-emu/multi_arith.h
index ed2434fcfb1ef46e..f7d9e49fe259d8c9 100644
--- a/arch/m68k/math-emu/multi_arith.h
+++ b/arch/m68k/math-emu/multi_arith.h
@@ -18,6 +18,8 @@
 #ifndef _MULTI_ARITH_H
 #define _MULTI_ARITH_H
 
+#include "fp_emu.h"
+
 static inline void fp_denormalize(struct fp_ext *reg, unsigned int cnt)
 {
 	reg->exp += cnt;
-- 
2.34.1

