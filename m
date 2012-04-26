From: <gerg@snapgear.com>
Subject: [PATCH 10/22] m68knommu: switch to GPIO init macros in ColdFire 5407 init code
Date: Thu, 26 Apr 2012 10:25:50 +1000
Message-ID: <1335399962-10308-11-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28249 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932622Ab2DZA1H (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:07 -0400
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
 arch/m68k/platform/5407/gpio.c |   16 +---------------
 1 files changed, 1 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/platform/5407/gpio.c b/arch/m68k/platform/5407/gpio.c
index 5850612..91d0420 100644
--- a/arch/m68k/platform/5407/gpio.c
+++ b/arch/m68k/platform/5407/gpio.c
@@ -21,21 +21,7 @@
 #include <asm/mcfgpio.h>
 
 static struct mcf_gpio_chip mcf_gpio_chips[] = {
-	{
-		.gpio_chip			= {
-			.label			= "PP",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.ngpio			= 16,
-		},
-		.pddr				= (void __iomem *) MCFSIM_PADDR,
-		.podr				= (void __iomem *) MCFSIM_PADAT,
-		.ppdr				= (void __iomem *) MCFSIM_PADAT,
-	},
+	MCFGPS(PP, 0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
 };
 
 static int __init mcf_gpio_init(void)
-- 
1.7.0.4
