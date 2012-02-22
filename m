From: <gerg@snapgear.com>
Subject: [PATCH 3/5 v2] m68knommu: remove unused CONFIG_GENERIC_CMOS_UPDATE option
Date: Wed, 22 Feb 2012 13:58:54 +1000
Message-ID: <1329883136-9837-3-git-send-email-gerg@snapgear.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50735 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932169Ab2BVD6m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 22:58:42 -0500
In-Reply-To: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The CONFIG_GENERIC_CMOS_UPDATE switch is always enabled for the non-MMU
m68k case. But the underlying code to support it, update_persistent_clock(),
doesn't end up doing anything on the currently supported non-MMU platforms.
No platforms supply the necessary function support for writing back the RTC.

So lets remove this option and support code. This also brings m68knommu
in line with the m68k, which doesn't enabled this switch either.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig          |    3 ---
 arch/m68k/kernel/time_no.c |    5 -----
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index ae413d4..6f823dc 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -24,9 +24,6 @@ config ARCH_HAS_ILOG2_U64
 config GENERIC_CLOCKEVENTS
 	bool
 
-config GENERIC_CMOS_UPDATE
-	def_bool !MMU
-
 config GENERIC_GPIO
 	bool
 
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
index 5fa42f1..87c7acd 100644
--- a/arch/m68k/kernel/time_no.c
+++ b/arch/m68k/kernel/time_no.c
@@ -65,11 +65,6 @@ void read_persistent_clock(struct timespec *ts)
 	}
 }
 
-int update_persistent_clock(struct timespec now)
-{
-	return set_rtc_mmss(now.tv_sec);
-}
-
 void __init time_init(void)
 {
 	mach_sched_init(timer_interrupt);
-- 
1.7.0.4
