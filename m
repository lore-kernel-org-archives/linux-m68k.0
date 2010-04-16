From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] mac8390: fix pr_info() calls, was Re: another cleanup
 patch gone wrong
Date: Fri, 16 Apr 2010 13:59:14 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1004161358290.271@localhost>
References: <alpine.OSX.2.00.1004161214270.271@localhost>  <20100415.200113.215578006.davem@davemloft.net>  <alpine.OSX.2.00.1004161323340.271@localhost> <1271390080.2298.25.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:37933 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758279Ab0DPD7S (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Apr 2010 23:59:18 -0400
In-Reply-To: <1271390080.2298.25.camel@Joe-Laptop.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, p_gortmaker@yahoo.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org


On Thu, 15 Apr 2010, Joe Perches wrote:

> >  	return 0;
> >  }
> > @@ -660,7 +660,7 @@
> >  {
> >  	ei_status.txing = 0;
> >  	if (ei_debug > 1)
> > -		pr_info("reset not supported\n");
> > +		pr_debug("reset not supported\n");
> 
> You'll need to add
> #define DEBUG
> for this to print.
> 
> > -		pr_info("Need to reset the NS8390 t=%lu...", jiffies);
> > +		pr_debug("Need to reset the NS8390 t=%lu...", jiffies);
> 
> This also now doesn't print.
> 

Oops. Thanks for spotting that. I'll resend.

Finn

> cheers, Joe
