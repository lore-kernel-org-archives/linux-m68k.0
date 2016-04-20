From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/23] m68k: do away with ARCH_REQUIRE_GPIOLIB
Date: Wed, 20 Apr 2016 10:58:07 +0200
Message-ID: <1461142701-21096-10-git-send-email-linus.walleij__15155.7067213163$1461142761$gmane$org@linaro.org>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Michael=20B=C3=BCsch?= <m@bues.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Replace "select ARCH_REQUIRE_GPIOLIB" with "select GPIOLIB"
as this can now be selected directly.

Cc: Michael B=C3=BCsch <m@bues.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Various arch maintainers:

either ACK this and I will merge it into the GPIO tree for v4.7
anticipating no clashes, or you wait until I have the enabling patch
upstream (patch 1 in this series, removing deps on
ARCH_[WANTS_OPTIONAL|REQUIRES]_GPIOLIB), and you will be able to
merge it to your arch trees yourselves for late v4.7
(post GPIO tree merge) or for v4.8.

You can also ask me for an immutable branch if you prefer that, I
will put the enabling patch on a branch and the patch for your arch
on top and ask you to pull it.

Select your option from the menu, silence probably means I will
merge it to the GPIO tree. Unless you are X86 or ARM in which case
I will be cautious.
---
 arch/m68k/Kconfig.cpu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 0dfcf1281e9c..c1beb5ae181f 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -22,11 +22,11 @@ config M68KCLASSIC
=20
 config COLDFIRE
 	bool "Coldfire CPU family support"
-	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
+	select GPIOLIB
 	select HAVE_CLK
=20
 endchoice
--=20
2.4.11
