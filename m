From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] m68k: Fall back to __gpio_to_irq() for non-arch GPIOs
Date: Wed, 26 Oct 2011 09:51:55 +0200
Message-ID: <1319615515-3286-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

gpiolib provides __gpio_to_irq() to map gpiolib gpios to interrupts - hook
that up on m68k.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/m68k/include/asm/gpio.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
index b204683..00d0071 100644
--- a/arch/m68k/include/asm/gpio.h
+++ b/arch/m68k/include/asm/gpio.h
@@ -225,7 +225,8 @@ static inline void gpio_set_value(unsigned gpio, int value)
 
 static inline int gpio_to_irq(unsigned gpio)
 {
-	return (gpio < MCFGPIO_IRQ_MAX) ? gpio + MCFGPIO_IRQ_VECBASE : -EINVAL;
+	return (gpio < MCFGPIO_IRQ_MAX) ? gpio + MCFGPIO_IRQ_VECBASE
+		: __gpio_to_irq(gpio);
 }
 
 static inline int irq_to_gpio(unsigned irq)
-- 
1.7.6.3
