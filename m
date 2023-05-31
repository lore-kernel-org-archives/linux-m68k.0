Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B56DC77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 31 May 2023 13:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbjEaNBW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 May 2023 09:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236317AbjEaNA7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 May 2023 09:00:59 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CB5E72
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 06:00:36 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-566586b180fso44910347b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685537966; x=1688129966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk0pPTGREGNtqqDFsY8KHF8G7JlW3Q+zzUWS3RUpyQU=;
        b=IujvhLnoPCo8kif/UJEmTWNYBLVd8nLyUYpqCIFLBhk0xj0z/GQG6FuA0tnOiFul/N
         QPDC5yXkwqEtzKNrkQFPVbimWm+WvRPugvOV4o8qWbEs48qHYxBFNksRoc65gZPkhgd3
         ZEVqfP1gDw9kG2KaRsSykfEanjN3eEPfFpiULlMBSE3kLDRUeaKEd9cPXVFKq+kBpiWI
         qyNZMaYm4mQ1loNw/r4wgFXlKivqtse4xkqS0+ZK5dJ8h9WTG3OoXC/D6L0Y+exMZ02A
         o0hnlJtbDMyOtXJ8ZD0XnPsGFAlj9DSarLRksTVD3i++GAJIw+Sara/rIEtsvvYwr4NN
         Ws+Q==
X-Gm-Message-State: AC+VfDwRS9smNvdvFf/68J9ijMb3IgrijrSd6OUgHHpNODlGIC40pL0I
        8NU4ykhYcGfC03MJGx1oqn0oMpoKTTblTQ==
X-Google-Smtp-Source: ACHHUZ4nYly9gUO5Cj4v51VOWfp8mif8fw6kv2uelM+8hh6C8dBELfwM5pyMJKt7FWdS3yWIppOdMw==
X-Received: by 2002:a0d:d9ce:0:b0:55d:edf3:9e0a with SMTP id b197-20020a0dd9ce000000b0055dedf39e0amr5900138ywe.27.1685537965851;
        Wed, 31 May 2023 05:59:25 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id g123-20020a0dc481000000b005611de826bdsm5364427ywd.86.2023.05.31.05.59.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:59:25 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-565eaf83853so48890217b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 May 2023 05:59:25 -0700 (PDT)
X-Received: by 2002:a81:48cc:0:b0:55a:c51:9a15 with SMTP id
 v195-20020a8148cc000000b0055a0c519a15mr6087006ywa.22.1685537965151; Wed, 31
 May 2023 05:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
In-Reply-To: <20230531125023.1121060-1-mpe@ellerman.id.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 May 2023 14:59:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Message-ID: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

CC Finn

On Wed, May 31, 2023 at 2:50 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> The powerpc section has a "F:" entry for drivers/macintosh, matching all
> files in or below drivers/macintosh. That is correct for the most part,
> but there are a couple of m68k-only drivers in the directory, so exclude
> those.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>  S:     Odd Fixes
>  F:     arch/powerpc/platforms/powermac/
>  F:     drivers/macintosh/
> +X:     drivers/macintosh/adb-iop.c
> +X:     drivers/macintosh/via-macii.c
>
>  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:     Michael Ellerman <mpe@ellerman.id.au>

LGTM, as there are already entries for these two files under
"M68K ON APPLE MACINTOSH".
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Which leads us to a related topic: Is Joshua still around?  Should Finn
be added or replace Joshua in the "M68K ON APPLE MACINTOSH" entry?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
