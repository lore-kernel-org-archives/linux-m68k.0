From: sfking@fdwdc.com
Subject: [PATCH 2/4] setting the gpio data direction register to output doesn't dependent upon the value to output!
Date: Wed, 21 May 2014 16:00:31 -0700
Message-ID: <1400713233-9155-3-git-send-email-sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.bf1.yahoo.com ([98.139.221.63]:43768 "HELO
	smtp104.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752550AbaEUXAp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 19:00:45 -0400
In-Reply-To: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: greg@uclinux.org
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, Steven King <sfking@fdwdc.com>

From: Steven King <sfking@fdwdc.com>

---
 arch/m68k/platform/coldfire/gpio.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/platform/coldfire/gpio.c b/arch/m68k/platform/coldfire/gpio.c
index ab9ac41..e168886 100644
--- a/arch/m68k/platform/coldfire/gpio.c
+++ b/arch/m68k/platform/coldfire/gpio.c
@@ -76,10 +76,7 @@ int __mcfgpio_direction_output(unsigned gpio, int value)
 
 	local_irq_save(flags);
 	data = mcfgpio_read(__mcfgpio_pddr(gpio));
-	if (value)
-		data |= mcfgpio_bit(gpio);
-	else
-		data &= mcfgpio_bit(gpio);
+	data |= mcfgpio_bit(gpio);
 	mcfgpio_write(data, __mcfgpio_pddr(gpio));
 
 	/* now set the data to output */
-- 
1.7.10.4
