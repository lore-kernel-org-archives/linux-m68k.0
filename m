From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RESENT] m68k/atari - update Kconfig.bus help text
Date: Sun, 14 Sep 2014 11:58:29 +0200
Message-ID: <CAMuHMdV4_58NHz-WEmJsJxQL+ER0QpXmC4Bpy_DxP8qyUuEALg@mail.gmail.com>
References: <1410569075-18692-1-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:57557 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752413AbaINJ6a (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Sep 2014 05:58:30 -0400
Received: by mail-lb0-f173.google.com with SMTP id w7so3043252lbi.18
        for <linux-m68k@vger.kernel.org>; Sun, 14 Sep 2014 02:58:29 -0700 (PDT)
In-Reply-To: <1410569075-18692-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Sat, Sep 13, 2014 at 2:44 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add NetUSBee to users of ATARI_ROM_ISA option (thanks Geert for
> spotting this in randconfig builds).
>
> Add note to ATARI_USB option to alert user to enable ATARI_ROM_ISA
> if they want support for the NetUSBee USB driver.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks, applied.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
