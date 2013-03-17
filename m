From: Alexandre Courbot <gnurou@gmail.com>
Subject: [RFC 3/3] blackfin: force use of gpiolib
Date: Sun, 17 Mar 2013 22:42:03 +0900
Message-ID: <1363527723-32713-4-git-send-email-acourbot__26942.7090105184$1363527961$gmane$org@nvidia.com>
References: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363527723-32713-1-git-send-email-acourbot@nvidia.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

Set the GENERIC_GPIO option to false by default and force the use of
gpiolib instead of making it optional, to prepare for the removal of
GENERIC_GPIO.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/blackfin/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
index c3f2e0b..20e203a 100644
--- a/arch/blackfin/Kconfig
+++ b/arch/blackfin/Kconfig
@@ -31,7 +31,7 @@ config BLACKFIN
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select ARCH_HAVE_CUSTOM_GPIO_H
-	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select ARCH_REQUIRE_GPIOLIB
 	select HAVE_UID16
 	select VIRT_TO_BUS
 	select ARCH_WANT_IPC_PARSE_VERSION
@@ -56,7 +56,7 @@ config ZONE_DMA
 	def_bool y
 
 config GENERIC_GPIO
-	def_bool y
+	def_bool n
 
 config FORCE_MAX_ZONEORDER
 	int
-- 
1.8.2
