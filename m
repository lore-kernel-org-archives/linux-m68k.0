From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 1 Apr 2014 01:52:16 +0200
Message-ID: <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
 <8761mvl3jb.fsf@igel.home>
 <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
 <87a9c63x1c.fsf@igel.home>
 <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
 <87txae2dt4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:48958
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751081AbaCaX7u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 31 Mar 2014 19:59:50 -0400
Content-Disposition: inline
In-Reply-To: <87txae2dt4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, debian m68k <debian-68k@lists.debian.org>

Andreas, 

> Don't top post!

Sorry - gurgle made me do it :')

> 
> Michael Schmitz <schmitzmic@gmail.com> writes:
> 
> > do we know the size of the first memory chunk early enough in head.S?
> > Maybe it's time to increase INIT_MAPPED_SIZE at least in cases where
> > we know that there's more than 4 MB in the first memchunk ...
> 
> How do you know?  You would have to reimplement the check paging_init
> does.

I see - as a heuristic, we can probably assume that the first memchunk is
the relevant one, and especially in the case of FastRAM, also the larger
one.
Does this hold for Amiga/Mac/VME as well? 

Cheers,

	Michael

> 
> Andreas.
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-68k-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> Archive: https://lists.debian.org/87txae2dt4.fsf@igel.home
