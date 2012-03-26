From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/q40: Add missing platform check before registering platform devices
Date: Mon, 26 Mar 2012 22:13:13 +0200
Message-ID: <1332792793-31174-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Dmitry Torokhov <dtor@mail.ru>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On multi-platform kernels, the Q40/Q60 platform devices should be
registered when running on Q40/Q60 only. Else it may crash later.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
As this weas introduced after v3.3, I'll queue this up together with the
other critical MACH_IS_* patches after v3.4-rc1 is released.

 arch/m68k/q40/config.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index be93648..ba5452f 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -335,6 +335,9 @@ static __init int q40_add_kbd_device(void)
 {
 	struct platform_device *pdev;
 
+	if (!MACH_IS_Q40)
+		return -ENODEV;
+
 	pdev = platform_device_register_simple("q40kbd", -1, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
-- 
1.7.0.4
