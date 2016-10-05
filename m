From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k: add Sysam AMCORE open board support
Date: Wed, 5 Oct 2016 15:06:27 +0200
Message-ID: <CAMuHMdWb34hm6yJC0iUj5VRr+p0BM56BAodiVX3rmXWKgrpaiQ@mail.gmail.com>
References: <1475367526-20169-1-git-send-email-angelo@sysam.it>
 <1ed14396-ce6a-7e01-9bb2-5486ab7c7d1c@linux-m68k.org> <8d50761d-2c8d-1509-394f-104c3818c310@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36046 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750964AbcJENG2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Oct 2016 09:06:28 -0400
Received: by mail-it0-f68.google.com with SMTP id o19so10106439ito.3
        for <linux-m68k@vger.kernel.org>; Wed, 05 Oct 2016 06:06:28 -0700 (PDT)
In-Reply-To: <8d50761d-2c8d-1509-394f-104c3818c310@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On Wed, Oct 5, 2016 at 2:51 PM, Angelo Dureghello <angelo@sysam.it> wrote:
>         /* physical address of the data register (CMD [A2] to 0) */
>         [0] = {
>                 .start  = DM9000_ADDR,
>                 .end    = DM9000_ADDR,

DM9000_ADDR + 3?

>                 .flags  = IORESOURCE_MEM,
>         }
>         /* physical address of the data register (CMD [A2] to 1) */
>         [1] = {
>                 .start  = DM9000_ADDR + 4,
>                 .end    = DM9000_ADDR + 4,

DM9000_ADDR + 7?

>                 .flags  = IORESOURCE_MEM,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
