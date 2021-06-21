Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E67BC48BE5
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 16:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63C6661153
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 16:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUQI5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhFUQI4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Jun 2021 12:08:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E33FC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 09:06:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a11so18031147lfg.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=grhn+4m03Hl/IKclIMEKcZj1BLiA+WR5DwYi+XwSseA=;
        b=Q+nWm9WmmmSMbAxOkMaCB9u9prznIbKgUSttcPTWKdMtZ0odlvJvuPtW7JSazKaLeU
         cUPduhuCaDSDV5BTOvqkmm6hpl1DHLT5xIUhJ6DyinLbPrgEFXS3Mk2MEy94+LkhkW80
         T4Lwo23p+PNIoBoAY6ZkmX/O+y56kyOcECF3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=grhn+4m03Hl/IKclIMEKcZj1BLiA+WR5DwYi+XwSseA=;
        b=ZNk0VnWOwXa1SoV6qlR7+swJwuIcX3YwqpMt/7WzRYExGorCKK27m3UiVM2pgU8eN3
         JhqawRg4uzd31ZExY07j6JCVclPBb4FapbTyWHczF+VxuzMXRrAJ1XB/w+xo7sOZy/Sb
         QbnC2+9t5ouV0p5XiwiVafisCriqQbCgka3ctGIbLr08AZhJ5KMevDCzm7pvz0q3D/Ee
         PG2EGoYGsCpenHoR7AfxHJfZGR3zWbPYfQJefZ6YLjLhIyIS8vPXzBHLaNak0L164tY3
         YNsSow/c1bCNbDD5GL7aaRqvFfonlBD7KnCUDiciVt0LirWKDP+fjPLcLFlHb8ZDO/vW
         cizg==
X-Gm-Message-State: AOAM530Cz8xuIJ5wEUrHNzo9lF2eAWj0ClzPxU9/0TIuZwCmBxotQ0vO
        JlIMATM2COqN+J422HhR2Vr/JZfldrqFxYir0Us=
X-Google-Smtp-Source: ABdhPJz94Yk/aZKaAgAdX7+ryUt8jC1GwmJKcX0weZMEYRpSXt2DZ2Wd3EpC4knG7w44WerKJf3vtg==
X-Received: by 2002:ac2:482a:: with SMTP id 10mr10454127lft.297.1624291599569;
        Mon, 21 Jun 2021 09:06:39 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f21sm1292513lfj.256.2021.06.21.09.06.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 09:06:39 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id p7so30923454lfg.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 09:06:38 -0700 (PDT)
X-Received: by 2002:a05:6512:baa:: with SMTP id b42mr14369828lfv.487.1624291598641;
 Mon, 21 Jun 2021 09:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <1624176865-15570-1-git-send-email-schmitzmic@gmail.com>
 <1624176865-15570-3-git-send-email-schmitzmic@gmail.com> <1547f9bc-441-6cfb-ad7c-57f7584dd63@linux-m68k.org>
In-Reply-To: <1547f9bc-441-6cfb-ad7c-57f7584dd63@linux-m68k.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 09:06:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2COuoJM822vRSxu8Wny6Qpe-XvpSyJhPJKMeXdYXe5w@mail.gmail.com>
Message-ID: <CAHk-=wh2COuoJM822vRSxu8Wny6Qpe-XvpSyJhPJKMeXdYXe5w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] m68k: correctly handle IO worker stack frame set-up
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 20, 2021 at 8:57 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> When the patch author is not the message sender, the message (commit log
> entry) would normally begin with "From: Author <author@example.com>".

Yes,. But in this case (as, honestly, with most of the trial patches I
send out) I'm perfectly happy to not get authorship attribution.
That's particularly true for something that I can't even test, and is
to code that I don't really know all that well.

I'm a big believer in trying to make sure people get proper credit and
attribution, but I'm also the one exception to the rule.

I get too much credit already, I don't need it for the patches that I
send out that are "I think something like this should work" and then
others do the heavy lifting of actually testing them and making sure
everything is good.

                 Linus
