From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/mac: Mark Mac IIsi ADB driver BROKEN
Date: Tue, 26 Nov 2013 11:52:41 +0100
Message-ID: <1385463161-16428-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:49199 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754830Ab3KZKwr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Nov 2013 05:52:47 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

As reported by Finn Thain, the Mac IIsi ADB driver should be disabled
because it will crash.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/macintosh/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index d26a312f117a..3067d56b11a6 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -32,7 +32,7 @@ config ADB_MACII
 
 config ADB_MACIISI
 	bool "Include Mac IIsi ADB driver"
-	depends on ADB && MAC
+	depends on ADB && MAC && BROKEN
 	help
 	  Say Y here if want your kernel to support Macintosh systems that use
 	  the Mac IIsi style ADB.  This includes the IIsi, IIvi, IIvx, Classic
-- 
1.7.9.5
