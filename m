From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/8] Documentation/zorro.txt: Update path to arch-specific header files
Date: Wed, 16 Oct 2013 13:03:18 +0200
Message-ID: <1381921405-11206-2-git-send-email-geert__22057.9485562213$1381921465$gmane$org@linux-m68k.org>
References: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-doc@vger.kernel.org

  - Arch-specific headers were moved to arch/<arch/>/include/asm,
  - APUS support was dropped a long time ago

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-doc@vger.kernel.org
---
 Documentation/zorro.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/zorro.txt b/Documentation/zorro.txt
index d5829d14774a..d17670400564 100644
--- a/Documentation/zorro.txt
+++ b/Documentation/zorro.txt
@@ -95,7 +95,7 @@ The treatment of these regions depends on the type of Zorro space:
 -------------
 
 linux/include/linux/zorro.h
-linux/include/asm-{m68k,ppc}/zorro.h
+linux/arch/m68k/include/asm/zorro.h
 linux/include/linux/zorro_ids.h
 linux/drivers/zorro
 /proc/bus/zorro
-- 
1.7.9.5
