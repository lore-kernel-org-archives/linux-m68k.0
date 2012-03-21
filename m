From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 02/11] m68k/amiga: Mark z_dev_present() __init
Date: Wed, 21 Mar 2012 10:51:46 +0100
Message-ID: <1332323515-7314-2-git-send-email-geert__17118.2338185192$1332323703$gmane$org@linux-m68k.org>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

It's called from amiga_init_devices() only, which is __init.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/amiga/platform.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/amiga/platform.c b/arch/m68k/amiga/platform.c
index 7fd8b41..1b8db5c 100644
--- a/arch/m68k/amiga/platform.c
+++ b/arch/m68k/amiga/platform.c
@@ -57,7 +57,7 @@ static int __init amiga_init_bus(void)
 subsys_initcall(amiga_init_bus);
 
 
-static int z_dev_present(zorro_id id)
+static int __init z_dev_present(zorro_id id)
 {
 	unsigned int i;
 
-- 
1.7.0.4
