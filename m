From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 23:45:32 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010042306190.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com> <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org> <alpine.OSX.2.00.1010041955060.285@localhost>
 <Pine.BSM.4.64L.1010041016060.29280@herc.mirbsd.org> <alpine.OSX.2.00.1010042123060.285@localhost> <Pine.BSM.4.64L.1010041130280.4312@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:36829 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755565Ab0JDMpa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 08:45:30 -0400
In-Reply-To: <Pine.BSM.4.64L.1010041130280.4312@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org


On Mon, 4 Oct 2010, Thorsten Glaser wrote:

> Finn Thain wrote:
> 
> >It may be that speakup works on amiga and atari (I don't know). It 
> >doesn't work on mac as there are no audio drivers.
> 
> There's a software backend.

Fair enough. The docs tell me that it can also use serial port connected 
synthesisers.

Finn
