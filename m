Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FA6C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Oct 2021 06:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC179613A0
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Oct 2021 06:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhJDGtg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Oct 2021 02:49:36 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:43793 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbhJDGtf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Oct 2021 02:49:35 -0400
Received: by mail-ua1-f47.google.com with SMTP id w2so558308uau.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 03 Oct 2021 23:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkQyyOwNhUveMKMLyLtnL30fGuoMI6Ske0DgXTygTcg=;
        b=c896Fda4BMiUSjVKnxv4fqcIp0DabeADxVuMfj119aqYqjcmqEuHf8GVxSGviYrziM
         f1wiF3oNSo79IjDDV+j0EfzX5/LGAWqLPz4cxxKB17YcEe0y5OJ+mxx+cbhpi0ICP/DS
         CJsPEkh4bCYv4pKDNX873hP8P4KWnvtfdVB8R0QqrRAckTcE4I16wuT112iWztdTMceo
         FGp4U6GXD4tP52SblmRrxDUo1CjY0aRIx0ia3pvkLfh2E6XvmdwRPrLMUMNgEo2Navww
         75VZrW8lVOsWrcNEGUokLHqXNPqK+RJpyxcsjruts2xYutxdXCvRQch0zdBwQyT9R6ug
         /j+Q==
X-Gm-Message-State: AOAM533+qMa/mp0m7o290mp17qUlXUYvLL/WzozUzlK6WPWD5f63dCaM
        eCk96a9bqe/HICPc2Qd85o2ZpY8s/NwLv6Rypf8=
X-Google-Smtp-Source: ABdhPJzekemMTDmOcZmAwc8VjcdhOBpqy9LccBnGIanXqRsFDCR1FNoQwvmiBHwkI3zP0T0FAw6AH1Y5YyKf1zNYeb8=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr5140985ual.122.1633330066468;
 Sun, 03 Oct 2021 23:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211003000223.25769-1-rdunlap@infradead.org>
In-Reply-To: <20211003000223.25769-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Oct 2021 08:47:35 +0200
Message-ID: <CAMuHMdWxZn85bk9MuMfW1K_k4v68t4duvJtVHgArdqgawxf78Q@mail.gmail.com>
Subject: Re: [RFC PATCH] m68k: set a default value for MEMORY_RESERVE
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Oct 3, 2021 at 2:02 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> 'make randconfig' can produce a .config file with
> "CONFIG_MEMORY_RESERVE=" (no value) since it has no default.
> When a subsequent 'make all' is done, kconfig restarts the config
> and prompts for a value for MEMORY_RESERVE. This breaks
> scripting/automation where there is no interactive user input.
>
> Add a default value for MEMORY_RESERVE. (Any integer value will
> work here for kconfig.)
>
> Fixes a kconfig warning:
>
> .config:214:warning: symbol value '' invalid for MEMORY_RESERVE
> * Restart config...
> Memory reservation (MiB) (MEMORY_RESERVE) [] (NEW)
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # from beginning of git history
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

As this is relevant for m68knommu, I'll leave it to Greg, unless he's too
busy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
