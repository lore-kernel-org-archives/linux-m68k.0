From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Chained vs. shared EtherNEC interrupts - was: Re: [SOLVED] Re:
 ARAnyM VMs with Debian hanging at 100% CPU usage
Date: Thu, 9 Aug 2012 22:01:05 +0200
Message-ID: <CAMuHMdWQ2P=rmNc8JJZ0-f==6v7ttMo-8Lb=taPG64e8MuYhng@mail.gmail.com>
References: <CAOmrzkKiPdAjcN4Pp883Gzj0hnYh=kv0Lxwau8Fa38ZsOCVTCQ@mail.gmail.com>
	<CAMuHMdWoq_M4yhuk8YK0+ibNXbwbZYDBu9WUfu+9cvvpvqQxpg@mail.gmail.com>
	<CAOmrzk+j3QwJw6jJ0wcRoibik7fbDNS_3uqZphB6Ba80bTWKxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:41020 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759378Ab2HIUBG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Aug 2012 16:01:06 -0400
Received: by vbbff1 with SMTP id ff1so372110vbb.19
        for <linux-m68k@vger.kernel.org>; Thu, 09 Aug 2012 13:01:05 -0700 (PDT)
In-Reply-To: <CAOmrzk+j3QwJw6jJ0wcRoibik7fbDNS_3uqZphB6Ba80bTWKxQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Aug 9, 2012 at 2:21 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> I still need to separate the USB driver stuff out of my chained
> interrupt patch, and possibly clean up checkpatch violations. Should
> be done with that by this weekend. How long until the current merge
> window closes?

There's no "current" merge window, as v3.6-rc1 was released almost one week
ago...
Expect the next merge window (for 3.7) to open around September 20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
