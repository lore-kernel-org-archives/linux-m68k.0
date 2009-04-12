From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sun, 12 Apr 2009 14:36:08 +0200
Message-ID: <m2ws9q122v.fsf@igel.home>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
	<10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
	<m2ab6nts2u.fsf@igel.home>
	<10f740e80904120125n216db328l5eea0bbffe66d686@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:35909 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760639AbZDLMgN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2009 08:36:13 -0400
In-Reply-To: <10f740e80904120125n216db328l5eea0bbffe66d686@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 12 Apr 2009 10:25:02 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?utf-8?Q?Kolbj=C3=B8rn?= Barmen <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> You can do without a tracking branch, i.e. `git checkout
> linux-m68k/m68k-v2.6.29'
> does work.

It may be ok for a quick look, but it creates a detached branch, which
you don't want in general.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
