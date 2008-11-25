From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH] MVME16x: add support for EARLY_PRINTK
Date: Tue, 25 Nov 2008 10:58:41 +0100
Message-ID: <1227607121.9242.5.camel@kars.perseus.home>
References: <1227186532.19809.3.camel@kars.perseus.home>
	 <200811250226.54137.zippel@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:36320 "EHLO
	smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752464AbYKYJ6t (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 25 Nov 2008 04:58:49 -0500
In-Reply-To: <200811250226.54137.zippel@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

On di, 2008-11-25 at 02:26 +0100, Roman Zippel wrote:
> On Thursday 20. November 2008, Kars de Jong wrote:
> > diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
> > index f53b6d5..e0283a0 100644
> > --- a/arch/m68k/Kconfig.debug
> > +++ b/arch/m68k/Kconfig.debug
> > @@ -2,4 +2,15 @@ menu "Kernel hacking"
> >
> >  source "lib/Kconfig.debug"
> >
> > +config EARLY_PRINTK
> > +	bool "Early printk" if EMBEDDED
> > +	depends on MVME16x
> > +	default y
> > +	help
> 
> This is really misnamed, the option is mvme specific but the name is rather 
> generic. Depending on the code size you could include the code 
> unconditionally (like we do on other ports).

Defining CONFIG_EARLY_PRINTK used to pull in some generic code, that's
why I named it like that.

I grepped the source for CONFIG_EARLY_PRINTK, it seems the generic code
is gone.

So I think I'll just define it unconditionally, and only on MVME16x it
will actually include some extra code. Is that OK with you?


Kind regards, Kars.


