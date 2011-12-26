From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 35/35] m68k: allow ColdFire 547x and 548x CPUs to be
 built with MMU enabled
Date: Mon, 26 Dec 2011 20:33:36 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1112262032100.4517@ayla.of.borg>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com> <1324610148-20666-36-git-send-email-gerg@snapgear.com> <alpine.DEB.2.00.1112261011590.4517@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:42528 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752116Ab1LZTdh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Dec 2011 14:33:37 -0500
In-Reply-To: <alpine.DEB.2.00.1112261011590.4517@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Mon, 26 Dec 2011, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Mon, 26 Dec 2011 19:57:33 +0100
> Subject: [PATCH] m68k/Kconfig: Separate classic m68k and coldfire early
> 
> While you can build multiplatform kernels for machines with classic
> m68k processors, you cannot mix support for classic m68k and coldfire
> processors. To avoid such hybrid kernels, introduce CONFIG_M68KCLASSIC
> as an antipole for CONFIG_COLDFIRE, and make all specific processor
> support depend on one of them.
> All classic m68k machine support also needs to depend on this.
> 
> The defaults (CONFIG_M68KCLASSIC if MMU, CONFIG_COLDFIRE if !MMU) are
> chosen such to make most of the existing configs build and work.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/Kconfig.cpu     |   63 +++++++++++++++++++++++++--------------------
>  arch/m68k/Kconfig.machine |    4 +++
>  2 files changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index a4c75ad..58d4b52 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -1,5 +1,34 @@
>  comment "Processor Type"
>  
> +config M68KCLASSIC
> +	bool "Classic M68K CPU family support"
> +	default y if MMU
> +	help
> +	  The Freescale (was Motorola) M68K family of processors implements
> +	  the full 68000 processor instruction set.
> +	  If you anticipate running this kernel on a computer with a classic
> +	  MC68xxx processor, say Y. Otherwise, say N.
> +
> +config COLDFIRE
> +	bool "Coldfire CPU family support"
> +	depends on !M68KCLASSIC

A choice may be a better choice:

>From c9a9a0b9402b2f09da33a963cadff7a6c507a70b Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Dec 2011 20:22:40 +0100
Subject: [PATCH] m68k/Kconfig: Make CONFIG_M68KCLASSIC/CONFIG_COLDFIRE a choice

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.cpu |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 58d4b52..a022e54 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -1,31 +1,35 @@
 comment "Processor Type"
 
-config M68KCLASSIC
-	bool "Classic M68K CPU family support"
-	default y if MMU
+choice
+	prompt "CPU family support"
+	default M68KCLASSIC if MMU
+	default COLDFIRE if !MMU
 	help
 	  The Freescale (was Motorola) M68K family of processors implements
 	  the full 68000 processor instruction set.
+	  The Freescale ColdFire family of processors is a modern derivitive
+	  of the 68000 processor family. They are mainly targeted at embedded
+	  applications, and are all System-On-Chip (SOC) devices, as opposed
+	  to stand alone CPUs. They implement a subset of the original 68000
+	  processor instruction set.
 	  If you anticipate running this kernel on a computer with a classic
-	  MC68xxx processor, say Y. Otherwise, say N.
+	  MC68xxx processor, select M68KCLASSIC.
+	  If you anticipate running this kernel on a computer with a ColdFire
+	  processor, select COLDFIRE.
+
+config M68KCLASSIC
+	bool "Classic M68K CPU family support"
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
-	depends on !M68KCLASSIC
 	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
-	default y if !MMU
 	help
-	  The Freescale ColdFire family of processors is a modern derivitive
-	  of the 68000 processor family. They are mainly targeted at embedded
-	  applications, and are all System-On-Chip (SOC) devices, as opposed
-	  to stand alone CPUs. They implement a subset of the original 68000
-	  processor instruction set.
-	  If you anticipate running this kernel on a computer with a ColdFire
-	  processor, say Y. Otherwise, say N.
+
+endchoice
 
 if M68KCLASSIC
 
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
