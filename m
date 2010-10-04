From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Tue, 5 Oct 2010 00:33:39 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010050026420.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org> <alpine.OSX.2.00.1010041943530.285@localhost>
 <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org> <alpine.OSX.2.00.1010042115260.285@localhost> <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:37456 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754495Ab0JDNdh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 09:33:37 -0400
In-Reply-To: <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


On Mon, 4 Oct 2010, Geert Uytterhoeven wrote:

> 
> I don't think it makes sense to build staging drivers on Debian/m68k. So 
> can't you default to CONFIG_STAGING=n?

It appears that this could be done by adding
"# CONFIG_STAGING is not set"
to debian/config/m68k/config
But this is probably a discussion for debian-m68k...

Finn
