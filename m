From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: remove no longer used rom_length from Palm/Pilot start up code
Date: Thu, 22 Dec 2011 17:18:27 +1000
Message-ID: <1324538307-1453-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:45284 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752639Ab1LVHSn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 02:18:43 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Compiling for the m68knommu/68328 Palm/Pilot target you get:

  LD      vmlinux
arch/m68k/platform/68328/head.o: In function `L3':
(.text+0x170): undefined reference to `rom_length'

"rom_length" is not used any longer by any of the m68knommu code.
So remove it from here too.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68328/head-pilot.S |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/platform/68328/head-pilot.S b/arch/m68k/platform/68328/head-pilot.S
index aecff53..465ca47 100644
--- a/arch/m68k/platform/68328/head-pilot.S
+++ b/arch/m68k/platform/68328/head-pilot.S
@@ -185,9 +185,6 @@ L3:
 	moveq	#79, %d7
 	movel	%d0, _ramend
 
-	movel	%a3, %d0
-	movel	%d0, rom_length
-
 	pea	0
 	pea	env
 	pea	%sp@(4)
-- 
1.7.0.4
