From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 31 Mar 2015 15:19:44 +0200
Message-ID: <21786.40688.53001.509365@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:33985 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753202AbbCaNTs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 31 Mar 2015 09:19:48 -0400
Received: by lboc7 with SMTP id c7so12138866lbo.1
        for <linux-m68k@vger.kernel.org>; Tue, 31 Mar 2015 06:19:47 -0700 (PDT)
In-Reply-To: <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz writes:
 > Hi,
 > 
 > has anyone found a solution to this one?
 > 
 > 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet.
 > Unpacking a large tarball tends to trigger this for me.

Alas, no.  I went back to the 3.10.xx kernels and they work Ok for me
(they tend to hang during shutdown, but I can live with that).

I should do a git bisect...

/Mikael

 > 
 > Cheers,
 > 
 >   Michael
 > 
 > 
 > On Tue, Jul 1, 2014 at 11:43 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 > > Andreas Schwab writes:
 > >  > Mikael Pettersson <mikpelinux@gmail.com> writes:
 > >  >
 > >  > > Reverting to 3.12.16 completely eliminates these problems.
 > >  >
 > >  > Even 3.11 has the kswapd0 cpu hog problem.
 > >
 > > Hmm, I just got the kswapd0 CPU hog on 3.12.16 too (while compiling
 > > java code during a gcc package rebuild).
 > >
 > > So kernels >= 3.11 have the kswapd0 CPU hog bug, and kernels >= 3.13
 > > also have the ksoftirdq/0 CPU hog bug.
 > >
 > > What's the last known-good kernel? 3.10?
 > > --
 > > To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
 > > the body of a message to majordomo@vger.kernel.org
 > > More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
