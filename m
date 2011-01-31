From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] input: atari - Propagate the return value of
 atari_keyb_init()
Date: Mon, 31 Jan 2011 20:19:40 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101312019050.14232@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into commit 2af13478ec1672a3aa7ea05d11fc2a15d1a406aa ("m68k: Fix
atarimouse init")

 drivers/input/keyboard/atakbd.c  |    5 +++--
 drivers/input/mouse/atarimouse.c |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/atakbd.c b/drivers/input/keyboard/atakbd.c
index 1839194..10bcd4a 100644
--- a/drivers/input/keyboard/atakbd.c
+++ b/drivers/input/keyboard/atakbd.c
@@ -223,8 +223,9 @@ static int __init atakbd_init(void)
 		return -ENODEV;
 
 	// need to init core driver if not already done so
-	if (atari_keyb_init())
-		return -ENODEV;
+	error = atari_keyb_init();
+	if (error)
+		return error;
 
 	atakbd_dev = input_allocate_device();
 	if (!atakbd_dev)
diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index 1b5f4dd..16a9d0f 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -118,8 +118,9 @@ static int __init atamouse_init(void)
 	if (!MACH_IS_ATARI || !ATARIHW_PRESENT(ST_MFP))
 		return -ENODEV;
 
-	if (atari_keyb_init())
-		return -ENODEV;
+	error = atari_keyb_init();
+	if (error)
+		return error;
 
 	atamouse_dev = input_allocate_device();
 	if (!atamouse_dev)
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
