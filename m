From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] m68k: propose move of platform coldfire
Date: Thu, 21 Aug 2014 09:30:34 +0200
Message-ID: <CAMuHMdX2a4n3+wAOmF43NCSBKowJ6X72KDtjgKzW-vYCLGisbQ@mail.gmail.com>
References: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:45150 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006AbaHUHaf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Aug 2014 03:30:35 -0400
Received: by mail-la0-f42.google.com with SMTP id pv20so8300530lab.15
        for <linux-m68k@vger.kernel.org>; Thu, 21 Aug 2014 00:30:34 -0700 (PDT)
In-Reply-To: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Thu, Aug 21, 2014 at 5:04 AM,  <gerg@uclinux.org> wrote:
> I propose that we move the arch/m68k/platform/coldfire directory to be
> directly under arch/m68k.
>
> The current platform/ structure was inhereted from the move of m68knommu,
> and is inconsistent with the existing m68k platforms (each having a
> directory under arch/m68k).
>
> Moving platform/coldfire is quite strait forward. The following patches do a
> move, and fix up the broken pathname comments.

That sounds fine to me.

> This does leave the question of what to do with the other directories still
> under arch/m68k/platform, namely 68000 and 68360. Should they be moved in
> the same way as coldfire?

I think the 68*328 and 68360 SoC support can have their own directories,
as these are platforms.

However, these directories also contain 68000 and 68360 CPU support,
which we may want to share with other platforms in the future, to support
68000-based Amigas, Ataris, Macs, Suns, ...

But as that's a problem to fix when someone is working on it, it's fine
for me to move these one level up, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
