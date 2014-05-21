From: sfking@fdwdc.com
Subject: [PATCH 4/4] Implement gpio support for m54xx.
Date: Wed, 21 May 2014 16:00:33 -0700
Message-ID: <1400713233-9155-5-git-send-email-sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.bf1.yahoo.com ([98.139.221.63]:43780 "HELO
	smtp104.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752342AbaEUXAq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 19:00:46 -0400
In-Reply-To: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: greg@uclinux.org
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, Steven King <sfking@fdwdc.com>

From: Steven King <sfking@fdwdc.com>

---
 arch/m68k/include/asm/m54xxsim.h |   12 +++++++++---
 arch/m68k/include/asm/mcfgpio.h  |   12 ++++++++----
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index d3bd838..a5fbd17 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -55,9 +55,15 @@
 /*
  *	Generic GPIO support
  */
-#define MCFGPIO_PIN_MAX		0	/* I am too lazy to count */
-#define MCFGPIO_IRQ_MAX		-1
-#define MCFGPIO_IRQ_VECBASE	-1
+#define MCFGPIO_PODR		(MCF_MBAR + 0xA00)
+#define MCFGPIO_PDDR		(MCF_MBAR + 0xA10)
+#define MCFGPIO_PPDR		(MCF_MBAR + 0xA20)
+#define MCFGPIO_SETR		(MCF_MBAR + 0xA20)
+#define MCFGPIO_CLRR		(MCF_MBAR + 0xA30)
+
+#define MCFGPIO_PIN_MAX		136	/* 128 gpio + 8 eport */
+#define MCFGPIO_IRQ_MAX		8
+#define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
 
 /*
  *	EDGE Port support.
diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index c41ebf4..66203c3 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -139,7 +139,8 @@ static inline void gpio_free(unsigned gpio)
 
 #if defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
     defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-    defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
+    defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
+    defined(CONFIG_M5441x)
 /*
  * These parts have an 'Edge' Port module (external interrupt/GPIO) which uses
  * read-modify-write to change an output and a GPIO module which has separate
@@ -195,7 +196,8 @@ static inline u32 __mcfgpio_ppdr(unsigned gpio)
 		return MCFSIM2_GPIO1READ;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
+      defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPPDR;
@@ -237,7 +239,8 @@ static inline u32 __mcfgpio_podr(unsigned gpio)
 		return MCFSIM2_GPIO1WRITE;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
+      defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPDR;
@@ -279,7 +282,8 @@ static inline u32 __mcfgpio_pddr(unsigned gpio)
 		return MCFSIM2_GPIO1ENABLE;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
+      defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPDDR;
-- 
1.7.10.4
