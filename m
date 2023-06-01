Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61BDC77B7E
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Jun 2023 07:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjFAHU1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Jun 2023 03:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjFAHU0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Jun 2023 03:20:26 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C688129
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Jun 2023 00:20:23 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-561c1436c75so5706587b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685604022; x=1688196022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uahBQ1+NZ4LtBmJlKuzSeHMKUQpvPqnHtI00z7d7Eg4=;
        b=gHS7IS56UQMZm8BOiBYWZe9eGMgHEEkhWQYdAwglxSzgtUIMWCYwcfvXvw1+mUvNf7
         BNIsUn/eTCKThf/YLXPOgzgNqhaaxPE6Om1Wfq6Q/EH8lmlqBO5QCaBOxUiQtrCjdufV
         wiOpWuByFYtjdbCoCNZiPiDTMsi+k3dNfOqr9HSyaisWEfxEJMbNQxKhQOwtrIYWDk3V
         YMFfR21sODwBazMvAjIq3yHvBfAhtaSQRtvxqTg0mA2AR3tARtuawOhHsKviGIHWzlII
         2v+hskt74pvZCKhMAp6WmX+1D6jVM3wW8REtGo4bopfS0Xzu2hPShyhRa9BTKXeR9RoF
         4B9Q==
X-Gm-Message-State: AC+VfDw8Q/fVsW/nSJGp9pFjqR6AH1zLL5EuSzHiFBibWY/OL2PYtD8T
        Hp2efEvdGggRl7Twbd3taWY4XWqRIpfQRQ==
X-Google-Smtp-Source: ACHHUZ6GIH6iYsKyaznPriDJBdQV9dcdeIvUcvHFxG5EMoxKDn8pcByWuxdXzwrGCxoBKbkqHVopBw==
X-Received: by 2002:a0d:df54:0:b0:565:a3e6:1b7b with SMTP id i81-20020a0ddf54000000b00565a3e61b7bmr8930014ywe.18.1685604022235;
        Thu, 01 Jun 2023 00:20:22 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id s11-20020a81770b000000b00561949f713fsm2505816ywc.39.2023.06.01.00.20.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:20:19 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bacf685150cso535474276.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:20:18 -0700 (PDT)
X-Received: by 2002:a25:6891:0:b0:ba8:7122:2917 with SMTP id
 d139-20020a256891000000b00ba871222917mr10052062ybc.0.1685604018484; Thu, 01
 Jun 2023 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-31-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-31-vishal.moola@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jun 2023 09:20:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Message-ID: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
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
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 31, 2023 at 11:33 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
