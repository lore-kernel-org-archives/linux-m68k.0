Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B909C433E1
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 005B42225F
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 18:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgF2SjF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 14:39:05 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44316 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbgF2SjD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Jun 2020 14:39:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id k6so11361668oij.11
        for <linux-m68k@vger.kernel.org>; Mon, 29 Jun 2020 11:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbomArStHGGFOwB96U9ImuHUu28TpN6/J5W5uAb7OLQ=;
        b=sy0ED7PECysW3bwyWL9dfLaOct38DCo97P7l8BkVNqj0SzIPF3LqtZalTjPOTtsfpn
         LkGMeChwJrS338S6juBAosnVjTtYV10vuTUmRH+5I7BaSewgE9fj8xTrpq0/pXZhY2z8
         iuYG1PI90DNn+TIZQWBZ2y/coPxHwus4j1sKGbf6kBpP/o5OlJK9Kcf31N+vfc3vdCQc
         AYlSOmNH6V2Y30Ene8Y0oMEDjXdYx10E1lyVMH/K5uirJsPmgxqkV5SMJhl9KT7WzJp1
         PKuNEyPToW3qfuDpTuUnfmwFTKmR8wQ6VApmYPXQhZ9NFbEr+z6Z0jysxVH40aE71xIY
         LXNg==
X-Gm-Message-State: AOAM530FyPoq35qH0bBK7ArrR5DJVOseOasvP8jo4svtUiF0ualF8TGk
        /A7zmGrsmflH0zy/Z0iU5gLAsXqNnduzfG8gDJw=
X-Google-Smtp-Source: ABdhPJyC3V1IJo1v+t1dAIJX+gUBWrMuFwQ8ZU6M5W5/wMWg79kX/1iTFPOX0oSpDDVkTQ437IBum7sg961idWVx08M=
X-Received: by 2002:aca:1801:: with SMTP id h1mr8453463oih.148.1593455942681;
 Mon, 29 Jun 2020 11:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <1590878719-21219-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1590878719-21219-1-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 20:38:51 +0200
Message-ID: <CAMuHMdV6v=oMV4WmohYRd+z0N7kMVZq4xcB+KJufuC5xfSc-wA@mail.gmail.com>
Subject: Re: [PATCH] m68k - annotate dummy read in Atari ROM port IO code as __maybe_unused
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, May 31, 2020 at 12:45 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> The Atari ROM port IO code uses dummy variables to implement writes
> (not supported by the hardware) as reads that encode the write data
> in part of the address. The value read from the ROM port in this
> operation is discarded.
>
> Annotate dummy variables as __maybe_unused to avoid a compiler warning.

will add "with W=1".

(took me a while to discover, upgraded my cross-compiler in vain ;-)

>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.9 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
