From: Steven King <sfking@fdwdc.com>
Subject: Re: m68knommu: CONFIG_I2C_COLDFIRE and CONFIG_RTC_DRV_M5441x
Date: Wed, 21 May 2014 14:47:41 -0700
Message-ID: <201405211447.41604.sfking@fdwdc.com>
References: <1400614121.4912.58.camel@x220> <201405201350.35661.sfking@fdwdc.com> <537CCA66.1050502@open.eurogiciel.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <537CCA66.1050502@open.eurogiciel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Paul Bolle <pebolle@tiscali.nl>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Gilles DOFFE <gdoffe.pro@gmail.com>, Baptiste Durand <baptiste.durand@open.eurogiciel.org>

On Wednesday 21 May 2014 8:46:46 am Yannick GICQUEL wrote:
> Hi all,
> 
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
> 

That interesting.  As Paul mentioned the proposed patch would remove the unused code supporting the RTC on the m5441x, however, I do have an updated (v3.15-rc5) version of the RTC driver as well as updated versions of the 1wire driver that I had submiited a couple of years ago, also a much simplier version of the patches to enable the enet-fec that I had posted previously.  I've also been looking at getting the eDMA working with an eye on adding support for the dspi.

As it didnt seem there was much interest in the platform I hadn't felt any need to try to get these merged, but if there is actually anyone besides myself interested in the m5441x I'd be a bit more motivated.
