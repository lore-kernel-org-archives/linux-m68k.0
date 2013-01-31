From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 08/17] [m68k] Atari: EtherNEC ethernet support - new driver (ne.c)
Date: Thu, 31 Jan 2013 13:22:42 +1300 (NZDT)
Message-ID: <20130131002242.29BA1360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:60766 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755428Ab3AaAWs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:22:48 -0500
Received: by mail-pa0-f45.google.com with SMTP id bg2so1386777pad.18
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:22:47 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 08/17] [m68k] Atari: EtherNEC ethernet support - new driver (ne.c)


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/net/ethernet/8390/Kconfig |    3 ++-
 drivers/net/ethernet/8390/ne.c    |    2 ++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index 30acd4f..42ba102 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -178,7 +178,8 @@ config MCF8390
 
 config NE2000
 	tristate "NE2000/NE1000 support"
-	depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX)
+	depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX || \
+		    ATARI_ETHERNEC)
 	select CRC32
 	---help---
 	  If you have a network (Ethernet) card of this type, say Y and read
diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8390/ne.c
index 47618e5..49948f6 100644
--- a/drivers/net/ethernet/8390/ne.c
+++ b/drivers/net/ethernet/8390/ne.c
@@ -166,6 +166,8 @@ bad_clone_list[] __initdata = {
 #elif defined(CONFIG_PLAT_OAKS32R)  || \
    defined(CONFIG_MACH_TX49XX)
 #  define DCR_VAL 0x48		/* 8-bit mode */
+#elif defined(CONFIG_ATARI)	/* 8-bit mode on Atari, normal on Q40 */
+#  define DCR_VAL (MACH_IS_ATARI ? 0x48 : 0x49)
 #else
 #  define DCR_VAL 0x49
 #endif
-- 
1.7.0.4
