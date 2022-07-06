Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0804CC43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiGFJZJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbiGFJZF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:25:05 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3693E1D0D2
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:25:04 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id h19so17391155qtp.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J7X22/F6gzh/+so/Ni9is1UKMSi5o3TOeyFWgFdTdAM=;
        b=Lqq1fzzbhu2MMiJCbyyWVuB4D/Xma59GS/jxYlwcfRUBjr0VtFD/d233BqEjNI6e3p
         P7As5PzFO0gNqWIfXQcjkUYxujQjS5uEKnHwbK0b9Ird9bWU5HzBgYz58M3IyVQ7f+rP
         vTeoGr+hJj4LGtHWX/MD+g0YpCmnkE4jtLdsJ18dnbkAnHmQ8kaI11inrG7WqzlfTQa9
         bJVH1/fmXT8tiz2o5e8H+tQ37Dneni7RjiF7UUuY/68X7xGfcSKrOkW1cAaMPGpRiO7Q
         1+p7TQhgyF1mtLIa27/q+yJPYKy1dAPaKThRL2tMoNcuUCGnbq5oRjk67F2N153EfMRi
         lwFw==
X-Gm-Message-State: AJIora+4AgyvGsNN9wTtP79nCprXvgbWcx/wVd9WYyxvdJipOWhURk1W
        2hO9FMRThlL19Q9NunuUmDZse5l9dja2Ow==
X-Google-Smtp-Source: AGRyM1snVr/+ujXgSEWaLwfek5kCzgVLY7jH4X4zlkGwluBqKIqeHjLg5q323ZzJYDZIwzGE7TxkrA==
X-Received: by 2002:a05:6214:2307:b0:46e:5fbc:3c30 with SMTP id gc7-20020a056214230700b0046e5fbc3c30mr35075753qvb.21.1657099503150;
        Wed, 06 Jul 2022 02:25:03 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id f8-20020ac84988000000b002f93ece0df3sm23679315qtq.71.2022.07.06.02.25.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:25:02 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-317a66d62dfso133837957b3.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:25:02 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr16422508ywq.384.1657099502581; Wed, 06
 Jul 2022 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220524075848.21684-1-juergh@canonical.com> <20220524075848.21684-3-juergh@canonical.com>
In-Reply-To: <20220524075848.21684-3-juergh@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:24:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOHVO7Vte0FAMEhx=xRLRqjXsKqNR6Bz0TLqPDWddt9Q@mail.gmail.com>
Message-ID: <CAMuHMdXOHVO7Vte0FAMEhx=xRLRqjXsKqNR6Bz0TLqPDWddt9Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] m68k: Kconfig.debug: Replace single quotes
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Juerg Haefliger <juergh@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 24, 2022 at 10:03 AM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
> Replace single quotes in strings with double quotes to match the majority
> of the rest of the kernel's Kconfig files.
>
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
