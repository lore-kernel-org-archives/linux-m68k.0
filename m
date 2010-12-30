From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 03/15]drivers:staging:rtl8187se:r8180_hw.h Typo change diable to disable.
Date: Thu, 30 Dec 2010 15:07:52 -0800
Message-ID: <1293750484-1161-3-git-send-email-justinmattock__5480.20789069614$1293750871$gmane$org@gmail.com>
References: <1293750484-1161-1-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-2-git-send-email-justinmattock@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1293750484-1161-2-git-send-email-justinmattock@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: trivial@kernel.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org, spi-devel-general@lists.sourceforge.net, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch fixes a typo "diable" to "disable". Please let me know if this 
is correct or not.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/staging/rtl8187se/r8180_hw.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rtl8187se/r8180_hw.h b/drivers/staging/rtl8187se/r8180_hw.h
index 3fca144..2911d40 100644
--- a/drivers/staging/rtl8187se/r8180_hw.h
+++ b/drivers/staging/rtl8187se/r8180_hw.h
@@ -554,7 +554,7 @@
 /* by amy for power save		*/
 /* by amy for antenna			*/
 #define EEPROM_SW_REVD_OFFSET 0x3f
-/*  BIT[8-9] is for SW Antenna Diversity. Only the value EEPROM_SW_AD_ENABLE means enable, other values are diable.					*/
+/*  BIT[8-9] is for SW Antenna Diversity. Only the value EEPROM_SW_AD_ENABLE means enable, other values are disabled.					*/
 #define EEPROM_SW_AD_MASK			0x0300
 #define EEPROM_SW_AD_ENABLE			0x0100
 
-- 
1.6.5.2.180.gc5b3e
