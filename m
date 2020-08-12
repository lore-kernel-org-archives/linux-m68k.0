Return-Path: <SRS0=xXxx=BW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26200C433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04A532076B
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Aug 2020 09:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgHLJo1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Aug 2020 05:44:27 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:35880 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgHLJo1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Aug 2020 05:44:27 -0400
Received: by mail-oo1-f49.google.com with SMTP id y30so337806ooj.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2020 02:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKY1HR/Ey97Lg3/GWw0KxRFSfEJedxxI19Gpnly6sGY=;
        b=OWR//3fRYmbj7r/vVVLHbUzotc+GfvoXZSwCsxjQnyxg4pRWuzHRRLwx5riWNrPgDB
         yKIZBVlmRmmAk/e2x0nGejLlWssYbFALEoJj8wWHA+bMT298K2FS7qROTu9Zd4NL7Z3Y
         OwoNimraAutlqljXAFgk1aHx8Ft4BWqKUe9Py7wyu6PjJA/e6HhEqGgYuy1YlkPLf+YE
         X6mrosBcJHQPlZAxsaADvtuq5qlRM+TDrMQs/YJdGhVaM7uwtnCi6djhuon3jxNiVd+c
         +3Zo7sYlJ3+WRfT2ab6Bys1iS3qttgEd3bT2avQOZD0GndQ6yDZ8arvnFI77aVbOu/Dx
         dXCA==
X-Gm-Message-State: AOAM53079MGsCUh808/xMHm2tOnWPijwGl7qdKSHPGDDxRvBhzfCF+e6
        525UsZBTb7WD0wkE22YCR0YoRWP6OVyKt8h1qdXvFld0
X-Google-Smtp-Source: ABdhPJzcVMnt3t+j8R997H27wYA5i9rknVx1FG9tBhqDQ7yEFwZ/ntn/R/hAM7LCnc65dIJTlygP48ItHb4x9W/DJyI=
X-Received: by 2002:a4a:6c13:: with SMTP id q19mr9119119ooc.11.1597225466483;
 Wed, 12 Aug 2020 02:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <86v9hoffcd.fsf@emacs.strotmann.de> <CAMuHMdWThu9QW-HAQ84TBi4ZGUmzpDw4t=WN37uwAoec7ynsvA@mail.gmail.com>
In-Reply-To: <CAMuHMdWThu9QW-HAQ84TBi4ZGUmzpDw4t=WN37uwAoec7ynsvA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Aug 2020 11:44:15 +0200
Message-ID: <CAMuHMdU=nV_f80aiZQ_EeDOtBE8mWmsQWCS9hau6BhUf5Gv2tw@mail.gmail.com>
Subject: Re: m68k chat 21st Aug 2020 - "the Amitari - EmuTOS and Atari
 Software on the Amiga"
To:     Carsten Strotmann <cas@strotmann.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        emutos-devel@lists.sourceforge.net, amigaml@freelists.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 12, 2020 at 10:30 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> There did exist a small AmigaOS emulator for Amiga UNIX, basically
> implementing a hunk loader and a few exec.library and dos.library calls.
> This was rumored to be sufficient to run e.g. the SAS C compiler.
> I tried it once on Linux/m68k, and it could run a simple Hello World.
>
> The only entrypoint you need to provide to run AmigaOS binaries is a
> pointer to ExecBase at address 4.  If TOS doesn't use that location for
> something else, you can implement AmigaOS support.
>
> Good luck! ;-)

FTR:

https://web.archive.org/web/20000304080628/http://www.cs.kuleuven.ac.be/~geert/bin/ados_linux.tar.gz


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
