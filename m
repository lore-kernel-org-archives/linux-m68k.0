From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC v4 00/25] Re-use nvram module
Date: Tue, 14 Jul 2015 17:57:35 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1507141045020.24654@nippy.intranet>
References: <20150712102527.356151908@telegraphics.com.au> <CAMuHMdX+5XHWf3sVqAnF_mioS1zZmxQXurEeMGMM3OKa9acxhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34244 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbbGNH54 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jul 2015 03:57:56 -0400
In-Reply-To: <CAMuHMdX+5XHWf3sVqAnF_mioS1zZmxQXurEeMGMM3OKa9acxhA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>


On Mon, 13 Jul 2015, Geert Uytterhoeven wrote:

> 
> How are we gonna merge this?

I think the series would have to be merged almost whole. For the most 
part, no maintainer can merge any of this without ACKs from others:

- to improve code re-use by replacing an API shared by arch-specific code 
  and a variety of drivers means getting ACKs from everyone concerned (or 
  the old API can't be removed).

- to move arch-specific code out of a generic driver means getting ACKs 
  from both arch maintainer and driver maintainer. Some of this 
  arch-specific code is shared by m68k, x86 and arm (but not powerpc) and 
  this complicates things.

- to adopt a new Kconfig convention in a uniform and consistent way seems 
  to require simultaneous changes in various drivers and architectures.

> Have you looked into the dependencies?

What I saw was not pretty.

> Are there (large) parts we can merge in parallel?

Not AFAICT. Two patches could be cherry picked, that might make sense to 
merge by themselves. Those are patches 2 and 12. Either or both could be 
reviewed and merged by the char device maintainers.

There are a couple of other small patches that could probably be cherry 
picked without breaking anything but these changes are not justified 
except by subsequent patches.

> 
> Thanks again!

No worries.

-- 

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
