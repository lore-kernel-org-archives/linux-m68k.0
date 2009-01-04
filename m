From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Add Eiffel PS/2 support for Atari mouse driver
Date: Sun, 04 Jan 2009 08:15:59 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901040805190.28468@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
 <1230962033.6343.15.camel@joy>
 <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
 <1230970564.6343.34.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:51380 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750761AbZADHQE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Jan 2009 02:16:04 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCX00600QUOV100@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 04 Jan 2009 08:16:00 +0100 (MET)
In-reply-to: <1230970564.6343.34.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr, Geert,

> > The only reason for reviving the joystick hack would have been to have a 
> > 'standard' way of passing a third mouse button. If the PS/2 adapter is that 
> > standard way now, that's fine. I'll just need to know what interrupt/device this 
> > is hooked up to, and what the data format is. 
> 
> It just adds new scancodes - I have provided a link to the scan codes
> table in one of my previous mails.
> 
> The middle mouse button is mapped to scancode 0x37 (IIRC) while the
> mouse wheels are provided in IKBD status packet.

I've written the first part of the Eiffel PS/2 mouse support, adding middle 
mouse button support based on the scancode you specified. Implementing the 
middle mouse button as a toggle is a bit awkward :-( It's basically what the 
joystick middle mouse button code did, so it should hopefully work. Comments 
welcome.

I've not tested the code beyond making sure the two regular buttons still work - 
I do not quite see how to activate Eiffel mouse support in ARAnyM. Maybe I'll 
hijack another scancode for the tests.

Adding the wheel events looks quite straightforward; I'll get to that later. 

Signed-off-by: Michael Schmitz <schmitz@debian.org>

---
 arch/m68k/atari/atakeyb.c        |   27 ++++++++++++++++++++++-
 drivers/input/mouse/atarimouse.c |   44 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index 2c16dcb..83209fa 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -55,6 +55,8 @@ static unsigned long broken_keys[128/(sizeof(unsigned long)*8)] = { 0, };
 
 #define BREAK_MASK	(0x80)
 
+#define SUPPORT_EIFFEL	1
+
 /*
  * ++roman: The following changes were applied manually:
  *
@@ -189,6 +191,22 @@ repeat:
 				kb_state.len = 1;
 				kb_state.buf[0] = scancode;
 				break;
+#if defined (SUPPORT_EIFFEL)
+			case 0x37:	/* middle button clicked */
+				kb_state.state = RMOUSE;
+				kb_state.len = 3;
+				kb_state.buf[0] = 0xFC;
+				kb_state.buf[1] = 0;
+				kb_state.buf[2] = 0;
+				break;
+			case 0xB7:	/* middle button released */
+				kb_state.state = RMOUSE;
+				kb_state.len = 3;
+				kb_state.buf[0] = 0xF4;
+				kb_state.buf[1] = 0;
+				kb_state.buf[2] = 0;
+				break;
+#endif
 
 			case 0xFC:
 				kb_state.state = CLOCK;
@@ -252,6 +270,9 @@ repeat:
 			kb_state.buf[kb_state.len++] = scancode;
 			if (kb_state.len == 5) {
 				kb_state.state = KEYBOARD;
+#if defined (DEBUG)
+				printk(KERN_INFO "atakeyb: AMOUSE %d %d %d %d %d\n", kb_state.buf[0], kb_state.buf[1], kb_state.buf[2], kb_state.buf[4], kb_state.buf[4]);
+#endif
 				/* not yet used */
 				/* wake up someone waiting for this */
 			}
@@ -261,8 +282,12 @@ repeat:
 			kb_state.buf[kb_state.len++] = scancode;
 			if (kb_state.len == 3) {
 				kb_state.state = KEYBOARD;
-				if (atari_input_mouse_interrupt_hook)
+				if (atari_input_mouse_interrupt_hook) {
+#if defined (DEBUG)
+					printk(KERN_INFO "atakeyb: RMOUSE packet\n");
+#endif
 					atari_input_mouse_interrupt_hook(kb_state.buf);
+				}
 			}
 			break;
 
diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index 1b5f4dd..e5274cf 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -60,25 +60,62 @@ MODULE_LICENSE("GPL");
 static int mouse_threshold[2] = {2, 2};
 module_param_array(mouse_threshold, int, NULL, 0);
 
+#define SUPPORT_EIFFEL 1
+
 #ifdef FIXED_ATARI_JOYSTICK
 extern int atari_mouse_buttons;
 #endif
+#if defined (SUPPORT_EIFFEL)
+static int eiffel_mouse_buttons;
+#endif
 
 static struct input_dev *atamouse_dev;
 
 static void atamouse_interrupt(char *buf)
 {
 	int buttons, dx, dy;
+#if defined (DEBUG)
+	printk(KERN_INFO "atarimouse: %x %x %x\n", buf[0], buf[1], buf[2]);
+#endif
+#if defined (SUPPORT_EIFFEL)
+	if ((buf[0] & 0xc) == 0x8)	/* real mouse packet */
+#endif
+	buttons = ((buf[0] & 1) << 2) | ((buf[0] & 2) >> 1);
 
-	buttons = (buf[0] & 1) | ((buf[0] & 2) << 1);
 #ifdef FIXED_ATARI_JOYSTICK
 	buttons |= atari_mouse_buttons & 2;
 	atari_mouse_buttons = buttons;
 #endif
 
+#if defined (SUPPORT_EIFFEL)
+	if (buf[1] == 0 && buf[2] == 0 && (buf[0] & 4)) { 
+		/* middle mouse button toggle */
+		switch (buf[0]) {
+		case 0xFC:
+			eiffel_mouse_buttons |= 0x2; 
+			break;
+		case 0xF4:
+			eiffel_mouse_buttons &= ~0x2; 
+			break;
+		default:
+			break;		
+		}
+	}
+	buttons |= eiffel_mouse_buttons & 2;
+	eiffel_mouse_buttons = buttons;
+#endif
+
 	/* only relative events get here */
 	dx =  buf[1];
+#if defined (CONFIG_ARANYM)
+	dy =  buf[2];
+#else
 	dy = -buf[2];
+#endif
+
+#if defined (DEBUG)
+	printk(KERN_INFO "atarimouse: dx %d dy %d buttons %x\n", dx, dy, buttons);
+#endif
 
 	input_report_rel(atamouse_dev, REL_X, dx);
 	input_report_rel(atamouse_dev, REL_Y, dy);
@@ -97,7 +134,12 @@ static int atamouse_open(struct input_dev *dev)
 #ifdef FIXED_ATARI_JOYSTICK
 	atari_mouse_buttons = 0;
 #endif
+#if defined (CONFIG_ARANYM)
+	printk(KERN_INFO "atarimouse: set reference origin=bottom (ARAnyM mode)!\n");
+	ikbd_mouse_y0_bot();
+#else
 	ikbd_mouse_y0_top();
+#endif
 	ikbd_mouse_thresh(mouse_threshold[0], mouse_threshold[1]);
 	ikbd_mouse_rel_pos();
 	atari_input_mouse_interrupt_hook = atamouse_interrupt;
