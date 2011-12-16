From: <gerg@snapgear.com>
Subject: [PATCH 28/35] m68k: add code to setup a ColdFire 54xx platform when MMU enabled
Date: Fri, 16 Dec 2011 22:36:25 +1000
Message-ID: <1324038992-31222-29-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49430 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759378Ab1LPMhI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:08 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We use the same setup code for ColdFire MMU enabled platforms as
standard m68k. So add support for it to setup our 54xx ColdFire
platforms. They do not support the same bootinfo parsing as other
m68k platforms.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/setup_mm.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 52e17d1..b3938ad 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -221,7 +221,8 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	/* The bootinfo is located right after the kernel bss */
-	m68k_parse_bootinfo((const struct bi_record *)_end);
+	if (!CPU_IS_COLDFIRE)
+		m68k_parse_bootinfo((const struct bi_record *)_end);
 
 	if (CPU_IS_040)
 		m68k_is040or060 = 4;
@@ -327,6 +328,11 @@ void __init setup_arch(char **cmdline_p)
 		config_sun3x();
 		break;
 #endif
+#ifdef CONFIG_COLDFIRE
+	case MACH_M54XX:
+		config_BSP(NULL, 0);
+		break;
+#endif
 	default:
 		panic("No configuration setup");
 	}
-- 
1.7.0.4
