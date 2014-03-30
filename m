From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 3/4] m68k/atari - ataflop: use correct virt/phys translation for DMA buffer
Date: Sun, 30 Mar 2014 13:01:25 +1300
Message-ID: <1396137686-32678-4-git-send-email-schmitz@debian.org>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:60964 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbaC3ABh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Mar 2014 20:01:37 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so6415094pdb.0
        for <linux-m68k@vger.kernel.org>; Sat, 29 Mar 2014 17:01:37 -0700 (PDT)
In-Reply-To: <1396137686-32678-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

With new ST-RAM allocation to work also when the kernel is running
from FastRAM, use dedicated virt/phys translation for this case.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
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
