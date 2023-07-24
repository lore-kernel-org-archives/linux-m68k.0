Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B765C001DE
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 13:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjGXNBZ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 09:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjGXNBJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 09:01:09 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C43549C2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 05:58:54 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-57a6df91b1eso53537147b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 05:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203533; x=1690808333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6b2FtAV3bNuD5mVsXsz2riCXJosQSO38iUoRG0Tlfw=;
        b=VRyLpZDLYu3KGXH77dxQURybX7hCW08/tLITA9LrkxpGUqPoJbFUAXcOJelX7ESAwo
         PosnxvonaWHhP8TsbSkC2ayCIaGkbzxbOApl88PgHqllq8++5lLcCYgY9FeGgIXKUI19
         FFgTb4o8pqoCwFF6OmP1PAwcu4Ph5B624nbm/pWrFKKSvimV+3HhK1avGkcNhJiwZi9k
         z6XEttwBQC32yVOQ9TqlwZZdyJ0d7s9okdqH+s+//qlvNbq415yu+UulwLh2sKfTJkuq
         sFBYD5pHu3PGIxIVarYztKP9gEgVzLHcDWXQGMuC4G4sxqSNyXvKZHeY83/4mjWf3+t/
         KQLQ==
X-Gm-Message-State: ABy/qLbMiV4MsHr4Y4SWM8fU/JZOycRFCvID0sl+fkMGLgYquqSC/Lzx
        2XDddeiQfNicvtTz2YDX1ABCFNp/qVU8Xw==
X-Google-Smtp-Source: APBJJlGdtdipr8R1NeiwRtLDKXUKq0VtWyrcQ0uOpV62kRZF3fme9IWBGXkiYKp70MWUTP8h0vKltA==
X-Received: by 2002:a0d:c246:0:b0:577:4387:197c with SMTP id e67-20020a0dc246000000b005774387197cmr8429947ywd.16.1690203533180;
        Mon, 24 Jul 2023 05:58:53 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id v129-20020a818587000000b0057042405e2csm2751007ywf.71.2023.07.24.05.58.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:58:52 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso4946198276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 05:58:52 -0700 (PDT)
X-Received: by 2002:a25:ba0c:0:b0:d15:454e:8ecd with SMTP id
 t12-20020a25ba0c000000b00d15454e8ecdmr576735ybg.13.1690203532619; Mon, 24 Jul
 2023 05:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <ZIyBaueWT9jnTwRC@decadent.org.uk>
In-Reply-To: <ZIyBaueWT9jnTwRC@decadent.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 14:58:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4deu65FdW7qGSYoQDLWmjqcz_oReQY+GKS-EtxERFJQ@mail.gmail.com>
Message-ID: <CAMuHMdW4deu65FdW7qGSYoQDLWmjqcz_oReQY+GKS-EtxERFJQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix invalid .section syntax
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ben,

On Fri, Jun 16, 2023 at 5:47 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> From: Ben Hutchings <benh@debian.org>
>
> gas supports several different forms for .section for ELF targets,
> including:
>     .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> and:
>     .section "NAME"[, #FLAGS...]
>
> In several places we use a mix of these two forms:
>     .section NAME, #FLAGS...
>
> A current development snapshot of binutils (2.40.50.20230611) treats
> this mixed syntax as an error.
>
> Change to consistently use:
>     .section NAME, "FLAGS"
> as is used elsewhere in the kernel.
>
> References: https://buildd.debian.org/status/fetch.php?pkg=linux&arch=m68k&ver=6.4%7Erc6-1%7Eexp1&stamp=1686907300&raw=1
> Signed-off-by: Ben Hutchings <benh@debian.org>

Thanks for your patch! Consistency is good.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. applied and queued.

> ---
> These changes are compile-tested only.

I verified there is no difference in the generated object files with my
current toolchain (GNU assembler version 2.38 (m68k-linux-gnu)
using BFD version (GNU Binutils for Ubuntu) 2.38).

Do you think it's worthwhile to fast-track this for v6.5, or is it fine to
queue this for v6.6?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
