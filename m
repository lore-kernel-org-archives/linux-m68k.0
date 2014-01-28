From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/3] m68k/atari - atari_scsi: fix wait_event completion conditions
Date: Tue, 28 Jan 2014 20:52:29 +1300
Message-ID: <1390895551-16270-2-git-send-email-schmitz@debian.org>
References: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:56483 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751985AbaA1HxJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Jan 2014 02:53:09 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so42502pbb.3
        for <linux-m68k@vger.kernel.org>; Mon, 27 Jan 2014 23:53:08 -0800 (PST)
In-Reply-To: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Michael Schmitz <schmitz@debian.org>

Fix patch by ArndB changing falcon_get_lock to use wait_event.
Some of the completion conditions had been missed when converting
from while() {} to do {} until() logic.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/scsi/atari_scsi.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index 1986ecb..cc1b013 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -550,10 +550,10 @@ static void falcon_get_lock(void)
 
 	local_irq_save(flags);
 
-       wait_event_cmd(falcon_fairness_wait,
-                      !in_irq() && falcon_got_lock && stdma_others_waiting(),
-                      local_irq_restore(flags),
-                      local_irq_save(flags));
+	wait_event_cmd(falcon_fairness_wait,
+		in_irq() || !falcon_got_lock || !stdma_others_waiting(),
+		local_irq_restore(flags),
+		local_irq_save(flags));
 
 	while (!falcon_got_lock) {
 		if (in_irq())
@@ -566,9 +566,9 @@ static void falcon_get_lock(void)
 			wake_up(&falcon_try_wait);
 		} else {
                        wait_event_cmd(falcon_try_wait,
-                                      !falcon_got_lock && !falcon_trying_lock,
-                                      local_irq_restore(flags),
-                                      local_irq_save(flags));
+				falcon_got_lock && !falcon_trying_lock,
+				local_irq_restore(flags),
+				local_irq_save(flags));
 		}
 	}
 
-- 
1.7.0.4
