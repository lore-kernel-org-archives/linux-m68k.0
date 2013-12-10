From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to support userspace robust futexes and PI mutexes
Date: Tue, 10 Dec 2013 11:19:23 +0100
Message-ID: <mvmy53t6mac.fsf@hawking.suse.de>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<alpine.LNX.2.00.1312101000250.10258@nippy.intranet>
	<87iouxzju3.fsf@igel.home>
	<alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
	<CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:34341 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751823Ab3LJKT0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Dec 2013 05:19:26 -0500
In-Reply-To: <CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 10 Dec 2013 11:12:50 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>, Mikael Pettersson <mikpelinux@gmail.com>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

>> Data read fault at 0x00000000 in Super Data (pc=0x3afec)
>> BAD KERNEL BUSERR

I think futex_init needs to do set_fs(USER_DS), since futex is about
user data.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
