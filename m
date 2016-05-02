From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] m68k/bvme6000: Include generic <linux/rtc.h>
Date: Mon,  2 May 2016 10:46:22 +0200
Message-ID: <1462178783-29294-2-git-send-email-geert@linux-m68k.org>
References: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The BVME6000 RTC driver doesn't use any MC146818-specific definitions,
hence include the generic <linux/rtc.h> instead of
<linux/mc146818rtc.h>.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To avoid a build failure after "rtc: cmos: move mc146818rtc code out of
asm-generic/rtc.h".
---
 arch/m68k/bvme6000/rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/bvme6000/rtc.c b/arch/m68k/bvme6000/rtc.c
index cf12a17dc289c5f9..f7984f44ff0f8072 100644
--- a/arch/m68k/bvme6000/rtc.c
+++ b/arch/m68k/bvme6000/rtc.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 #include <linux/poll.h>
 #include <linux/module.h>
-#include <linux/mc146818rtc.h>	/* For struct rtc_time and ioctls, etc */
+#include <linux/rtc.h>	/* For struct rtc_time and ioctls, etc */
 #include <linux/bcd.h>
 #include <asm/bvme6000hw.h>
 
-- 
1.9.1
