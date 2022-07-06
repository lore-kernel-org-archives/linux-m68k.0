Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E264C43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbiGFJZ0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbiGFJZZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:25:25 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DEA1C115
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:25:25 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id g1so10581894qkl.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FaDAtHQWvfEw5MYYPxQYlNYkXhU2XcrxUemUI7UF4Pc=;
        b=MPe3qd5bPxCyba8mQG8LGyLRJphkCMAANjXtV/8bf/7TaDl4YPam+0Bzh/eyXhLXEb
         53Sw9j9oozWbfZKN33q7xRuvbtpuWWI4HgMkWbICCJrIGZ9m4KIwdz+FnIAM2xOtMwDT
         4zI9YcP6tLca/5GpMdqKXPrArsm1VnGHE2vvVz9+/5WTrNkNKNBZKRW/Q0E0S3VjGmh+
         M7K08zBD3UZN7klcEZUNwZ3jqZtH7eJktxY9XRT5wxhsCxedHWksLf8Db9AsqyNADSFx
         FChfx6XULPtTLzne4M2QT/GnVwJsmHe4W2LrlL2zO/KDY5EiVpidm9j8qVor+azvx0h7
         +Z1g==
X-Gm-Message-State: AJIora+gADdYz9dwwpolEzx657hqUvJ/OT7C3y5reU1qTiyhvaLjOQ+p
        uv7GRIFsO5YHNxJczdtky9COiWv3hXAiKA==
X-Google-Smtp-Source: AGRyM1vFa382azu3n3/OO97HqkxF3VqHIT+Vwm/f6280fZ1BEnl0+w7udJjoLqEfaaRIo9ymNrintg==
X-Received: by 2002:a05:620a:2453:b0:6af:6f18:b432 with SMTP id h19-20020a05620a245300b006af6f18b432mr27568359qkn.54.1657099523955;
        Wed, 06 Jul 2022 02:25:23 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a151300b006a91da2fc8dsm29731535qkk.0.2022.07.06.02.25.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:25:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-317a66d62dfso133845777b3.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:25:23 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr18140330ywj.316.1657099523437; Wed, 06
 Jul 2022 02:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220524075848.21684-1-juergh@canonical.com> <20220524075848.21684-4-juergh@canonical.com>
In-Reply-To: <20220524075848.21684-4-juergh@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:25:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVih0jegzAD32_tNHheGCFavV7RPGtHTtos3=-AX4D2Cg@mail.gmail.com>
Message-ID: <CAMuHMdVih0jegzAD32_tNHheGCFavV7RPGtHTtos3=-AX4D2Cg@mail.gmail.com>
Subject: Re: [PATCH 3/3] m68k: Kconfig.machine: Add endif comment
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Juerg Haefliger <juergh@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 24, 2022 at 9:58 AM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
> Add missing trailing endif comment.
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
