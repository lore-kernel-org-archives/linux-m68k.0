From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sat, 11 Apr 2009 12:14:49 +0200
Message-ID: <m2ab6nts2u.fsf@igel.home>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
	<10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42701 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823AbZDKKO4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Apr 2009 06:14:56 -0400
In-Reply-To: <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sat, 11 Apr 2009 10:16:29 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?utf-8?Q?Kolbj=C3=B8rn?= Barmen <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> 2.6.29 development is done on branch `m68k-v2.6.29', use
>
>     git checkout m68k-v2.6.29

After cloning the repository you first have to create the tracking
m68k-v2.6.29 branch:

$ git checkout -t origin/m68k-v2.6.29

>   2. Set up a remote (if you want a combined one with Linus' and m68k):
>
>     git remote add linux-m68k
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
>     git remote update
>     git checkout linux-m68k/master
> or  git checkout linux-m68k/m68k-v2.6.29

Same here, you need to add -t to the checkout commands to tell git to
create tracking branches.  In the first case when checking out
linux-m68k/master you also have to add "-b <branch>" to name the local
branch differently from the already existing master branch.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
