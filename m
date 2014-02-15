From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 1/4] m68k: remove CONSOLE_PENGIUN macro, adopt CONFIG_LOGO
Date: Sat, 15 Feb 2014 15:45:29 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402151532410.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>


Allow CONFIG_LOGO to enable/disable the head.S penguin logo as well as the 
framebuffer console logo. This should save a few bytes. It also gets rid 
of the obscure CONSOLE_PENGIUN macro.


Index: linux-m68k/arch/m68k/kernel/head.S
===================================================================
--- linux-m68k.orig/arch/m68k/kernel/head.S	2014-02-15 14:49:20.000000000 +1100
+++ linux-m68k/arch/m68k/kernel/head.S	2014-02-15 15:08:07.000000000 +1100
@@ -275,7 +275,6 @@
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE
 #define CONSOLE
-#define CONSOLE_PENGUIN
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK
@@ -907,15 +906,15 @@ L(nothp):
  */
 #ifdef CONFIG_MAC
 	is_not_mac(L(nocon))
-#ifdef CONSOLE
+#  ifdef CONSOLE
 	console_init
-#ifdef CONSOLE_PENGUIN
+#    ifdef CONFIG_LOGO
 	console_put_penguin
-#endif	/* CONSOLE_PENGUIN */
+#    endif /* CONFIG_LOGO */
 	console_put_stats
-#endif	/* CONSOLE */
+#  endif /* CONSOLE */
 L(nocon):
-#endif	/* CONFIG_MAC */
+#endif /* CONFIG_MAC */
 
 
 	putc	'\n'
@@ -3456,7 +3455,7 @@ func_start	console_put_stats,%a0/%d7
 
 func_return	console_put_stats
 
-#ifdef CONSOLE_PENGUIN
+#ifdef CONFIG_LOGO
 func_start	console_put_penguin,%a0-%a1/%d0-%d7
 	/*
 	 *	Get 'that_penguin' onto the screen in the upper right corner
