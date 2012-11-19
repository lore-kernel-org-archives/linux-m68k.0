From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 008/493] zorro: remove CONFIG_HOTPLUG ifdefs
Date: Mon, 19 Nov 2012 13:19:17 -0500
Message-ID: <1353349642-3677-8-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Remove conditional code based on CONFIG_HOTPLUG being false.  It's
always on now in preparation of it going away as an option.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org> 
Cc: linux-m68k@lists.linux-m68k.org 
---
 drivers/zorro/zorro-driver.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index 229624f..ac1db7f 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -142,7 +142,6 @@ static int zorro_bus_match(struct device *dev, struct device_driver *drv)
 
 static int zorro_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-#ifdef CONFIG_HOTPLUG
 	struct zorro_dev *z;
 
 	if (!dev)
@@ -159,9 +158,6 @@ static int zorro_uevent(struct device *dev, struct kobj_uevent_env *env)
 		return -ENOMEM;
 
 	return 0;
-#else /* !CONFIG_HOTPLUG */
-	return -ENODEV;
-#endif /* !CONFIG_HOTPLUG */
 }
 
 struct bus_type zorro_bus_type = {
-- 
1.8.0
