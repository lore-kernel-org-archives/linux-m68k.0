From: Stephen N Chivers <schivers@csc.com.au>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Fri, 14 Nov 2008 10:04:52 +1000
Message-ID: <OF230B0A8F.E04CFE94-ONCA257501.000022B8-CA257501.00007248@csc.com>
References: <1226611986.4267.16.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail87.messagelabs.com ([216.82.250.19]:51641 "EHLO
	mail87.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbYKNAEp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Nov 2008 19:04:45 -0500
In-Reply-To: <1226611986.4267.16.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Andreas Schwab <schwab@suse.de>, Roman Zippel <zippel@linux-m68k.org>

On Friday 14/11/2008, Kars de Jong wrote:

>By the way, I tested Linus' HEAD today (with your quilt patches, Geert)
>on my MVME167, it only needed the above fixed and it booted.
>
>I couldn't compile it with my old cross compiler (gcc version 4.1.3
>20080623 (prerelease) (Debian 4.1.2-23)), it ICEed somewhere in
>net/sunrpc.
That is also where my attempts to cross compile 2.6.27 failed.
>
>The new cross compiler I built after that (gcc version 4.3.2 (Debian
>4.3.2-1)) had no problems with it.

Stephen Chivers,
CSC Australia, Pty. Ltd.

