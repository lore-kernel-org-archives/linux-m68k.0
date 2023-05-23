Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC47C7EE23
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 12:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbjEWMFj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 08:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbjEWMFi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 08:05:38 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BBD119
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 05:05:29 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55db055b412so68614117b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 05:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843528; x=1687435528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4ahAcHn3pk25oWMINMFj6HUYrG1pckCHQI/m37jHT8=;
        b=eKOdUP7lPnzIHTkKr063BPzheQN4EF+3xuTlcwY2qGzZ4tzHcr+QiOLZtIx+8wPeO7
         dlpMtgXZWa9C3MB61jhUlJP+eCEXyjBv2VNZNtGCJOJt9TLbVY66BvYIRx6T0e8UBnHT
         7GhLUP03YRcztZTFS2ycAWGbW1dGKtPi3cB4SLfm5JITtFDdJPgbvJz0WT2ZOt+GE/jM
         JbPhWn2vPg2YSWoRepbY+s09MhSkzw4Kp3I9EVL9CcCG2ehlQ1mwTAQBbJuwK4e5Kjih
         1Wm615ogvZ6iLBLa8k9nvVlm0ugl3lmgOYPptekejykSx3UkLE+uOx9I5CCy1PQ13swO
         eFxQ==
X-Gm-Message-State: AC+VfDxVuvSnF5WbhwWde1vXHOytkTevpuHo7CdWnCLAKMIJC6A3iN7i
        FfvSj6FYoB2uo8+xC9uj3+fHT4NOUxLSkA==
X-Google-Smtp-Source: ACHHUZ6Ogo/Opz6Sj3mHBV6EPdPnUNgtXQjrHBCBOjFaRsVCy17QFFWkJcT3hpYbbl4TZPdnQg+DNw==
X-Received: by 2002:a05:690c:80f:b0:565:57c9:ca30 with SMTP id bx15-20020a05690c080f00b0056557c9ca30mr622433ywb.3.1684843528432;
        Tue, 23 May 2023 05:05:28 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id r190-20020a0de8c7000000b0056189f9ec2asm2830752ywe.133.2023.05.23.05.05.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 05:05:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5621a279cbbso70428027b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 05:05:28 -0700 (PDT)
X-Received: by 2002:a81:a156:0:b0:55d:820f:11e7 with SMTP id
 y83-20020a81a156000000b0055d820f11e7mr14014339ywg.2.1684843527952; Tue, 23
 May 2023 05:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683365892.git.fthain@linux-m68k.org> <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
 <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com>
 <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com> <ee3cdd7b-c2b7-792e-e6ad-39fc6a1f817c@helsinkinet.fi>
In-Reply-To: <ee3cdd7b-c2b7-792e-e6ad-39fc6a1f817c@helsinkinet.fi>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 May 2023 14:05:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmaw9J1TfawD_wkmpww1tDtGqA53wrnwsJyoZzSDUdSQ@mail.gmail.com>
Message-ID: <CAMuHMdWmaw9J1TfawD_wkmpww1tDtGqA53wrnwsJyoZzSDUdSQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] m68k: Move signal frame following exception on 68020/030
To:     Eero Tamminen <oak@helsinkinet.fi>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eero,

On Tue, May 23, 2023 at 1:40 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 23.5.2023 4.11, Michael Schmitz wrote:
> > On 22/05/23 23:41, Geert Uytterhoeven wrote:
> ...
> >> I plan to send this upstream later this week, so any additional
> >> testing would be appreciated.
> >
> > I've given this some lengthy stress testing, and haven't seen it fail once.
> >
> > In contrast, various attempts of mine to improve on the concept (by only
> > moving the signal frame away from the USP in case it's likely to clash)
> > sometimes came up against a kernel bus error in setup_frame() when
> > copying the signo to the signal frame. I must be making some incorrect
> > assumptions still ...
> >
> > Limiting the signal frame shift to bus fault exceptions that happen
> > mid-instruction is not too much of an overhead even in low memory
> > settings, and using 256 bytes (the largest possible operand size, i.e.
> > the largest adjustment to USP that might occur on completion of the
> > interrupted instruction) did not seem to cause any issues with stack
> > growth either.
> >
> > I can give this some more testing in ARAnyM (extending the stack shift
> > to format 7 frames) but I'd say it's got as much testing on 030 hardware
> > as we can do.
>
> Aranym emulates only 040 (without CPU cache).

Hence Michael's comment to extend the stack shift to format-7 frames,
which is what is generated on '040 in case of an access error.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
