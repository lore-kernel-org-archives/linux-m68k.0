Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C277C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jun 2022 07:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238965AbiFMHYf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jun 2022 03:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237668AbiFMHY3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jun 2022 03:24:29 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4A51AD8B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 00:24:29 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id o43so3810816qvo.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 00:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jo6diAbkzH0dd9HLAnROmzlLspOkvFZqdSOZ8/PgR6c=;
        b=6Cr17958ZiaGW/x4mn6RzJ445PKThiihVVL5bIzsxwQrVjQca14BffF2IkRCjul35o
         fON6W5iFfVPd5H28qefjpLhEN3DvoyAey7hI4TgR9cTdhqgMc282ZWj1wyruQFkZzRdW
         B28+eJE3dIBkrIITqmQCtPwAsiCsjHfx1ORCPKqM5irx8nVXrEM59SVq+aZboBc6+bmY
         bbdoNQfugnyWgYwONkygh2dLeADDTybePpEN3IxKesIpuTgCNtwMAL5GMTNfkL06WX6W
         fxdp4/ES2e8KvDlKRa3ECdRcmJGTq44OdSUL+e8ikTQBAqcxxZkbvWfDopYSb9ganQk8
         AofA==
X-Gm-Message-State: AOAM532FtpCPs9T6eZkClOSOLtyWo69PjnoNWbYl8j1Y5OHKHmKqua1m
        YC2Awkgj6HwQI2NKBpbbqesgH7j8wYaDpQ==
X-Google-Smtp-Source: ABdhPJzig3OCj2GYwbeSe7d4Ci1ZbsYHQVhjGhuYLUiDlsk1NxG25ZfjXD2G8EBFDPqhNYEoGVUXLQ==
X-Received: by 2002:a05:6214:2308:b0:432:e69f:5d71 with SMTP id gc8-20020a056214230800b00432e69f5d71mr97759325qvb.19.1655105068028;
        Mon, 13 Jun 2022 00:24:28 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id gd8-20020a05622a5c0800b002f93554c009sm4437733qtb.59.2022.06.13.00.24.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 00:24:27 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id h27so8470874ybj.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jun 2022 00:24:27 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr59037253ybu.604.1655105067505; Mon, 13
 Jun 2022 00:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220610083924.32877-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220610083924.32877-1-wangxiang@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jun 2022 09:24:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYeSoRJ-bjxOMn8+qEZ8=VEO_yfg-gq1e3MxKix4GBLA@mail.gmail.com>
Message-ID: <CAMuHMdWYeSoRJ-bjxOMn8+qEZ8=VEO_yfg-gq1e3MxKix4GBLA@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: mac: Fix typo in comment
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 10, 2022 at 10:42 AM Xiang wangx <wangxiang@cdjrlc.com> wrote:
> Delete the redundant word 'an'.
> The second "and" should not be deleted, but replaced by "an".
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
> ---
> Changes since v1
> *Change comments "and and" to "and an"

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
