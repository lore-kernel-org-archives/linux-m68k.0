From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 28 Oct 2009 12:19:06 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0910281209160.394@silk.local>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com>
 <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:51124 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757128AbZJ1BXs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Oct 2009 21:23:48 -0400
In-Reply-To: <4AE5B9B7.7000106@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org



On Mon, 26 Oct 2009, Maxim Kuvyrkov wrote:

> Maxim Kuvyrkov wrote:
> ...
> > Geert, in case there'll be further changes in the NPTL patch, would 
> > you like me submit full patch against original tree or only the 
> > incremental difference?
> 
> Ping.
> 
> Geert, did you have a chance to look over the patch from Oct. 2 2009?
> 
> I've done a lot of testing since then and TLS/NPTL support on 
> m68k/ColdFire is now stable enough to have no unexpected failures on 
> binutils, gcc, g++, libstdc++ and glibc testsuites.

Nice work. I'm looking forward to eglibc patches so I can build a current 
toolchain.

I suppose you can't really backport to eglibc 2.10 until the siginfo 
question is resolved. It appears from the list traffic that the consensus 
is to adopt the generic struct layout here. Is that the solution that 
you've used in testing? If so, can you send the patches you been testing?

Thanks,

Finn


> 
> Thanks,
> 
> 
