From: <gerg@snapgear.com>
Subject: [PATCH 12/22] m68knommu: make duplicated ColdFire GPIO init code common for all
Date: Thu, 26 Apr 2012 10:25:52 +1000
Message-ID: <1335399962-10308-13-git-send-email-gerg@snapgear.com>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25074 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670Ab2DZA1N (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 Apr 2012 20:27:13 -0400
In-Reply-To: <1335399962-10308-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The code that adds each ColdFire platforms GPIO signals is duplicated in
each platforms specific code. Remove it from each platforms code and put
a single version in the existing ColdFire gpio subsystem init code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/mcfgpio.h    |    3 +++
 arch/m68k/platform/5206/gpio.c     |   12 ++----------
 arch/m68k/platform/520x/gpio.c     |   12 ++----------
 arch/m68k/platform/523x/gpio.c     |   12 ++----------
 arch/m68k/platform/5249/gpio.c     |   12 ++----------
 arch/m68k/platform/5272/gpio.c     |   12 ++----------
 arch/m68k/platform/527x/gpio.c     |   12 ++----------
 arch/m68k/platform/528x/gpio.c     |   12 ++----------
 arch/m68k/platform/5307/gpio.c     |   12 ++----------
 arch/m68k/platform/532x/gpio.c     |   12 ++----------
 arch/m68k/platform/5407/gpio.c     |   12 ++----------
 arch/m68k/platform/coldfire/gpio.c |    4 ++++
 12 files changed, 27 insertions(+), 100 deletions(-)

diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 148f56a..f0e3938 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -29,6 +29,9 @@ struct mcf_gpio_chip {
 	const u8 *gpio_to_pinmux;
 };
 
+extern struct mcf_gpio_chip mcf_gpio_chips[];
+extern unsigned int mcf_gpio_chips_size;
+
 int mcf_gpio_direction_input(struct gpio_chip *, unsigned);
 int mcf_gpio_get_value(struct gpio_chip *, unsigned);
 int mcf_gpio_direction_output(struct gpio_chip *, unsigned, int);
diff --git a/arch/m68k/platform/5206/gpio.c b/arch/m68k/platform/5206/gpio.c
index 200a7ac..a652f8e 100644
--- a/arch/m68k/platform/5206/gpio.c
+++ b/arch/m68k/platform/5206/gpio.c
@@ -20,16 +20,8 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PP, 0, 8, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/520x/gpio.c b/arch/m68k/platform/520x/gpio.c
index 96b3685..49387c3 100644
--- a/arch/m68k/platform/520x/gpio.c
+++ b/arch/m68k/platform/520x/gpio.c
@@ -20,7 +20,7 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
 	MCFGPF(CS, 9, 3),
 	MCFGPF(FECI2C, 16, 4),
@@ -31,12 +31,4 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPF(FECL, 56, 8),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/523x/gpio.c b/arch/m68k/platform/523x/gpio.c
index 8e6e30e..07806eb 100644
--- a/arch/m68k/platform/523x/gpio.c
+++ b/arch/m68k/platform/523x/gpio.c
@@ -20,7 +20,7 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
 	MCFGPF(ADDR, 13, 3),
 	MCFGPF(DATAH, 16, 8),
@@ -37,12 +37,4 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPF(ETPU, 104, 3),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/5249/gpio.c b/arch/m68k/platform/5249/gpio.c
index 775d618..422e45f 100644
--- a/arch/m68k/platform/5249/gpio.c
+++ b/arch/m68k/platform/5249/gpio.c
@@ -20,17 +20,9 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(GPIO0, 0, 32, MCFSIM2_GPIOENABLE, MCFSIM2_GPIOWRITE, MCFSIM2_GPIOREAD),
 	MCFGPS(GPIO1, 32, 32, MCFSIM2_GPIO1ENABLE, MCFSIM2_GPIO1WRITE, MCFSIM2_GPIO1READ),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/5272/gpio.c b/arch/m68k/platform/5272/gpio.c
index 91358b8..c029dab 100644
--- a/arch/m68k/platform/5272/gpio.c
+++ b/arch/m68k/platform/5272/gpio.c
@@ -20,18 +20,10 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PA,  0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
 	MCFGPS(PB, 16, 16, MCFSIM_PBDDR, MCFSIM_PBDAT, MCFSIM_PBDAT),
 	MCFGPS(Pc, 32, 16, MCFSIM_PCDDR, MCFSIM_PCDAT, MCFSIM_PCDAT),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/527x/gpio.c b/arch/m68k/platform/527x/gpio.c
index b612a63..1c8633b 100644
--- a/arch/m68k/platform/527x/gpio.c
+++ b/arch/m68k/platform/527x/gpio.c
@@ -20,7 +20,7 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 #if defined(CONFIG_M5271)
 	MCFGPS(PIRQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
 	MCFGPF(ADDR, 13, 3),
@@ -58,12 +58,4 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 #endif
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/528x/gpio.c b/arch/m68k/platform/528x/gpio.c
index f0e19d6..764c6c8 100644
--- a/arch/m68k/platform/528x/gpio.c
+++ b/arch/m68k/platform/528x/gpio.c
@@ -20,7 +20,7 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(NQ, 1, 7, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
 	MCFGPS(TA, 8, 4, MCFGPTA_GPTDDR, MCFGPTA_GPTPORT, MCFGPTB_GPTPORT),
 	MCFGPS(TB, 16, 4, MCFGPTB_GPTDDR, MCFGPTB_GPTPORT, MCFGPTB_GPTPORT),
@@ -46,12 +46,4 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPF(UA, 176, 4),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/5307/gpio.c b/arch/m68k/platform/5307/gpio.c
index 91d0420..7bbbea7 100644
--- a/arch/m68k/platform/5307/gpio.c
+++ b/arch/m68k/platform/5307/gpio.c
@@ -20,16 +20,8 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PP, 0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/532x/gpio.c b/arch/m68k/platform/532x/gpio.c
index 9454c65..3e1b71d 100644
--- a/arch/m68k/platform/532x/gpio.c
+++ b/arch/m68k/platform/532x/gpio.c
@@ -20,7 +20,7 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PIRQ, 0, 8, MCFEPORT_EPDDR, MCFEPORT_EPDR, MCFEPORT_EPPDR),
 	MCFGPF(FECH, 8, 8),
 	MCFGPF(FECL, 16, 8),
@@ -40,12 +40,4 @@ static struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPF(LCDCTLL, 128, 8),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/5407/gpio.c b/arch/m68k/platform/5407/gpio.c
index 91d0420..7bbbea7 100644
--- a/arch/m68k/platform/5407/gpio.c
+++ b/arch/m68k/platform/5407/gpio.c
@@ -20,16 +20,8 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfgpio.h>
 
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
+struct mcf_gpio_chip mcf_gpio_chips[] = {
 	MCFGPS(PP, 0, 16, MCFSIM_PADDR, MCFSIM_PADAT, MCFSIM_PADAT),
 };
 
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
+unsigned int mcf_gpio_chips_size = ARRAY_SIZE(mcf_gpio_chips);
diff --git a/arch/m68k/platform/coldfire/gpio.c b/arch/m68k/platform/coldfire/gpio.c
index 292a1a5..4c8c424 100644
--- a/arch/m68k/platform/coldfire/gpio.c
+++ b/arch/m68k/platform/coldfire/gpio.c
@@ -122,6 +122,10 @@ struct bus_type mcf_gpio_subsys = {
 
 static int __init mcf_gpio_sysinit(void)
 {
+	unsigned int i = 0;
+
+	while (i < mcf_gpio_chips_size)
+		gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
 	return subsys_system_register(&mcf_gpio_subsys, NULL);
 }
 
-- 
1.7.0.4
