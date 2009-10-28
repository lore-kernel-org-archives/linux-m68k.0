From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Add private syscalls to support NPTL
Date: Thu, 29 Oct 2009 03:38:23 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0910290323070.564@silk.local>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>  <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>  <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com>
 <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com> <4AE5B9B7.7000106@codesourcery.com> <alpine.OSX.2.00.0910281209160.394@silk.local> <4AE7EAC2.8050409@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:63043 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755138AbZJ1QiO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Oct 2009 12:38:14 -0400
In-Reply-To: <4AE7EAC2.8050409@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org



On Wed, 28 Oct 2009, Maxim Kuvyrkov wrote:

> Finn Thain wrote:
> > 
> > On Mon, 26 Oct 2009, Maxim Kuvyrkov wrote:
> > 
> > > Maxim Kuvyrkov wrote:
> > > ...
> > > > Geert, in case there'll be further changes in the NPTL patch, 
> > > > would you like me submit full patch against original tree or only 
> > > > the incremental difference?
> > > Ping.
> > > 
> > > Geert, did you have a chance to look over the patch from Oct. 2 
> > > 2009?
> > > 
> > > I've done a lot of testing since then and TLS/NPTL support on 
> > > m68k/ColdFire is now stable enough to have no unexpected failures on 
> > > binutils, gcc, g++, libstdc++ and glibc testsuites.
> > 
> > Nice work. I'm looking forward to eglibc patches so I can build a 
> > current toolchain.
> 
> We [CodeSourcery] have just updated all of our toolchains, and the 
> GNU/Linux toolchain is based on EGLIBC 2.10 and has well tested TLS/NPTL 
> support.  If you are targeting ColdFire you can simply download the 
> toolchain at <http://www.codesourcery.com/sgpp/lite/coldfire>.

At the moment I'm more interested in the m68k toolchain, particularly for 
debian. But thanks for the link, I was unaware of the free download.

> > I suppose you can't really backport to eglibc 2.10 until the siginfo 
> > question is resolved. It appears from the list traffic that the 
> > consensus is to adopt the generic struct layout here. Is that the 
> > solution that you've used in testing?
> 
> I'm not sure if any parts of the m68k kernel port depend on the custom 
> layout of siginfo, so I've only fixed the pieces which I'm sure are 
> wrong.  I.e, I've been testing with this 
> <http://marc.info/?l=linux-m68k&m=125447365311948&w=2> patch.
> 
> > If so, can you send the patches you been testing?
> 
> All the patches are in the mailing lists.
> 
> The kernel patches are at
> 
> http://marc.info/?l=linux-m68k&m=125447760017098&w=2
> http://marc.info/?l=linux-m68k&m=125447365311948&w=2
> 
> The [E]GLIBC patches are at
> 
> [M68K/ColdFire patch 1/n] Update sysdep.h
> http://sourceware.org/ml/libc-ports/2009-08/msg00006.html
> 
> [M68K/ColdFire patch 2/n] Add CFI information to dl-trampoline.S
> http://sourceware.org/ml/libc-ports/2009-08/msg00007.html
> 
> [M68K/ColdFire patch 3/n] Update jmpbuf-unwind.h
> http://sourceware.org/ml/libc-ports/2009-08/msg00008.html
> 
> [M68K/ColdFire patch 4/n] Remove kernel headers
> Update by hand to match your kernel
> 
> [M68K/ColdFire patch 5/n] Main NPTL patch
> http://sourceware.org/ml/libc-ports/2009-10/msg00006.html
> http://sourceware.org/ml/libc-ports/2009-10/msg00030.html
> 
> [M68K/ColdFire patch 6/n] Add TLS relocations to elf/elf.h
> http://sourceware.org/ml/libc-ports/2009-08/msg00012.html
> Should I post this one to glibc-alpha@ for the review?
> 
> [M68K/ColdFire patch 7/n] Handle libgcc_s.so.2
> http://sourceware.org/bugzilla/show_bug.cgi?id=4457
> 
> Let me know if you find any particular problems with these patches.
> 

That's a great help, thanks.

Finn
