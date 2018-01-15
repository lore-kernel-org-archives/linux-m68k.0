From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] MAINTAINERS: Add NuBus subsystem entry
Date: Sun, 14 Jan 2018 22:41:13 -0500 (EST)
Message-ID: <a3359f6905dae1beac9e88e0eb68387ca8400d78.1515925759.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

This is legacy code but it might as well have an official maintainer.

Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2811a211632c..2bf5a5aee278 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9652,6 +9652,15 @@ S:	Supported
 F:	Documentation/filesystems/ntfs.txt
 F:	fs/ntfs/
 
+NUBUS SUBSYSTEM
+M:	Finn Thain <fthain@telegraphics.com.au>
+L:	linux-m68k@lists.linux-m68k.org
+S:	Maintained
+F:	arch/*/include/asm/nubus.h
+F:	drivers/nubus/
+F:	include/linux/nubus.h
+F:	include/uapi/linux/nubus.h
+
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
-- 
2.13.6
