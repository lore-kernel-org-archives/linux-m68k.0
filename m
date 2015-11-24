From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Fix for Falcon 030 boot fault in v4.3
Date: Wed, 25 Nov 2015 10:06:13 +1300
Message-ID: <1448399173-24847-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33071 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754127AbbKXVGX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Nov 2015 16:06:23 -0500
Received: by pabfh17 with SMTP id fh17so34381431pab.0
        for <linux-m68k@vger.kernel.org>; Tue, 24 Nov 2015 13:06:23 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, schwab@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>, Michael Schmitz <schmitzmic@debian.org>

Geert,

as discussed, I'm sending a patch to fix my problem booting my Atari
Falcon running in 030 mode (CT60 disabled, so no FastRAM present).

As evidenced by adding initcall_debug to the boot options, the boot hangs
in atari_platform_init() on your v4.3 kernel. I've had a similar fault
a year ago with 3.18 so it's not a recent regression. 

I've narrowed the problem down to the ioremap() calls used to map the
EtherNAT and EtherNEC register spaces for probing. For some reason,
ioremap() blocks with interrupts enabled. The heartbeat signal on the
IDE LED keeps flashing, albeit at a steadily increasing rate.

The patch below fixes the symptoms, i.e. I can boot 4.3 to user space
with functional EtherNEC adapter. I'm baffled as to why ioremap would
block instead of returning error though. Maybe Andreas can shed some
light on this? 

Cheers,

	Michael


[PATCH] m68k/atari - change device probe in atari_platform_init()

Don't probe for EtherNAT CPLD config register unless running on
a CT60 type Atari Falcon. The EtherNAT isn't visible from the
Falcon bus when running in 030 mode.

Don't probe for EtherNEC registers at all - the ROM port is always
present. Let the ne driver sort out whether there's an adapter
plugged in.

This saves running early ioremap() in atari_platform_init(),
which blocks on Falcon in 030 mode.

Signed-off-by: Michael Schmitz <schmitzmic@debian.org>
---
 arch/m68k/atari/config.c |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 192b00f..ef35cb7 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -884,6 +884,12 @@ int __init atari_platform_init(void)
 		return -ENODEV;
 
 #ifdef CONFIG_ATARI_ETHERNAT
+	/* 
+	 * only probe for EtherNAT when running on CT60!
+	 * EtherNAT can't be found on 030 Falcon, and early
+	 * ioremap() blocks on Falcon in 030 mode! 
+	*/
+	if (CPU_IS_060)
 	{
 		unsigned char *enatc_virt;
 		enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
@@ -896,17 +902,13 @@ int __init atari_platform_init(void)
 #endif
 
 #ifdef CONFIG_ATARI_ETHERNEC
+	/* don't probe for EtherNEC - just assume it's present */
 	{
 		int error;
-		unsigned char *enec_virt;
-		enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
-		if (hwreg_present(enec_virt)) {
-			error = platform_add_devices(atari_netusbee_devices,
-						ARRAY_SIZE(atari_netusbee_devices));
-			if (error && !rv)
-				rv = error;
-		}
-		iounmap(enec_virt);
+		error = platform_add_devices(atari_netusbee_devices,
+					ARRAY_SIZE(atari_netusbee_devices));
+		if (error && !rv)
+			rv = error;
 	}
 #endif
 
-- 
1.7.0.4
