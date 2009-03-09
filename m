From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH 1/7] parisc: rtc: get_rtc_time() returns unsigned int
Date: Mon,  9 Mar 2009 14:26:17 +0100
Message-ID: <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-parisc-owner@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>, Kyle McMartin <kyle@mcmartin.ca>
Cc: rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 drivers/rtc/rtc-parisc.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index b966f56..620b949 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -13,9 +13,7 @@
 
 static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 {
-	unsigned long ret;
