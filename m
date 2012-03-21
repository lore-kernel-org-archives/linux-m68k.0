From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 05/11] m68k/atari: Add missing platform check before registering platform devices
Date: Wed, 21 Mar 2012 10:51:49 +0100
Message-ID: <1332323515-7314-5-git-send-email-geert__9239.13357914916$1332323753$gmane$org@linux-m68k.org>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On multi-platform kernels, the Atari platform devices should be registered
when running on Atari only. Else it may crash later.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/atari/config.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index af78731..35fb81d 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -693,6 +693,9 @@ static struct platform_device *atari_platform_devices[] __initdata = {
 
 int __init atari_platform_init(void)
 {
+	if (!MACH_IS_ATARI)
+		return -ENODEV;
+
 	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
 }
 
-- 
1.7.0.4
