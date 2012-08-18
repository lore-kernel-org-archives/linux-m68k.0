From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/apollo: Remove disabled definitions in apollohw.h
Date: Sat, 18 Aug 2012 15:15:14 +0200
Message-ID: <1345295714-13030-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/apollohw.h |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/include/asm/apollohw.h b/arch/m68k/include/asm/apollohw.h
index 635ef4f..6c19e0c 100644
--- a/arch/m68k/include/asm/apollohw.h
+++ b/arch/m68k/include/asm/apollohw.h
@@ -46,18 +46,6 @@ struct SCN2681 {
 
 };
 
-#if 0
-struct mc146818 {
-
-	unsigned int second1:4, second2:4, alarm_second1:4, alarm_second2:4,
-		     minute1:4, minute2:4, alarm_minute1:4, alarm_minute2:4;
-	unsigned int hours1:4, hours2:4, alarm_hours1:4, alarm_hours2:4,
-		     day_of_week1:4, day_of_week2:4, day_of_month1:4, day_of_month2:4;
-	unsigned int month1:4, month2:4, year1:4, year2:4, :16;
-
-};
-#endif
-
 struct mc146818 {
         unsigned char second, alarm_second;
         unsigned char minute, alarm_minute;
-- 
1.7.0.4
