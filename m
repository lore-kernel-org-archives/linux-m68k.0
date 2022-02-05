Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C31AC433F5
	for <linux-m68k@archiver.kernel.org>; Sat,  5 Feb 2022 08:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354330AbiBEIcF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 5 Feb 2022 03:32:05 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:36555 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbiBEIcF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 5 Feb 2022 03:32:05 -0500
Received: by mail-ua1-f42.google.com with SMTP id v5so3712604uam.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Feb 2022 00:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7YGDXhWoC0YDK4LN4ffYmnnoBIU82UZ+ZgHex0wJpV0=;
        b=vIBzQ1UORF77MitVCzDE7xdNIE/ROJQ9K6EhBkVZ6N3OI6VufLkIVr6zIT8MohcXIc
         eQMOGQleuO3htWvnxUiEn4ZIqK/VogkmR+KRhCItLJtskZFENPDExQ0R0E66gOTEuhzs
         3bHTgQsW7lW/MDI3jIG+nKgz350NQZlHC1goglqium6nDNO3qFspCCXCjxOHECCQzUIC
         TcPA5sIvZ/FWHbvkW0oOcLeTkuj8kqbOrFdkhmIZHOkTkbZ2RLpzkJfvOCFWY/Q9+f3q
         bLtnhmdYmBVGHZzFT9Z7UQTfTi5aHa+5FZ5WVZcSKVkh2mDlI+jTdP7aGyJtIz8lCl9h
         KnyQ==
X-Gm-Message-State: AOAM531FjHt8qcKj+aNjO7MzDSHKxqAQjHlGc4RaQh00l+Rql1UvqHrm
        aMsLnNdXjMdrsjQIE1avLArbpfPTiJCeiQ==
X-Google-Smtp-Source: ABdhPJzqaQI3OOv/1l3TAPvnmt2gDacDCmOll2gcl/G51drg6Jtw83JZWGuCDP/ogqdmWUQIEv0o/w==
X-Received: by 2002:ab0:b8b:: with SMTP id c11mr908872uak.35.1644049924724;
        Sat, 05 Feb 2022 00:32:04 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 17sm327506uak.8.2022.02.05.00.32.04
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 00:32:04 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id 60so14784167uae.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Feb 2022 00:32:04 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr469698uaw.122.1644049923955;
 Sat, 05 Feb 2022 00:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20220128173006.1713210-1-geert@linux-m68k.org>
 <63c80eba-7c55-2a92-8078-c63cec3c9efb@gmail.com> <8913a0a2-9496-143c-18c2-f3023fd37ba0@gmail.com>
 <8d215dab-cd0f-452b-281b-f67c9324b53b@gmail.com>
In-Reply-To: <8d215dab-cd0f-452b-281b-f67c9324b53b@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 5 Feb 2022 09:31:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnkvSCHKt5ouZP7HrMBg7nPg7fjiio-KVJ7dehA=FwyQ@mail.gmail.com>
Message-ID: <CAMuHMdVnkvSCHKt5ouZP7HrMBg7nPg7fjiio-KVJ7dehA=FwyQ@mail.gmail.com>
Subject: Re: Regression in 5.17-rc1 on pata-falcon (was: Re: [PATCH] m68k: mm:
 Remove check for VM_IO to fix deferred I/O)
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Jens Axboe <axboe@kernel.dk>,
        Laibin Qiu <qiulaibin@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Sat, Feb 5, 2022 at 1:04 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> commit 180dccb0dba4f5e84a4a70c1be1d34cbb6528b32 (blk-mq: fix tag_get
> wait task can't be awakened) does cause a regression on my m68k hardware
> test rig (m68k Falcon030, IDE disk attached through pata-falcon driver
> which does use polled IO instead of interrupts, so may be a little on
> the slow side).

> Bisection between v5.16 and v5.17-rc1 points to
> 180dccb0dba4f5e84a4a70c1be1d34cbb6528b32 as the culprit, which is
> corroborated by reverting that commit in v5.17-rc1 and booting as
> rapidly as before.

Now you know the culprit, it looks like several other people ran into this.
Does this fix help?
https://lore.kernel.org/all/1643040870.3bwvk3sis4.none@localhost/

It is commit 10825410b956dc1e ("blk-mq: Fix wrong wakeup
batch configuration which will cause hang") in v5.17-rc2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
