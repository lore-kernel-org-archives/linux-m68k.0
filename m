From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian-installer progress and input needed
Date: Tue, 16 May 2017 09:40:54 +0200
Message-ID: <CAMuHMdXK2NsfZ8oV2XiDZjMzVWtW=5VViDQ5uqDmuONTphyoBg@mail.gmail.com>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36117 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbdEPHk4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 16 May 2017 03:40:56 -0400
Received: by mail-it0-f49.google.com with SMTP id o5so57213909ith.1
        for <linux-m68k@vger.kernel.org>; Tue, 16 May 2017 00:40:55 -0700 (PDT)
In-Reply-To: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Adrian,

On Mon, May 15, 2017 at 11:21 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Thus, I would to ask around which modules are needed for the various
> hardware people have, e.g. SCSI driver for 68k Macs, IDE drivers for
> Amiga and Atari and so on.
>
> The drivers need to be added to the corresponding module list in [2]
> which will add them to module packages. The module packages then
> have to be included in the pkg-list for d-i on m68k [3]. Of course,
> the drivers need to be enabled in the kernel configuration as well.

You can extract a list of SCSI/IDE drivers needed from the defconfigs at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/m68k/configs

All needed drivers should be builtin in the defconfigs above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
