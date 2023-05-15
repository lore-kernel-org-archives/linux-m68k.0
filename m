Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5BAC77B7D
	for <linux-m68k@archiver.kernel.org>; Mon, 15 May 2023 09:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbjEOJmv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 May 2023 05:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239812AbjEOJmV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 May 2023 05:42:21 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FBB4C2E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:39:10 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b9d8b458e10so16326879276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143532; x=1686735532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvFU0BstB/n7JNs68o15ZW/f4y85+yMBEC8vi+Lmbbw=;
        b=LeHbHRILfRbgs0Di7OQLdnEI86tZRL7lYDv+FgxgIInDSGl/g+oU0wR2DCB+U6MVWH
         xhJ9vkFeinK86eKPbKyGLE41pk/RGtp0ecTA8C9PDan272vrlvze3o/ypt7gjDJJ5LR5
         leZ0cYsI+SId23Q7fQ31jtCpbQ9caUQKKH6bxFgxNG4VdkJgqfyyjbNNazG3PuRq6iHa
         IAkTl0m7CanBK94yRPs3ui9EAFiWQzon6uJhHkzYC7puHawjw5xSfB+G9YPlCCgkWn96
         HlYgInUVMMIN0lTHKei80A3WJSM05YfuMZCsstIxBha7N0bLavIZNEA914yEt0u2sx/Y
         3W0Q==
X-Gm-Message-State: AC+VfDxAzWFnsvJy5JGTw8wJthLDiTIyLG++1qoSzNrznLvHNnHKh9qG
        E0CdEeTRtVtghfSuj3v55B5tGWoQ+XeAEQ==
X-Google-Smtp-Source: ACHHUZ5bw5XaJenpvGoPsjdlvynHB7tC76QORA8F0WRoW0nvyXH+pWkKD97LD4KQm84bgbbJ3GzLzg==
X-Received: by 2002:a25:b19c:0:b0:ba1:8307:ecaa with SMTP id h28-20020a25b19c000000b00ba18307ecaamr27775888ybj.7.1684143532030;
        Mon, 15 May 2023 02:38:52 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id w132-20020a25c78a000000b00ba71866d8efsm2111249ybe.63.2023.05.15.02.38.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 02:38:51 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-55d2e87048cso181438797b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:38:51 -0700 (PDT)
X-Received: by 2002:a0d:e209:0:b0:555:cbdc:c6 with SMTP id l9-20020a0de209000000b00555cbdc00c6mr30150231ywe.9.1684143531314;
 Mon, 15 May 2023 02:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <d4e2a586e793cc8d9442595684ab8a077c0fe726.1678783919.git.fthain@linux-m68k.org>
In-Reply-To: <d4e2a586e793cc8d9442595684ab8a077c0fe726.1678783919.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 May 2023 11:38:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqgzh-_zwirAB+FXSZbuJ6WpML_kMdTRUD_=-Rpx0T5w@mail.gmail.com>
Message-ID: <CAMuHMdXqgzh-_zwirAB+FXSZbuJ6WpML_kMdTRUD_=-Rpx0T5w@mail.gmail.com>
Subject: Re: [PATCH] nubus: Partially revert proc_create_single_data() conversion
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 14, 2023 at 9:53 AM Finn Thain <fthain@linux-m68k.org> wrote:
> The conversion to proc_create_single_data() introduced a regression
> whereby reading a file in /proc/bus/nubus results in a seg fault:
>
>  # grep -r . /proc/bus/nubus/e/
> Data read fault at 0x00000020 in Super Data (pc=0x1074c2)
> BAD KERNEL BUSERR
> Oops: 00000000
> Modules linked in:
> PC: [<001074c2>] PDE_DATA+0xc/0x16
> SR: 2010  SP: 38284958  a2: 01152370
> d0: 00000001    d1: 01013000    d2: 01002790    d3: 00000000
> d4: 00000001    d5: 0008ce2e    a0: 00000000    a1: 00222a40
> Process grep (pid: 45, task=142f8727)
> Frame format=B ssw=074d isc=2008 isb=4e5e daddr=00000020 dobuf=01199e70
> baddr=001074c8 dibuf=ffffffff ver=f
> Stack from 01199e48:
>         01199e70 00222a58 01002790 00000000 011a3000 01199eb0 015000c0 00000000
>         00000000 01199ec0 01199ec0 000d551a 011a3000 00000001 00000000 00018000
>         d003f000 00000003 00000001 0002800d 01052840 01199fa8 c01f8000 00000000
>         00000029 0b532b80 00000000 00000000 00000029 0b532b80 01199ee4 00103640
>         011198c0 d003f000 00018000 01199fa8 00000000 011198c0 00000000 01199f4c
>         000b3344 011198c0 d003f000 00018000 01199fa8 00000000 00018000 011198c0
> Call Trace: [<00222a58>] nubus_proc_rsrc_show+0x18/0xa0
>  [<000d551a>] seq_read+0xc4/0x510
>  [<00018000>] fp_fcos+0x2/0x82
>  [<0002800d>] __sys_setreuid+0x115/0x1c6
>  [<00103640>] proc_reg_read+0x5c/0xb0
>  [<00018000>] fp_fcos+0x2/0x82
>  [<000b3344>] __vfs_read+0x2c/0x13c
>  [<00018000>] fp_fcos+0x2/0x82
>  [<00018000>] fp_fcos+0x2/0x82
>  [<000b8aa2>] sys_statx+0x60/0x7e
>  [<000b34b6>] vfs_read+0x62/0x12a
>  [<00018000>] fp_fcos+0x2/0x82
>  [<00018000>] fp_fcos+0x2/0x82
>  [<000b39c2>] ksys_read+0x48/0xbe
>  [<00018000>] fp_fcos+0x2/0x82
>  [<000b3a4e>] sys_read+0x16/0x1a
>  [<00018000>] fp_fcos+0x2/0x82
>  [<00002b84>] syscall+0x8/0xc
>  [<00018000>] fp_fcos+0x2/0x82
>  [<0000c016>] not_ext+0xa/0x18
> Code: 4e5e 4e75 4e56 0000 206e 0008 2068 ffe8 <2068> 0020 2008 4e5e 4e75 4e56 0000 2f0b 206e 0008 2068 0004 2668 0020 206b ffe8
> Disabling lock debugging due to kernel taint
>
> Segmentation fault
>
> The proc_create_single_data() conversion does not work because
> single_open(file, nubus_proc_rsrc_show, PDE_DATA(inode)) is not
> equivalent to the original code.
>
> Fixes: 3f3942aca6da ("proc: introduce proc_create_single{,_data}")
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: stable@vger.kernel.org # 5.6+
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.5 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
