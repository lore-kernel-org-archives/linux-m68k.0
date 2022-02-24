Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E6FC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Feb 2022 09:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiBXJR3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Feb 2022 04:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbiBXJR2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Feb 2022 04:17:28 -0500
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE48B253F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:16:58 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id t25so585297uaa.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NTd9N13TV5CbKXDGdNq7pUdUNNFFvtUDS+ni8CDyggE=;
        b=SAb0xozVDeA3WFdT7dlkCtLyIQnS8zbDR1derc+FR+aylMEG8bwGflNwMF1C4o+AiE
         7StDpzLlHjcXIqjivX+xdlYqQYFcDiOXl7huQ7k+A75feb9MPNIKO/uSMeEdiYqxeHd+
         SE8saDaKr2ygWuE03AVpdXrLp7RgvI4fZkcTOkcrrWG9QFH7Lcxh9A+xZYWf4B8JJjfr
         8rGsL5AMobPW0gv6zDCeiYY6QqJC+/bqwIESto+u74clMTZXmFsRnFD10qPV+FYOiQSo
         kdgTTUEtUMAjuUxD08IeyqBwaGalD3vPBR4yX4OtNnD5APtk0dz56ZZF9E7pmlNG2BSq
         xEfA==
X-Gm-Message-State: AOAM5304czJ66msPf3VromnjNhz3smb3ienHaJb3+kmG5WS4nWMNQDxw
        r0slwnzV05faUqjaOuhEcKBIIz64ViSiYg==
X-Google-Smtp-Source: ABdhPJwbF99ATRYmzOgzlFrKXGpiUBTwSRa9C/RHoPXeql/C0E6pLGEwLYn5DpdvE7AFhCPzJb5vtQ==
X-Received: by 2002:ab0:483:0:b0:33c:8f09:7a81 with SMTP id 3-20020ab00483000000b0033c8f097a81mr705237uaw.107.1645694216987;
        Thu, 24 Feb 2022 01:16:56 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id n77sm309369vkn.29.2022.02.24.01.16.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:16:56 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id t25so585277uaa.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:16:56 -0800 (PST)
X-Received: by 2002:ab0:1009:0:b0:343:779c:f40a with SMTP id
 f9-20020ab01009000000b00343779cf40amr672014uab.89.1645694216310; Thu, 24 Feb
 2022 01:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20220224060448.1856091-1-keescook@chromium.org>
 <CAMuHMdVioQLy_T2LimgWdfWM=j=fomfpayuS1mbXnBLZj4gGQA@mail.gmail.com> <d75f1259c3e64387a161ebcb0448d594@AcuMS.aculab.com>
In-Reply-To: <d75f1259c3e64387a161ebcb0448d594@AcuMS.aculab.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:16:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtQ+B-01ZOwZNvgQ7pndNsP3V90_jHdR=RS4K7O3Vk9g@mail.gmail.com>
Message-ID: <CAMuHMdWtQ+B-01ZOwZNvgQ7pndNsP3V90_jHdR=RS4K7O3Vk9g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement "current_stack_pointer"
To:     David Laight <David.Laight@aculab.com>
Cc:     Kees Cook <keescook@chromium.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Feb 24, 2022 at 10:12 AM David Laight <David.Laight@aculab.com> wrote:
> From: Geert Uytterhoeven
> > Sent: 24 February 2022 08:59
> ...
> > > +register unsigned long current_stack_pointer __asm__("sp");
> >
> > I don't know what HARDENED_USERCOPY does, so I don't know if you need
> > "usp" (see rdusp()) or "sp"?
>
> HARDENED_USERCOPY significantly slows down some systems calls
> (especially things like sendmsg()) by trying to run-time verify
> that the kernel buffer doesn't overrun a stack frame or kmalloc()ed

Kernel stack frame of user stack frame?

> buffer.
>
> I've got measurable improvements by either using __copy_to/from_user()
> (which skips the tests) or user_access_begin() and __get_user().
>
> At the moment the code for reading a compat iovec[] is actually
> faster than that for a native one!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
