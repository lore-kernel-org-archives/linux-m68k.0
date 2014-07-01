From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 1 Jul 2014 13:43:38 +0200
Message-ID: <21426.40682.197715.245775@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:64805 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357AbaGALnm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Jul 2014 07:43:42 -0400
Received: by mail-lb0-f180.google.com with SMTP id w7so6770648lbi.39
        for <linux-m68k@vger.kernel.org>; Tue, 01 Jul 2014 04:43:41 -0700 (PDT)
In-Reply-To: <mvm1tuv6dhk.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, linux-m68k@vger.kernel.org

Andreas Schwab writes:
 > Mikael Pettersson <mikpelinux@gmail.com> writes:
 > 
 > > Reverting to 3.12.16 completely eliminates these problems.
 > 
 > Even 3.11 has the kswapd0 cpu hog problem.

Hmm, I just got the kswapd0 CPU hog on 3.12.16 too (while compiling
java code during a gcc package rebuild).

So kernels >= 3.11 have the kswapd0 CPU hog bug, and kernels >= 3.13
also have the ksoftirdq/0 CPU hog bug.

What's the last known-good kernel? 3.10?
