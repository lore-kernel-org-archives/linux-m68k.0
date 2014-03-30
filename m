From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 4/4] m68k/atari - atari_scsi: use correct virt/phys translation for DMA buffer
Date: Sun, 30 Mar 2014 13:01:26 +1300
Message-ID: <1396137686-32678-5-git-send-email-schmitz@debian.org>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:36478 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212AbaC3ABi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Mar 2014 20:01:38 -0400
Received: by mail-pa0-f54.google.com with SMTP id lf10so6553041pab.41
        for <linux-m68k@vger.kernel.org>; Sat, 29 Mar 2014 17:01:38 -0700 (PDT)
In-Reply-To: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

With new ST-RAM allocation to work also when the kernel is running
from FastRAM, use dedicated virt/phys translation for this case.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
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
