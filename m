Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB24CE7A8C
	for <linux-m68k@archiver.kernel.org>; Mon, 25 Sep 2023 15:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjIYPxm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 Sep 2023 11:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjIYPxl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 Sep 2023 11:53:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41F5AF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Sep 2023 08:53:34 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by dfw.source.kernel.org (Postfix) with ESMTP id DB10E611C5;
        Mon, 25 Sep 2023 15:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3C9C433C8;
        Mon, 25 Sep 2023 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695657213;
        bh=IfkWee5NGXcjx2dGOM+wKo9pmVmBViwhCPWD/UdzuuQ=;
        h=From:To:Cc:Subject:Date:From;
        b=tDkFmT81D6oSNGqYSQjqpGYlSgfdMvsbHE6HpCPrdP7RZmhBsyfXOaZtuTR3ZNFu4
         jxtvqsQXaGGZMdxIMLivsUiUlWsmK88pY3rGZZHlVBdO/3zQ2X9tSYmbYr3jBIXjhc
         vtFpi2JG/0MuR2my9PL6fBriQGIZCPNPMOJ4Z7+vxQiQf7jXZtP+LwGb3lBLw6reiW
         XwqDvdnSylbGfnwtu1B5gpar4gDbGW6nLAw8ApmvdZoRp/rjlx5UziY1peZeOPKGac
         G/ecgEcLlB0Pz224zq/oYB9As3CCTkwAOSi/cwTyx+xzYMCXlhGBm8nEPZRXtpMg2D
         26Ni3YWFv0miQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: asm/io.h: mark mmio read addresses as const
Date:   Mon, 25 Sep 2023 17:53:20 +0200
Message-Id: <20230925155328.443664-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Passing constant __iomem tokens into the readl() family of helpers
or any of the others causes a warning on m68k:

include/asm-generic/io.h: In function 'ioread8_rep':
arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 | #define readsb(port, buf, nr)     raw_insb((port), (u8

Add a 'const' modifier to the pointers to shut up the warnings here.

Closes: https://lore.kernel.org/oe-kbuild-all/202309251926.bPl23AhG-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/include/asm/raw_io.h | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index 3ba40bc1dfaa9..4bc29e57e57fb 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -17,15 +17,15 @@
  * two accesses to memory, which may be undesirable for some devices.
  */
 #define in_8(addr) \
-    ({ u8 __v = (*(__force volatile u8 *) (unsigned long)(addr)); __v; })
+    ({ u8 __v = (*(__force const volatile u8 *) (unsigned long)(addr)); __v; })
 #define in_be16(addr) \
-    ({ u16 __v = (*(__force volatile u16 *) (unsigned long)(addr)); __v; })
+    ({ u16 __v = (*(__force const volatile u16 *) (unsigned long)(addr)); __v; })
 #define in_be32(addr) \
-    ({ u32 __v = (*(__force volatile u32 *) (unsigned long)(addr)); __v; })
+    ({ u32 __v = (*(__force const volatile u32 *) (unsigned long)(addr)); __v; })
 #define in_le16(addr) \
-    ({ u16 __v = le16_to_cpu(*(__force volatile __le16 *) (unsigned long)(addr)); __v; })
+    ({ u16 __v = le16_to_cpu(*(__force const volatile __le16 *) (unsigned long)(addr)); __v; })
 #define in_le32(addr) \
-    ({ u32 __v = le32_to_cpu(*(__force volatile __le32 *) (unsigned long)(addr)); __v; })
+    ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
 
 #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
 #define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned long)(addr)) = (w))
@@ -98,7 +98,8 @@
 #define raw_rom_outw(val, port) rom_out_be16((port), (val))
 #endif /* CONFIG_ATARI_ROM_ISA */
 
-static inline void raw_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
+static inline void raw_insb(const volatile u8 __iomem *port, u8 *buf,
+			    unsigned int len)
 {
 	unsigned int i;
 
@@ -146,7 +147,7 @@ static inline void raw_outsb(volatile u8 __iomem *port, const u8 *buf,
 	}
 }
 
-static inline void raw_insw(volatile u16 __iomem *port, u16 *buf, unsigned int nr)
+static inline void raw_insw(volatile const u16 __iomem *port, u16 *buf, unsigned int nr)
 {
 	unsigned int tmp;
 
@@ -225,7 +226,7 @@ static inline void raw_outsw(volatile u16 __iomem *port, const u16 *buf,
 	}
 }
 
-static inline void raw_insl(volatile u32 __iomem *port, u32 *buf, unsigned int nr)
+static inline void raw_insl(const volatile u32 __iomem *port, u32 *buf, unsigned int nr)
 {
 	unsigned int tmp;
 
@@ -305,7 +306,7 @@ static inline void raw_outsl(volatile u32 __iomem *port, const u32 *buf,
 }
 
 
-static inline void raw_insw_swapw(volatile u16 __iomem *port, u16 *buf,
+static inline void raw_insw_swapw(const volatile u16 __iomem *port, u16 *buf,
 				  unsigned int nr)
 {
     if ((nr) % 8)
@@ -413,7 +414,8 @@ static inline void raw_outsw_swapw(volatile u16 __iomem *port, const u16 *buf,
 
 
 #if defined(CONFIG_ATARI_ROM_ISA)
-static inline void raw_rom_insb(volatile u8 __iomem *port, u8 *buf, unsigned int len)
+static inline void raw_rom_insb(const volatile u8 __iomem *port, u8 *buf,
+				unsigned int len)
 {
 	unsigned int i;
 
@@ -430,7 +432,7 @@ static inline void raw_rom_outsb(volatile u8 __iomem *port, const u8 *buf,
 		rom_out_8(port, *buf++);
 }
 
-static inline void raw_rom_insw(volatile u16 __iomem *port, u16 *buf,
+static inline void raw_rom_insw(const volatile u16 __iomem *port, u16 *buf,
 				   unsigned int nr)
 {
 	unsigned int i;
@@ -448,7 +450,7 @@ static inline void raw_rom_outsw(volatile u16 __iomem *port, const u16 *buf,
 		rom_out_be16(port, *buf++);
 }
 
-static inline void raw_rom_insw_swapw(volatile u16 __iomem *port, u16 *buf,
+static inline void raw_rom_insw_swapw(const volatile u16 __iomem *port, u16 *buf,
 				   unsigned int nr)
 {
 	unsigned int i;
-- 
2.39.2

