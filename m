Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70525C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D994206F1
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732341AbgF2TXy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:23:54 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41088 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732329AbgF2TXx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 15:23:53 -0400
Received: by mail-ot1-f65.google.com with SMTP id k15so16495581otp.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 12:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrPnCljU1860yCGZIfPUioryws6wJRVJxy4Gh2bbc3c=;
        b=LlM6r344bqKWfy0XxBMl3dp3ulYNdDZ4RXhhD3rd4SlyAHzuQt76yjc0CxybmMvOdo
         +8hx+EG6o0pC/fstaRItxfS7oQX0LTm/4lRpUwW2Vr+Md42UEYejDQy/C/D6D2sYEZ0V
         4q/cPhQmUNlq02jfegSx33sxqBIbAchgBEldD+1Y6Mw3jdj6ZGZTwq26bbIkIAmqikbF
         CbOpmlwo+VoFLHvDgzH7ajNrespJY7hd9Ccq67Rh7lYRIuyyWP3jev/PpkLCrPJ3/rQh
         b+6eEFobfl/DVFdr7MfbCKIJSOogbN3bgZeBSS14d/9g4TmF4+4NkpAbUk48L9bOW5lG
         yttQ==
X-Gm-Message-State: AOAM5311bkcU7LuQz1s4nHkV13vqWuDk/A6rxaa44vT85gkMxaRmBF+n
        Z+uJBykVfQUXGbOtEUb/B6WPmLHdSxtV5o8LhbQ=
X-Google-Smtp-Source: ABdhPJxl5plHICTtaYzkf/9wUMt3eBpkHEi9OIvkAEvJIIE6HqxUGfA7Rl+748M1U69XR99GMumWGAOY5A6eTlzYHLk=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr14673780otk.145.1593458632754;
 Mon, 29 Jun 2020 12:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200617031153.85858-1-masahiroy@kernel.org>
In-Reply-To: <20200617031153.85858-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 21:23:41 +0200
Message-ID: <CAMuHMdX0ZFV8fScH+pCCRU4MqmidxGkymbz0XdxH6oY5-2xvzQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: use CLEAN_FILES to clean up files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jun 17, 2020 at 5:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> The log of 'make ARCH=m68k clean' does not look nice.
>
> $ make ARCH=m68k clean
>   CLEAN   arch/m68k/kernel
>   [ snip ]
>   CLEAN   usr
> rm -f vmlinux.gz vmlinux.bz2
>   CLEAN   vmlinux.symvers modules.builtin modules.builtin.modinfo
>
> Use CLEAN_FILES to simplify the code, and beautify the log.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.9 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
