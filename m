From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 11 Jun 2014 10:45:43 +0200
Message-ID: <mvm1tuv6dhk.fsf@hawking.suse.de>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:50112 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbaFKIps (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jun 2014 04:45:48 -0400
In-Reply-To: <21393.43065.207399.530921@gargle.gargle.HOWL> (Mikael
	Pettersson's message of "Fri, 6 Jun 2014 13:38:33 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: linux-m68k@vger.kernel.org

Mikael Pettersson <mikpelinux@gmail.com> writes:

> Reverting to 3.12.16 completely eliminates these problems.

Even 3.11 has the kswapd0 cpu hog problem.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
