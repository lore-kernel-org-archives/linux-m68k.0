From: Alexandre Courbot <gnurou@gmail.com>
Subject: [RFC 1/3] mips: pnx833x: remove requirement for GENERIC_GPIO
Date: Sun, 17 Mar 2013 22:42:01 +0900
Message-ID: <1363527723-32713-2-git-send-email-acourbot@nvidia.com>
References: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

pnx833x does not seem to use the generic gpio API.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 50cded3..ff0e563 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1107,7 +1107,6 @@ config SOC_PNX833X
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_BIG_ENDIAN
-	select GENERIC_GPIO
 	select CPU_MIPSR2_IRQ_VI
 
 config SOC_PNX8335
-- 
1.8.2
