From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: merge MMU and non-MMU versions of mm/init.c
Date: Sun, 11 Nov 2012 11:43:56 +0100
Message-ID: <CAMuHMdWA9DLVqGUJrJCUa_zUNjRT-xoab1y9AGrK04QRVgR6PQ@mail.gmail.com>
References: <1351082187-15436-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:37916 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459Ab2KKKn5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Nov 2012 05:43:57 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so5322697vbb.19
        for <linux-m68k@vger.kernel.org>; Sun, 11 Nov 2012 02:43:56 -0800 (PST)
In-Reply-To: <1351082187-15436-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Oct 24, 2012 at 2:36 PM,  <gerg@snapgear.com> wrote:
> Some of the code in the existing mm/init_mm.c and mm/init_no.c files is
> the same, and if we merge them back to a single file we can save some code
> duplication.
>
> Although the old mem_init() code for non-MMU was a little different than
> the MMU version, it turns out we can use the same code. So I now we just
> use the MMU mem_init() code for all. It also means we now get identical
> console info messages for this code on kernel boot up.
>
> So merge the two files back into a single file.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
