From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Wed, 21 May 2014 17:55:33 +0200
Message-ID: <1400687733.1122.4.camel@x220>
References: <1400614121.4912.58.camel@x220>
	 <CAMuHMdVbRJOO1fvMDOeVH1j5HiDY=FMA35us0u7oP2jbYS=NAQ@mail.gmail.com>
	 <201405201350.35661.sfking@fdwdc.com>
	 <537CCA66.1050502@open.eurogiciel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <537CCA66.1050502@open.eurogiciel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Steven King <sfking@fdwdc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Gilles DOFFE <gdoffe.pro@gmail.com>, Baptiste Durand <baptiste.durand@open.eurogiciel.org>

Yannick,

On Wed, 2014-05-21 at 17:46 +0200, Yannick GICQUEL wrote:
> The MCF5441x support is quite a hot topic today for our company.
> This Soc family is seducing some of our customers, especially for it's 
> long term support from Freescale.
> 
> We have worked on this target since past few weeks, using a Tower Kit 
> hardware and JTag, and just about to prepare a full integration of this 
> device on recent kernel release.
> As a part of the open-source department, we have also planned to deliver 
> this work to the community and propose some patches to refresh this 
> target support.
> 
> Some informations we observe on this target to be refreshed:
>   - NAND controller needs to be integrated again,
>   - UART controller as well,
> 
> Also :
>   - This chip contains a MMU and can be unlink from the !MMU dependency
> 
> This is for the big lines, if the community is ok for a patch receipt, 
> some other feature can be also pushed.
> BTW, what about this patches proposal ? Is there some time slot for 
> patch proposal ?

The patch discussed (but not yet submitted) would remove all code
currently hidden behind
    #if IS_ENABLED(CONFIG_RTC_DRV_M5441x)

in the kernel tree. Now, I'm guessing the (new) code you're working on
doesn't care about CONFIG_RTC_DRV_M5441x. So chances are you could not
care less if that code gets removed.


Paul Bolle
