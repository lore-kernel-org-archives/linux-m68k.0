From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] reinstate mac rtc
Date: Wed, 15 Oct 2008 23:41:05 +0200
Message-ID: <F86D8C33-9B01-11DD-B097-00050249ADE1@kaffe.org>
References: <Pine.LNX.4.64.0810132114590.6220@anakin>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out11.libero.it ([212.52.84.111]:50310 "EHLO
	cp-out11.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269AbYJOVlO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 17:41:14 -0400
In-Reply-To: <Pine.LNX.4.64.0810132114590.6220@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org

Finn, Geert,

so there is hope of not having a screwed clock time on my IIfx / QUadra 
950? the 2.2 series kernel had the clock, but no later kernel ever had 
it.


Generally, do you have a kernel to use on the above machines? I sitll 
have 2.2 but I can't upgrade libc due to that and this is breaking my 
upgrades and made my box a mess...



Riccardo
On Monday, October 13, 2008, at 09:21  PM, Geert Uytterhoeven wrote:

> 	Hi Finn,
>
> Thanks, I've added:
>     [PATCH] reinstate mac rtc
>     [PATCH] mac via cleanup and commentry
>     [PATCH] machw.h cleanup
>     [PATCH] mac baboon interrupt enable/disable
>     [PATCH] mac_esp asm fix
>     [PATCH] macfb annotations and compiler warning fix
>     [PATCH] fix trigraph ignored warning in setox.S
>     [PATCH] fbcon: remove broken mac vbl handler
>     [PATCH] mac_esp: fix for quadras with two esp chips
>     [PATCH] m68k: Do not overflow fb_fix_screeninfo.id in macfb
>
> Any of these I should still try to get into 2.6.28? Or is queueing for 
> 2.6.29
> OK?
>

