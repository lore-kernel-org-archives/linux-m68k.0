From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 2 Jan 2014 13:26:46 +0100
Message-ID: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>
	<1388664474-1710039-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:63475 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaABM0r (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jan 2014 07:26:47 -0500
Received: by mail-pa0-f47.google.com with SMTP id kq14so14363274pab.6
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jan 2014 04:26:47 -0800 (PST)
In-Reply-To: <1388664474-1710039-3-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

---------- Forwarded message ----------
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, Jan 2, 2014 at 1:07 PM
Subject: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
<geert@linux-m68k.org>, "James E.J. Bottomley"
<JBottomley@parallels.com>, linux-scsi@vger.kernel.org


sleep_on is known broken and going away. The atari_scsi driver is one of
two remaining users in the falcon_get_lock() function, which is a rather
crazy piece of code. This does not attempt to fix the driver's locking
scheme in general, but at least prevents falcon_get_lock from going to
sleep when no other thread holds the same lock or tries to get it,
and we no longer schedule with irqs disabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James E.J. Bottomley <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org
---
 drivers/scsi/atari_scsi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index a3e6c8a..b55a58a 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -90,6 +90,7 @@
 #include <linux/init.h>
 #include <linux/nvram.h>
 #include <linux/bitops.h>
+#include <linux/wait.h>

 #include <asm/setup.h>
 #include <asm/atarihw.h>
@@ -549,8 +550,10 @@ static void falcon_get_lock(void)

        local_irq_save(flags);

-       while (!in_irq() && falcon_got_lock && stdma_others_waiting())
-               sleep_on(&falcon_fairness_wait);
+       wait_event_cmd(falcon_fairness_wait,
+                      !in_irq() && falcon_got_lock && stdma_others_waiting(),
+                      local_irq_restore(flags),
+                      local_irq_save(flags));

        while (!falcon_got_lock) {
                if (in_irq())
@@ -562,7 +565,10 @@ static void falcon_get_lock(void)
                        falcon_trying_lock = 0;
                        wake_up(&falcon_try_wait);
                } else {
-                       sleep_on(&falcon_try_wait);
+                       wait_event_cmd(falcon_try_wait,
+                                      !falcon_got_lock && !falcon_trying_lock,
+                                      local_irq_restore(flags),
+                                      local_irq_save(flags));
                }
        }

--
1.8.3.2
