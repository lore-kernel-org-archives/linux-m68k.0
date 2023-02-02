Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE929C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Feb 2023 07:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjBBHqo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Feb 2023 02:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjBBHqn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Feb 2023 02:46:43 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F136384F93
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Feb 2023 23:46:13 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id z5so1019051qtn.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 23:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLpp3el8PzQEw9FqoojrKVG51btX48MICoZF2aZsKVE=;
        b=EKZMvkdHQR4v+2uY4uVoDF1EV+4BQORWENEl3euXk6p965Big+BNaKbDr8z6bKY+rM
         ulbeT8MeENse75PoBOqNqqlDncYs+oZw+vQZL4mzrT5PZgWD/JjD58/Ca5+3Jvj3PfZu
         XTt1Z/nWhColA/4j6NAApg9fhWZupqsDRScgzBs97OsITBqNpZCefYGLwVDK43R9AWq4
         2O2k30p9Jyche7ieftMoB5HVV8iUrwTDz/1uveYRHnw9bi4EkvYuy4rUHOBb62z4h+po
         toxTohe2nGqcZiEBDjf9A8wwe82pbLaJYLS42DfRaSdp8+Ip6zEiMkxz19ctoGnyVvKl
         tYZA==
X-Gm-Message-State: AO0yUKXm9INJmUG42Y4EFJY0vOWeqUcXFD7RcIqo8FZsQtm8hOOiXQyb
        E7HQkqF+vqMqh5oEnhz/vHbfnNFogrh0Tw==
X-Google-Smtp-Source: AK7set88T4yeX/eztkc3erGYSlk+rXaphfXPLce29M1MkB9YIRawF9hQxo2RI8a8Idns6mReONsQkA==
X-Received: by 2002:ac8:574b:0:b0:3b9:a4bb:e53d with SMTP id 11-20020ac8574b000000b003b9a4bbe53dmr10478795qtx.34.1675323882525;
        Wed, 01 Feb 2023 23:44:42 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y77-20020a376450000000b0071c535f3ff3sm9582234qkb.6.2023.02.01.23.44.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 23:44:42 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4a263c4ddbaso16481547b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 23:44:41 -0800 (PST)
X-Received: by 2002:a0d:f106:0:b0:507:86ae:c733 with SMTP id
 a6-20020a0df106000000b0050786aec733mr698800ywf.358.1675323881670; Wed, 01 Feb
 2023 23:44:41 -0800 (PST)
MIME-Version: 1.0
References: <45aa9faee34d73515abcc073812ae1d32f821e3d.camel@physik.fu-berlin.de>
In-Reply-To: <45aa9faee34d73515abcc073812ae1d32f821e3d.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Feb 2023 08:44:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE6iPqW=weJyS-AGYMgbaLwA-JjYGhDJj06hw2qK8oHQ@mail.gmail.com>
Message-ID: <CAMuHMdXE6iPqW=weJyS-AGYMgbaLwA-JjYGhDJj06hw2qK8oHQ@mail.gmail.com>
Subject: Re: m68k assembly question: jsr vs. bsr
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Wed, Feb 1, 2023 at 11:17 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Can anyone answer this question regarding the difference between "bsr" and "jsr":
>
> > https://github.com/llvm/llvm-project/issues/60354#issuecomment-1412018845

"jsr" is an absolute jump to a subroutine.
"bsr" is a relative jump (8-bit, 16-bit, or 32-bit signed offset) to a
subroutine,
i.e. typically for calling a nearby function.

There's also "jbsr", which is an assembler macro that picks the most
appropriate: bsr does not need relocation, but bsr.l is 68020+ only.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
