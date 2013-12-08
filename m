From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/3] rtc: Disable RTC_DRV_CMOS on Atari
Date: Sun,  8 Dec 2013 10:49:57 +0100
Message-ID: <1386496197-20669-3-git-send-email-geert@linux-m68k.org>
References: <1386496197-20669-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1386496197-20669-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Alessandro Zummo <a.zummo@towertech.it>

On ARAnyM (emulating an Atari Falcon, which doesn't have an RTC IRQ, as the
Second Multi Function Peripheral MFP 68901 is available on Atari TT only),
rtc-cmos doesn't work well:
  - The date is of by 32 years (2045 instead of 2013):

    rtc_cmos rtc_cmos: setting system clock to 2045-12-02 10:56:17 UTC (2395824977)

  - The hwclock utility doesn't work:

    hwclock: ioctl() to /dev/rtc to turn on update interrupts failed unexpectedly, errno=5: Input/output error.

As rtc-generic works fine for the RTC part, and nvram works for the NVRAM
part, we'll continue on using that.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
---
 drivers/rtc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 007730222116..f1d7e974a700 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -626,7 +626,7 @@ comment "Platform RTC drivers"
 
 config RTC_DRV_CMOS
 	tristate "PC-style 'CMOS'"
-	depends on X86 || ARM || M32R || ATARI || PPC || MIPS || SPARC64
+	depends on X86 || ARM || M32R || PPC || MIPS || SPARC64
 	default y if X86
 	help
 	  Say "yes" here to get direct support for the real time clock
-- 
1.7.9.5
