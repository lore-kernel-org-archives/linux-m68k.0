Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B3FC4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 03:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F9D360F4C
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 03:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239421AbhIWDny (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Sep 2021 23:43:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239422AbhIWDmD (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Sep 2021 23:42:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0643261130;
        Thu, 23 Sep 2021 03:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368432;
        bh=9YslAXxCMaTFHOBWoSiFZ6Zq2lboJuzMRnlyQStX84w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZAzYQHY1w7FfgZIeTkpDZ9cNOQrEsSGb6iIP2fWO78HtUsJ65AW5cP2VHiTc2tdYI
         1vOL4D4cMXccgCsD8ZNd6Y//QCyvRAYAjQ04Vr2g1Jch7k1Q0GGk/D0AQSPPaC8g7U
         IWZyuSO8PNvPHeZmbUZjE+LwMx74r4Y0PpqWeGBTNapK87eDgqok9A7hyi65euSz8L
         /dznm/bSXNUQYfhOiu3ZBio60/YB6AtSWDjPAFpFPL7la1Nl0ezAcm6a9iuPQVWZyf
         XcbIMcC9oOAeZpf+yit15N07ChovJEjOu7uIAfglpiMUWyVBFE2BAgC3UxOBgKloBt
         L0x1BgPUX/mow==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 4.9 02/11] m68k: Double cast io functions to unsigned long
Date:   Wed, 22 Sep 2021 23:40:18 -0400
Message-Id: <20210923034028.1421876-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923034028.1421876-1-sashal@kernel.org>
References: <20210923034028.1421876-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit b1a89856fbf63fffde6a4771d8f1ac21df549e50 ]

m68k builds fail widely with errors such as

arch/m68k/include/asm/raw_io.h:20:19: error:
	cast to pointer from integer of different size
arch/m68k/include/asm/raw_io.h:30:32: error:
	cast to pointer from integer of different size [-Werror=int-to-p

On m68k, io functions are defined as macros. The problem is seen if the
macro parameter variable size differs from the size of a pointer. Cast
the parameter of all io macros to unsigned long before casting it to
a pointer to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20210907060729.2391992-1-linux@roeck-us.net
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/include/asm/raw_io.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index 932faa35655b..2238232c360e 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -30,21 +30,21 @@ extern void __iounmap(void *addr, unsigned long size);
  * two accesses to memory, which may be undesirable for some devices.
  */
 #define in_8(addr) \
-    ({ u8 __v = (*(__force volatile u8 *) (addr)); __v; })
+    ({ u8 __v = (*(__force volatile u8 *) (unsigned long)(addr)); __v; })
 #define in_be16(addr) \
-    ({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
+    ({ u16 __v = (*(__force volatile u16 *) (unsigned long)(addr)); __v; })
 #define in_be32(addr) \
-    ({ u32 __v = (*(__force volatile u32 *) (addr)); __v; })
+    ({ u32 __v = (*(__force volatile u32 *) (unsigned long)(addr)); __v; })
 #define in_le16(addr) \
-    ({ u16 __v = le16_to_cpu(*(__force volatile __le16 *) (addr)); __v; })
+    ({ u16 __v = le16_to_cpu(*(__force volatile __le16 *) (unsigned long)(addr)); __v; })
 #define in_le32(addr) \
-    ({ u32 __v = le32_to_cpu(*(__force volatile __le32 *) (addr)); __v; })
+    ({ u32 __v = le32_to_cpu(*(__force volatile __le32 *) (unsigned long)(addr)); __v; })
 
-#define out_8(addr,b) (void)((*(__force volatile u8 *) (addr)) = (b))
-#define out_be16(addr,w) (void)((*(__force volatile u16 *) (addr)) = (w))
-#define out_be32(addr,l) (void)((*(__force volatile u32 *) (addr)) = (l))
-#define out_le16(addr,w) (void)((*(__force volatile __le16 *) (addr)) = cpu_to_le16(w))
-#define out_le32(addr,l) (void)((*(__force volatile __le32 *) (addr)) = cpu_to_le32(l))
+#define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
+#define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned long)(addr)) = (w))
+#define out_be32(addr,l) (void)((*(__force volatile u32 *) (unsigned long)(addr)) = (l))
+#define out_le16(addr,w) (void)((*(__force volatile __le16 *) (unsigned long)(addr)) = cpu_to_le16(w))
+#define out_le32(addr,l) (void)((*(__force volatile __le32 *) (unsigned long)(addr)) = cpu_to_le32(l))
 
 #define raw_inb in_8
 #define raw_inw in_be16
-- 
2.30.2

