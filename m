Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE51C678D4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Mar 2023 13:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjCFNEL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 08:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjCFNEH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Mar 2023 08:04:07 -0500
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435FE2A149
        for <linux-m68k@vger.kernel.org>; Mon,  6 Mar 2023 05:03:52 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id c80so1014164ybf.5
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 05:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKYESg89QQOaUl59qLFg/jQHWHRekOOdhQyhoBwHYGU=;
        b=OhqaEpigUSjO4fS41m5pIFmHH+n8iDW19POd1zl6RHtpdBBKjuqcyAscEQjA6q4Avs
         1F6T3hm51IYvtF19dju6qVE44R+bf1dc/ErFgmsO+6x3duPA6ioQdo7rmyaMDTeFR3na
         M9fgOUvp1FpmRG4kWHqivbiPQjSWCuDFbM7fhMp+nkBabDcXOaYiiWGtUUcJDg4nhBXG
         3Gkleyc3n88BUH5JjH8jnXcA2+QnJ95e64j9dwGIGTmpiagHyTSxhuc/GiJYIIsKrpUg
         ZF/MuHrisFHOmKPwQ4HtziPrgosGUWI6/E8UQhtArVXzmQAA8kQRDPknxM8t+NTjfZa1
         O1Zw==
X-Gm-Message-State: AO0yUKX/kv1TCqEtv3OHBMEna57ccyLWCGbSrdp2wJw9FtT7V+ZSOZfa
        7enG0ro0y2w5IK4d95LYNhUDqu8IZ5h2aw==
X-Google-Smtp-Source: AK7set/Sw2sSB2G6NXOFCQQmHFUdmN4QW5a1SHwx0FAGQp0pPK2rNadOqJMThyuhwW6wrVn1vGYamg==
X-Received: by 2002:a5b:90:0:b0:a7a:26c2:2c96 with SMTP id b16-20020a5b0090000000b00a7a26c22c96mr10800981ybp.25.1678107830885;
        Mon, 06 Mar 2023 05:03:50 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id s2-20020ae9de02000000b00706b09b16fasm7466791qkf.11.2023.03.06.05.03.50
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:03:50 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id k23so7964648ybk.13
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 05:03:50 -0800 (PST)
X-Received: by 2002:a5b:308:0:b0:90d:af77:9ca6 with SMTP id
 j8-20020a5b0308000000b0090daf779ca6mr6336007ybp.7.1678107830172; Mon, 06 Mar
 2023 05:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20230301021107.26307-1-schmitzmic@gmail.com>
In-Reply-To: <20230301021107.26307-1-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Mar 2023 14:03:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP=cNZKZcurO8V1UrNTUgookaWnmPr02+Wv9vxKX-b6Q@mail.gmail.com>
Message-ID: <CAMuHMdVP=cNZKZcurO8V1UrNTUgookaWnmPr02+Wv9vxKX-b6Q@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: kernel/traps.c - only force 030 bus error if PC
 not in exception table
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 1, 2023 at 3:13 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> __get_kernel_nofault() does copy data in supervisor mode when
> forcing a task backtrace log through /proc/sysrq_trigger.
> This is expected cause a bus error exception on e.g. NULL
> pointer dereferencing when logging a kernel task has no
> workqueue associated. This bus error ought to be ignored.
>
> Our 030 bus error handler is ill equipped to deal with this:
>
> Whenever ssw indicates a kernel mode access on a data fault,
> we don't even attempt to handle the fault and instead always
> send a SEGV signal (or panic). As a result, the check
> for exception handling at the fault PC (buried in
> send_sig_fault() which gets called from do_page_fault()
> eventually) is never used.
>
> In contrast, both 040 and 060 access error handlers do not
> care whether a fault happened on supervisor mode access,
> and will call do_page_fault() on those, ultimately honoring
> the exception table.
>
> Add a check in bus_error030 to call do_page_fault() in case
> we do have an entry for the fault PC in our exception table.
>
> I had attempted a fix for this earlier in 2019 that did rely
> on testing pagefault_disabled() (see link below) to achieve
> the same thing, but this patch should be more generic.
>
> Tested on 030 Atari Falcon.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Reported-by: Eero Tamminen <oak@helsinkinet.fi>
> CC: Eero Tamminen <oak@helsinkinet.fi>
> CC: Finn Thain <fthain@linux-m68k.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
> Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
> --
>
> Changes from v1:
>
> - add comment
> - reword commit message
> - add link to old patch as well (stick to lore.kernel.org
>   even though these links are currently not functional)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue as a fix in the m68k for-v6.3 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
