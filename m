From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Wed, 2 Apr 2014 07:56:26 +1300
Message-ID: <CAOmrzk+GSRe6TjzqbnCqwZuBR10HwC47dJ6TBF+MJBvgAvkhjA@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<87txae2dt4.fsf@igel.home>
	<20140331235216.GA2109@mail.biophys.uni-duesseldorf.de>
	<CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com>
	<alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:57417 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751720AbaDAS41 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Apr 2014 14:56:27 -0400
Received: by mail-oa0-f44.google.com with SMTP id n16so11696592oag.17
        for <linux-m68k@vger.kernel.org>; Tue, 01 Apr 2014 11:56:26 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1404012153360.16187@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

Hi Finn,

>> Don't know about Mac,
>
> It may be possible to boot Linux with MacOS running in 24-bit mode, and
> ISTR that this leads to a large number of memory chunks. The Penguin

The chunk size would still be 16 MB, perhaps?

(Unless Geert is right and interleaving means multiple small memory
chunks. I doubt Apple engineers would have gone that far.)

Cheers,

  Michael
