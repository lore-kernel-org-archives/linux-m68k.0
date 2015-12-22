From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 46/77] ncr5380: Fix NDEBUG_NO_DATAOUT flag
Date: Tue, 22 Dec 2015 12:18:24 +1100
Message-ID: <20151222011750.505466143@telegraphics.com.au>
References: <20151222011737.980475848@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40509 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbbLVCbS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Dec 2015 21:31:18 -0500
Content-Disposition: inline; filename=ncr5380-fix-NDEBUG_NO_DATAOUT
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "James E.J. Bottomley" <JBottomley@odin.com>, Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>

NDEBUG_NO_DATAOUT should not disable DATA IN phases too. Fix this.
(This bug has long been fixed in atari_NCR5380.c.)

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 drivers/scsi/NCR5380.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/scsi/NCR5380.c
===================================================================
--- linux.orig/drivers/scsi/NCR5380.c	2015-12-22 12:16:37.000000000 +1100
+++ linux/drivers/scsi/NCR5380.c	2015-12-22 12:16:40.000000000 +1100
@@ -1838,7 +1838,6 @@ static void NCR5380_information_transfer
 				continue;
 			}
 			switch (phase) {
-			case PHASE_DATAIN:
 			case PHASE_DATAOUT:
 #if (NDEBUG & NDEBUG_NO_DATAOUT)
 				printk("scsi%d : NDEBUG_NO_DATAOUT set, attempted DATAOUT aborted\n", instance->host_no);
@@ -1848,6 +1847,7 @@ static void NCR5380_information_transfer
 				cmd->scsi_done(cmd);
 				return;
 #endif
+			case PHASE_DATAIN:
 				/* 
 				 * If there is no room left in the current buffer in the
 				 * scatter-gather list, move onto the next one.
