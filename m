Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36297C83F11
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 06:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjH1G51 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 02:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjH1G5K (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 02:57:10 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5AAE0
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:57:07 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59234aaca15so33215117b3.3
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693205826; x=1693810626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL5DJlpHfJ1uG0/XOt7NA2qa7PY6QqanZud3uUxPtSQ=;
        b=fs3VL34RAloAO0XkI6+tUIb6bYxsAKkA9iE6pbLsd66VbrAbhIAqxzSP3m3NbrZj/w
         noCf3+J0tWlKQ4SiYy184FgjBjmLk1nM49lnlvhsTSFQWo6niKKMxW60TLS7UjxPcVQV
         b4l1KbDZ9X0SqPR7IJHfhVngqlNyeer4aNmq8709BXjUDNixEjAx28RqtdDhm/SXNhVh
         +fJPg4pFrLMT5SjbwzJJXgiAnXOxqekAy/CHo5QJDlgJaT2LNLRT7sc9q/d8sd9d9bHY
         0gVAmEDfD+AkFhF1vj/jjU1uAk6JjIrxfPgDJP1R+7dviEhKHLiD2qQD0DOfGRXYb9UI
         VGKQ==
X-Gm-Message-State: AOJu0YyfR91lukna/cn1dbOEcs8g+mC4A9Gry5qRPTWfwFnvhOa3s3fJ
        RFZhYWUqTh5Mf5F3ZR9ydWH15tzBdJAoMg==
X-Google-Smtp-Source: AGHT+IHFsykAt53We48XKnTcjUxsVqJikcvnN6it3c677kxzeAw9FbpM9rhmXGsP76uWSEAZuKURtQ==
X-Received: by 2002:a81:71d7:0:b0:576:bfc7:1e43 with SMTP id m206-20020a8171d7000000b00576bfc71e43mr22097463ywc.25.1693205826257;
        Sun, 27 Aug 2023 23:57:06 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id x144-20020a81a096000000b00589f4021f84sm1995983ywg.37.2023.08.27.23.57.05
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:57:06 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d77ad095f13so2527876276.2
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 23:57:05 -0700 (PDT)
X-Received: by 2002:a25:c5c8:0:b0:d7a:cb32:2747 with SMTP id
 v191-20020a25c5c8000000b00d7acb322747mr4683543ybe.17.1693205825341; Sun, 27
 Aug 2023 23:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de> <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
In-Reply-To: <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 08:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWE5V9N4GYdoe+G6iqBxmjX2rY15FsBkfWYWrXN1TGuGQ@mail.gmail.com>
Message-ID: <CAMuHMdWE5V9N4GYdoe+G6iqBxmjX2rY15FsBkfWYWrXN1TGuGQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Aug 27, 2023 at 3:03 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Sat, 26 Aug 2023, John Paul Adrian Glaubitz wrote:
> > On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> > Not only mold but also most notably the following projects:
> >
> > - LLVM
> > - Firebird Database
> > - OpenJDK
> > - Various Qt packages
>
> And potentially more in the future, which may be anticipated on the basis
> that "those users don't need a stable ABI any more, so let's just ignore
> the portability issues in our code and leave the problem to the distros
> and toolchain developers".

Indeed, the world is slowly turning into "everything is 64-bit little endian"...

> Moreover, why is it that only a few developers have a problem with making
> explicit their decisions regarding alignment of shorts? What actual pain
> does it cause them to accept a patch to make their struct layouts plain?

I guess you mean "ints" and "longs" instead of "shorts"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
