From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sat, 25 May 2013 18:06:43 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305251805100.4391@nippy.intranet>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com> <alpine.LNX.2.00.1305241705020.3487@nippy.intranet> <CAMuHMdX5hqLUXqUZqhUqB7ErR5sR_-7FNxC2i6M__h0_L9M7Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41156 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923Ab3EYIGt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 May 2013 04:06:49 -0400
In-Reply-To: <CAMuHMdX5hqLUXqUZqhUqB7ErR5sR_-7FNxC2i6M__h0_L9M7Wg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>


On Fri, 24 May 2013, Geert Uytterhoeven wrote:

> On Fri, May 24, 2013 at 9:27 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> >> CONFIG_ADB_MACIISI : . . . . . y . . . . . y
> >
> > This is broken. It should be disabled because it will crash (unless it 
> > has fixed itself ;-)
> 
> Will disable. If this is really broken, shall I mark ik BROKEN in 
> Kconfig?

Sure. It was a long time ago that I tried it, but I have no reason to 
believe that it is no longer broken.

Finn
