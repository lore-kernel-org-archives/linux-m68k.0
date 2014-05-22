From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 0/4] m68knommu: Coldfire gpio fixes and updates.
Date: Thu, 22 May 2014 11:15:48 +1000
Message-ID: <537D4FC4.4070406@westnet.com.au>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out3.external.iinet.net.au ([203.59.1.219]:37534
	"EHLO icp-osb-irony-out3.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751524AbaEVB3J (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 21:29:09 -0400
In-Reply-To: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfking@fdwdc.com
Cc: greg@uclinux.org, geert@linux-m68k.org, linux-m68k@vger.kernel.org

Hi Steven,

On 22/05/14 09:00, sfking@fdwdc.com wrote:
> From: Steven King <sfking@fdwdc.com>
> 
> I had these queued up, forgot to send.  This fixes a heinous bug in
> mcfgpio_direction_output, adds code to enable gpio_to_irq functionality,
> removes some of the global namespace pollution in gpio.c and adds gpio support
> for the m54xx.  Tested on m5253, m5282, m5484 and m54418; compile tested only
> for the rest of the currenly supported coldfire targets.

All looks good to me. Can I add your:

  Singed-off-by: Steven King <sfking@fdwdc.com>

Thanks
Greg


> Steven King (4):
>   add to_irq function so we can map gpios to external interrupts.
>   setting the gpio data direction register to output doesn't dependent
>     upon the value to output!
>   Make everything thats not exported, static.
>   Implement gpio support for m54xx.
> 
>  arch/m68k/include/asm/m54xxsim.h   |   12 +++++++++---
>  arch/m68k/include/asm/mcfgpio.h    |   12 ++++++++----
>  arch/m68k/platform/coldfire/gpio.c |   34 +++++++++++++++++++++++-----------
>  3 files changed, 40 insertions(+), 18 deletions(-)
> 
