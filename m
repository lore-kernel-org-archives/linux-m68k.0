From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] [SCSI] st: Remove obsolete scsi_tape.max_pfn
Date: Sun, 15 Nov 2015 12:48:06 +0100
Message-ID: <1447588086-21019-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Its last user was removed 10 years ago, in commit
8b05b773b6030de5 ("[SCSI] convert st to use scsi_execute_async").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/scsi/st.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/st.h b/drivers/scsi/st.h
index b6486b5d86811227..8c732c8de0153eb1 100644
--- a/drivers/scsi/st.h
+++ b/drivers/scsi/st.h
@@ -148,8 +148,6 @@ struct scsi_tape {
 	int tape_type;
 	int long_timeout;	/* timeout for commands known to take long time */
 
-	unsigned long max_pfn;	/* the maximum page number reachable by the HBA */
-
 	/* Mode characteristics */
 	struct st_modedef modes[ST_NBR_MODES];
 	int current_mode;
-- 
1.9.1
