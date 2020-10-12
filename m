Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01F0C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 762E420714
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388160AbgJLNS5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:18:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40197 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387930AbgJLNS5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:18:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id m128so18666627oig.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aMWY9DGRjs+jduT+N0yf7HvNAAtSyYLaBXYdq1dzzY=;
        b=lXW/tZrlrvj5Rm1Dp1zXad98yofnItD0anTIjBmU3BwQUg6LD63MiRhTFJQZ6n3TBI
         FC8d1gMe9SVvrdrElrs9m44dAMIpv/iZe0GXy1xSozffZSKMb0iJ9VDiVufXxLscaTB6
         jUVhqP7zFsa1r10v+AgiYPGCQP1c5fvJ7KWk57LIrbbkC7NbVS2jKDsTS3wY0EKssKqA
         Xmb/hHlTGi0smB5YvPSK/S0kNEd0jEssvPJxMH87+hGFurPbgEFJMZmzxUSDlnbpMPtf
         rkaO2c+2GDlmLYOnB9dsTuhmB/77xNnrquTXkfp8OI661L5SfOvu1JtHzbqp6SzDMuFt
         k20Q==
X-Gm-Message-State: AOAM533sYzxgzDlu/APVYOqJ32OxS+d8yB65aUNQFjT76U4Q36omd4SY
        1BnLNz0cUTZljccg3VB2R14s2PpSfRXNIaH38Jc=
X-Google-Smtp-Source: ABdhPJxE8Y4OMEfu8CnqWe2Vd68rfLTLW4vBYd/syOBG4o2qvCFamDMdiPviCEGxqaCAq2EaIlCaQPhdcEamd6RLSq4=
X-Received: by 2002:aca:4441:: with SMTP id r62mr10164517oia.153.1602508735977;
 Mon, 12 Oct 2020 06:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201008123429.1133896-1-arnd@arndb.de>
In-Reply-To: <20201008123429.1133896-1-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:18:44 +0200
Message-ID: <CAMuHMdUaS=qkGT8YXTHBwW3UJDZay4tt8eOkR0r50-guts6egQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: avoid xchg() warning
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 8, 2020 at 2:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> gcc warns about the value of xchg()/cmpxchg() being unused
> in some cases:
>
> net/core/filter.c: In function 'bpf_clear_redirect_map':
> arch/m68k/include/asm/cmpxchg.h:137:3: warning: value computed is not used [-Wunused-value]
>   106 | #define cmpxchg(ptr, o, n) cmpxchg_local((ptr), (o), (n))
> net/core/filter.c:3595:4: note: in expansion of macro 'cmpxchg'
>  3595 |    cmpxchg(&ri->map, map, NULL);
>
> Shut up that warning like we do on other architectures, by
> turning the macro into a statement expression.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
