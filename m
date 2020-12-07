Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00B9C4361B
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 07:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A3E225A9
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Dec 2020 07:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgLGHgf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Dec 2020 02:36:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46519 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgLGHge (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Dec 2020 02:36:34 -0500
Received: by mail-oi1-f195.google.com with SMTP id k2so14420800oic.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Dec 2020 23:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81A1/EI2V5mNEQhjEQLpvlKbCZRpRrCc/XWWtaeN53s=;
        b=iuXm9ISXPkb8oNUIHOJDMPL/q+rsz/kswKX7St3OS3xXJj0HEv1/i+HRZ0jGJwfmsu
         bNaNnFeP5IVN0cyQH5VLwzZ2dnixDINt22FMZT5gLJM+iYz9u3TyKPICCeHD0UdMc3kq
         WD5co5wPnbNOEwwOjPLdSDVQ9V2eFlsmFfKQ5Y3DtqEESUghkOXEWGgTVkx75wU+HFB2
         5Zlr0jthqJ83yNftp22DsuoJMvwC+muSChZypWNUx9dlPdeRuGLfG+lTu6m9A01W94dZ
         SIoigXm/qhGaoccbS3LLTsZ6Vu1vofb7TjKqYjZaOp5kA0HHiU44/gla5Crj8/fW3Zu/
         Zsug==
X-Gm-Message-State: AOAM5306Op5Lr3v6oczRtFSnespe93uQG2+YKJVcrwKvayMuKiuNCMEd
        MADmOYJHJ2WmCKRaql+2l1S3YLhHrKBps9yLHNw=
X-Google-Smtp-Source: ABdhPJy/JEX754OpU/TA3+t9ubAjETJ+JgblXzUnQ4UMH8YPy4PUYm8OthzBU9+DM64zMQkgJyrBU5FFU4KbRsoCaak=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr9941990oib.54.1607326553857;
 Sun, 06 Dec 2020 23:35:53 -0800 (PST)
MIME-Version: 1.0
References: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
In-Reply-To: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Dec 2020 08:35:42 +0100
Message-ID: <CAMuHMdWVS1nQM1vP5kyz9Dz3TmzYSDeZxCPXGpG-pGN93Zdxcw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update 68k Mac entry
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joshua Thompson <funaho@jurai.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Sat, Dec 5, 2020 at 4:49 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> Two files under drivers/macintosh are actually m68k-only. I think that
> patches for these files should be reviewed in the appropriate forum and
> merged via the appropriate tree, rather than falling to the powerpc
> maintainers to deal with. Update the "M68K ON APPLE MACINTOSH" section
> accordingly.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
