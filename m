From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] mac8390: fix pr_info() calls and change return code
Date: Fri, 16 Apr 2010 23:57:34 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1004162340370.271@localhost>
References: <alpine.OSX.2.00.1004161214270.271@localhost>  <20100415.200113.215578006.davem@davemloft.net>  <alpine.OSX.2.00.1004161323340.271@localhost>  <alpine.OSX.2.00.1004161403160.271@localhost> <1271392454.2298.37.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:45362 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932157Ab0DPN5i (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Apr 2010 09:57:38 -0400
In-Reply-To: <1271392454.2298.37.camel@Joe-Laptop.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, p_gortmaker@yahoo.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org


On Thu, 15 Apr 2010, Joe Perches wrote:

> ...Why is it better to use -EBUSY?

Nubus slots are geographically addressed and their irqs are equally 
inflexible. -EAGAIN is misleading because retrying will not help fix 
whatever bug caused the irq to unavailable.

> ...It'd be better to prefix this with the driver name
> or use something like netdev_dbg with #define DEBUG
> otherwise it's "huh? what device emits this message?"
> when reading the logs.
> 
> Something like:
> 	printk(KERN_DEBUG pr_fmt("reset not supported\n"));

Thanks for the suggestion. I'll resend again.

> ...unnecessary conversion.

I guess some prefer consistency, some prefer symmetry.

Finn
