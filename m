From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Sun, 17 May 2009 10:29:40 +0200
Message-ID: <10f740e80905170129i4f275533k92841282ce629270@mail.gmail.com>
References: <F7CDF992-412A-11DE-9D14-00050249ADE1@kaffe.org>
	 <Pine.LNX.4.64.0905152017240.3873@loopy.telegraphics.com.au>
	 <20090517061039.GA3019@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:39557 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872AbZEQI3k (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 May 2009 04:29:40 -0400
Received: by ewy24 with SMTP id 24so3403459ewy.37
        for <linux-m68k@vger.kernel.org>; Sun, 17 May 2009 01:29:40 -0700 (PDT)
In-Reply-To: <20090517061039.GA3019@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, linux-m68k@vger.kernel.org

On Sun, May 17, 2009 at 08:10, Brad Boyer <flar@allandria.com> wrote:
> On Fri, May 15, 2009 at 08:28:51PM +1000, Finn Thain wrote:
>> This commit looks a bit suspect -- it was not CC'd to this list -- in
>> particular the Makefile change:
>>
>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc
>>
>> So now mac8390.c and 8390.c both #include "lib8390.c"... might this
>> perhaps lead to the wrong ei_inb/outb etc in the final link?
>
> It does seem like an odd change. It would be nice if this list got
> copied on changes to any nubus drivers, but I suppose it's not anywhere
> on the maintainers list. It might be something to bring up with David
> for any future changes to nubus network cards.

Probably the change looked sufficient trivial/innocent. Trivial updates for core
changes are usually posted on the subsystem mailing list only.

> I'll try to find some time to build a kernel and try it out. I have
> several cards that use this driver.

Good, thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
