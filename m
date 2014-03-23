From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/2] m68k/atari - ataflop: use correct virt/phys translation for DMA buffer
Date: Sun, 23 Mar 2014 14:24:25 +1300
Message-ID: <1395537866-29423-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:44745 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbaCWBYt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Mar 2014 21:24:49 -0400
Received: by mail-pa0-f48.google.com with SMTP id hz1so3958960pad.35
        for <linux-m68k@vger.kernel.org>; Sat, 22 Mar 2014 18:24:49 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

---
 drivers/block/ataflop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 0e30c6e..f54655a 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1952,7 +1952,7 @@ static int __init atari_floppy_init (void)
 		goto Enomem;
 	}
 	TrackBuffer = DMABuffer + 512;
-	PhysDMABuffer = virt_to_phys(DMABuffer);
+	PhysDMABuffer = atari_stram_to_phys(DMABuffer);
 	PhysTrackBuffer = virt_to_phys(TrackBuffer);
 	BufferDrive = BufferSide = BufferTrack = -1;
 
-- 
1.7.0.4
