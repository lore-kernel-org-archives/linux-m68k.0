From: Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH] m68k: amig: Use PTR_RET rather than if(IS_ERR(.. [1]
Date: Mon, 06 Aug 2012 19:51:16 +0200
Message-ID: <1344275476.14513.97.camel__11044.0276250758$1344278024$gmane$org@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "[geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org]"@vger.kernel.org

The semantic patch that makes this change is available
in scripts/coccinelle/api/ptr_ret.cocci.

More information about semantic patching is available at
http://coccinelle.lip6.fr/

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff -u -p a/arch/m68k/amiga/platform.c b/arch/m68k/amiga/platform.c
--- a/arch/m68k/amiga/platform.c
+++ b/arch/m68k/amiga/platform.c
@@ -56,10 +56,7 @@ static int __init amiga_init_bus(void)
 	n = AMIGAHW_PRESENT(ZORRO3) ? 4 : 2;
 	pdev = platform_device_register_simple("amiga-zorro", -1,
 					       zorro_resources, n);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	return 0;
+	return PTR_RET(pdev);
 }
 
 subsys_initcall(amiga_init_bus);
