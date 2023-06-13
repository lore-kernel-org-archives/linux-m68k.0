Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71815C88CB2
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 07:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238329AbjFMH3M convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbjFMH3L (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 03:29:11 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14A29B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:29:10 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-56d1cb6a607so25707487b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641349; x=1689233349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKEzJjzBKla4S0x8jxwIAxVSx314J/aF9PC4BBXNBUc=;
        b=AZBql3RZ4wqlS6WYKZme4/j2SZVfpuMFoJbxiaDYaixsp4pAeURXvyLXqz+A5zKNXA
         EYLjMAPOo5ozTx/qRpFrjgl4rsMsv4HHGfrEyZkVK+t3urAN63xiAihPZW2+7ruU/dJM
         3kKhaFcDhVn5ujazrEDpxP2+cnsZjtF/+XQCtS/PVqYWjZixxXRQU7XpJuvcn+vJ6x5i
         SdgPTTOEiKo/gjgdoiQDZpJ2ivlbAI6nWEP6QWs6Iw8wRXyUAmGj1oORGj/xzoa2j6u0
         3bySmJRdAjsluM68n1LWVGIKno0OmkGpB//MrGYc5QJB2txD9iEQZxosXAo+Jy3XfNeQ
         m8Nw==
X-Gm-Message-State: AC+VfDyijf6EdQQ0ifcWwQPhfrWOUhDMbDn7CyO8Rehj746iVra5+C/F
        fGH04C6hF5CJOANBJwJ7ntQsjlOlGtiHGg==
X-Google-Smtp-Source: ACHHUZ6F29Yg8Xvmb6x5YEGhTmzjsUSNHAe9A6ZLQBGjG5g1tbUx13fPr6EytksHfW3Mv9c6fSr2Kg==
X-Received: by 2002:a0d:ebc4:0:b0:56c:e4ad:45a6 with SMTP id u187-20020a0debc4000000b0056ce4ad45a6mr1059985ywe.15.1686641349613;
        Tue, 13 Jun 2023 00:29:09 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id j142-20020a819294000000b0056d1de0a154sm1337754ywg.37.2023.06.13.00.29.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-56d304ef801so19437527b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
X-Received: by 2002:a0d:d611:0:b0:56d:ddc:cdbb with SMTP id
 y17-20020a0dd611000000b0056d0ddccdbbmr1077781ywd.25.1686641348561; Tue, 13
 Jun 2023 00:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com> <20230612210423.18611-26-vishal.moola@gmail.com>
In-Reply-To: <20230612210423.18611-26-vishal.moola@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jun 2023 09:28:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Subject: Re: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
To:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 12, 2023 at 11:05 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
