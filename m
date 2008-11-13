From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Fri, 14 Nov 2008 10:01:43 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811140959120.18881@loopy.telegraphics.com.au>
References: <OFF2D16A54.2029BAD8-ONCA2574FD.0079BF46-CA2574FE.000FBF52@csc.com>
  <Pine.LNX.4.64.0811111055100.19341@anakin> <1226611986.4267.16.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:36645 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbYKMXBq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Nov 2008 18:01:46 -0500
In-Reply-To: <1226611986.4267.16.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen N Chivers <schivers@csc.com.au>, Roman Zippel <zippel@linux-m68k.org>, Andreas Schwab <schwab@suse.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>



On Thu, 13 Nov 2008, Kars de Jong wrote:

...
> 
> I couldn't compile it with my old cross compiler (gcc version 4.1.3 
> 20080623 (prerelease) (Debian 4.1.2-23)), it ICEed somewhere in 
> net/sunrpc.

I don't suppose that you still have the error message? (I think I've seen 
that compiler fail like PR 29826 which has a patch in the gcc bugzilla.)

Finn

> The new cross compiler I built after that (gcc version 4.3.2 (Debian
> 4.3.2-1)) had no problems with it.
> 
> 
> Kind regards, Kars.
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
