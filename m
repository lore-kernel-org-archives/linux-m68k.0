From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Don't hang waiting for Cuda power-down command
Date: Sat, 12 Aug 2017 17:11:02 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1708121021180.1762@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58614 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750972AbdHLHST (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 12 Aug 2017 03:18:19 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Testing shows that the CUDA_POWERDOWN command never completes (for a 
Centris 660av or LC 475, at least). So, don't wait for command completion 
on those Cuda-based models that do not support soft power. Just proceed to 
log the usual message, "It is now safe to turn off your Macintosh."

Reported-by: Stan Johnson <userm57@yahoo.com>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 0f3ba726e8a9..d96348a52362 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -357,6 +357,17 @@ static void cuda_shutdown(void)
 	struct adb_request req;
 	if (cuda_request(&req, NULL, 2, CUDA_PACKET, CUDA_POWERDOWN) < 0)
 		return;
+
+	/* Avoid infinite polling loop when PSU is not under Cuda control */
+	switch (macintosh_config->ident) {
+	case MAC_MODEL_C660:
+	case MAC_MODEL_Q605:
+	case MAC_MODEL_Q605_ACC:
+	case MAC_MODEL_P475:
+	case MAC_MODEL_P475F:
+		return;
+	}
+
 	while (!req.complete)
 		cuda_poll();
 }
