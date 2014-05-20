From: Steven King <sfking@fdwdc.com>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Tue, 20 May 2014 13:50:35 -0700
Message-ID: <201405201350.35661.sfking@fdwdc.com>
References: <1400614121.4912.58.camel@x220> <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tuesday 20 May 2014 1:19:26 pm Geert Uytterhoeven wrote:
> Hi Paul,
> 
> On Tue, May 20, 2014 at 9:28 PM, Paul Bolle <pebolle@tiscali.nl> wrote:
> > In v3.6 both a check for CONFIG_I2C_COLDFIRE and two checks for
> > CONFIG_RTC_DRV_M5441x were added to the code for the coldfire platform
> > (in m525x.c and in m5441x.c respectively). Neither of these macros can
> > be matched to a Kconfig symbol.
> >
> > Is a series that adds these Kconfig symbols pending?
> 
> For the former, Steven King (cc) submitted patches in 2010 and 2012.
> For the latter, he submitted patches in 2012.
> 
> Seems like they were never integrated...

Indeed.

At this point, they're pretty much superfluous so if someone were to submit a patch removing them, they would not get any objections from me.
