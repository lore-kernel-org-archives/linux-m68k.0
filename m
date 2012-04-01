From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 3/5] m68k/atari: EtherNAT - register EtherNAT platform devices
 only when probed
Date: Sun, 01 Apr 2012 15:02:56 +1200
Message-ID: <4F77C560.6050805@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58158 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754253Ab2DADDD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 23:03:03 -0400
Received: by pbcun15 with SMTP id un15so3260728pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 20:03:02 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi All,

Part 3 in the EtherNAT series - only register platform devices if the 
card is present.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/atari/config.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 12a76ab..92bf83a 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -752,7 +752,18 @@ static struct platform_device 
*atari_platform_devices[] __initdata = {
 
 int __init atari_platform_init(void)
 {
-       return platform_add_devices(atari_platform_devices, 
ARRAY_SIZE(atari_platform_devices));
+       int rv = -ENODEV;
+       unsigned char *enatc_virt;
+
+       if (!MACH_IS_ATARI)
+               return -ENODEV;
+
+       enatc_virt = (unsigned char 
*)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
+       if (hwreg_present(enatc_virt))
+               rv = platform_add_devices(atari_platform_devices, 
ARRAY_SIZE(atari_platform_devices));
+       iounmap(enatc_virt);
+
+       return rv;     
 }
 
 arch_initcall(atari_platform_init);
