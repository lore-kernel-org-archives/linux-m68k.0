Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5101AC001E0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 14:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245606AbjHPOzw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 10:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343842AbjHPOzW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 10:55:22 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600952716
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:55:18 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bd045336c6so5826534a34.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197717; x=1692802517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tf06pj+19UjpKnAon6148kouUgaKWETT51HYndVh5do=;
        b=Qq1DTOHSNUGpz+jW7F4ZlSNreY2kV0k5u1AnwDKPJMW5xGCFtH+ZLBg7jYfleRVl9V
         HnMtEz4nAb7fivnncPN+WULgxFoXeBWxHBOca+6shC2e5JL/HMqIH15pYRCiXaVOPK66
         tssT7jGYwE/+uxiUJjU1SSHe1NlLJYLZyu71HVzkZm0d6vAlvbLzhQsUNSm2moLULRhj
         f6nWLL6q/NpQ6l5n8+FNxTNtyqLCQx2PgkZWfGGP1Cu/JhCCGCQVj9g3UAoatVwwQww8
         jXBwfKruPQPGk1xhQPYEpjKmr2z9h7wdWG+qOxfFneE4hWebefe/YWKc0BGja5Hb40HZ
         T2Fg==
X-Gm-Message-State: AOJu0Yzc7e+izQ97CH8bGf0uOiNaLx1A+MkTM/ar2qeQfW/pqIaVvavi
        2zrxp+EBSjm4Wwo0DkyLx8UNNEoDy7ehWw==
X-Google-Smtp-Source: AGHT+IGCn4Q31ueyGYXVX+qAXapGJkRB5kfItJ8IAMk+5dQIS64sC3zMmUErayUqimW8KklLk9yAbA==
X-Received: by 2002:a05:6830:445:b0:6b9:90db:f6ed with SMTP id d5-20020a056830044500b006b990dbf6edmr2010528otc.11.1692197717320;
        Wed, 16 Aug 2023 07:55:17 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id v22-20020a9d5a16000000b006b9cb784553sm6116983oth.36.2023.08.16.07.55.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 07:55:17 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bd045336c6so5826518a34.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:55:16 -0700 (PDT)
X-Received: by 2002:a05:6830:1bee:b0:6bd:603:797f with SMTP id
 k14-20020a0568301bee00b006bd0603797fmr1895493otb.37.1692197716644; Wed, 16
 Aug 2023 07:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230807153654.997091-1-masahiroy@kernel.org>
In-Reply-To: <20230807153654.997091-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 16:55:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1gXTNsy2+wXo4v19fE9yUtCXdh21wJsfH-Pcppf3tPw@mail.gmail.com>
Message-ID: <CAMuHMdX1gXTNsy2+wXo4v19fE9yUtCXdh21wJsfH-Pcppf3tPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k: replace #include <asm/export.h> with #include <linux/export.h>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 7, 2023 at 5:37 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
> deprecated <asm/export.h>, which is now a wrapper of <linux/export.h>.
>
> Replace #include <asm/export.h> with #include <linux/export.h>.
>
> After all the <asm/export.h> lines are converted, <asm/export.h> and
> <asm-generic/export.h> will be removed.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.6 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
