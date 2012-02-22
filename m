From: <gerg@snapgear.com>
Subject: [PATCH 5/5 v2] m68k: remove dead timer code
Date: Wed, 22 Feb 2012 13:58:56 +1000
Message-ID: <1329883136-9837-5-git-send-email-gerg@snapgear.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50763 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932125Ab2BVD7e (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 22:59:34 -0500
In-Reply-To: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The set_rtc_mmss() function is defined "static inline" but is never used
in this file. Remove it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/time.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index adfcefb..d7deb7f 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -28,13 +28,6 @@
 #include <linux/timex.h>
 #include <linux/profile.h>
 
-static inline int set_rtc_mmss(unsigned long nowtime)
-{
-  if (mach_set_clock_mmss)
-    return mach_set_clock_mmss (nowtime);
-  return -1;
-}
-
 /*
  * timer_interrupt() needs to keep up the real-time clock,
  * as well as call the "xtime_update()" routine every clocktick
-- 
1.7.0.4
