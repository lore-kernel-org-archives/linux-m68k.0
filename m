From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 13/15]drivers:isdn:mISDN:dsp_cmx.c Typo change diable to disable.
Date: Thu, 30 Dec 2010 15:08:02 -0800
Message-ID: <1293750484-1161-13-git-send-email-justinmattock__6999.96967237002$1293750984$gmane$org@gmail.com>
References: <1293750484-1161-1-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-2-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-3-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-4-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-5-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-6-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-7-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-8-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-9-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-10-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-11-git-send-email-justinmattock@gmail.com>
 <1293750484-1161-12-git-send-email-justinmattock@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1293750484-1161-12-git-send-email-justinmattock@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: trivial@kernel.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org, spi-devel-general@lists.sourceforge.net, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch fixes a typo "diable" to "disable". Please let me know if this 
is correct or not.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 drivers/isdn/mISDN/dsp_cmx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/mISDN/dsp_cmx.c b/drivers/isdn/mISDN/dsp_cmx.c
index 76d9e67..309bacf 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -112,7 +112,7 @@
  * Disable rx-data:
  * If cmx is realized in hardware, rx data will be disabled if requested by
  * the upper layer. If dtmf decoding is done by software and enabled, rx data
- * will not be diabled but blocked to the upper layer.
+ * will not be disabled but blocked to the upper layer.
  *
  * HFC conference engine:
  * If it is possible to realize all features using hardware, hardware will be
-- 
1.6.5.2.180.gc5b3e
