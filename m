From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC v3 02/24] m68k/atari: Move Atari-specific code out of
 drivers/char/nvram.c
Date: Thu, 2 Jul 2015 12:00:01 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1507021154040.15903@nippy.intranet>
References: <20150628014159.732792697@telegraphics.com.au> <20150628014200.233057221@telegraphics.com.au> <CAMuHMdUY2pM4N3Uddo2TecNo2BL4t-7VVDY=2wrgsqomVnCXFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34568 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753996AbbGBCAY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Jul 2015 22:00:24 -0400
In-Reply-To: <CAMuHMdUY2pM4N3Uddo2TecNo2BL4t-7VVDY=2wrgsqomVnCXFg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


On Mon, 29 Jun 2015, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Sun, Jun 28, 2015 at 3:42 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > Change the vmode calculation from logical OR to bitwise OR, since it 
> > is obviously wrong.
> 
> Ideally, that should be a separate patch we can put on the fast track.

If you will fast track a portion of this patch series, that's great. I'll 
send a separate patch. (However, IMHO, that portion which would ideally be 
fast tracked is a matter of opinion.)

-- 

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
