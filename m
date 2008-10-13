From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [patch 17/18] net/rfkill/rfkill-input.c needs <linux/sched.h>
Date: Mon, 13 Oct 2008 21:59:03 +0200
Message-ID: <20081013195922.392078574@mail.of.borg>
References: <20081013195846.674654386@mail.of.borg>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:43157 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753370AbYJMUFn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Oct 2008 16:05:43 -0400
Content-Disposition: inline; filename=net-rfkill-rfkill-input-c-needs-linux-sched-h.diff
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

For some m68k configs, I get:

| net/rfkill/rfkill-input.c: In function 'rfkill_start':
| net/rfkill/rfkill-input.c:208: error: dereferencing pointer to incomplete type

As the incomplete type is `struct task_struct', including <linux/sched.h> fixes
it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 net/rfkill/rfkill-input.c |    1 +
 1 file changed, 1 insertion(+)

--- a/net/rfkill/rfkill-input.c
+++ b/net/rfkill/rfkill-input.c
@@ -16,6 +16,7 @@
 #include <linux/workqueue.h>
 #include <linux/init.h>
 #include <linux/rfkill.h>
+#include <linux/sched.h>
 
 #include "rfkill-input.h"
 

-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

