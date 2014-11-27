From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] Input: amikbd - Allocate temporary keymap buffer dynamically
Date: Thu, 27 Nov 2014 10:42:20 +0100
Message-ID: <1417081340-2989-2-git-send-email-geert@linux-m68k.org>
References: <1417081340-2989-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51910 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344AbaK0Jm2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Nov 2014 04:42:28 -0500
In-Reply-To: <1417081340-2989-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Allocate the temporary buffer needed for initialization of the console
keyboard maps dynamically instead of statically, to reduce kernel size.

add/remove: 0/1 grow/shrink: 1/1 up/down: 12/-518 (-506)
function                                     old     new   delta
amikbd_probe                                 358     370     +12
vermagic                                      63      57      -6
temp_map                                     512       -    -512

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/input/keyboard/amikbd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/amikbd.c b/drivers/input/keyboard/amikbd.c
index 4f81e65d9e35cb7d..fc98c5d10768cd2c 100644
--- a/drivers/input/keyboard/amikbd.c
+++ b/drivers/input/keyboard/amikbd.c
@@ -36,6 +36,7 @@
 #include <linux/interrupt.h>
 #include <linux/keyboard.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <asm/amigaints.h>
 #include <asm/amigahw.h>
@@ -147,13 +148,18 @@ static unsigned char amikbd_keycode[0x78] __initdata = {
 
 static void __init amikbd_init_console_keymaps(void)
 {
+	unsigned short *temp_map;
+	size_t temp_map_size = NR_KEYS * sizeof(*temp_map);
 	int i, j;
 
+	temp_map = kmalloc(temp_map_size, GFP_KERNEL);
+	if (!temp_map)
+		return;
+
 	for (i = 0; i < MAX_NR_KEYMAPS; i++) {
-		static u_short temp_map[NR_KEYS] __initdata;
 		if (!key_maps[i])
 			continue;
-		memset(temp_map, 0, sizeof(temp_map));
+		memset(temp_map, 0, temp_map_size);
 		for (j = 0; j < 0x78; j++) {
 			if (!amikbd_keycode[j])
 				continue;
@@ -163,8 +169,10 @@ static void __init amikbd_init_console_keymaps(void)
 			if (!temp_map[j])
 				temp_map[j] = 0xf200;
 		}
-		memcpy(key_maps[i], temp_map, sizeof(temp_map));
+		memcpy(key_maps[i], temp_map, temp_map_size);
 	}
+
+	kfree(temp_map);
 }
 #else /* !CONFIG_HW_CONSOLE */
 static inline void amikbd_init_console_keymaps(void) {}
-- 
1.9.1
