From: <gerg@snapgear.com>
Subject: [PATCH 4/4] m68knommu: add support for configuring a Freescale M5373EVB board
Date: Mon, 19 Nov 2012 15:14:08 +1000
Message-ID: <1353302048-924-5-git-send-email-gerg@snapgear.com>
References: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:27405 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395Ab2KSFOx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Nov 2012 00:14:53 -0500
In-Reply-To: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add a configuration switch for supporting the Freescale M5373EVB board.
It is based on the newly added ColdFire 537x CPU support.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.machine |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 7cdf6b0..5f93fad 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -359,6 +359,13 @@ config COBRA5329
 	help
 	  Support for the senTec COBRA5329 board.
 
+config M5373EVB
+	bool "Freescale M5373EVB board support"
+	depends on M537x
+	select FREESCALE
+	help
+	  Support for the Freescale M5373EVB board.
+
 config M5407C3
 	bool "Motorola M5407C3 board support"
 	depends on M5407
-- 
1.7.0.4
