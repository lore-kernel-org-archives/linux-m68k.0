From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k-queue
Date: Thu, 16 May 2013 12:55:44 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305161226500.12344@nippy.intranet>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com> <5191FC4C.8010707@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1305151727470.10554@nippy.intranet> <CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45208 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751020Ab3EPCzv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 May 2013 22:55:51 -0400
In-Reply-To: <CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 16 May 2013, Michael Schmitz wrote:

> I had forgotten about the mac68k CVS. Or never knew about it.
> 

As I recall, there used to be a repository that lived on purplehat.net 
which was said to have been lost in a disk crash.

What is on sourceforge is quite a few years older than that, but the odd 
commit did prove useful sometimes for cherry picking for 2.6, even though 
the sourceforge repo has very little beyond Linux 2.2. There is a 2.4 
branch but it was always too buggy to be viable, and didn't track mainline 
beyond 2.4.18.

Which reminds me - I'd like to update the mac68k sites. The sourceforge 
material (i.e. downloads) are ancient and buggy and the project docs needs 
some updating.

Spare time permitting, I'd like to make available some current kernel 
binaries and tools for download (and remove/archive the broken 2.4 
downloads), provide instructions for cross-compiling mainline kernels 
using a current toolchain, with links to Thorsten's cross-compilers and so 
on.

The old material is a bit of an embarrassment, and the omission of current 
binaries suggests that the port never worked since 2.2...

Does anyone have any thoughts about a refresh of the mac68k 
downloads/docs?

Finn
