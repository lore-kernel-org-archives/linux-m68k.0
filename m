From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: toolchain
Date: Sun, 6 Sep 2009 15:20:05 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909061510270.415@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:33508 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbZIFFUG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Sep 2009 01:20:06 -0400
In-Reply-To: <4AA2684E.1080009@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@vger.kernel.org



On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:

> > With this information, I could attempt to build a toolchain from 
> > upstream sources, or figure out whether or not the debian archive has 
> > the necessary source packages...
> 
> You will also need a patch for kernel, posted on linux-m68k@.

Stephen, this patch will be needed in order to build glibc with TLS, since 
it provides the userspace headers for TLS.

http://marc.info/?l=linux-m68k&m=125145669021517&w=2

Not sure how debian handles the kernel headers. I presume that 
linux-libc-dev (probably 2.6.30) needs the patch? (As will the other 
kernel packages of course.)

Finn
