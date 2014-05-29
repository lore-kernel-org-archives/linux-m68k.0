From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 0/9] m68knommu: use ColdFire DMA timer
Date: Thu, 29 May 2014 16:22:11 -0700
Message-ID: <201405291622.11925.sfking@fdwdc.com>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp104.biz.mail.gq1.yahoo.com ([98.137.12.179]:45718 "HELO
	smtp104.biz.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752978AbaE2XWP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 29 May 2014 19:22:15 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, uclinux-dev@uclinux.org

On Tuesday 27 May 2014 5:49:40 pm gerg@uclinux.org wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Most of the modern ColdFire family members contain the DMA timer hardware
> module. Build the support code for it and use it on those that do. We can
> use it as an accurate time source.
>
> I don't have test platforms based on all of these ColdFire types, it would
> be really helpful if anyone that has any of these can test these changes.
> It build tests fine on all these types, and it works on 520x and 527x
> based platforms.
>
> These changes are (neccessarily) on top of my recent patch series titled
> "clean up timer code on the ColdFire 53xx".
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
>  arch/m68k/include/asm/m520xsim.h        |    8 ++++++++
>  arch/m68k/include/asm/m523xsim.h        |    8 ++++++++
>  arch/m68k/include/asm/m527xsim.h        |    8 ++++++++
>  arch/m68k/include/asm/m528xsim.h        |    8 ++++++++
>  arch/m68k/include/asm/m53xxsim.h        |   10 +++++-----
>  arch/m68k/include/asm/m5441xsim.h       |    8 ++++++++
>  arch/m68k/platform/coldfire/Makefile    |   10 +++++-----
>  arch/m68k/platform/coldfire/dma_timer.c |   24 +++++++++++++-----------
>  8 files changed, 63 insertions(+), 21 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi Greg,

I was able to to test this on 528x and 5441x and didnt have problems, so you 
can add my Acked-by if you want.
