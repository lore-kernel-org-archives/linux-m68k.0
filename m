From: Daniel Palmer <danieruru@gmail.com>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 2 Apr 2014 20:33:26 +0900
Message-ID: <CAO64nm7RTG0V8RUj+4wZc336QHiVa6q=xH0NsU710_vhhHLfkQ@mail.gmail.com>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>
	<CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
	<alpine.LNX.2.00.1404021529450.9604@nippy.intranet>
	<CAO64nm6NJSmVWyo779AKqD_8FyXPKK-_EYEM1SsMz+N7WJWeHg@mail.gmail.com>
	<CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:37727 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758372AbaDBLd1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 07:33:27 -0400
Received: by mail-vc0-f176.google.com with SMTP id lc6so63906vcb.35
        for <linux-m68k@vger.kernel.org>; Wed, 02 Apr 2014 04:33:26 -0700 (PDT)
In-Reply-To: <CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org

On Wed, Apr 2, 2014 at 7:47 PM, Luis Alves <ljalvs@gmail.com> wrote:
> is compiled for 64-bit arch only):
> https://code.google.com/p/m68k/downloads/detail?name=m68k-uclinux-tools-20121115.tar.bz2&can=2&q=

I have a 64bit machine so I might try it later. I have compiled my
kernel with GCC 4.8.2 for the m68k-elf target and that is working.

The problem I'm having now is that every time I run something in hush
it runs when it exits hush exits with it and busybox's init restarts
it.
A quick bit of googling suggested that busybox's init couldn't be used
on nommu systems but the source has #ifdefs for nommu systems all over
the place.
simpleinit from the uclinux dist seems to be doing the same thing.
