Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D386C77B7C
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 15:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237939AbjEKPRy convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 11:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238399AbjEKPRx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 11:17:53 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DF51BE3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 08:17:51 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f122ff663eso9843796e87.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 08:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683818268; x=1686410268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeLJUnaY4RpSv7Fr2RyuafyTEGCbWOy7/KdXYyNynDE=;
        b=koZ75qqLzIBsvsVyJmC8DQHoU1hSresStMD6ednnldZpEQ5gVZ0qa8slaLx9zZpBsl
         1Tls1dr1B+NND7RHlbDCoqd2uD2OvFsIrpJoWhzfgK2pQI5dxd7WV7BzKsF6Ag/h+Df1
         5bj/uG2iWxhuaps/YvqeyM522XiMo2HabO9mkQneAIGkY6D5F4DcOWUYx8gKLd0FeGmI
         XMyRocfA7j4zkJCW/C0P1x7g0+3IjqPltkHOPYAFo04jccyGseTkqUFe9G3PZSRyXjLy
         QQ2heHhQRbgLTBKJ+6YLbvV3xwyu6QV8pgev75TzF3SUiBRKknuhtH/95Yj2x4gsvcMH
         Mm1w==
X-Gm-Message-State: AC+VfDx2PskprPtQfYPGxBiwOZJNbl4nPmrO0ygUI89k6GwdYjAgdwOL
        7PiWLu949MZ+5IRg8q73IpHl0XQz7j52Cxct
X-Google-Smtp-Source: ACHHUZ5ooOW/C5R3liy1Ks/oGI1KvWAKHhaidnFZ9+ekugPrQsJeQ+pxQylFpiLPz1W96hLTuum+FQ==
X-Received: by 2002:a19:f006:0:b0:4eb:5232:5397 with SMTP id p6-20020a19f006000000b004eb52325397mr3131217lfc.21.1683818268493;
        Thu, 11 May 2023 08:17:48 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id p3-20020a19f003000000b004f24d357794sm1144490lfc.281.2023.05.11.08.17.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 08:17:47 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f122ff663eso9843715e87.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 08:17:46 -0700 (PDT)
X-Received: by 2002:ac2:4c13:0:b0:4f2:22bf:fe98 with SMTP id
 t19-20020ac24c13000000b004f222bffe98mr2776652lfq.37.1683818265953; Thu, 11
 May 2023 08:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150802.737477-1-cgzones@googlemail.com>
In-Reply-To: <20230511150802.737477-1-cgzones@googlemail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 May 2023 17:17:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVa69s3g0z6qgayzNx=jT6Ko2RNeZehru0SbzYH8VwkfQ@mail.gmail.com>
Message-ID: <CAMuHMdVa69s3g0z6qgayzNx=jT6Ko2RNeZehru0SbzYH8VwkfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] fs/xattr: add *at family syscalls
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, audit@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        Nhat Pham <nphamcs@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christian,

On Thu, May 11, 2023 at 5:10 PM Christian Göttsche
<cgzones@googlemail.com> wrote:
> Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> removexattrat().  Those can be used to operate on extended attributes,
> especially security related ones, either relative to a pinned directory
> or on a file descriptor without read access, avoiding a
> /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
>
> One use case will be setfiles(8) setting SELinux file contexts
> ("security.selinux") without race conditions.
>
> Add XATTR flags to the private namespace of AT_* flags.
>
> Use the do_{name}at() pattern from fs/open.c.
>
> Use a single flag parameter for extended attribute flags (currently
> XATTR_CREATE and XATTR_REPLACE) and *at() flags to not exceed six
> syscall arguments in setxattrat().
>
> Previous approach ("f*xattr: allow O_PATH descriptors"): https://lore.kernel.org/all/20220607153139.35588-1-cgzones@googlemail.com/
> v1 discussion: https://lore.kernel.org/all/20220830152858.14866-2-cgzones@googlemail.com/
>
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>

Thanks for your patch!

The syscall numbers conflict with those used in "[PATCH] cachestat:
wire up cachestat for other architectures", so this needs some
synchronization.
https://lore.kernel.org/linux-sh/20230510195806.2902878-1-nphamcs@gmail.com

>  arch/m68k/kernel/syscalls/syscall.tbl       |   4 +

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
