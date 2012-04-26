From: <gerg@snapgear.com>
Subject: [PATCH 08/22] m68knommu: switch to GPIO init macros in ColdFire 528x init code
Date: Thu, 26 Apr 2012 10:25:48 +1000
Message-ID: <1335399962-10308-9-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28248 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932656Ab2DZA1G (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:06 -0400
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Modify the GPIO setup table to use the mcfgpio.h macros for table init.
Simplifies code and reduces line count significantly.

We also need to rename some of the GPIO registers to be consistent with
all other ColdFire parts (we can't use the new GPIO macros otherwise).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h |  179 +++++++---------
 arch/m68k/platform/528x/gpio.c   |  427 ++------------------------------------
 2 files changed, 103 insertions(+), 503 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index 569476f..d63b99f 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -97,100 +97,81 @@
 /*
  * 	GPIO registers
  */
-#define MCFGPIO_PORTA		(MCF_IPSBAR + 0x00100000)
-#define MCFGPIO_PORTB		(MCF_IPSBAR + 0x00100001)
-#define MCFGPIO_PORTC		(MCF_IPSBAR + 0x00100002)
-#define MCFGPIO_PORTD		(MCF_IPSBAR + 0x00100003)
-#define MCFGPIO_PORTE		(MCF_IPSBAR + 0x00100004)
-#define MCFGPIO_PORTF		(MCF_IPSBAR + 0x00100005)
-#define MCFGPIO_PORTG		(MCF_IPSBAR + 0x00100006)
-#define MCFGPIO_PORTH		(MCF_IPSBAR + 0x00100007)
-#define MCFGPIO_PORTJ		(MCF_IPSBAR + 0x00100008)
-#define MCFGPIO_PORTDD		(MCF_IPSBAR + 0x00100009)
-#define MCFGPIO_PORTEH		(MCF_IPSBAR + 0x0010000A)
-#define MCFGPIO_PORTEL		(MCF_IPSBAR + 0x0010000B)
-#define MCFGPIO_PORTAS		(MCF_IPSBAR + 0x0010000C)
-#define MCFGPIO_PORTQS		(MCF_IPSBAR + 0x0010000D)
-#define MCFGPIO_PORTSD		(MCF_IPSBAR + 0x0010000E)
-#define MCFGPIO_PORTTC		(MCF_IPSBAR + 0x0010000F)
-#define MCFGPIO_PORTTD		(MCF_IPSBAR + 0x00100010)
-#define MCFGPIO_PORTUA		(MCF_IPSBAR + 0x00100011)
-
-#define MCFGPIO_DDRA		(MCF_IPSBAR + 0x00100014)
-#define MCFGPIO_DDRB		(MCF_IPSBAR + 0x00100015)
-#define MCFGPIO_DDRC		(MCF_IPSBAR + 0x00100016)
-#define MCFGPIO_DDRD		(MCF_IPSBAR + 0x00100017)
-#define MCFGPIO_DDRE		(MCF_IPSBAR + 0x00100018)
-#define MCFGPIO_DDRF		(MCF_IPSBAR + 0x00100019)
-#define MCFGPIO_DDRG		(MCF_IPSBAR + 0x0010001A)
-#define MCFGPIO_DDRH		(MCF_IPSBAR + 0x0010001B)
-#define MCFGPIO_DDRJ		(MCF_IPSBAR + 0x0010001C)
-#define MCFGPIO_DDRDD		(MCF_IPSBAR + 0x0010001D)
-#define MCFGPIO_DDREH		(MCF_IPSBAR + 0x0010001E)
-#define MCFGPIO_DDREL		(MCF_IPSBAR + 0x0010001F)
-#define MCFGPIO_DDRAS		(MCF_IPSBAR + 0x00100020)
-#define MCFGPIO_DDRQS		(MCF_IPSBAR + 0x00100021)
-#define MCFGPIO_DDRSD		(MCF_IPSBAR + 0x00100022)
-#define MCFGPIO_DDRTC		(MCF_IPSBAR + 0x00100023)
-#define MCFGPIO_DDRTD		(MCF_IPSBAR + 0x00100024)
-#define MCFGPIO_DDRUA		(MCF_IPSBAR + 0x00100025)
-
-#define MCFGPIO_PORTAP		(MCF_IPSBAR + 0x00100028)
-#define MCFGPIO_PORTBP		(MCF_IPSBAR + 0x00100029)
-#define MCFGPIO_PORTCP		(MCF_IPSBAR + 0x0010002A)
-#define MCFGPIO_PORTDP		(MCF_IPSBAR + 0x0010002B)
-#define MCFGPIO_PORTEP		(MCF_IPSBAR + 0x0010002C)
-#define MCFGPIO_PORTFP		(MCF_IPSBAR + 0x0010002D)
-#define MCFGPIO_PORTGP		(MCF_IPSBAR + 0x0010002E)
-#define MCFGPIO_PORTHP		(MCF_IPSBAR + 0x0010002F)
-#define MCFGPIO_PORTJP		(MCF_IPSBAR + 0x00100030)
-#define MCFGPIO_PORTDDP		(MCF_IPSBAR + 0x00100031)
-#define MCFGPIO_PORTEHP		(MCF_IPSBAR + 0x00100032)
-#define MCFGPIO_PORTELP		(MCF_IPSBAR + 0x00100033)
-#define MCFGPIO_PORTASP		(MCF_IPSBAR + 0x00100034)
-#define MCFGPIO_PORTQSP		(MCF_IPSBAR + 0x00100035)
-#define MCFGPIO_PORTSDP		(MCF_IPSBAR + 0x00100036)
-#define MCFGPIO_PORTTCP		(MCF_IPSBAR + 0x00100037)
-#define MCFGPIO_PORTTDP		(MCF_IPSBAR + 0x00100038)
-#define MCFGPIO_PORTUAP		(MCF_IPSBAR + 0x00100039)
-
-#define MCFGPIO_SETA		(MCF_IPSBAR + 0x00100028)
-#define MCFGPIO_SETB		(MCF_IPSBAR + 0x00100029)
-#define MCFGPIO_SETC		(MCF_IPSBAR + 0x0010002A)
-#define MCFGPIO_SETD		(MCF_IPSBAR + 0x0010002B)
-#define MCFGPIO_SETE		(MCF_IPSBAR + 0x0010002C)
-#define MCFGPIO_SETF		(MCF_IPSBAR + 0x0010002D)
-#define MCFGPIO_SETG		(MCF_IPSBAR + 0x0010002E)
-#define MCFGPIO_SETH		(MCF_IPSBAR + 0x0010002F)
-#define MCFGPIO_SETJ		(MCF_IPSBAR + 0x00100030)
-#define MCFGPIO_SETDD		(MCF_IPSBAR + 0x00100031)
-#define MCFGPIO_SETEH		(MCF_IPSBAR + 0x00100032)
-#define MCFGPIO_SETEL		(MCF_IPSBAR + 0x00100033)
-#define MCFGPIO_SETAS		(MCF_IPSBAR + 0x00100034)
-#define MCFGPIO_SETQS		(MCF_IPSBAR + 0x00100035)
-#define MCFGPIO_SETSD		(MCF_IPSBAR + 0x00100036)
-#define MCFGPIO_SETTC		(MCF_IPSBAR + 0x00100037)
-#define MCFGPIO_SETTD		(MCF_IPSBAR + 0x00100038)
-#define MCFGPIO_SETUA		(MCF_IPSBAR + 0x00100039)
-
-#define MCFGPIO_CLRA		(MCF_IPSBAR + 0x0010003C)
-#define MCFGPIO_CLRB		(MCF_IPSBAR + 0x0010003D)
-#define MCFGPIO_CLRC		(MCF_IPSBAR + 0x0010003E)
-#define MCFGPIO_CLRD		(MCF_IPSBAR + 0x0010003F)
-#define MCFGPIO_CLRE		(MCF_IPSBAR + 0x00100040)
-#define MCFGPIO_CLRF		(MCF_IPSBAR + 0x00100041)
-#define MCFGPIO_CLRG		(MCF_IPSBAR + 0x00100042)
-#define MCFGPIO_CLRH		(MCF_IPSBAR + 0x00100043)
-#define MCFGPIO_CLRJ		(MCF_IPSBAR + 0x00100044)
-#define MCFGPIO_CLRDD		(MCF_IPSBAR + 0x00100045)
-#define MCFGPIO_CLREH		(MCF_IPSBAR + 0x00100046)
-#define MCFGPIO_CLREL		(MCF_IPSBAR + 0x00100047)
-#define MCFGPIO_CLRAS		(MCF_IPSBAR + 0x00100048)
-#define MCFGPIO_CLRQS		(MCF_IPSBAR + 0x00100049)
-#define MCFGPIO_CLRSD		(MCF_IPSBAR + 0x0010004A)
-#define MCFGPIO_CLRTC		(MCF_IPSBAR + 0x0010004B)
-#define MCFGPIO_CLRTD		(MCF_IPSBAR + 0x0010004C)
-#define MCFGPIO_CLRUA		(MCF_IPSBAR + 0x0010004D)
+#define MCFGPIO_PODR_A		(MCF_IPSBAR + 0x00100000)
+#define MCFGPIO_PODR_B		(MCF_IPSBAR + 0x00100001)
+#define MCFGPIO_PODR_C		(MCF_IPSBAR + 0x00100002)
+#define MCFGPIO_PODR_D		(MCF_IPSBAR + 0x00100003)
+#define MCFGPIO_PODR_E		(MCF_IPSBAR + 0x00100004)
+#define MCFGPIO_PODR_F		(MCF_IPSBAR + 0x00100005)
+#define MCFGPIO_PODR_G		(MCF_IPSBAR + 0x00100006)
+#define MCFGPIO_PODR_H		(MCF_IPSBAR + 0x00100007)
+#define MCFGPIO_PODR_J		(MCF_IPSBAR + 0x00100008)
+#define MCFGPIO_PODR_DD		(MCF_IPSBAR + 0x00100009)
+#define MCFGPIO_PODR_EH		(MCF_IPSBAR + 0x0010000A)
+#define MCFGPIO_PODR_EL		(MCF_IPSBAR + 0x0010000B)
+#define MCFGPIO_PODR_AS		(MCF_IPSBAR + 0x0010000C)
+#define MCFGPIO_PODR_QS		(MCF_IPSBAR + 0x0010000D)
+#define MCFGPIO_PODR_SD		(MCF_IPSBAR + 0x0010000E)
+#define MCFGPIO_PODR_TC		(MCF_IPSBAR + 0x0010000F)
+#define MCFGPIO_PODR_TD		(MCF_IPSBAR + 0x00100010)
+#define MCFGPIO_PODR_UA		(MCF_IPSBAR + 0x00100011)
+
+#define MCFGPIO_PDDR_A		(MCF_IPSBAR + 0x00100014)
+#define MCFGPIO_PDDR_B		(MCF_IPSBAR + 0x00100015)
+#define MCFGPIO_PDDR_C		(MCF_IPSBAR + 0x00100016)
+#define MCFGPIO_PDDR_D		(MCF_IPSBAR + 0x00100017)
+#define MCFGPIO_PDDR_E		(MCF_IPSBAR + 0x00100018)
+#define MCFGPIO_PDDR_F		(MCF_IPSBAR + 0x00100019)
+#define MCFGPIO_PDDR_G		(MCF_IPSBAR + 0x0010001A)
+#define MCFGPIO_PDDR_H		(MCF_IPSBAR + 0x0010001B)
+#define MCFGPIO_PDDR_J		(MCF_IPSBAR + 0x0010001C)
+#define MCFGPIO_PDDR_DD		(MCF_IPSBAR + 0x0010001D)
+#define MCFGPIO_PDDR_EH		(MCF_IPSBAR + 0x0010001E)
+#define MCFGPIO_PDDR_EL		(MCF_IPSBAR + 0x0010001F)
+#define MCFGPIO_PDDR_AS		(MCF_IPSBAR + 0x00100020)
+#define MCFGPIO_PDDR_QS		(MCF_IPSBAR + 0x00100021)
+#define MCFGPIO_PDDR_SD		(MCF_IPSBAR + 0x00100022)
+#define MCFGPIO_PDDR_TC		(MCF_IPSBAR + 0x00100023)
+#define MCFGPIO_PDDR_TD		(MCF_IPSBAR + 0x00100024)
+#define MCFGPIO_PDDR_UA		(MCF_IPSBAR + 0x00100025)
+
+#define MCFGPIO_PPDSDR_A	(MCF_IPSBAR + 0x00100028)
+#define MCFGPIO_PPDSDR_B	(MCF_IPSBAR + 0x00100029)
+#define MCFGPIO_PPDSDR_C	(MCF_IPSBAR + 0x0010002A)
+#define MCFGPIO_PPDSDR_D	(MCF_IPSBAR + 0x0010002B)
+#define MCFGPIO_PPDSDR_E	(MCF_IPSBAR + 0x0010002C)
+#define MCFGPIO_PPDSDR_F	(MCF_IPSBAR + 0x0010002D)
+#define MCFGPIO_PPDSDR_G	(MCF_IPSBAR + 0x0010002E)
+#define MCFGPIO_PPDSDR_H	(MCF_IPSBAR + 0x0010002F)
+#define MCFGPIO_PPDSDR_J	(MCF_IPSBAR + 0x00100030)
+#define MCFGPIO_PPDSDR_DD	(MCF_IPSBAR + 0x00100031)
+#define MCFGPIO_PPDSDR_EH	(MCF_IPSBAR + 0x00100032)
+#define MCFGPIO_PPDSDR_EL	(MCF_IPSBAR + 0x00100033)
+#define MCFGPIO_PPDSDR_AS	(MCF_IPSBAR + 0x00100034)
+#define MCFGPIO_PPDSDR_QS	(MCF_IPSBAR + 0x00100035)
+#define MCFGPIO_PPDSDR_SD	(MCF_IPSBAR + 0x00100036)
+#define MCFGPIO_PPDSDR_TC	(MCF_IPSBAR + 0x00100037)
+#define MCFGPIO_PPDSDR_TD	(MCF_IPSBAR + 0x00100038)
+#define MCFGPIO_PPDSDR_UA	(MCF_IPSBAR + 0x00100039)
+
+#define MCFGPIO_PCLRR_A		(MCF_IPSBAR + 0x0010003C)
+#define MCFGPIO_PCLRR_B		(MCF_IPSBAR + 0x0010003D)
+#define MCFGPIO_PCLRR_C		(MCF_IPSBAR + 0x0010003E)
+#define MCFGPIO_PCLRR_D		(MCF_IPSBAR + 0x0010003F)
+#define MCFGPIO_PCLRR_E		(MCF_IPSBAR + 0x00100040)
+#define MCFGPIO_PCLRR_F		(MCF_IPSBAR + 0x00100041)
+#define MCFGPIO_PCLRR_G		(MCF_IPSBAR + 0x00100042)
+#define MCFGPIO_PCLRR_H		(MCF_IPSBAR + 0x00100043)
+#define MCFGPIO_PCLRR_J		(MCF_IPSBAR + 0x00100044)
+#define MCFGPIO_PCLRR_DD	(MCF_IPSBAR + 0x00100045)
+#define MCFGPIO_PCLRR_EH	(MCF_IPSBAR + 0x00100046)
+#define MCFGPIO_PCLRR_EL	(MCF_IPSBAR + 0x00100047)
+#define MCFGPIO_PCLRR_AS	(MCF_IPSBAR + 0x00100048)
+#define MCFGPIO_PCLRR_QS	(MCF_IPSBAR + 0x00100049)
+#define MCFGPIO_PCLRR_SD	(MCF_IPSBAR + 0x0010004A)
+#define MCFGPIO_PCLRR_TC	(MCF_IPSBAR + 0x0010004B)
+#define MCFGPIO_PCLRR_TD	(MCF_IPSBAR + 0x0010004C)
+#define MCFGPIO_PCLRR_UA	(MCF_IPSBAR + 0x0010004D)
 
 #define MCFGPIO_PBCDPAR		(MCF_IPSBAR + 0x00100050)
 #define MCFGPIO_PFPAR		(MCF_IPSBAR + 0x00100051)
@@ -242,11 +223,11 @@
  * definitions for generic gpio support
  *
  */
-#define MCFGPIO_PODR		MCFGPIO_PORTA	/* port output data */
-#define MCFGPIO_PDDR		MCFGPIO_DDRA	/* port data direction */
-#define MCFGPIO_PPDR		MCFGPIO_PORTAP	/* port pin data */
-#define MCFGPIO_SETR		MCFGPIO_SETA	/* set output */
-#define MCFGPIO_CLRR		MCFGPIO_CLRA	/* clr output */
+#define MCFGPIO_PODR		MCFGPIO_PODR_A	/* port output data */
+#define MCFGPIO_PDDR		MCFGPIO_PDDR_A	/* port data direction */
+#define MCFGPIO_PPDR		MCFGPIO_PPDSDR_A/* port pin data */
+#define MCFGPIO_SETR		MCFGPIO_PPDSDR_A/* set output */
+#define MCFGPIO_CLRR		MCFGPIO_PCLRR_A	/* clr output */
 
 #define MCFGPIO_IRQ_MAX		8
 #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
diff --git a/arch/m68k/platform/528x/gpio.c b/arch/m68k/platform/528x/gpio.c
index 526db66..f0e19d6 100644
--- a/arch/m68k/platform/528x/gpio.c
+++ b/arch/m68k/platform/528x/gpio.c
@@ -21,410 +21,29 @@
 #include <asm/mcfgpio.h>
 
 static struct mcf_gpio_chip mcf_gpio_chips[] = {
-	{
-		.gpio_chip			= {
-			.label			= "NQ",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.base			= 1,
-			.ngpio			= 7,
-		},
-		.pddr				= (void __iomem *)MCFEPORT_EPDDR,
-		.podr				= (void __iomem *)MCFEPORT_EPDR,
-		.ppdr				= (void __iomem *)MCFEPORT_EPPDR,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "TA",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 8,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFGPTA_GPTDDR,
-		.podr				= (void __iomem *)MCFGPTA_GPTPORT,
-		.ppdr				= (void __iomem *)MCFGPTB_GPTPORT,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "TB",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 16,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFGPTB_GPTDDR,
-		.podr				= (void __iomem *)MCFGPTB_GPTPORT,
-		.ppdr				= (void __iomem *)MCFGPTB_GPTPORT,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "QA",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 24,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFQADC_DDRQA,
-		.podr				= (void __iomem *)MCFQADC_PORTQA,
-		.ppdr				= (void __iomem *)MCFQADC_PORTQA,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "QB",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 32,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFQADC_DDRQB,
-		.podr				= (void __iomem *)MCFQADC_PORTQB,
-		.ppdr				= (void __iomem *)MCFQADC_PORTQB,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "A",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 40,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRA,
-		.podr				= (void __iomem *)MCFGPIO_PORTA,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTAP,
-		.setr				= (void __iomem *)MCFGPIO_SETA,
-		.clrr				= (void __iomem *)MCFGPIO_CLRA,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "B",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 48,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRB,
-		.podr				= (void __iomem *)MCFGPIO_PORTB,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTBP,
-		.setr				= (void __iomem *)MCFGPIO_SETB,
-		.clrr				= (void __iomem *)MCFGPIO_CLRB,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "C",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 56,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRC,
-		.podr				= (void __iomem *)MCFGPIO_PORTC,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTCP,
-		.setr				= (void __iomem *)MCFGPIO_SETC,
-		.clrr				= (void __iomem *)MCFGPIO_CLRC,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "D",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 64,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRD,
-		.podr				= (void __iomem *)MCFGPIO_PORTD,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTDP,
-		.setr				= (void __iomem *)MCFGPIO_SETD,
-		.clrr				= (void __iomem *)MCFGPIO_CLRD,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "E",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 72,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRE,
-		.podr				= (void __iomem *)MCFGPIO_PORTE,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTEP,
-		.setr				= (void __iomem *)MCFGPIO_SETE,
-		.clrr				= (void __iomem *)MCFGPIO_CLRE,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "F",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 80,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRF,
-		.podr				= (void __iomem *)MCFGPIO_PORTF,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTFP,
-		.setr				= (void __iomem *)MCFGPIO_SETF,
-		.clrr				= (void __iomem *)MCFGPIO_CLRF,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "G",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 88,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRG,
-		.podr				= (void __iomem *)MCFGPIO_PORTG,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTGP,
-		.setr				= (void __iomem *)MCFGPIO_SETG,
-		.clrr				= (void __iomem *)MCFGPIO_CLRG,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "H",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 96,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRH,
-		.podr				= (void __iomem *)MCFGPIO_PORTH,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTHP,
-		.setr				= (void __iomem *)MCFGPIO_SETH,
-		.clrr				= (void __iomem *)MCFGPIO_CLRH,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "J",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 104,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRJ,
-		.podr				= (void __iomem *)MCFGPIO_PORTJ,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTJP,
-		.setr				= (void __iomem *)MCFGPIO_SETJ,
-		.clrr				= (void __iomem *)MCFGPIO_CLRJ,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "DD",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 112,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRDD,
-		.podr				= (void __iomem *)MCFGPIO_PORTDD,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTDDP,
-		.setr				= (void __iomem *)MCFGPIO_SETDD,
-		.clrr				= (void __iomem *)MCFGPIO_CLRDD,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "EH",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 120,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDREH,
-		.podr				= (void __iomem *)MCFGPIO_PORTEH,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTEHP,
-		.setr				= (void __iomem *)MCFGPIO_SETEH,
-		.clrr				= (void __iomem *)MCFGPIO_CLREH,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "EL",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 128,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDREL,
-		.podr				= (void __iomem *)MCFGPIO_PORTEL,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTELP,
-		.setr				= (void __iomem *)MCFGPIO_SETEL,
-		.clrr				= (void __iomem *)MCFGPIO_CLREL,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "AS",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 136,
-			.ngpio			= 6,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRAS,
-		.podr				= (void __iomem *)MCFGPIO_PORTAS,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTASP,
-		.setr				= (void __iomem *)MCFGPIO_SETAS,
-		.clrr				= (void __iomem *)MCFGPIO_CLRAS,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "QS",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 144,
-			.ngpio			= 7,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRQS,
-		.podr				= (void __iomem *)MCFGPIO_PORTQS,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTQSP,
-		.setr				= (void __iomem *)MCFGPIO_SETQS,
-		.clrr				= (void __iomem *)MCFGPIO_CLRQS,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "SD",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 152,
-			.ngpio			= 6,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRSD,
-		.podr				= (void __iomem *)MCFGPIO_PORTSD,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTSDP,
-		.setr				= (void __iomem *)MCFGPIO_SETSD,
-		.clrr				= (void __iomem *)MCFGPIO_CLRSD,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "TC",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 160,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRTC,
-		.podr				= (void __iomem *)MCFGPIO_PORTTC,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTTCP,
-		.setr				= (void __iomem *)MCFGPIO_SETTC,
-		.clrr				= (void __iomem *)MCFGPIO_CLRTC,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "TD",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 168,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRTD,
-		.podr				= (void __iomem *)MCFGPIO_PORTTD,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTTDP,
-		.setr				= (void __iomem *)MCFGPIO_SETTD,
-		.clrr				= (void __iomem *)MCFGPIO_CLRTD,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "UA",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 176,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *)MCFGPIO_DDRUA,
-		.podr				= (void __iomem *)MCFGPIO_PORTUA,
-		.ppdr				= (void __iomem *)MCFGPIO_PORTUAP,
-		.setr				= (void __iomem *)MCFGPIO_SETUA,
-		.clrr				= (void __iomem *)MCFGPIO_CLRUA,
-	},
+	MCFGPS(NQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPS(TA, 8, 4, MCFGPTA_GPTDDR, MCFGPTA_GPTPORT, MCFGPTB_GPTPORT),
+	MCFGPS(TB, 16, 4, MCFGPTB_GPTDDR, MCFGPTB_GPTPORT, MCFGPTB_GPTPORT),
+	MCFGPS(QA, 24, 4, MCFQADC_DDRQA, MCFQADC_PORTQA, MCFQADC_PORTQA),
+	MCFGPS(QA, 32, 4, MCFQADC_DDRQB, MCFQADC_PORTQB, MCFQADC_PORTQB),
+	MCFGPF(A, 40, 8),
+	MCFGPF(B, 48, 8),
+	MCFGPF(C, 56, 8),
+	MCFGPF(D, 64, 8),
+	MCFGPF(E, 72, 8),
+	MCFGPF(F, 80, 8),
+	MCFGPF(G, 88, 8),
+	MCFGPF(H, 96, 8),
+	MCFGPF(J, 104, 8),
+	MCFGPF(DD, 112, 8),
+	MCFGPF(EH, 120, 8),
+	MCFGPF(EL, 128, 8),
+	MCFGPF(AS, 136, 6),
+	MCFGPF(QS, 144, 7),
+	MCFGPF(SD, 152, 6),
+	MCFGPF(TC, 160, 4),
+	MCFGPF(TD, 168, 4),
+	MCFGPF(UA, 176, 4),
 };
 
 static int __init mcf_gpio_init(void)
-- 
1.7.0.4
