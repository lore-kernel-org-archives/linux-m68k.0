From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Sun, 6 Sep 2009 20:00:01 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909061901140.415@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>  <20090831120617.GA1114@marenka.net>  <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com>  <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>  <20090901151747.GB27514@marenka.net>  <alpine.OSX.2.00.0909050045330.383@silk.local>  <4AA2684E.1080009@codesourcery.com> <8259f0250909050900u3f367519tadcd44bd41779dd4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:36473 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754282AbZIFJ77 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Sep 2009 05:59:59 -0400
In-Reply-To: <8259f0250909050900u3f367519tadcd44bd41779dd4@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


On Sat, 5 Sep 2009, mike wrote:

> > The life is fast ebbing from debian/m68k as far as I can tell. I'm not 
> > sure if there is sufficient energy to revitalize it. I'd be delighted 
> > to be proven wrong.
> 
> Yep sad isnt it, one hope for the port is that several amigans ( trough 
> natami ) and atarians ( trough the coldfire atari project) or otherwise 
> some miracle happens at freescale and thereby more people see a reason 
> to run debian on their 68k's,
> 
> Question is tho, as the kernel gets more bloated and slower as time 
> passes, and the packages that run on top, will it even be usable on 
> those in a few...

I haven't seen anyone test for kernel performance regressions on m68k 
(other than the scheduler regression) -- let alone work on reversing them. 
Probably because of the usual shortage of skills.

> Netbsd seems to have a fast kernel. from what little i've booted of 
> it...

You have to pick the right architecture. In Linux (the kernel) algorithms 
are tuned for the common case, which is x86. And hence you'd expect a 
Linux operating system's performance to be competitive with any equivalent 
operating system running on that architecture.

Having said that, kernel performance even on x86 is quite variable from 
one release to another:
http://www.phoronix.com/scan.php?page=article&item=linux_2629_benchmarks&num=9 

Of course, benchmarks on Intel architectures should not be taken as 
representative of m68k performance. It would be informative to build and 
run a benchmark suite like that one on debian etch-m68k (it has gcc 3.3 
and 4.1) using the latest kernel.

Finn
