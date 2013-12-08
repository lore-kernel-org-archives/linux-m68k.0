From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] rtc: rtc-cmos: Remove superfluous name cast
Date: Sun,  8 Dec 2013 10:49:55 +0100
Message-ID: <1386496197-20669-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Alessandro Zummo <a.zummo@towertech.it>

device_driver.name is "const char *"

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
---
 drivers/rtc/rtc-cmos.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index f14876256a4a..ed5540d78a80 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1127,7 +1127,7 @@ static struct platform_driver cmos_platform_driver = {
 	.remove		= __exit_p(cmos_platform_remove),
 	.shutdown	= cmos_platform_shutdown,
 	.driver = {
-		.name		= (char *) driver_name,
+		.name		= driver_name,
 #ifdef CONFIG_PM
 		.pm		= &cmos_pm_ops,
 #endif
-- 
1.7.9.5
