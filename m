From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: always set stack frame format for
 ColdFire on thread start
Date: Sun, 16 Sep 2012 21:23:49 +0200
Message-ID: <CAMuHMdVH04ZG-1_fQe1kq4NzORjB042xnaZvKrw4NxhDP0qEBw@mail.gmail.com>
References: <1347426799-24854-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:42090 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab2IPTXt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Sep 2012 15:23:49 -0400
Received: by vbbff1 with SMTP id ff1so2165801vbb.19
        for <linux-m68k@vger.kernel.org>; Sun, 16 Sep 2012 12:23:49 -0700 (PDT)
In-Reply-To: <1347426799-24854-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Sep 12, 2012 at 7:13 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The stack frame "format" field needs to be explicitly set on thread creation
> on ColdFire. For a normal long word aligned user stack pointer the frame
> format is 0x4.
>
> We were doing this for non-MMU ColdFire, but not for the case with MMU enabled.
> So fix it so we always do it if targeting ColdFire.
>
> The old code happend to rely on the stack frame format being inhereted from
> the process calling exec. Furture changes means that may not always work,
> so we really do want to set it explicitly.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

The classic-m68k changes look fine, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
