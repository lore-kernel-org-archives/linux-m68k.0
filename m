Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293D2C433DB
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 05:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1FA223A23
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 05:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbhAPFJ4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 16 Jan 2021 00:09:56 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44920 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbhAPFJ4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 16 Jan 2021 00:09:56 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id C709529D94;
        Sat, 16 Jan 2021 00:09:10 -0500 (EST)
Date:   Sat, 16 Jan 2021 16:09:09 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Sam Creasey <sammy@sammy.net>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Booting Linux on Sun3 machines
In-Reply-To: <20210116010503.GI1344617@anhedonia>
Message-ID: <alpine.LNX.2.23.453.2101161559510.6@nippy.intranet>
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de> <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com> <20210116010503.GI1344617@anhedonia>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Fri, 15 Jan 2021, Sam Creasey wrote:

> Honestly, it probably doesn't boot.  The last kernel I knew to boot
> successfully was 2.6.16, and that required patches.
> 

Here's a patch that might help with debugging. It enables the 
'earlyprintk' kernel parameter for Sun 3. (Sun 3x builds already support 
that and don't need this patch.)

Note that this patch is untested and may make things worse. I have a few 
more Sun 3 patches that need testing (refactoring of DMA code in NCR5380).

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 11b306bdd788..cf3f8442c839 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -10,7 +10,7 @@ config BOOTPARAM_STRING
 
 config EARLY_PRINTK
 	bool "Early printk"
-	depends on !(SUN3 || M68000 || COLDFIRE)
+	depends on !(M68000 || COLDFIRE)
 	help
 	  Write kernel log output directly to a serial port.
 	  Where implemented, output goes to the framebuffer as well.
diff --git a/arch/m68k/kernel/early_printk.c b/arch/m68k/kernel/early_printk.c
index 7d3fe08a48eb..4b06fb32298a 100644
--- a/arch/m68k/kernel/early_printk.c
+++ b/arch/m68k/kernel/early_printk.c
@@ -11,6 +11,9 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <asm/setup.h>
+#ifdef CONFIG_SUN3
+#include <asm/oplib.h>
+#endif
 
 extern void mvme16x_cons_write(struct console *co,
 			       const char *str, unsigned count);
@@ -20,8 +23,14 @@ asmlinkage void __init debug_cons_nputs(const char *s, unsigned n);
 static void __ref debug_cons_write(struct console *c,
 				   const char *s, unsigned n)
 {
-#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
-      defined(CONFIG_COLDFIRE))
+#if defined(CONFIG_SUN3)
+	while (n-- && *s) {
+		if (*s == '\n')
+			prom_putchar('\r');
+		prom_putchar(*s);
+		s++;
+	}
+#elif !(defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE))
 	if (MACH_IS_MVME16x)
 		mvme16x_cons_write(c, s, n);
 	else
