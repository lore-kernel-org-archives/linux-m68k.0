From: Steven King <sfking@fdwdc.com>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Tue, 20 May 2014 14:16:28 -0700
Message-ID: <201405201416.29118.sfking@fdwdc.com>
References: <1400614121.4912.58.camel@x220> <201405201350.35661.sfking@fdwdc.com> <1400619663.4912.69.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp103.biz.mail.bf1.yahoo.com ([98.139.221.62]:27527 "HELO
	smtp103.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750716AbaETVQd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 20 May 2014 17:16:33 -0400
In-Reply-To: <1400619663.4912.69.camel@x220>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Paul Bolle <pebolle@tiscali.nl>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tuesday 20 May 2014 2:01:03 pm Paul Bolle wrote:
> On Tue, 2014-05-20 at 13:50 -0700, Steven King wrote:
> > At this point, they're pretty much superfluous so if someone were to
> > submit a patch removing them, they would not get any objections from
> > me.
> 
> Just to be clear: you mean the checks for these two macros (and the code
> hidden behind them), don't you?

Yes.
