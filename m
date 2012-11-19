From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 381/493] m68k: remove use of __devinitconst
Date: Mon, 19 Nov 2012 13:25:30 -0500
Message-ID: <1353349642-3677-381-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

CONFIG_HOTPLUG is going away as an option so __devinitconst is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org> 
Cc: linux-m68k@lists.linux-m68k.org 
---
 arch/m68k/emu/nfeth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index a985a7e..695cd73 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -39,7 +39,7 @@ enum {
 #define MAX_UNIT	8
 
 /* These identify the driver base version and may not be removed. */
-static const char version[] __devinitconst =
+static const char version[] =
 	KERN_INFO KBUILD_MODNAME ".c:v" DRV_VERSION " " DRV_RELDATE
 	" S.Opichal, M.Jurik, P.Stehlik\n"
 	KERN_INFO " http://aranym.org/\n";
-- 
1.8.0
