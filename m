From: <gerg@snapgear.com>
Subject: [PATCH 01/22] m68knommu: introduce macros to simplify ColdFire GPIO table initialization
Date: Thu, 26 Apr 2012 10:25:41 +1000
Message-ID: <1335399962-10308-2-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28216 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932593Ab2DZA0x (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:26:53 -0400
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We have very large tables in the ColdFire CPU GPIO setup code that essentially
boil down to 2 distinct types of GPIO pin initiaization. Using 2 macros we can
reduce these large tables to at most a dozen lines of setup code, and in quite
a few cases a single table entry.

Introduce these 2 macros into the existing mcfgpio.h header.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/mcfgpio.h |   41 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index ee5e4cc..148f56a 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -37,4 +37,45 @@ void mcf_gpio_set_value_fast(struct gpio_chip *, unsigned, int);
 int mcf_gpio_request(struct gpio_chip *, unsigned);
 void mcf_gpio_free(struct gpio_chip *, unsigned);
 
+/*
+ *	Define macros to ease the pain of setting up the gpio tables.
+ */
+#define	MCFGPS(mlabel, mbase, mngpio, mpddr, mpodr, mppdr)		    \
+	{								    \
+		.gpio_chip			= {			    \
+			.label			= #mlabel,		    \
+			.request		= mcf_gpio_request,	    \
+			.free			= mcf_gpio_free,	    \
+			.direction_input	= mcf_gpio_direction_input, \
+			.direction_output	= mcf_gpio_direction_output,\
+			.get			= mcf_gpio_get_value,	    \
+			.set			= mcf_gpio_set_value,       \
+			.base			= mbase,		    \
+			.ngpio			= mngpio,		    \
+		},							    \
+		.pddr		= (void __iomem *) mpddr,		    \
+		.podr		= (void __iomem *) mpodr,		    \
+		.ppdr		= (void __iomem *) mppdr,		    \
+	}
+
+#define	MCFGPF(mlabel, mbase, mngpio)					    \
+	{								    \
+		.gpio_chip			= {			    \
+			.label			= #mlabel,		    \
+			.request		= mcf_gpio_request,	    \
+			.free			= mcf_gpio_free,	    \
+			.direction_input	= mcf_gpio_direction_input, \
+			.direction_output	= mcf_gpio_direction_output,\
+			.get			= mcf_gpio_get_value,	    \
+			.set			= mcf_gpio_set_value_fast,  \
+			.base			= mbase,		    \
+			.ngpio			= mngpio,		    \
+		},							    \
+		.pddr		= (void __iomem *) MCFGPIO_PDDR_##mlabel,   \
+		.podr		= (void __iomem *) MCFGPIO_PODR_##mlabel,   \
+		.ppdr		= (void __iomem *) MCFGPIO_PPDSDR_##mlabel, \
+		.setr		= (void __iomem *) MCFGPIO_PPDSDR_##mlabel, \
+		.clrr		= (void __iomem *) MCFGPIO_PCLRR_##mlabel,  \
+	}
+
 #endif
-- 
1.7.0.4
