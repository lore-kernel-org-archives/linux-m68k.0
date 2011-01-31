From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] input: atari - Fix mouse movement and button mapping
Date: Mon, 31 Jan 2011 20:20:34 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101312019410.14277@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Up and down movements were reversed, left and right buttons were swapped.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Following up on the discussion from 2 years ago.
This makes gpm work on ARAnyM. Does it work on real hardware?

 drivers/input/mouse/atarimouse.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index 16a9d0f..5c4a692 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -77,15 +77,15 @@ static void atamouse_interrupt(char *buf)
 #endif
 
 	/* only relative events get here */
-	dx =  buf[1];
-	dy = -buf[2];
+	dx = buf[1];
+	dy = buf[2];
 
 	input_report_rel(atamouse_dev, REL_X, dx);
 	input_report_rel(atamouse_dev, REL_Y, dy);
 
-	input_report_key(atamouse_dev, BTN_LEFT,   buttons & 0x1);
+	input_report_key(atamouse_dev, BTN_LEFT,   buttons & 0x4);
 	input_report_key(atamouse_dev, BTN_MIDDLE, buttons & 0x2);
-	input_report_key(atamouse_dev, BTN_RIGHT,  buttons & 0x4);
+	input_report_key(atamouse_dev, BTN_RIGHT,  buttons & 0x1);
 
 	input_sync(atamouse_dev);
 
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
