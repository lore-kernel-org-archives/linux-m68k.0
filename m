From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] Disable MC68000 cpu target when MMU is selected
Date: Thu, 25 Oct 2012 21:01:16 +0100
Message-ID: <1351195276-5937-1-git-send-email-ljalvs@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:37157 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759761Ab2JYUBX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Oct 2012 16:01:23 -0400
Received: by mail-gg0-f174.google.com with SMTP id k5so415571ggd.19
        for <linux-m68k@vger.kernel.org>; Thu, 25 Oct 2012 13:01:23 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@snapgear.com, ljalvs@gmail.com

Hi,

As pointed out by Geert, MC68000 target needs to be disabled when
 MMU support is enabled.
 

Regards,
Luis


Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/Kconfig.cpu |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index aad3b0b..6708fa4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -36,6 +36,7 @@ if M68KCLASSIC
 
 config M68000
 	bool "MC68000"
+	depends on !MMU
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
 	select CPU_HAS_NO_UNALIGNED
-- 
1.7.10.4
