From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari - smc91x: remove Atari special case handling
 for SMC_PUSH_DATA
Date: Tue, 13 Jan 2015 09:50:17 +0100
Message-ID: <CAMuHMdVS=tu1wRp==GmaZJMhYk+h7PPwxW1c=ummMygq5tD87Q@mail.gmail.com>
References: <1417373882-22011-1-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35482 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbbAMIuT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Jan 2015 03:50:19 -0500
Received: by mail-la0-f47.google.com with SMTP id hz20so1429577lab.6
        for <linux-m68k@vger.kernel.org>; Tue, 13 Jan 2015 00:50:18 -0800 (PST)
In-Reply-To: <1417373882-22011-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

On Sun, Nov 30, 2014 at 7:58 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Use of string accessors for unaligned writes (see mainstream commit
> e9e4ea74f06635f2ffc1dffe5ef40c854faa0a90) have fixed the swapped
> first unaligned byte problem for the Atari EtherNAT. Drop the
> redundant special case code now.
>
> Signed-off-by: Michael Schmitz <schmitz@debian.org>
> Tested-by: Christian Steigies <cts@debian.org>

Thanks, applied and folded into "net: smc91x: Add Atari EtherNAT support".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
