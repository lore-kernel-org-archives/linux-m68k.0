Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B47C636D6
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Feb 2023 12:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbjBWMj4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 07:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbjBWMj4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Feb 2023 07:39:56 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAE0B467
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 04:39:54 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id l12so10418821qtr.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 04:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pqgFpbDixyZcLFCVJx52cSGhF5lxYjE6NAN+dNryU4=;
        b=BQdVyMfnmmjlbbLdlrkHEt6pahoEmlAdw3o3AZPLxVC+AfWwfARbmW73xA2k/ACGkI
         1aB5klrLkmjhbXbjR8l5MFu5T4fgF7I5W1/PlQWL1viRu7F8kf7qZ3nzEDHD5MWIOqQA
         MOENnALgmm5VJ2i8vaXnzksT83Jzz/87iXhAAn0a81ZA1Dw/1L4nUrOxfaE332To09DQ
         79bPB2LlP4IFtkLuoAf/KooLn0LR/8FJ8PZoQTHtKS/cWO7c+u7vnc+11bhmJ2UDJH20
         lz1qxaG0Lhnh/nIKiWVSjQyskXwoT4fNjseYe7IYm2tqUzsoQgSuEppb4EKh+3TTb/Uh
         J66A==
X-Gm-Message-State: AO0yUKUXho8yWu7WGeI65IZrqoHmPQt2cdjLV4DA/2BCrp9xHaRKM7na
        yAjQLW/OroSjaOyUWVAeOLus9wA7WObrbWrJ
X-Google-Smtp-Source: AK7set9UDP1gFOXzbYXDtLhgvmvzlPjZyWqaY5f0g5tL3yV5y1UVoZ2N0ds8sbXa/KvQHLee14rOdQ==
X-Received: by 2002:ac8:5bd5:0:b0:3b9:b2c3:9d2a with SMTP id b21-20020ac85bd5000000b003b9b2c39d2amr6670829qtb.22.1677155993666;
        Thu, 23 Feb 2023 04:39:53 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id j62-20020a37b941000000b0073baa5ec0besm2957880qkf.115.2023.02.23.04.39.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 04:39:53 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-536c02c9dfbso177931197b3.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 04:39:53 -0800 (PST)
X-Received: by 2002:a25:910c:0:b0:8da:6dc5:ca06 with SMTP id
 v12-20020a25910c000000b008da6dc5ca06mr1942595ybl.7.1677155992777; Thu, 23 Feb
 2023 04:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org>
In-Reply-To: <20230223112349.26675-1-jongk@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Feb 2023 13:39:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
Message-ID: <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On Thu, Feb 23, 2023 at 12:26 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> The calculation of end addresses of memory chunks overflowed to 0 when
> a memory chunk is located at the end of 32-bit address space.
> This is the case for the HP300 architecture.
>
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>a
> Link: https://lore.kernel.org/linux-m68k/CACz-3rhUo5pgNwdWHaPWmz+30Qo9xCg70wNxdf7o5x-6tXq8QQ@mail.gmail.com/

Thanks for your patch!

So this has been broken for the last 15 years?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
