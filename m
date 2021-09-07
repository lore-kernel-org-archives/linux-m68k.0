Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46C1C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 12:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8DD66103E
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 12:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344438AbhIGMvZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:51:25 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:41646 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344375AbhIGMvY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Sep 2021 08:51:24 -0400
Received: by mail-vs1-f48.google.com with SMTP id l9so8179698vsb.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Sep 2021 05:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqzG0edJSf2zwWdbDpmcnFDoPo2y6a0/m9oDx9ZHMOE=;
        b=dfa1QkcVwc//jcFvOVMbEbXvOeErH8uAerx6jQht5HK0/VFymV+hwy29R5avYIRaKg
         +gwhKrDWFmmORGsjb4zqNrDlN2VTSMv76kr8cnTAUUwATmkGefdVCwSxPCkIFR5o1Hfo
         OSbYk6RqMhYHMZ+Uz0Ndy7Zg17DTb+rtAd0OBOeEW25iQZ+1oDaF18aR3mPIGUrsD+ng
         OO6Te1+P7c7KSqQIkYaRvByXx5xlqJFsgZsNO8q+exSWUKycWYKFijy3JD6SndNMO3L1
         O5hXtEU2nvXIPKA9J0Ihpmq2saZ7FOI7WrY4o2Lj4uACIhGb50/823b/SI5cbJoJSSA1
         Z0rw==
X-Gm-Message-State: AOAM530dRZRpgsjOhHpjTCMepuJ5N8yVblEBUq2gzSgvAgUK84EgwOm0
        xU20yMYSgPcUVsdv/94Y6YT7hzXttV3RglbjiGo=
X-Google-Smtp-Source: ABdhPJxPryL8aTPbGDHY35cMqmQRv/1khmLpGMz1CZxejsOJTmiAIVYrDdEFqOST7n2BhwCskVWCgMtwvi6EEzgxLZQ=
X-Received: by 2002:a05:6102:b10:: with SMTP id b16mr4947451vst.41.1631019017646;
 Tue, 07 Sep 2021 05:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210907060729.2391992-1-linux@roeck-us.net>
In-Reply-To: <20210907060729.2391992-1-linux@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 14:50:06 +0200
Message-ID: <CAMuHMdVjAdC7bqFcxtfquHxpHJELe=UxWW53DcO-wNYZ-1Sy=w@mail.gmail.com>
Subject: Re: [PATCH] m68k: Double cast io functions to unsigned long
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 7, 2021 at 8:07 AM Guenter Roeck <linux@roeck-us.net> wrote:
> m68k builds fail widely with errors such as
>
> arch/m68k/include/asm/raw_io.h:20:19: error:
>         cast to pointer from integer of different size
> arch/m68k/include/asm/raw_io.h:30:32: error:
>         cast to pointer from integer of different size [-Werror=int-to-p
>
> On m68k, io functions are defined as macros. The problem is seen if the
> macro parameter variable size differs from the size of a pointer. Cast
> the parameter of all io macros to unsigned long before casting it to
> a pointer to fix the problem.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k fixes branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
