Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D6AC77B6F
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 07:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjDKHVY convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 03:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDKHVX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 03:21:23 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280C6F9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:21:23 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id h198so13555745ybg.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681197682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQGfLVrq2H2KryLTDW+SJAq2e67g+unw+N0J7gMgi0k=;
        b=NXnN5CxjyokHhufzgePthhyIYoKGxzlRCtMcbDpuhBDnk8XLTw6aG5XvYxh31tHnTM
         GTfFftJKTIGF+aXG3VIwfue0337rTybCZrEuld625CWuO+tryPPPszNPqZpcHrQrWG7z
         nQjYBn6LJLeFrgoZ4fpukg/PlvKaBd7Yri4BGhQq0ETPE5+pK69CikTxHhxD5VHoXAuZ
         7IqOfY4gp8sFoUmgMGS6YFQtaeWtDVojyw/ZjGxWPJI9+/xZzXVw1pCQTtMDUx9dwu2L
         27Xn1F8OpjxbXCcgc7+p3DLuh/GlwcKGp+UGqUpu6ewV9mxTmUnm0kxBz/ks9DxYuQti
         XKqQ==
X-Gm-Message-State: AAQBX9cmaPkiWeEVPbf8TqCwPFcEJ5NYs6WZrgQSX4eppa5DOr2tzHwR
        PKS2ZzEi7BrwyDLFUF5/+dfzQHC69WTzZw==
X-Google-Smtp-Source: AKy350atXt4273GH7XdRpjOKND4XjXdcNrvGLuXtkEtNcTHKmFUuN5raB+orGci2SBuLMmXRYQjvig==
X-Received: by 2002:a25:a4c2:0:b0:a1f:b582:fe5c with SMTP id g60-20020a25a4c2000000b00a1fb582fe5cmr11952869ybi.51.1681197682091;
        Tue, 11 Apr 2023 00:21:22 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id y72-20020a25dc4b000000b00b8ed7b61526sm1951053ybe.1.2023.04.11.00.21.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 00:21:21 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y69so13944532ybe.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:21:21 -0700 (PDT)
X-Received: by 2002:a25:7654:0:b0:b8e:e0db:5b9d with SMTP id
 r81-20020a257654000000b00b8ee0db5b9dmr3490915ybc.12.1681197681317; Tue, 11
 Apr 2023 00:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
 <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org> <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
 <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org> <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com>
 <6f2c6c5b-7e9d-94f2-98ba-9a1306f131bb@linux-m68k.org> <df1f56d3-ff3a-a4bf-290f-7f43f60ba45b@gmail.com>
 <dcad89d6-d535-4e07-0fff-c9070af3519a@linux-m68k.org>
In-Reply-To: <dcad89d6-d535-4e07-0fff-c9070af3519a@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Apr 2023 09:21:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWAzsN0L=T3FBcb1Thj-WqNJe04FS6ujMvRTy5OaWzbQ@mail.gmail.com>
Message-ID: <CAMuHMdXWAzsN0L=T3FBcb1Thj-WqNJe04FS6ujMvRTy5OaWzbQ@mail.gmail.com>
Subject: Re: kernel behaviour, was Re: dash behaviour
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Tue, Apr 11, 2023 at 6:59 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 11 Apr 2023, Michael Schmitz wrote:
> > We don't know for definite that we deal with a suspect user space
> > program - it might just be a change in a previously fine program that
> > now exposes a subtle kernel bug (undetected for quite a long time, but
> > we've seen a few of those now...)?
> >
>
> That's right -- the kernel is also suspect. As is glibc. I will keep
> looking for some way to narrow down the search.

Or the compiler...

https://lore.kernel.org/all/CABVgOSmgpkktiLkU-ic0xGitDOhep+3sb5X91hb8RNEzFauhAA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
