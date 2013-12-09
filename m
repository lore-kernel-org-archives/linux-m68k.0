From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to support userspace robust futexes and PI mutexes
Date: Tue, 10 Dec 2013 00:27:16 +0100
Message-ID: <87iouxzju3.fsf@igel.home>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<alpine.LNX.2.00.1312101000250.10258@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:43648 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757Ab3LIX1V (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Dec 2013 18:27:21 -0500
In-Reply-To: <alpine.LNX.2.00.1312101000250.10258@nippy.intranet> (Finn
	Thain's message of "Tue, 10 Dec 2013 10:11:42 +1100 (EST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mikael Pettersson <mikpe@it.uu.se>, linux-m68k@vger.kernel.org

Finn Thain <fthain@telegraphics.com.au> writes:

> Data read fault at 0x00000000 in Super Data (pc=0x3afec)
> BAD KERNEL BUSERR
> Oops: 00000000
> Modules linked in:
> PC: [<0003afec>] cmpxchg_futex_value_locked+0x14/0x4a

What does it do here?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
