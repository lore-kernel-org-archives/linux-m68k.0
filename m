From: Alexandre Courbot <gnurou@gmail.com>
Subject: [RFC 2/3] m68k: coldfire: use gpiolib
Date: Sun, 17 Mar 2013 22:42:02 +0900
Message-ID: <1363527723-32713-3-git-send-email-acourbot@nvidia.com>
References: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

Force use of gpiolib for Coldfire, as a step towards the deprecation of
GENERIC_GPIO.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/m68k/Kconfig.cpu | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index b1cfff8..d266787 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -22,8 +22,7 @@ config M68KCLASSIC
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
-	select GENERIC_GPIO
-	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
-- 
1.8.2
