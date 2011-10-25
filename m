From: <gerg@snapgear.com>
Subject: [PATCH 20/36] m68k: ColdFire with MMU needs simpler lib checksum code
Date: Tue, 25 Oct 2011 17:19:12 +1000
Message-ID: <1319527168-11166-21-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25213 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762Ab1JYHVM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:12 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We have 2 implementations of the IP checksuming code for m68k. One uses
the more advanced instructions available in 68020 and above processors,
the other uses the simpler instructions available on the original 68000
processors and the modern ColdFire processors.

The code choice shouldn't be made based on whether we have an MMU enabled
or not. It is a processor specific choice. The newer advanced ColdFire
CPU family members with MMU still only support the simpler instructions.

So choose the checksumming code based on CONFIG_CPU_HAS_NO_BITFIELDS.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/lib/Makefile |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 1a1bd90..3161158 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -7,8 +7,14 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 	   memcpy.o memset.o memmove.o
 
 ifdef CONFIG_MMU
-lib-y	+= string.o uaccess.o checksum_mm.o
+lib-y	+= string.o uaccess.o
 else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o checksum_no.o
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o
+endif
+
+ifdef CONFIG_CPU_HAS_NO_BITFIELDS
+lib-y	+= checksum_no.o
+else
+lib-y	+= checksum_mm.o
 endif
 
-- 
1.7.0.4
