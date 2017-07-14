From: Angelo Dureghello <angelo@sysam.it>
Subject: Re:[PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Sat, 15 Jul 2017 01:21:18 +0200
Message-ID: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:58433 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdGNX2B (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 14 Jul 2017 19:28:01 -0400
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

The Freescale ColdFire M5441x system-on-chip parts have full paged MMU
hardware support. So far though we have only allowed them to be
configured for use in non-MMU mode.

All required kernel changes to support operation of the M5441x parts
with MMU enabled have been pushed into the kernel, so now we can allow
it to be configured and used with the MMU enabled.

I don't actually have any M5441x based hardware so I can't do any real
testing on this. The changes up to now were based on Yannick Gicquel
initial patches to support this. Is anybody out there able to test
this properly?  I won't push this any further until we have some
confirmation that it all works as expected.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
  arch/m68k/Kconfig.cpu | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index d2219f30..4dc51c0 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -283,7 +283,7 @@ config M548x
  
  config M5441x
  	bool "MCF5441x"
-	depends on !MMU
+	select MMU_COLDFIRE if MMU
  	select GENERIC_CLOCKEVENTS
  	select HAVE_CACHE_CB
  	help
-- 
1.9.1


I tested the patch on my mcf54415 based board, get silence after u-boot at kernel execution


U-Boot 2017.05-00709-g9d9f074dfe-dirty (Jul 14 2017 - 01:11:57 +0200)

CPU:   Freescale MCF54410 (Mask:9f Version:2)
        CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
        INP CLK 30 MHz VCO CLK 480 MHz
SPI:   ready
DRAM:  128 MiB
SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
device 0 offset 0x100000, size 0x1d9720
SF: 1939232 bytes @ 0x100000 Read: OK
## Booting kernel from Legacy Image at 40001000 ...
    Image Name:   mainline kernel
    Created:      2017-07-14  22:46:07 UTC
    Image Type:   M68K Linux Kernel Image (uncompressed)
    Data Size:    1939168 Bytes = 1.8 MiB
    Load Address: 40001000
    Entry Point:  40001000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK

--- silence, kernel execution hangs here ---


Regards,
Angelo Dureghello



--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
[prev in list] [next in list] [prev in thread] [next in thread]
