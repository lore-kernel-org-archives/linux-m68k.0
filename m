From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 0/4] m68knommu: Coldfire gpio fixes and updates.
Date: Wed, 21 May 2014 19:00:14 -0700
Message-ID: <201405211900.14492.sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com> <537D4FC4.4070406@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp107.biz.mail.ne1.yahoo.com ([98.138.207.14]:35359 "HELO
	smtp107.biz.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750760AbaEVCG6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 22:06:58 -0400
In-Reply-To: <537D4FC4.4070406@westnet.com.au>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: greg@uclinux.org, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Wednesday 21 May 2014 6:15:48 pm Greg Ungerer wrote:
> Hi Steven,
> 
> On 22/05/14 09:00, sfking@fdwdc.com wrote:
> > From: Steven King <sfking@fdwdc.com>
> > 
> > I had these queued up, forgot to send.  This fixes a heinous bug in
> > mcfgpio_direction_output, adds code to enable gpio_to_irq functionality,
> > removes some of the global namespace pollution in gpio.c and adds gpio support
> > for the m54xx.  Tested on m5253, m5282, m5484 and m54418; compile tested only
> > for the rest of the currenly supported coldfire targets.
> 
> All looks good to me. Can I add your:
> 
>   Singed-off-by: Steven King <sfking@fdwdc.com>

D'oh!  Sure, you can do that ;)
