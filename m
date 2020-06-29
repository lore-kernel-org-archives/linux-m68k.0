Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A19C433E3
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:07:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE5862083E
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730841AbgF2THt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730425AbgF2THo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 15:07:44 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C77C031C67
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 10:48:04 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j11so12444338oiw.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 10:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vABQ7HbcBDd0XPggt/7L/+c9wShVJPfWpxaGETBJcM4=;
        b=DPFG3qTfTSd2PaM0jkg55qbIUPaUP4RT4PApjBVDqIcT3QuU2nuhdqcue80ZPHuOiE
         uRFBNFzWIKXlvuK5vH+2ONspVuZ3qnUcEDj6FrtymaXbQOwsbjwNKe2/nMLxTll2rSEH
         xzQjKPNK/rE0MJ8yb7lq2YUlLMac/OrL0Ga9dJX8OZciHoIhCH9/Savw20HFtmWkTGwx
         X+MQ9AmWVECSvyR/+b2sh+wH8LzYFmE4Iji+6ovT4tMxpZBAfL1Wwgw23fbQqwCbb+yk
         WGBuOPMKui6jYlcvr3w50cv8euTbp2CmC+5GawCP+GgPOrAeU8AnMRR1cy45nAqr6TIo
         DdNA==
X-Gm-Message-State: AOAM530fxyj+POZEpW30kKUvNSjnbK+tTwPgJQVidOLusNyBmZGSikCR
        OsytgAH8u1QRlYA6infokbC7nygKQIxSmlzZ6mk=
X-Google-Smtp-Source: ABdhPJxH1pExPSzW5fxpRMvrEhgo+8OaxN6D+KQP6BRrzfFRWYXDFWRTnIR1DWk+OTxPPKgDng3tQcSkE56MdtYh14Y=
X-Received: by 2002:aca:1801:: with SMTP id h1mr8281492oih.148.1593452883808;
 Mon, 29 Jun 2020 10:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200526123810.301667-1-masahiroy@kernel.org> <20200526123810.301667-4-masahiroy@kernel.org>
In-Reply-To: <20200526123810.301667-4-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 19:47:52 +0200
Message-ID: <CAMuHMdUt5UWN8qURFxsDmMn3TNN4C7ekyykbTMeGiU99z4O=Jw@mail.gmail.com>
Subject: Re: [PATCH 4/4] m68k: pass -D options to KBUILD_CPPFLAGS instead of KBUILD_{A,C}FLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 26, 2020 at 2:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Precisely, -D is a preprocessor option.
>
> KBUILD_CPPFLAGS is passed to for compiling .c and .S files too.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.9 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
