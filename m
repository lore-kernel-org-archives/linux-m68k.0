From: <gerg@snapgear.com>
Subject: [PATCH 04/22] m68knommu: switch to GPIO init macros in ColdFire 523x init code
Date: Thu, 26 Apr 2012 10:25:44 +1000
Message-ID: <1335399962-10308-5-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28220 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932622Ab2DZA06 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:26:58 -0400
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Modify the GPIO setup table to use the mcfgpio.h macros for table init.
Simplifies code and reduces line count significantly.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/523x/gpio.c |  264 ++-------------------------------------
 1 files changed, 14 insertions(+), 250 deletions(-)

diff --git a/arch/m68k/platform/523x/gpio.c b/arch/m68k/platform/523x/gpio.c
index 327ebf1..8e6e30e 100644
--- a/arch/m68k/platform/523x/gpio.c
+++ b/arch/m68k/platform/523x/gpio.c
@@ -21,256 +21,20 @@
 #include <asm/mcfgpio.h>
 
 static struct mcf_gpio_chip mcf_gpio_chips[] = {
-	{
-		.gpio_chip			= {
-			.label			= "PIRQ",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.base			= 1,
-			.ngpio			= 7,
-		},
-		.pddr				= (void __iomem *) MCFEPORT_EPDDR,
-		.podr				= (void __iomem *) MCFEPORT_EPDR,
-		.ppdr				= (void __iomem *) MCFEPORT_EPPDR,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "ADDR",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 13,
-			.ngpio			= 3,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_ADDR,
-		.podr				= (void __iomem *) MCFGPIO_PODR_ADDR,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_ADDR,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_ADDR,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_ADDR,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "DATAH",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 16,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_DATAH,
-		.podr				= (void __iomem *) MCFGPIO_PODR_DATAH,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_DATAH,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_DATAH,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_DATAH,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "DATAL",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 24,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_DATAL,
-		.podr				= (void __iomem *) MCFGPIO_PODR_DATAL,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_DATAL,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_DATAL,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_DATAL,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "BUSCTL",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 32,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_BUSCTL,
-		.podr				= (void __iomem *) MCFGPIO_PODR_BUSCTL,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_BUSCTL,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_BUSCTL,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_BUSCTL,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "BS",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 40,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_BS,
-		.podr				= (void __iomem *) MCFGPIO_PODR_BS,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_BS,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_BS,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_BS,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "CS",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 49,
-			.ngpio			= 7,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_CS,
-		.podr				= (void __iomem *) MCFGPIO_PODR_CS,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_CS,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_CS,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_CS,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "SDRAM",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 56,
-			.ngpio			= 6,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_SDRAM,
-		.podr				= (void __iomem *) MCFGPIO_PODR_SDRAM,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_SDRAM,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_SDRAM,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_SDRAM,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "FECI2C",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 64,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_FECI2C,
-		.podr				= (void __iomem *) MCFGPIO_PODR_FECI2C,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_FECI2C,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_FECI2C,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_FECI2C,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "UARTH",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 72,
-			.ngpio			= 2,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_UARTH,
-		.podr				= (void __iomem *) MCFGPIO_PODR_UARTH,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_UARTH,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_UARTH,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_UARTH,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "UARTL",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 80,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_UARTL,
-		.podr				= (void __iomem *) MCFGPIO_PODR_UARTL,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_UARTL,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_UARTL,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_UARTL,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "QSPI",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 88,
-			.ngpio			= 5,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_QSPI,
-		.podr				= (void __iomem *) MCFGPIO_PODR_QSPI,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_QSPI,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_QSPI,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_QSPI,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "TIMER",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 96,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_TIMER,
-		.podr				= (void __iomem *) MCFGPIO_PODR_TIMER,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_TIMER,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_TIMER,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_TIMER,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "ETPU",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 104,
-			.ngpio			= 3,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_ETPU,
-		.podr				= (void __iomem *) MCFGPIO_PODR_ETPU,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_ETPU,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_ETPU,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_ETPU,
-	},
+	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(ADDR, 13, 3),
+	MCFGPF(DATAH, 16, 8),
+	MCFGPF(DATAL, 24, 8),
+	MCFGPF(BUSCTL, 32, 8),
+	MCFGPF(BS, 40, 4),
+	MCFGPF(CS, 49, 7),
+	MCFGPF(SDRAM, 56, 6),
+	MCFGPF(FECI2C, 64, 4),
+	MCFGPF(UARTH, 72, 2),
+	MCFGPF(UARTL, 80, 8),
+	MCFGPF(QSPI, 88, 5),
+	MCFGPF(TIMER, 96, 8),
+	MCFGPF(ETPU, 104, 3),
 };
 
 static int __init mcf_gpio_init(void)
-- 
1.7.0.4
