From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] m68k/atari - atari_scsi: use correct virt/phys translation for DMA buffer
Date: Sun, 23 Mar 2014 14:24:26 +1300
Message-ID: <1395537866-29423-2-git-send-email-schmitz@debian.org>
References: <1395537866-29423-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:38424 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbaCWBYf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 21:24:35 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so3946064pbc.7
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 18:24:35 -0700 (PDT)
In-Reply-To: <1395537866-29423-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

---
 drivers/scsi/atari_scsi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index 296c936..a8d721f 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -639,7 +639,7 @@ static int __init atari_scsi_detect(struct scsi_host_template *host)
 					"double buffer\n");
 			return 0;
 		}
-		atari_dma_phys_buffer = virt_to_phys(atari_dma_buffer);
+		atari_dma_phys_buffer = atari_stram_to_phys(atari_dma_buffer);
 		atari_dma_orig_addr = 0;
 	}
 #endif
-- 
1.7.0.4
