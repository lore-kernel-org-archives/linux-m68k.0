Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4DDC636D7
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 14:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjBUO4N (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 09:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234219AbjBUO4M (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 09:56:12 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A3C2B2BB
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:56:07 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id w23so4539762qtn.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H9rlM93o7YjCNFLq7PoSUH/JUrct3uXhYzV1vYyc7E=;
        b=Jt1SBMPTBa20bJYiFLtCNKkhhOip9C0Y+qP+Lq0GT/cuHn42vU1OQJUXVGQydIy2Px
         XwW/rgJ36YiLaDAN4waIoWYm+7cffYZUNMDndKBFagRFDqM/FCUFPYhNyChrYgp9kAkg
         QPVsN9+ur29dICbGfK9nHKSX6wa7PDVyZ/Y4JLXlojKSDKlHbmL4YGg3Q33mf+kgL3LD
         0JWuJmW47z0fRcqGF3UD5bDdIkxuvkBpH//XH8LDrg1i+gAKsVERnOzK+/VvYpPgCv3n
         s6F3vSKJYMqxoFioUL0Ljpk5XNh3qscPsURedec7vJ44Ss30IuOR57VAguAPZIfH+m57
         z3Qg==
X-Gm-Message-State: AO0yUKU4tbOTbAYCmyJQVgTse0qbRl9PvGsdJkOaaGa7A8Ef+6pPkRdM
        /jyfFuLCbKrBPbgvg+zIQs1eHYgqjAaUDQ==
X-Google-Smtp-Source: AK7set+PgArTDv13S3cnbXWc+5SU+6ZNpkIdDFfjDv9gEZnJoN20o45kWe6LEJoMI4qZbSxwvR//bA==
X-Received: by 2002:ac8:5714:0:b0:3b6:3ab8:6396 with SMTP id 20-20020ac85714000000b003b63ab86396mr8434017qtw.36.1676991366173;
        Tue, 21 Feb 2023 06:56:06 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 1-20020a05620a040100b006fbb4b98a25sm2889587qkp.109.2023.02.21.06.56.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 06:56:05 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536c2a1cc07so51947797b3.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:56:05 -0800 (PST)
X-Received: by 2002:a81:d351:0:b0:536:e16d:23ea with SMTP id
 d17-20020a81d351000000b00536e16d23eamr139016ywl.526.1676991365618; Tue, 21
 Feb 2023 06:56:05 -0800 (PST)
MIME-Version: 1.0
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
In-Reply-To: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Feb 2023 15:55:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
Message-ID: <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Feb 21, 2023 at 3:51 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> I tested Debian's most recent m68k kernels from the 6.0.x and 6.1.x series and

Thanks for testing!

> neither of these boot on my Amiga 4000/060. Both get stuck at the ABCDGHIJK
> message.

Looks surprisingly similar to the issue reported by Stan.
Do the mitigations given in
https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
help?

> FWIW, I noticed that the kernel image itself is already over 7 MB, not sure
> whether this is a problem.

Depends on how much RAM you have ;-)

> Anyone else tried a recent kernel on their Amigas?

I really should start booting on real Amiga hardware again...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
