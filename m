From: <gerg@snapgear.com>
Subject: [PATCH 2/2] m68knommu: move and fix the 68VZ328 platform bootlogo.h
Date: Tue, 3 Apr 2012 14:18:28 +1000
Message-ID: <1333426708-16514-2-git-send-email-gerg@snapgear.com>
References: <1333426708-16514-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:43014 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751Ab2DCEYc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Apr 2012 00:24:32 -0400
In-Reply-To: <1333426708-16514-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The 68EZ328/bootlogo.h is not actually used in the 68EZ328 platform code
at all. It is used by the 68VZ328 platform code though, so move it to be
with the rest of the 68VZ328 platform code.

Commit c0e0c89c089f4bd66dbbd1a44da90abe74fe3f02 ("fix broken boot logo
inclusion") modified the bootlogo code to not be included in asm code.
Modify 68VZ328/bootlogo.h so that the bootlogo bit map is named correctly
for dorect use in the C code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/{68EZ328 => 68VZ328}/bootlogo.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename arch/m68k/platform/{68EZ328 => 68VZ328}/bootlogo.h (99%)

diff --git a/arch/m68k/platform/68EZ328/bootlogo.h b/arch/m68k/platform/68VZ328/bootlogo.h
similarity index 99%
rename from arch/m68k/platform/68EZ328/bootlogo.h
rename to arch/m68k/platform/68VZ328/bootlogo.h
index e842bda..b38e2b2 100644
--- a/arch/m68k/platform/68EZ328/bootlogo.h
+++ b/arch/m68k/platform/68VZ328/bootlogo.h
@@ -1,6 +1,6 @@
 #define splash_width 640
 #define splash_height 480
-static unsigned char splash_bits[] = {
+unsigned char __attribute__ ((aligned(16))) bootlogo_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-- 
1.7.0.4
