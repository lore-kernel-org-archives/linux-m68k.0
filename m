From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 12/22] m68k/mvme147: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:10 +0100
Message-ID: <1481123360-10978-13-git-send-email-geert__5809.65027115798$1481123803$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Convert from printk() to pr_*().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mvme147/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index c11d38dfad08faa1..8778612d1f312d5c 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -63,7 +63,7 @@ int __init mvme147_parse_bootinfo(const struct bi_record *bi)
 
 void mvme147_reset(void)
 {
-	printk ("\r\n\nCalled mvme147_reset\r\n");
+	pr_info("\r\n\nCalled mvme147_reset\r\n");
 	m147_pcc->watchdog = 0x0a;	/* Clear timer */
 	m147_pcc->watchdog = 0xa5;	/* Enable watchdog - 100ms to reset */
 	while (1)
-- 
1.9.1
