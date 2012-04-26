From: <gerg@snapgear.com>
Subject: [PATCH 05/22] m68knommu: switch to GPIO init macros in ColdFire 5249 init code
Date: Thu, 26 Apr 2012 10:25:45 +1000
Message-ID: <1335399962-10308-6-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28233 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932622Ab2DZA1A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:00 -0400
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
 arch/m68k/platform/5249/gpio.c |   33 ++-------------------------------
 1 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/arch/m68k/platform/5249/gpio.c b/arch/m68k/platform/5249/gpio.c
index 2b56c6e..775d618 100644
--- a/arch/m68k/platform/5249/gpio.c
+++ b/arch/m68k/platform/5249/gpio.c
@@ -21,37 +21,8 @@
 #include <asm/mcfgpio.h>
 
 static struct mcf_gpio_chip mcf_gpio_chips[] = {
-	{
-		.gpio_chip			= {
-			.label			= "GPIO0",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.ngpio			= 32,
-		},
-		.pddr				= (void __iomem *) MCFSIM2_GPIOENABLE,
-		.podr				= (void __iomem *) MCFSIM2_GPIOWRITE,
-		.ppdr				= (void __iomem *) MCFSIM2_GPIOREAD,
-	},
-	{
-		.gpio_chip			= {
-			.label			= "GPIO1",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.base			= 32,
-			.ngpio			= 32,
-		},
-		.pddr				= (void __iomem *) MCFSIM2_GPIO1ENABLE,
-		.podr				= (void __iomem *) MCFSIM2_GPIO1WRITE,
-		.ppdr				= (void __iomem *) MCFSIM2_GPIO1READ,
-	},
+	MCFGPS(GPIO0, 0, 32, MCFSIM2_GPIOENABLE, MCFSIM2_GPIOWRITE, MCFSIM2_GPIOREAD),
+	MCFGPS(GPIO1, 32, 32, MCFSIM2_GPIO1ENABLE, MCFSIM2_GPIO1WRITE, MCFSIM2_GPIO1READ),
 };
 
 static int __init mcf_gpio_init(void)
-- 
1.7.0.4
