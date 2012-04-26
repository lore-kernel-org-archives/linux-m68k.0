From: <gerg@snapgear.com>
Subject: [PATCH 03/22] m68knommu: switch to GPIO init macros in ColdFire 520x init code
Date: Thu, 26 Apr 2012 10:25:43 +1000
Message-ID: <1335399962-10308-4-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28219 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932622Ab2DZA04 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:26:56 -0400
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
 arch/m68k/platform/520x/gpio.c |  149 ++-------------------------------------
 1 files changed, 8 insertions(+), 141 deletions(-)

diff --git a/arch/m68k/platform/520x/gpio.c b/arch/m68k/platform/520x/gpio.c
index 9bcc3e4..96b3685 100644
--- a/arch/m68k/platform/520x/gpio.c
+++ b/arch/m68k/platform/520x/gpio.c
@@ -21,147 +21,14 @@
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
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFEPORT_EPDDR,
-		.podr				= (void __iomem *) MCFEPORT_EPDR,
-		.ppdr				= (void __iomem *) MCFEPORT_EPPDR,
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
-			.base			= 9,
-			.ngpio			= 3,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_CS,
-		.podr				= (void __iomem *) MCFGPIO_PODR_CS,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_CS,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_CS,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_CS,
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
-			.base			= 16,
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
-			.label			= "QSPI",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 24,
-			.ngpio			= 4,
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
-			.base			= 32,
-			.ngpio			= 4,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_TIMER,
-		.podr				= (void __iomem *) MCFGPIO_PODR_TIMER,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_TIMER,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_TIMER,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_TIMER,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "UART",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 40,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_UART,
-		.podr				= (void __iomem *) MCFGPIO_PODR_UART,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_UART,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_UART,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_UART,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "FECH",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 48,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_FECH,
-		.podr				= (void __iomem *) MCFGPIO_PODR_FECH,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_FECH,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_FECH,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_FECH,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "FECL",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value_fast,
-			.base			= 56,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFGPIO_PDDR_FECL,
-		.podr				= (void __iomem *) MCFGPIO_PODR_FECL,
-		.ppdr				= (void __iomem *) MCFGPIO_PPDSDR_FECL,
-		.setr				= (void __iomem *) MCFGPIO_PPDSDR_FECL,
-		.clrr				= (void __iomem *) MCFGPIO_PCLRR_FECL,
-	},
+	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
+	MCFGPF(CS, 9, 3),
+	MCFGPF(FECI2C, 16, 4),
+	MCFGPF(QSPI, 24, 4),
+	MCFGPF(TIMER, 32, 4),
+	MCFGPF(UART, 40, 8),
+	MCFGPF(FECH, 48, 8),
+	MCFGPF(FECL, 56, 8),
 };
 
 static int __init mcf_gpio_init(void)
-- 
1.7.0.4
