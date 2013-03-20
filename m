From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] m68k: clean up unused "config ROMVECSIZE"
Date: Wed, 20 Mar 2013 11:38:06 +0100
Message-ID: <1363775886.1390.90.camel__26891.5065484636$1363775937$gmane$org@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Kconfig symbol ROMVECSIZE is unused since commit
f84f52a5c15db7d14a534815f27253b001735183 ("m68knommu: clean up linker
script"). Let's clean up its Kconfig entry too.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 arch/m68k/Kconfig.machine | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 7240584..28ec0c0 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -539,15 +539,6 @@ config ROMVEC
 	  68000 type variants the vectors are at the base of the boot device
 	  on system startup.
 
-config ROMVECSIZE
-	hex "Size of ROM vector region (in bytes)"
-	default "0x400"
-	depends on ROM
-	help
-	  Define the size of the vector region in ROM. For most 68000
-	  variants this would be 0x400 bytes in size. Set to 0 if you do
-	  not want a vector region at the start of the ROM.
-
 config ROMSTART
 	hex "Address of the base of system image in ROM"
 	default "0x400"
-- 
1.7.11.7
