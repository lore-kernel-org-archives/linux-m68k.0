Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694C4C25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 16:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjAVQgH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 11:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjAVQgH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 11:36:07 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400EFFF16
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:36:06 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id a25so7956771qto.10
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBaaP4ZwGY6Y8R9gatcQlYhmkOCksOiUfA8gFicptuU=;
        b=2qCpZIrlPhZwc7kL2lOMURGYeujU6euJQRES6r57UZkN0OjU+X9GLFnHLUyT7PIGSw
         ieBv3UR6bCPbD/SZL4nN/NsgDFmGYMpfESwPXqwGzv0kCYiG5B3nFo5u38ffsFJ2ZAVb
         7JQW7KyHrlFenKs530T/vDDdaZSWMBLGMBN84wYAMvZoZj6vb5SVCNmIw1XKUtI7S/gH
         IBvLkuyEXDSnCZbAh1tJmet2xR54rnI6s08XA8RObLZaHTME1r+70q0e//WkfTklFbeL
         w/mnaLJfIsscH2z8Hh8cGkF92EYOSnwhkWPWyM/N7SsqTCV3mXuw7TkRpg23KK+GPBqa
         TGtA==
X-Gm-Message-State: AFqh2kpde/FnBMxkMjieuhC0B1Qd+I3G7vbBjbuLcS04Ohrc3F7cBmlO
        AohiKWq7rB8tE6SL+RObPw9HY8A42YYaNg==
X-Google-Smtp-Source: AMrXdXsuLFXrT6QprLBBb7ZRPGXyP0sHlGIldk5jrfx70o7ruETbwdkOtRQ8E8WDXqkbAt6J9Fo+IA==
X-Received: by 2002:ac8:47d1:0:b0:3b6:3995:2ec2 with SMTP id d17-20020ac847d1000000b003b639952ec2mr34536316qtr.19.1674405365251;
        Sun, 22 Jan 2023 08:36:05 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id bz25-20020a05622a1e9900b003a591194221sm8358841qtb.7.2023.01.22.08.36.04
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 08:36:05 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4ff07dae50dso95705857b3.2
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:36:04 -0800 (PST)
X-Received: by 2002:a05:690c:c89:b0:4dd:7a8e:1cf3 with SMTP id
 cm9-20020a05690c0c8900b004dd7a8e1cf3mr2270585ywb.384.1674405364650; Sun, 22
 Jan 2023 08:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20230112035529.13521-1-schmitzmic@gmail.com> <20230112035529.13521-2-schmitzmic@gmail.com>
 <CAMuHMdWW=5MJZL0ztbPhAp726zX=PoGArQhgXz4fekJQUoCmRw@mail.gmail.com>
In-Reply-To: <CAMuHMdWW=5MJZL0ztbPhAp726zX=PoGArQhgXz4fekJQUoCmRw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 22 Jan 2023 17:35:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa1wdKk2hG3vsa1OCpRhxPV5J9_r=TsNVyvJxOCCHzHA@mail.gmail.com>
Message-ID: <CAMuHMdWa1wdKk2hG3vsa1OCpRhxPV5J9_r=TsNVyvJxOCCHzHA@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] m68k/kernel - check syscall_trace_enter() return
 code on m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 22, 2023 at 5:35 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> > Check return code of syscall_trace_enter(), and skip syscall
> > if -1. Return code will be left at what had been set by
> > ptrace or seccomp (in regs->d0).
> >
> > No regression seen in testing with strace on ARAnyM.
> >
> > Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >
> > --
> > Changes from v12:
> >
> > - prevent overwriting the syscall return value after change
> >   by ptrace or seccomp on 68020+
>
> Thanks for the update!
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.3.

Doh...

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.3 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
