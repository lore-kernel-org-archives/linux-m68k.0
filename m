From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Tue, 20 May 2014 23:01:03 +0200
Message-ID: <1400619663.4912.69.camel@x220>
References: <1400614121.4912.58.camel@x220>
	 <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com>
	 <201405201350.35661.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201405201350.35661.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tue, 2014-05-20 at 13:50 -0700, Steven King wrote:
> At this point, they're pretty much superfluous so if someone were to
> submit a patch removing them, they would not get any objections from
> me.

Just to be clear: you mean the checks for these two macros (and the code
hidden behind them), don't you?


Paul Bolle
