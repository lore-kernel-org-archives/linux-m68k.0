Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED18C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 10:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbiIZKJW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiIZKIu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 06:08:50 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A51A38A22
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:08:49 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id z9so3996147qvn.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wQTsHrE4DrjLcABGfj6LEXsJg7Ql+9uK2OtUgcnTbVA=;
        b=S/SEVudQV5A9mutLFtFvWqB6qO534T6ZcieCiWshraV8/sQkeAX+0TqqE/4lVYEceZ
         vptTc0B2s4LUmCAQT9IhMH0rSJPaKirvDwtaFowxahsMRldbp0PfD6Gfp5DpRUb67q78
         e3fWy4P7StA5ZE46uHXB7dOSkyXVr9UtcwaQQMKC+CUxEu5Fz20n5cMU4pux4C5XOX54
         c6ie5nI/x/sOHPRCHqOlGUTcLqeyaUQ3O1XTHFJtqhLfTvhlTMl0aMeHF6g+s6yzPbsE
         ay8jV9pXZKpW7xQGdeG4PQCITaILGUE8E5Gdi8re7SAEpxW2+V5snMN6pOtz2JowSTer
         oQkg==
X-Gm-Message-State: ACrzQf0cA8J3F6GaAmuA+Zo4sdcDzrTeY71FItZnENr836xCzQ06T5nH
        oRzcuCyJGOyp02lhvpkAQJQsmuSRrAB6gg==
X-Google-Smtp-Source: AMsMyM7R9NFWw2vATvnowGIc+eiusO/NuUf9PIgBDqPo1qRShBE+H9aZTywDRfyHzz+er95umCkrDw==
X-Received: by 2002:a05:6214:2584:b0:4ac:7f6b:e258 with SMTP id fq4-20020a056214258400b004ac7f6be258mr16507445qvb.114.1664186928552;
        Mon, 26 Sep 2022 03:08:48 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id w17-20020ac87e91000000b0035a6d0f7298sm11284724qtj.35.2022.09.26.03.08.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:08:48 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3450a7358baso62759037b3.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:08:48 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:344:fca5:9b44 with SMTP id
 g9-20020a0ddd09000000b00344fca59b44mr19683884ywe.358.1664186928023; Mon, 26
 Sep 2022 03:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220923170340.4099226-1-Jason@zx2c4.com> <CAMuHMdVJoocGUugnhv=pbgu7z6MFexmRGH1JkQCjm9g-=HiowQ@mail.gmail.com>
 <CAHmME9qnsaUq4PvXM-BW63B=gvgzR3gV6zszEy2VFgzCx=B=wQ@mail.gmail.com>
In-Reply-To: <CAHmME9qnsaUq4PvXM-BW63B=gvgzR3gV6zszEy2VFgzCx=B=wQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 12:08:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsFQC6RKbYO2x+9esf_j6H7ySJhQ6yPocf9feJRN4b2w@mail.gmail.com>
Message-ID: <CAMuHMdVsFQC6RKbYO2x+9esf_j6H7ySJhQ6yPocf9feJRN4b2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] m68k: process bootinfo records before saving them
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Mon, Sep 26, 2022 at 12:06 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On 9/26/22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> The RNG seed boot record is memzeroed after processing, in order to
> >> preserve forward secrecy. By saving the bootinfo for procfs prior to
> >> that, forward secrecy is violated, since it becomes possible to recover
> >> past states. So, save the bootinfo block only after first processing
> >> them.
> >>
> >> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> >> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for the review.
>
> Did you intend to take these 3 patches through your m68k tree, or did
> you want me to take them for some reason instead?

This is all TBD, see the comments I'm writing on the other patches ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
