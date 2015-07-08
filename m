From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 6/8] m68k: m5441x: set rambar to end of SRAM physical addr space
Date: Wed,  8 Jul 2015 11:51:30 +0200
Message-ID: <1436349092-2214-7-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:37759 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932944AbbGHJvx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:53 -0400
Received: by wiclp1 with SMTP id lp1so74959098wic.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:52 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.52
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:52 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Even if SRAM is not used, this is required to avoid inconsistency at runtime.
Otherwise, an assertion failed in ld.so during init process execution:

Inconsistency detected by ld.so: rtld.c: 1290: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/coldfire/head.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index fa31be2..bf39885 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -151,6 +151,15 @@ _start0:
 
 _start:
 	nop					/* filler */
+#if defined(CONFIG_M5441x)
+#if defined(CONFIG_SRAM_BASE)
+	movel	#(CONFIG_SRAM_BASE+0x221), %d0
+#else
+	movel	#(0x8ff00000+0x221), %d0
+#endif
+	movec	%d0, %rambar1
+#endif
+
 	movew	#0x2700, %sr			/* no interrupts */
 	movel	#CACHE_INIT,%d0			/* disable cache */
 	movec	%d0,%CACR
-- 
1.9.1.286.g5172cb3
