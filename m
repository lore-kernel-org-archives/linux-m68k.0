From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 07/11] m68k/mac: Add missing platform check before registering platform devices
Date: Wed, 21 Mar 2012 10:51:51 +0100
Message-ID: <1332323515-7314-7-git-send-email-geert__36413.8191835538$1332323668$gmane$org@linux-m68k.org>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, stable@vger.kernel.org

On multi-platform kernels, the Mac platform devices should be registered
when running on Mac only. Else it may crash later.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@vger.kernel.org
---
 arch/m68k/mac/config.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index f60ff5f..da3b8d8 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -981,6 +981,9 @@ int __init mac_platform_init(void)
 {
 	u8 *swim_base;
 
+	if (!MACH_IS_MAC)
+		return -ENODEV;
+
 	/*
 	 * Serial devices
 	 */
-- 
1.7.0.4
