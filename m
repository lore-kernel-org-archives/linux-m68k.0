Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D6BC43334
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Jul 2022 07:35:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiGDHfU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Jul 2022 03:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiGDHfT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Jul 2022 03:35:19 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2255C23
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Jul 2022 00:35:18 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id z13so8845204qts.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Jul 2022 00:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4uTcz29t3pg1C4YGaeQ71ecfCeed2MNypmoCrMjlf/c=;
        b=sJabsFzM0P6Dz5g3Pc/DW1Z/uNarptdKZAyGO9i0DmngIQ9xpED3DpEfRX1DVa+WWt
         GOhNpNUqDYJmttsr/l0TjZuX1CgOKjeZN4WSNAp5rH28OZoR54aPEUjBvXwTVxrytGTg
         MBYXjTXSz98QgEl+rO4dYwhl+q2X5VM9MzrT3WIl3WhK3CprSBOtvIVeDjrjn2T4zLYB
         m3i/TlO4wQ5D3D1PGHRWg1X832LZV5+5CfbzCG2dTOMznqKFD2BPUjpjJjU2kkozgOIb
         cfnm9xQ9zzphE/KCxb+N0OiDdI+5ZqF0r9GuB/wNM/2g9zX66n/k8UwzkEXjEAnkI0Bi
         49UA==
X-Gm-Message-State: AJIora9PqszYFCzfI3FS4kssKbriWdPBIhOdEcE8fesRVJTqczKoDHa4
        uRmoxVp5SwTmTKmcx05oOYQGMm8zKMqyvQ==
X-Google-Smtp-Source: AGRyM1t3TN/vNMugWiqaNnXexlCjZ56IP6PwUpy6T0JZr9CDJNmaAIgrTMgI99HleqdeM3HZBKQO/g==
X-Received: by 2002:ad4:5dcd:0:b0:470:3909:fc4c with SMTP id m13-20020ad45dcd000000b004703909fc4cmr27644945qvh.87.1656920117609;
        Mon, 04 Jul 2022 00:35:17 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id l6-20020a37bb06000000b006a981a2c483sm23177548qkf.39.2022.07.04.00.35.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 00:35:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id e69so8813744ybh.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Jul 2022 00:35:17 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr31448190ybh.36.1656920116950; Mon, 04
 Jul 2022 00:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220704073644.2384999-1-yangyingliang@huawei.com>
In-Reply-To: <20220704073644.2384999-1-yangyingliang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 09:35:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeCV9th=yc7d1OQ72wPUiSxrUFniyV4tJkVrNmRNcMaQ@mail.gmail.com>
Message-ID: <CAMuHMdUeCV9th=yc7d1OQ72wPUiSxrUFniyV4tJkVrNmRNcMaQ@mail.gmail.com>
Subject: Re: [PATCH] m68k/amiga: fix missing platform_device_unregister() on
 error in amiga_init_devices()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yang,

On Mon, Jul 4, 2022 at 9:27 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
> Add the missing platform_device_unregister() before return
> from amiga_init_devices() in the error handling case.
>
> Fixes: eeed227966da ("m68k/amiga: Add error checks when registering platform devices")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks for your patch!

TBH, I don't think it's worth adding this code: this happens during early
kernel startup.  If any of these devices fail to register, that must happen
because the system ran out of memory, and thus won't work anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
