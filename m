From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/resend] m68k/scsi: Remove obsolete IRQ_FLG_* users
Date: Sun, 11 Dec 2011 10:04:51 +0100
Message-ID: <1323594291-25304-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-scsi-owner@vger.kernel.org>
Sender: linux-scsi-owner@vger.kernel.org
To: linux-scsi@vger.kernel.org
Cc: linux-m68k@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "James E.J. Bottomley" <JBottomley@parallels.com>
List-Id: linux-m68k@vger.kernel.org

The m68k core irq code stopped honoring these flags during the irq
restructuring in 2006.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org
---
Please take or ack, so I can remove the definition for IRQ_FLG_SLOW in
the m68k code

 drivers/scsi/mac_scsi.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mac_scsi.c b/drivers/scsi/mac_scsi.c
index af3a6af..ea2bde2 100644
--- a/drivers/scsi/mac_scsi.c
+++ b/drivers/scsi/mac_scsi.c
@@ -291,8 +291,7 @@ int __init macscsi_detect(struct scsi_host_template * tpnt)
     ((struct NCR5380_hostdata *)instance->hostdata)->ctrl = 0;
 
     if (instance->irq != SCSI_IRQ_NONE)
-	if (request_irq(instance->irq, NCR5380_intr, IRQ_FLG_SLOW, 
-			"ncr5380", instance)) {
+	if (request_irq(instance->irq, NCR5380_intr, 0, "ncr5380", instance)) {
 	    printk(KERN_WARNING "scsi%d: IRQ%d not free, interrupts disabled\n",
 		   instance->host_no, instance->irq);
 	    instance->irq = SCSI_IRQ_NONE;
-- 
1.7.0.4

