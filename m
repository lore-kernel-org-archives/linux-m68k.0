From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Mon, 26 May 2014 14:30:32 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405261416530.4170@nippy.intranet>
References: <20140411052757.888960081@telegraphics.com.au> <20140411052759.169790206@telegraphics.com.au> <CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com> <alpine.LNX.2.00.1405252030460.18784@nippy.intranet>
 <CAOmrzk+iOMyv5WtTeqcZkWZsqaXSAfSMcCAMVUJqRNdnyxKq9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:49572 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbaEZEbh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 00:31:37 -0400
In-Reply-To: <CAOmrzk+iOMyv5WtTeqcZkWZsqaXSAfSMcCAMVUJqRNdnyxKq9g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 26 May 2014, Michael Schmitz wrote:

> On Sun, May 25, 2014 at 10:37 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> 
> >
> > diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
> > index 3ab329b..b210a29 100644
> > --- a/arch/m68k/kernel/head.S
> > +++ b/arch/m68k/kernel/head.S
> > @@ -2752,7 +2752,7 @@ L(scc_initable_mac):
> >  #ifdef CONFIG_ATARI
> >  /* #define USE_PRINTER */
> >  /* #define USE_SCC_B */
> > -/* #define USE_SCC_A */
> > +#define USE_SCC_A
> >  #define USE_MFP
> >
> >  #if defined(USE_SCC_A) || defined(USE_SCC_B)
> >
> 
> Does it even work if both USE_SCC_A and USE_MFP are defined? I've only
> ever had defined one or the other.

Right, you can't use both. The logic throughout head.S seems to be 
consistent --

#if defined(USE_PRINTER)
        ...
#elif defined(USE_SCC_A) || defined(USE_SCC_B)
        ...
#elif defined(USE_MFP)
        ...
#endif

> 
> Would not object to making that change too, if it happens to work OK.

Disabling the MFP output might not be desirable, so I'm not actually 
proposing that change should be merged.

> More to test, sigh.

I'm sorry for sending untested patches but I didn't really expect anyone 
to test this. It amounts to a bug fix in dead code and probably doesn't 
need any more testing: it's mostly copied from the Mac SCC code, which has 
been tested already.

-- 
