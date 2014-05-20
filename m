From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Tue, 20 May 2014 22:19:26 +0200
Message-ID: <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com>
References: <1400614121.4912.58.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1400614121.4912.58.camel@x220>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Steven King <sfking@fdwdc.com>

Hi Paul,

On Tue, May 20, 2014 at 9:28 PM, Paul Bolle <pebolle@tiscali.nl> wrote:
> In v3.6 both a check for CONFIG_I2C_COLDFIRE and two checks for
> CONFIG_RTC_DRV_M5441x were added to the code for the coldfire platform
> (in m525x.c and in m5441x.c respectively). Neither of these macros can
> be matched to a Kconfig symbol.
>
> Is a series that adds these Kconfig symbols pending?

For the former, Steven King (cc) submitted patches in 2010 and 2012.
For the latter, he submitted patches in 2012.

Seems like they were never integrated...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
