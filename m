From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 01 Apr 2015 18:11:36 +0200
Message-ID: <87sicjltfr.fsf@igel.home>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:37931 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210AbbDAQLk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Apr 2015 12:11:40 -0400
In-Reply-To: <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	(Michael Schmitz's message of "Tue, 31 Mar 2015 14:16:27 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitzmic@gmail.com> writes:

> has anyone found a solution to this one?
>
> 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet.
> Unpacking a large tarball tends to trigger this for me.

The only workaround I have is to drop caches regularily
(/proc/sys/vm/drop_caches) when MemFree is getting low.  All my OBS
build workers are stable running 3.11.6 with this workaround.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
