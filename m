From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [PATCH 2/2] m68k: delete unused MAX_NOINT_IPL definition
Date: Thu, 19 Apr 2012 00:54:39 +0200
Message-ID: <20367.17967.190221.242729@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fanny.its.uu.se ([130.238.4.241]:58253 "EHLO fanny.its.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752055Ab2DRWyl (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 18 Apr 2012 18:54:41 -0400
Received: from fanny.its.uu.se (localhost [127.0.0.1])
	by fanny.its.uu.se (Postfix) with ESMTP id 1D0A96333
	for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 00:54:40 +0200 (MSZ)
Received: from pilspetsen.it.uu.se (pilspetsen.it.uu.se [130.238.18.39])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by fanny.its.uu.se (Postfix) with ESMTP id DB4876253
	for <linux-m68k@vger.kernel.org>; Thu, 19 Apr 2012 00:54:39 +0200 (MSZ)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

The MAX_NOINT_IPL macro is defined in m68k's <asm/entry.h> but not
used anywhere in the kernel.  Delete it.  Tested on Atari.

Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
---
This patch has a trivial context dependency on
"[PATCH 1/2] m68k: correct the Atari ALLOWINT definition",
so should be applied after it.

--- linux-3.4-rc3/arch/m68k/include/asm/entry.h.~1~	2012-04-18 22:07:52.000000000 +0200
+++ linux-3.4-rc3/arch/m68k/include/asm/entry.h	2012-04-18 22:17:05.000000000 +0200
@@ -35,11 +35,9 @@
 #if defined(MACH_ATARI_ONLY)
 	/* block out HSYNC = ipl 2 on the atari */
 #define ALLOWINT	(~0x500)
-#define	MAX_NOINT_IPL	3
 #else
 	/* portable version */
 #define ALLOWINT	(~0x700)
-#define	MAX_NOINT_IPL	0
 #endif /* machine compilation types */
 
 #ifdef __ASSEMBLY__
