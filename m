Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399FAECAAA3
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Aug 2022 07:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245379AbiHZHjk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Aug 2022 03:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245378AbiHZHji (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 26 Aug 2022 03:39:38 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7569BFE89
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:39:37 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id l6so499621qvu.2
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8MJ15+6jrWJ2J9g6174wUsFTZbWDtPH6U+ThJJMYh+E=;
        b=wQ01PW4L8sjipaBhMaBRLQNGm+ADSK3cjr0Vq7HUOWmq8+MdtjuSaeuQwp4Mm93aZN
         m/H+ujJgJIpkcG6HDUecCzttPm8acEV/qSdOVxrm6N0HTGmGmVi5JcM+lQmYca9GPb73
         eHesohMAz5YhLl2FNg8U5uklQ+pF+QYp9cRCRa49QZhG2BqRBQmwg/xRAyTb/Yq2Ixy/
         /x1WSz8ZkTRw0Dhv6IvVFBm9dFSSy221tdELOoyJOeXJTPhuvJ+a6buiuE5gF4coSw6M
         WNHbjFu0u7q6dxqpRBfvWZBMsGu0hns5McZyxzsRR05JQj4Nruu6tZikxYGHhvi0K9yS
         OJfQ==
X-Gm-Message-State: ACgBeo3i+xgMVg3rOrVkRmSxQS0EAfshpynAcxJPhuL9zplZNl9Q6ulm
        M+0nsOOilJayuCzDoOpGb9eYdDXgaM6KuQ==
X-Google-Smtp-Source: AA6agR6GVU5fJTL3kKtEaFqBcN27UNcKyzc8rDwOcEiTWVoax4d/uhx+18K+TZ1EbGzarlvHqP+7dQ==
X-Received: by 2002:a05:6214:29c2:b0:497:8b2:442 with SMTP id gh2-20020a05621429c200b0049708b20442mr6807480qvb.97.1661499576608;
        Fri, 26 Aug 2022 00:39:36 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id h3-20020ac87d43000000b00342e86b3bdasm858856qtb.12.2022.08.26.00.39.36
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:39:36 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-33dbbf69b3dso16437477b3.1
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:39:36 -0700 (PDT)
X-Received: by 2002:a25:778d:0:b0:696:4bb6:9aaa with SMTP id
 s135-20020a25778d000000b006964bb69aaamr4203561ybc.380.1661499576132; Fri, 26
 Aug 2022 00:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220826040302.3455339-1-gerg@linux-m68k.org> <20220826040302.3455339-2-gerg@linux-m68k.org>
In-Reply-To: <20220826040302.3455339-2-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 09:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAiKAn0+9BQedJTkb0w_=r54bu1FpGDeEV--NZi0QKOA@mail.gmail.com>
Message-ID: <CAMuHMdWAiKAn0+9BQedJTkb0w_=r54bu1FpGDeEV--NZi0QKOA@mail.gmail.com>
Subject: Re: [PATCH 2/3] m68knommu: fix non-mmu classic 68000 legacy timer
 tick selection
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Aug 26, 2022 at 6:08 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> The family of classic 68000 parts supported when in non-mmu mode all
> currently use the legacy timer support. Move the selection of that config
> option, LEGACY_TIMER_TICK, into the core CPU configuration.
>
> This fixes compilation if no specific CPU variant is selected, since
> the LEGACY_TIMER_TICK option was only selected in the specific CPU
> variant configurations.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
