From: Petr Stehlik <pstehlik@sophics.cz>
Subject: Re: nfhd performance
Date: Mon, 19 Aug 2013 17:48:24 +0200
Message-ID: <1376927304.17125.19.camel@pracovni>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
	 <03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
	 <CAMuHMdUkMEorK34WnV9==thRPCVRXV0ySWq=fFTNFO1fe3Qc6g@mail.gmail.com>
	 <21010.11209.818043.191186@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx.zln.cz ([188.246.101.4]:53722 "EHLO mx.zln.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062Ab3HSPsf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 19 Aug 2013 11:48:35 -0400
In-Reply-To: <21010.11209.818043.191186@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

> Part of the problem is that ByteSwap = No setting.  Contrary to what one might
> think, "No" there actually means "yes, byteswap every sector read or written".
> 
> Grep for byteswap in aranym's src/natfeat/xhdi.cpp if you don't believe me...
> 
> As far as I can tell, this setting is only meaningful if you have an image which
> must be shared with actual HW, and you don't want to byteswap it when migrating
> it between these two roles (HW or aranym).  I don't have that requirement, so I
> run my aranym VMs with ByteSwap = Yes, which eliminates that overhead.

Very true.

> There are also other things in xhdi.cpp I don't really like, such as going through
> stdio when raw Unix file-descriptors would do, and the small I/O unit size.

Please suggest a better yet portable way. I've been thinking about
reading more than a single sector at once, that could help a bit. Should
write a benchmark for it first, it seems.

Petr
