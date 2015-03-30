From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2] m68k/mac: Fix out-of-bounds array index in OSS IRQ source
 initialization
Date: Mon, 30 Mar 2015 12:22:30 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1503301222220.18094@nippy.intranet>
References: <alpine.LNX.2.00.1503281605050.26059@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41323 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936AbbC3BW7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Mar 2015 21:22:59 -0400
In-Reply-To: <alpine.LNX.2.00.1503281605050.26059@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, David Binderman <dcb314@hotmail.com>

---

Changes since v1:
- remove pointless braces

Index: linux/arch/m68k/mac/oss.c
===================================================================
--- linux.orig/arch/m68k/mac/oss.c	2015-03-20 20:10:54.000000000 +1100
+++ linux/arch/m68k/mac/oss.c	2015-03-29 19:58:40.000000000 +1100
@@ -47,9 +47,8 @@ void __init oss_init(void)
 	/* Disable all interrupts. Unlike a VIA it looks like we    */
 	/* do this by setting the source's interrupt level to zero. */
 
-	for (i = 0; i <= OSS_NUM_SOURCES; i++) {
+	for (i = 0; i < OSS_NUM_SOURCES; i++)
 		oss->irq_level[i] = 0;
-	}
 }
 
 /*
