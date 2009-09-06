From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: toolchain
Date: Sun, 6 Sep 2009 12:37:24 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909061209230.415@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <4AA2684E.1080009@codesourcery.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:64005 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753766AbZIFCh1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Sep 2009 22:37:27 -0400
In-Reply-To: <4AA2684E.1080009@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org



On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:

> Finn Thain wrote:
> ...
> > But in that post (June 28) Maxim recommends using mainline binutils, 
> > and since then we have HJL binutils-2.19.51.0.14 released, "...based 
> > on binutils 2009 0722 in CVS on sourceware.org..." So I guess I should 
> > start there.
> 
> The last binutils TLS patches went in on 2009-08-26; the patches fixed 
> generation of invalid TLS relocations.

OK. Debian has 2.19.51.20090827-1 in the sid archive. I wonder if it has 
been built yet?

> > I understand that the current GCC (4.4) lacks the necessary patches, 
> > and 4.5 is still uncooked (and that's a scary prospect). Can someone 
> > confirm that this is the necessary patch for 4.4: 
> > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
> 
> I think GCC 4.4 should be good enough.

That's encouraging.

> 
> > As for eglibc, there are a number of branches listed here,
> > http://www.eglibc.org/repository
> > The question is, which branch, snapshot or release might meet be suitable?
> 
> EGLIBC does not yet have NPTL patches checked in, they are in review on 
> libc-ports@.  Once the review is finished, I will likely backport the 
> patches from EGLIBC trunk to 2.10 branch.

I guess I'll wait for that, and then perhaps look into patching 2.9 if 
that turns out to be straight forward. (Debian has 2.10 in the 
experimental archive, 2.9 (more or less) in stable and testing.)

> 
> > With this information, I could attempt to build a toolchain from 
> > upstream sources, or figure out whether or not the debian archive has 
> > the necessary source packages...
> 
> You will also need a patch for kernel, posted on linux-m68k@.

Right.

Thanks for the update.

Finn

> 
> --
> Maxim
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
