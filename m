From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Fri, 8 Jun 2012 15:43:00 +1000
Message-ID: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:35498 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933363Ab2FHFoU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 01:44:20 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

All current ColdFire CPUs are able to support unaligned memory accesses.
So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for ColdFire.

It seems that the current restriction was inherrited from the early non-MMU
support for the basic 68000 proecssors - which do not support unaligned
accesses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index d4f3a98..06fa0c3 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -27,7 +27,6 @@ config COLDFIRE
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
-	select CPU_HAS_NO_UNALIGNED
 	select GENERIC_CSUM
 
 endchoice
-- 
1.7.0.4
