Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8831EC433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 12 Feb 2022 14:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiBLO7u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 12 Feb 2022 09:59:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiBLO7u (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 12 Feb 2022 09:59:50 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2FC214
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Feb 2022 06:59:46 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id p7so2745889vsg.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Feb 2022 06:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=uFtOIkhRRUwgkrLortfSPfxBMrkSbVxzV0guUNJR+x0=;
        b=l1FFYaPfv4lsVz1aXlLCoU2oz4IY1DNAoVtkhHwnVK6Br2C6uTRnLP/vpl7C1B50WK
         cjfDP5zY0uciajP1VCbi/xq8rCF6UkWRSO6R7y+/eOPtnTaD1ELCKQgmZ4mHNw3B2tbG
         wbBkkM8YUPPEz4ALK9sDf/lqeTDDcqzol+4If4YIVVjfyl3ptc5LVAdlWTxV2LBUPTmx
         gZ1nFbViA5jJCK3dDbbn/B4Yi/PQ5zz1PxUOJgejyPGeIKGXBQSGfvRKeyyIj3jzRrwV
         7rH7aye82j0rtweLtXl6ZfuhqyKSRmK+LHbrHyzp7beyFuAE/4/L9OoxcqAHgfidKwJU
         lXUA==
X-Gm-Message-State: AOAM533xhX4Y3+32ZSU4m+eamBzW0KGfX+9EsEdNpuWrVpUxxIH6CodK
        nvd18UqR7DykwpEHjpXo27T3Q7H2M12E0g==
X-Google-Smtp-Source: ABdhPJyE3MTFSXfL5bQrLGgw+coFQXsXfCwToGYFqhUtgTi2tcyAUcFDAuXsUAZQ7vMZ/U5jFGtzYQ==
X-Received: by 2002:a05:6102:54a7:: with SMTP id bk39mr2057604vsb.60.1644677984955;
        Sat, 12 Feb 2022 06:59:44 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id w15sm2623870uam.13.2022.02.12.06.59.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 06:59:44 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id j26so12380317vso.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Feb 2022 06:59:44 -0800 (PST)
X-Received: by 2002:a67:ec0c:: with SMTP id d12mr1706591vso.77.1644677984376;
 Sat, 12 Feb 2022 06:59:44 -0800 (PST)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 12 Feb 2022 15:59:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
Message-ID: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
Subject: Wrong colors on ARAnyM
To:     Petr Stehlik <pstehlik@sophics.cz>,
        Michael Schmitz <schmitzmic@gmail.com>
Cc:     aranym@googlegroups.com,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

While working on an Atari DRM driver for Linux, I discovered a problem
with video modes using 2 bitplanes: the display only shows tints of
blue. 1, 4, and 8 bitplanes work fine.

With debug code added to ARAnyM, it turns out the bad behavior
happens when ARAnyM uses the STe palette registers instead of the
Falcon palette registers. And apparently the issue can also be
reproduced with atafb, and with other color depths:

 1. Boot Linux (I'm using video=atafb:tthigh)

    Everything looks good:

      refreshPalette:319: st_shift = 0
      refreshPalette:354: Fal color 0 = 0x00000000 => 00/00/00
      refreshPalette:354: Fal color 1 = 0x000000a8 => 00/00/aa
      refreshPalette:354: Fal color 2 = 0x00a80000 => 00/aa/00
      refreshPalette:354: Fal color 3 = 0x00a800a8 => 00/aa/aa

 2. Change the color depth a few times:

    $ fbset -depth 1
    $ fbset -depth 2
    $ fbset -depth 4
      ...

    If good: console is white(grey) on black

      refreshPalette:319: st_shift = 0
      refreshPalette:354: Fal color 0 = 0x00000000 => 00/00/00
      refreshPalette:354: Fal color 1 = 0xa8a800a8 => aa/aa/aa
      refreshPalette:354: Fal color 2 = 0x54540054 => 55/55/55
      refreshPalette:354: Fal color 3 = 0xfcfc00fc => ff/ff/ff

    If bad: console is blue on black

      refreshPalette:319: st_shift = 256
      refreshPalette:335: STe color 0 = 0x0000 => 00/00/00
      refreshPalette:335: STe color 1 = 0x0117 => 22/22/ee
      refreshPalette:335: STe color 2 = 0x0000 => 00/00/00
      refreshPalette:335: STe color 3 = 0x0000 => 00/00/00

As a workaround, I fixed ARAnyM to force numColors to 256, so
it will always use the Falcon palette.
https://github.com/aranym/aranym/blob/master/src/videl.cpp#L319

Is this a bug in ARAnyM, or a bug in atafb?
As the problem is not 100% reproducible, it looks like a race condition
in ARAnyM, or a wrong initialization order in atafb.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
