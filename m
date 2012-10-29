From: <gerg@snapgear.com>
Subject: [PATCH] m68k: remove unused asm/dbg.h
Date: Mon, 29 Oct 2012 15:16:01 +1000
Message-ID: <1351487761-8476-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:37562 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726Ab2J2FU3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Oct 2012 01:20:29 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The contents of the m68k asm/dbg.h are never used, remove the file and
remove the one reference to it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/dbg.h      |    6 ------
 drivers/tty/serial/68328serial.c |    1 -
 2 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 arch/m68k/include/asm/dbg.h

diff --git a/arch/m68k/include/asm/dbg.h b/arch/m68k/include/asm/dbg.h
deleted file mode 100644
index 27af327..0000000
--- a/arch/m68k/include/asm/dbg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#define DEBUG 1
-#ifdef CONFIG_COLDFIRE
-#define	BREAK asm volatile ("halt")
-#else
-#define BREAK *(volatile unsigned char *)0xdeadbee0 = 0
-#endif
diff --git a/drivers/tty/serial/68328serial.c b/drivers/tty/serial/68328serial.c
index 66c38a3..fa1bc91 100644
--- a/drivers/tty/serial/68328serial.c
+++ b/drivers/tty/serial/68328serial.c
@@ -14,7 +14,6 @@
  * 2.4/2.5 port                 David McCullough
  */
 
-#include <asm/dbg.h>
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/serial.h>
-- 
1.7.0.4
