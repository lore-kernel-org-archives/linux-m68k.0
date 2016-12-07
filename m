From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/22] m68k/68000: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:02 +0100
Message-ID: <1481123360-10978-5-git-send-email-geert__42091.0117253245$1481123939$gmane$org@linux-m68k.org>
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
 arch/m68k/68000/m68328.c   | 6 +++---
 arch/m68k/68000/m68EZ328.c | 6 +++---
 arch/m68k/68000/m68VZ328.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/68000/m68328.c b/arch/m68k/68000/m68328.c
index e53caf4c3bfbf9d1..419751b15ec8b5f1 100644
--- a/arch/m68k/68000/m68328.c
+++ b/arch/m68k/68000/m68328.c
@@ -45,9 +45,9 @@ void m68328_reset (void)
 
 void __init config_BSP(char *command, int len)
 {
-  printk(KERN_INFO "\n68328 support D. Jeff Dionne <jeff@uclinux.org>\n");
-  printk(KERN_INFO "68328 support Kenneth Albanowski <kjahds@kjshds.com>\n");
-  printk(KERN_INFO "68328/Pilot support Bernhard Kuhn <kuhn@lpr.e-technik.tu-muenchen.de>\n");
+  pr_info("68328 support D. Jeff Dionne <jeff@uclinux.org>\n");
+  pr_info("68328 support Kenneth Albanowski <kjahds@kjshds.com>\n");
+  pr_info("68328/Pilot support Bernhard Kuhn <kuhn@lpr.e-technik.tu-muenchen.de>\n");
 
   mach_hwclk = m68328_hwclk;
   mach_reset = m68328_reset;
diff --git a/arch/m68k/68000/m68EZ328.c b/arch/m68k/68000/m68EZ328.c
index e6ab321f93f832e9..6a309a3cfbfc1953 100644
--- a/arch/m68k/68000/m68EZ328.c
+++ b/arch/m68k/68000/m68EZ328.c
@@ -57,12 +57,12 @@ void __init config_BSP(char *command, int len)
 {
   unsigned char *p;
 
-  printk(KERN_INFO "\n68EZ328 DragonBallEZ support (C) 1999 Rt-Control, Inc\n");
+  pr_info("68EZ328 DragonBallEZ support (C) 1999 Rt-Control, Inc\n");
 
 #ifdef CONFIG_UCSIMM
-  printk(KERN_INFO "uCsimm serial string [%s]\n",getserialnum());
+  pr_info("uCsimm serial string [%s]\n", getserialnum());
   p = cs8900a_hwaddr = gethwaddr(0);
-  printk(KERN_INFO "uCsimm hwaddr %pM\n", p);
+  pr_info("uCsimm hwaddr %pM\n", p);
 
   p = getbenv("APPEND");
   if (p) strcpy(p,command);
diff --git a/arch/m68k/68000/m68VZ328.c b/arch/m68k/68000/m68VZ328.c
index 1154bdb220a022cd..81b5491685a4a2ab 100644
--- a/arch/m68k/68000/m68VZ328.c
+++ b/arch/m68k/68000/m68VZ328.c
@@ -150,9 +150,9 @@ static void __init init_hardware(char *command, int size)
 {
 	char *p;
 
-	printk(KERN_INFO "uCdimm serial string [%s]\n", getserialnum());
+	pr_info("uCdimm serial string [%s]\n", getserialnum());
 	p = cs8900a_hwaddr = gethwaddr(0);
-	printk(KERN_INFO "uCdimm hwaddr %pM\n", p);
+	pr_info("uCdimm hwaddr %pM\n", p);
 	p = getbenv("APPEND");
 	if (p)
 		strcpy(p, command);
@@ -177,7 +177,7 @@ static void __init init_hardware(char *command, int size)
 
 void __init config_BSP(char *command, int size)
 {
-	printk(KERN_INFO "68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.\n");
+	pr_info("68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.\n");
 
 	init_hardware(command, size);
 
-- 
1.9.1
