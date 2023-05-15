Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF364C7EE22
	for <linux-m68k@archiver.kernel.org>; Mon, 15 May 2023 09:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbjEOJqG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 May 2023 05:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241246AbjEOJpT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 May 2023 05:45:19 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A64E19A4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:44:50 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-55a26b46003so186316057b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143889; x=1686735889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfFE/qiRkN557/2I5XaanSNXOAZ3eFVDGQ65E3a+VhY=;
        b=dRpr63UfoYSPXZ2k8EXwFY1FeY3yN0CkxBr2kFl0rqkvJLDZS7rY7WxL9+mRRm7w4q
         ycTXFGMYhMb6ieKQ/f5zw2v9ABSVt40xuf0uNftpNkkmswXhm5Yhxf8cdaXx/dtsHafx
         sTbjr0Z64ebXeaEhwCbGxs8BAGaLZLFtsBYz6ir6MuZu+gQV/UhNesOaFLjeNomhiz0j
         NmuMX4v4X62WdaLT2W7HdbiTbfCYk55inGcr0kYjQEMn5Mpr7dXsOiBxg056Sv9UVi8r
         9bVLcTgjeDdbHFDtGmhWQgKdc+5els/AJsUTYlaa84WYrdZQK/8gupViPugQmTEOheVb
         zpXg==
X-Gm-Message-State: AC+VfDxWz5xJyS7Io1Xq5WuuQYviO0UO0mAwNYc8B2iDsW8HkdRFPrwJ
        3eVXBh9Qtxt8aAZsg204PbudTKPeL8y5hA==
X-Google-Smtp-Source: ACHHUZ583CqeYLk91HYEGrNzdu4O3p2+O1d9bvplfne5S0LMiqQutO2/aibSlG/GJTeFrius/z5y0Q==
X-Received: by 2002:a0d:ffc7:0:b0:560:bb81:6e8 with SMTP id p190-20020a0dffc7000000b00560bb8106e8mr17943362ywf.51.1684143889306;
        Mon, 15 May 2023 02:44:49 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id q129-20020a817587000000b0054601bc6ce2sm7734240ywc.118.2023.05.15.02.44.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 02:44:49 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-559eae63801so186304657b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 May 2023 02:44:48 -0700 (PDT)
X-Received: by 2002:a81:9c10:0:b0:559:e974:82 with SMTP id m16-20020a819c10000000b00559e9740082mr33480420ywa.20.1684143888518;
 Mon, 15 May 2023 02:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <1296c4d691bba057291246f067c191ef8a88531c.1680667933.git.fthain@linux-m68k.org>
In-Reply-To: <1296c4d691bba057291246f067c191ef8a88531c.1680667933.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 May 2023 11:44:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLsnfQ4XhJiuE54BjGaCMAxvzOR+GGB9iFD8pYXprfxQ@mail.gmail.com>
Message-ID: <CAMuHMdXLsnfQ4XhJiuE54BjGaCMAxvzOR+GGB9iFD8pYXprfxQ@mail.gmail.com>
Subject: Re: [PATCH v4] nubus: Don't list slot resources by default
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Brad Boyer <flar@allandria.com>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 5, 2023 at 6:19 AM Finn Thain <fthain@linux-m68k.org> wrote:
> Some Nubus card ROMs contain many slot resources. A single Radius video
> card produced well over a thousand entries under /proc/bus/nubus/.
> Populating /proc/bus/nubus/ on a slow machine with several such cards
> installed takes long enough that the user may think that the system is
> wedged. All those procfs entries also consume significant RAM though
> they are not normally needed (except by developers).
> Omit these resources from /proc/bus/nubus/ by default and add a kernel
> parameter to enable them when needed.
> On the test machine, this saved 300 kB and 10 seconds.
>
> Cc: Brad Boyer <flar@allandria.com>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v3:
>  - Better commentary.
> Changed since v2:
>  - Added commentary.
>  - Moved declaration to nubus.h.
> Changed since v1:
>  - Expanded to cover all slot resources in procfs.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.5 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
