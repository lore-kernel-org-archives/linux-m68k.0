From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 6/6] m68k: section mismatch fixes: Atari SCSI
Date: Sun,  1 Mar 2009 10:21:15 +0100
Message-ID: <1235899275-23630-7-git-send-email-geert@linux-m68k.org>
References: <1235899275-23630-1-git-send-email-geert@linux-m68k.org>
 <1235899275-23630-2-git-send-email-geert@linux-m68k.org>
 <1235899275-23630-3-git-send-email-geert@linux-m68k.org>
 <1235899275-23630-4-git-send-email-geert@linux-m68k.org>
 <1235899275-23630-5-git-send-email-geert@linux-m68k.org>
 <1235899275-23630-6-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:46103 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753317AbZCAJV1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Mar 2009 04:21:27 -0500
In-Reply-To: <1235899275-23630-6-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>

From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>

add __init annotations to probe routines

Signed-off-by: Michael Schmitz <schmitz@debian.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/scsi/atari_NCR5380.c |    2 +-
 drivers/scsi/atari_scsi.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/atari_NCR5380.c b/drivers/scsi/atari_NCR5380.c
index 93b61f1..0471f88 100644
--- a/drivers/scsi/atari_NCR5380.c
+++ b/drivers/scsi/atari_NCR5380.c
@@ -844,7 +844,7 @@ static char *lprint_Scsi_Cmnd(Scsi_Cmnd *cmd, char *pos, char *buffer, int lengt
  *
  */
 
-static int NCR5380_init(struct Scsi_Host *instance, int flags)
+static int __init NCR5380_init(struct Scsi_Host *instance, int flags)
 {
 	int i;
 	SETUP_HOSTDATA(instance);
diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index 21fe07f..ad7a23a 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -589,7 +589,7 @@ int atari_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 #endif
 
 
-int atari_scsi_detect(struct scsi_host_template *host)
+int __init atari_scsi_detect(struct scsi_host_template *host)
 {
 	static int called = 0;
 	struct Scsi_Host *instance;
-- 
1.6.1.3

