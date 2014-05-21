From: sfking@fdwdc.com
Subject: [PATCH 1/4] add to_irq function so we can map gpios to external interrupts.
Date: Wed, 21 May 2014 16:00:30 -0700
Message-ID: <1400713233-9155-2-git-send-email-sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.bf1.yahoo.com ([98.139.221.63]:43763 "HELO
	smtp104.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752545AbaEUXAo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 19:00:44 -0400
In-Reply-To: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: greg@uclinux.org
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, Steven King <sfking@fdwdc.com>

From: Steven King <sfking@fdwdc.com>

---
 arch/m68k/platform/coldfire/gpio.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/m68k/platform/coldfire/gpio.c b/arch/m68k/platform/coldfire/gpio.c
index 9cd2b5c..ab9ac41 100644
--- a/arch/m68k/platform/coldfire/gpio.c
+++ b/arch/m68k/platform/coldfire/gpio.c
@@ -147,6 +147,18 @@ void mcfgpio_free(struct gpio_chip *chip, unsigned offset)
 	__mcfgpio_free(offset);
 }
 
+int mcfgpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+#if defined(MCFGPIO_IRQ_MIN)
+	if ((offset >= MCFGPIO_IRQ_MIN) && (offset < MCFGPIO_IRQ_MAX))
+#else
+	if (offset < MCFGPIO_IRQ_MAX)
+#endif
+		return MCFGPIO_IRQ_VECBASE + offset;
+	else
+		return -EINVAL;
+}
+
 struct bus_type mcfgpio_subsys = {
 	.name		= "gpio",
 	.dev_name	= "gpio",
@@ -160,6 +172,7 @@ static struct gpio_chip mcfgpio_chip = {
 	.direction_output	= mcfgpio_direction_output,
 	.get			= mcfgpio_get_value,
 	.set			= mcfgpio_set_value,
+	.to_irq			= mcfgpio_to_irq,
 	.base			= 0,
 	.ngpio			= MCFGPIO_PIN_MAX,
 };
-- 
1.7.10.4
