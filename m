From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: [PATCH] m68k/sun3: Use %pM format specifier to print ethernet address
Date: Thu, 27 Aug 2015 18:30:43 +0600
Message-ID: <1440678643-7171-1-git-send-email-kuleshovmail@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Alexander Kuleshov <kuleshovmail@gmail.com>

printk() supports %pM format specifier for printing 6-byte MAC/FDDI
addresses in hex notation small buffers, let's use it intead of %x:%x...

Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
---
 arch/m68k/sun3/idprom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/sun3/idprom.c b/arch/m68k/sun3/idprom.c
index c86ac37..cfe9aa4 100644
--- a/arch/m68k/sun3/idprom.c
+++ b/arch/m68k/sun3/idprom.c
@@ -125,8 +125,5 @@ void __init idprom_init(void)
 
 	display_system_type(idprom->id_machtype);
 
-	printk("Ethernet address: %x:%x:%x:%x:%x:%x\n",
-		    idprom->id_ethaddr[0], idprom->id_ethaddr[1],
-		    idprom->id_ethaddr[2], idprom->id_ethaddr[3],
-		    idprom->id_ethaddr[4], idprom->id_ethaddr[5]);
+	printk("Ethernet address: %pM\n", idprom->id_ethaddr);
 }
-- 
2.5.0
