From: sfking@fdwdc.com
Subject: [PATCH 3/4] Make everything thats not exported, static.
Date: Wed, 21 May 2014 16:00:32 -0700
Message-ID: <1400713233-9155-4-git-send-email-sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.bf1.yahoo.com ([98.139.221.63]:43772 "HELO
	smtp104.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752139AbaEUXAp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 19:00:45 -0400
In-Reply-To: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: greg@uclinux.org
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, Steven King <sfking@fdwdc.com>

From: Steven King <sfking@fdwdc.com>

---
 arch/m68k/platform/coldfire/gpio.c |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/platform/coldfire/gpio.c b/arch/m68k/platform/coldfire/gpio.c
index e168886..e7e4286 100644
--- a/arch/m68k/platform/coldfire/gpio.c
+++ b/arch/m68k/platform/coldfire/gpio.c
@@ -114,37 +114,39 @@ EXPORT_SYMBOL(__mcfgpio_free);
 
 #ifdef CONFIG_GPIOLIB
 
-int mcfgpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int mcfgpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	return __mcfgpio_direction_input(offset);
 }
 
-int mcfgpio_get_value(struct gpio_chip *chip, unsigned offset)
+static int mcfgpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
 	return __mcfgpio_get_value(offset);
 }
 
-int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
+static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
+				    int value)
 {
 	return __mcfgpio_direction_output(offset, value);
 }
 
-void mcfgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
+static void mcfgpio_set_value(struct gpio_chip *chip, unsigned offset,
+			      int value)
 {
 	__mcfgpio_set_value(offset, value);
 }
 
-int mcfgpio_request(struct gpio_chip *chip, unsigned offset)
+static int mcfgpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	return __mcfgpio_request(offset);
 }
 
-void mcfgpio_free(struct gpio_chip *chip, unsigned offset)
+static void mcfgpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	__mcfgpio_free(offset);
 }
 
-int mcfgpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int mcfgpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 #if defined(MCFGPIO_IRQ_MIN)
 	if ((offset >= MCFGPIO_IRQ_MIN) && (offset < MCFGPIO_IRQ_MAX))
@@ -156,7 +158,7 @@ int mcfgpio_to_irq(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 }
 
-struct bus_type mcfgpio_subsys = {
+static struct bus_type mcfgpio_subsys = {
 	.name		= "gpio",
 	.dev_name	= "gpio",
 };
-- 
1.7.10.4
