From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: atari_mouse_interrupt_hook (was: Re: [PATCH/RFC] atafb and panning)
Date: Tue, 16 Dec 2008 21:49:13 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812162144140.29433@anakin>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190912190.27671@anakin>
 <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
 <1227343506.6129.0.camel@joy> <1227379735.6118.10.camel@joy>
 <Pine.LNX.4.64.0811232242480.30025@anakin>
 <alpine.DEB.1.00.0811240050090.15319@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812141725090.5936@anakin>
 <alpine.DEB.1.00.0812150457400.29644@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:44944 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644AbYLPUtT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Dec 2008 15:49:19 -0500
In-Reply-To: <alpine.DEB.1.00.0812150457400.29644@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, 15 Dec 2008, Michael Schmitz wrote:
> > > That's gotta be from ARAnyM. But I've got another bummer for you: The Atari 
> > > keyboard driver calls atari_mouse_interrupt_hook if it's set, not 
> > > atari_input_mouse_interrupt_hook. Fix below.
> > 
> > Euh, what does this mean?
> > 
> > Who should use atari_mouse_interrupt_hook (no users left)?
> 
> No one should be using atari_mouse_interrupt_hook anymore so it can be killed 
> off. I probably renamed the hook in all but that one place following a 
> recommendation from the list. My bad, as usual.

Looks like you missed one more spot, so I came up with this. OK?

commit 896d2f2715d1fadd4c510c4125b1e4c0f1918f6f
Author: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Date:   Tue Dec 16 21:26:03 2008 +0100

    atari: Use the correct mouse interrupt hook
    
    The Atari keyboard driver calls atari_mouse_interrupt_hook if it's set, not
    atari_input_mouse_interrupt_hook. Fix below.
    
    [geert] Killed off atari_mouse_interrupt_hook completely, after fixing another
    incorrect assignment in atarimouse.c.
    
    Signed-off-by: Michael Schmitz <schmitz@debian.org>
    Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index c038b7c..2c16dcb 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -37,13 +37,10 @@ extern unsigned int keymap_count;
 
 /* Hook for MIDI serial driver */
 void (*atari_MIDI_interrupt_hook) (void);
-/* Hook for mouse driver */
-void (*atari_mouse_interrupt_hook) (char *);
 /* Hook for keyboard inputdev  driver */
 void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */
 void (*atari_input_mouse_interrupt_hook) (char *);
-EXPORT_SYMBOL(atari_mouse_interrupt_hook);
 EXPORT_SYMBOL(atari_input_keyboard_interrupt_hook);
 EXPORT_SYMBOL(atari_input_mouse_interrupt_hook);
 
@@ -264,8 +261,8 @@ repeat:
 			kb_state.buf[kb_state.len++] = scancode;
 			if (kb_state.len == 3) {
 				kb_state.state = KEYBOARD;
-				if (atari_mouse_interrupt_hook)
-					atari_mouse_interrupt_hook(kb_state.buf);
+				if (atari_input_mouse_interrupt_hook)
+					atari_input_mouse_interrupt_hook(kb_state.buf);
 			}
 			break;
 
diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index adf45b3..a57143c 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -108,7 +108,7 @@ static int atamouse_open(struct input_dev *dev)
 static void atamouse_close(struct input_dev *dev)
 {
 	ikbd_mouse_disable();
-	atari_mouse_interrupt_hook = NULL;
+	atari_input_mouse_interrupt_hook = NULL;
 }
 
 static int __init atamouse_init(void)
diff --git a/include/asm-m68k/atarikb.h b/include/asm-m68k/atarikb.h
index 546e7da..68f3622 100644
--- a/include/asm-m68k/atarikb.h
+++ b/include/asm-m68k/atarikb.h
@@ -34,8 +34,6 @@ void ikbd_joystick_disable(void);
 
 /* Hook for MIDI serial driver */
 extern void (*atari_MIDI_interrupt_hook) (void);
-/* Hook for mouse driver */
-extern void (*atari_mouse_interrupt_hook) (char *);
 /* Hook for keyboard inputdev  driver */
 extern void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
