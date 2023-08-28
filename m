Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A88C83F13
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 07:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjH1HAi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 03:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjH1HAY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 03:00:24 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC6A9E
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 00:00:21 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-590685a3be5so31873687b3.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 00:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693206020; x=1693810820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/95Vc6xcbNZnn8et4G8uSxySRAV1S0DSAEwAeCoIu1k=;
        b=KDTq+xoOzeSRaTRD8I2MvDpBnOszDkgXiSFPdEeKl+tA4zpx16Zc40dsdopUS8NenX
         vL3znfGOFWFCrtktvQN4Lbq41fo4LVi72u771AjXVd0/S/gwTqoWS/VQnB1JLwLxNYgF
         CYlqd6Dlg5wXzgjmuDV30e52Y/BDJQ63aBu0JnScgjfI1JC8YJqDr1TLIXu34TrrnGyf
         P3Ij638+f5xFxL7UOOzOp26YfSTqVS3dPgLy2t6SAyjzMyaRDGeDq4vSL20lP0Yg5n6R
         8ZerNgAGXTAlG+q/e+D/WCkr/Xht8YPRw/N0ahcoqjdL3hbcs+XG8iPip50NnHGaXY3u
         8RgQ==
X-Gm-Message-State: AOJu0YxdEm2SSQsnCvSl9lJkWMFLBCqELGtNF+XPJG/Bmi3JGeX/48NA
        aYq3FN4QfUo0Y84XAnVjyBHmRjxFZY84TA==
X-Google-Smtp-Source: AGHT+IH3rGFBmBOEKJlANKGlTb6gTWO0WLZHkjxwLEHrrI9nyF6O56F5DLhZ8BcMR9Qd5LINY4SJOg==
X-Received: by 2002:a81:5b43:0:b0:568:d586:77c4 with SMTP id p64-20020a815b43000000b00568d58677c4mr23281209ywb.4.1693206020009;
        Mon, 28 Aug 2023 00:00:20 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id v17-20020a81a551000000b00586b5b6347csm1946788ywg.109.2023.08.28.00.00.19
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:00:19 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso2932241276.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 00:00:19 -0700 (PDT)
X-Received: by 2002:a25:8691:0:b0:d78:312:c4a8 with SMTP id
 z17-20020a258691000000b00d780312c4a8mr10657439ybk.53.1693206019032; Mon, 28
 Aug 2023 00:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
In-Reply-To: <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 09:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com>
Message-ID: <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     James Le Cuirot <chewi@aura-online.co.uk>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Aug 27, 2023 at 11:36 AM James Le Cuirot
<chewi@aura-online.co.uk> wrote:
> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
> > Moreover, why is it that only a few developers have a problem with making
> > explicit their decisions regarding alignment of shorts? What actual pain
> > does it cause them to accept a patch to make their struct layouts plain?
>
> Some projects do accept patches. Yann Collet was even kind enough to fix this
> in zstd themselves. On the other hand, we have had to fight to stop Python
> from dropping m68k support entirely. The real problem is the effort required
> to produce these patches. I haven't been able to wrap my head around this so
> far, but I would still like to learn. I could see myself eventually fixing
> mold, but LLVM feels like a very tall order.

Perhaps we need a new compiler warning: "hole in structure due to
non-natural alignment, please consider adding explicit padding"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
