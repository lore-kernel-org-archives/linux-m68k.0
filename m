From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 02/10] m68knommu: improve the clock configuration defaults
Date: Tue,  7 Jul 2015 16:55:16 +1000
Message-ID: <1436252124-23051-3-git-send-email-gerg@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas02p.mx.bigpond.com ([61.9.168.140]:42704 "EHLO
	nskntmtas02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755243AbbGGGyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:13 -0400
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

Create some intelligent default settings for each ColdFire SoC type
in the configuration entry for CONFIG_CLOCK_FREQ.

The ColdFire clock frequency is configurable at build time. There is a
lot of variation in the frequency of operation on specific ColdFire based
boards. But we can choose a default that matches the maximum frequency
of clock operation for a particular ColdFire part. That is typically
the most common clock setting.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 7da5949..62f590e 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -418,6 +418,14 @@ config HAVE_IPSBAR
 
 config CLOCK_FREQ
 	int "Set the core clock frequency"
+	default "25000000" if M5206
+	default "54000000" if M5206e
+	default "166666666" if M520x
+	default "140000000" if M5249
+	default "150000000" if M527x || M523x
+	default "90000000" if M5307
+	default "50000000" if M5407
+	default "266000000" if M54xx
 	default "66666666"
 	depends on COLDFIRE
 	help
-- 
1.9.1
