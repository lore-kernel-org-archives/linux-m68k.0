Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615BFCD37AD
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Sep 2023 20:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237806AbjIOUtz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Sep 2023 16:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237730AbjIOUtW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Sep 2023 16:49:22 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7517272A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 13:48:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59b5484fbe6so28805607b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 13:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694810933; x=1695415733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fe+fqfIjcOfCW6NskWKgMVJO3w4J1C4yBJg4t96fIc=;
        b=BroB315+B8DYSxNvhJt9WwXsFSsNUvPc3Q8sJ+L4AGS5tF/qXXfeN0mfJyQA2ni5Wz
         VXEHnhs+L+uFFPyJ7LqgscAc4J0VU/jVIlhRfx0L9+lE94Jx+bb+0xG6JPae+ljRynAw
         7zyPxrTfwSzaLKEL0Ep2gtMJMCLdl+P3JyX7KYOuOm5dWu3SobsCS1WRqjQXfHVNyIMv
         Vu3ZYrxcnHZHGP3ZBuOslSVrojSMg3wJBn90TIp28OXLo4AfXCiQYmgiotvNZ87XAC2Y
         IzWFW2YbRZxba0wnJfZfbSPQdJnSkxcEBur6lAwyiJ1MbEO1lfQKg7dCgB30GO9n3qB4
         79fw==
X-Gm-Message-State: AOJu0YwviXc1dOCS+IaE8oup2PLjRt1QTv/Qnx9IfSsbMY53EqCis+Zl
        C1ZhnT76yac5Za0SErXPdI4xGWbxVlJ2Kw==
X-Google-Smtp-Source: AGHT+IH5e3iBiMv1UX8VoON0zjmShS5pTy+lzrFyg9iOqITznLchle0sHgmErHd6cnb9tBMu+sfg5w==
X-Received: by 2002:a0d:ea97:0:b0:58f:9cd8:9e4d with SMTP id t145-20020a0dea97000000b0058f9cd89e4dmr2966517ywe.46.1694810932874;
        Fri, 15 Sep 2023 13:48:52 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id hd4-20020a05690c488400b0058427045833sm281426ywb.133.2023.09.15.13.48.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 13:48:52 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59c0b5f984aso12917327b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Sep 2023 13:48:52 -0700 (PDT)
X-Received: by 2002:a25:d883:0:b0:c39:9e09:2c71 with SMTP id
 p125-20020a25d883000000b00c399e092c71mr2809726ybg.41.1694810932065; Fri, 15
 Sep 2023 13:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230915082416.3949600-1-geert@linux-m68k.org> <CAHk-=witemuuUen2Gr_+uUq1nSWb=MxNVTXS2f2hiTeqfywKrQ@mail.gmail.com>
In-Reply-To: <CAHk-=witemuuUen2Gr_+uUq1nSWb=MxNVTXS2f2hiTeqfywKrQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Sep 2023 22:48:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU07_UtjfAASmVhOxO4zTFQuiS3dGjXKwz+bP6dxJ12Fw@mail.gmail.com>
Message-ID: <CAMuHMdU07_UtjfAASmVhOxO4zTFQuiS3dGjXKwz+bP6dxJ12Fw@mail.gmail.com>
Subject: Re: [GIT PULL] m68k updates for v6.6 (take two)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On Fri, Sep 15, 2023 at 9:32 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, 15 Sept 2023 at 01:24, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > m68k updates for v6.6 (take two)
> >
> >   - Miscellaneous esthetical improvements for the floating point
> >     emulator,
> >   - Miscellaneous fixes for W=1 builds.
>
> This is not appropriate for a "fixes" pull. It's about an order of
> magnitude bigger than the pull you sent during the merge window, and
> the merge window is closed now.

Fair enough.

Perhaps I should have given more background: Arnd is working on enabling
more warnings from W=1 by default, so I thought I'd rather fix the
remaining issues on m68k sooner rather than later.
Anyway, they can wait...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
