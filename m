From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/11] m68k/amiga: Use arch_initcall() for registering platform devices
Date: Wed, 21 Mar 2012 10:51:48 +0100
Message-ID: <1332323515-7314-4-git-send-email-geert__40204.6198178597$1332323751$gmane$org@linux-m68k.org>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

module_init() maps to device_initcall(), opening the possibility of
race conditions between platform_driver_probe() and registering platform
devices.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/amiga/platform.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/amiga/platform.c b/arch/m68k/amiga/platform.c
index 2872891..80076d3 100644
--- a/arch/m68k/amiga/platform.c
+++ b/arch/m68k/amiga/platform.c
@@ -252,4 +252,4 @@ static int __init amiga_init_devices(void)
 	return 0;
 }
 
-device_initcall(amiga_init_devices);
+arch_initcall(amiga_init_devices);
-- 
1.7.0.4
