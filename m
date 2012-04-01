From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 4/5] m68k/atari: EtherNAT - fix dumb compile error
Date: Sun, 01 Apr 2012 15:05:55 +1200
Message-ID: <4F77C613.2090608@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:60772 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754196Ab2DADGB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 23:06:01 -0400
Received: by dake40 with SMTP id e40so1054753dak.11
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 20:06:01 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi All,

Part 4 in the EtherNAT series - forgot to include isp116x.h, oops.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/atari/config.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 92bf83a..aceebc2 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -32,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
+#include <linux/usb/isp116x.h>
 #include <linux/vt_kern.h>
 #include <linux/module.h>
 
