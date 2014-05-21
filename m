From: sfking@fdwdc.com
Subject: [PATCH 0/4] m68knommu: Coldfire gpio fixes and updates.
Date: Wed, 21 May 2014 16:00:29 -0700
Message-ID: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.bf1.yahoo.com ([98.139.221.63]:43758 "HELO
	smtp104.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752139AbaEUXAn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 19:00:43 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: greg@uclinux.org
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org, Steven King <sfking@fdwdc.com>

From: Steven King <sfking@fdwdc.com>


I had these queued up, forgot to send.  This fixes a heinous bug in
mcfgpio_direction_output, adds code to enable gpio_to_irq functionality,
removes some of the global namespace pollution in gpio.c and adds gpio support
for the m54xx.  Tested on m5253, m5282, m5484 and m54418; compile tested only
for the rest of the currenly supported coldfire targets.


Steven King (4):
  add to_irq function so we can map gpios to external interrupts.
  setting the gpio data direction register to output doesn't dependent
    upon the value to output!
  Make everything thats not exported, static.
  Implement gpio support for m54xx.

 arch/m68k/include/asm/m54xxsim.h   |   12 +++++++++---
 arch/m68k/include/asm/mcfgpio.h    |   12 ++++++++----
 arch/m68k/platform/coldfire/gpio.c |   34 +++++++++++++++++++++++-----------
 3 files changed, 40 insertions(+), 18 deletions(-)

-- 
1.7.10.4
