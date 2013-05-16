From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: m68k-queue
Date: Fri, 17 May 2013 10:40:17 +1200
Message-ID: <CAOmrzk+_RijrcSCYmAofwi5_0RgF_uUMbQqm_nz1NLq1UUq9Tw@mail.gmail.com>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
	<5191FC4C.8010707@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1305151727470.10554@nippy.intranet>
	<CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
	<alpine.LNX.2.00.1305161226500.12344@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:44625 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190Ab3EPWkS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 May 2013 18:40:18 -0400
Received: by mail-oa0-f43.google.com with SMTP id o6so4425586oag.2
        for <linux-m68k@vger.kernel.org>; Thu, 16 May 2013 15:40:17 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1305161226500.12344@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Finn,

> As I recall, there used to be a repository that lived on purplehat.net
> which was said to have been lost in a disk crash.
>
> What is on sourceforge is quite a few years older than that, but the odd
> commit did prove useful sometimes for cherry picking for 2.6, even though
> the sourceforge repo has very little beyond Linux 2.2. There is a 2.4
> branch but it was always too buggy to be viable, and didn't track mainline
> beyond 2.4.18.

I must have been using 2.2 and never tried 2.4 I guess. Too many disk
crashes to trace that now.

It appears there has been testing on recent kernels and continued
improvement of hardware support - what is the latest kernel version
that you or others tested?

> Which reminds me - I'd like to update the mac68k sites. The sourceforge
> material (i.e. downloads) are ancient and buggy and the project docs needs
> some updating.
>
> Spare time permitting, I'd like to make available some current kernel
> binaries and tools for download (and remove/archive the broken 2.4
> downloads), provide instructions for cross-compiling mainline kernels
> using a current toolchain, with links to Thorsten's cross-compilers and so
> on.

By all means - if you have something that works better than what's
there; update it.

> The old material is a bit of an embarrassment, and the omission of current
> binaries suggests that the port never worked since 2.2...

Entirely possible. Some of the stuff that used to work fine on my
Falcon is only supported in the 2.4 series now. Never got it to work
since.

> Does anyone have any thoughts about a refresh of the mac68k
> downloads/docs?

I've lost track - does the current unstable/experimental debian-ports
distribution boot and install on Macs? Shame there's no such thing as
060 accelerator for Macs, but with 040 models it might be feasible.

If so, docs and tools to boot and install might be appreciated.

Cheers,

  Michael



On Thu, May 16, 2013 at 2:55 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Thu, 16 May 2013, Michael Schmitz wrote:
>
>> I had forgotten about the mac68k CVS. Or never knew about it.
>>
>
> As I recall, there used to be a repository that lived on purplehat.net
> which was said to have been lost in a disk crash.
>
> What is on sourceforge is quite a few years older than that, but the odd
> commit did prove useful sometimes for cherry picking for 2.6, even though
> the sourceforge repo has very little beyond Linux 2.2. There is a 2.4
> branch but it was always too buggy to be viable, and didn't track mainline
> beyond 2.4.18.
>
> Which reminds me - I'd like to update the mac68k sites. The sourceforge
> material (i.e. downloads) are ancient and buggy and the project docs needs
> some updating.
>
> Spare time permitting, I'd like to make available some current kernel
> binaries and tools for download (and remove/archive the broken 2.4
> downloads), provide instructions for cross-compiling mainline kernels
> using a current toolchain, with links to Thorsten's cross-compilers and so
> on.
>
> The old material is a bit of an embarrassment, and the omission of current
> binaries suggests that the port never worked since 2.2...
>
> Does anyone have any thoughts about a refresh of the mac68k
> downloads/docs?
>
> Finn
