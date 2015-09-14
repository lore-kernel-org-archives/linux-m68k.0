From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: [PATCH] m68k/sun3: Fix virtual addresses of clock and interrupt register
Date: Mon, 14 Sep 2015 15:40:11 +0600
Message-ID: <1442223611-30175-1-git-send-email-kuleshovmail__32969.9624133811$1442223696$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Alexander Kuleshov <kuleshovmail@gmail.com>

The MMU base is 32 bits size - 0xfe000000, seems that we missed
one zero in the definition of the clock and interrupt register
addresses.

Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
---
 arch/m68k/sun3/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index a8b942b..c9c388f 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -61,8 +61,8 @@ void __init sun3_init(void)
 	m68k_cputype = CPU_68020;
 	m68k_fputype = FPU_68881; /* mc68881 actually */
 	m68k_mmutype = MMU_SUN3;
-	clock_va    =          (char *) 0xfe06000;	/* dark  */
-	sun3_intreg = (unsigned char *) 0xfe0a000;	/* magic */
+	clock_va    =          (char *) 0xfe006000;	/* dark  */
+	sun3_intreg = (unsigned char *) 0xfe00a000;	/* magic */
 	sun3_disable_interrupts();
 
 	prom_init((void *)LINUX_OPPROM_BEGVM);
-- 
2.5.0
