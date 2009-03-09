From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH 2/7] parisc: rtc: platform_driver_probe() fixups
Date: Mon,  9 Mar 2009 14:26:18 +0100
Message-ID: <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-parisc-owner@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>, Kyle McMartin <kyle@mcmartin.ca>
Cc: rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, dann frazier <dannf@hp.com>
List-Id: linux-m68k@vger.kernel.org

When using platform_driver_probe(), it's not needed to setup a .probe
function, and .remove should be marked __exit_p(), not __devexit_p().

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index 620b949..f4e871c 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -62,8 +62,7 @@ static struct platform_driver parisc_rtc_driver = {
 		.name = "rtc-parisc",
 		.owner = THIS_MODULE,
 	},
-	.probe = parisc_rtc_probe,
-	.remove = __devexit_p(parisc_rtc_remove),
+	.remove = __exit_p(parisc_rtc_remove),
 };
 
 static int __init parisc_rtc_init(void)
-- 
1.6.0.4

