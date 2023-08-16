Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BB7C41513
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 15:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344371AbjHPPuu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344370AbjHPPuT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 11:50:19 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F312D44
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:49:59 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58c7bd44c7bso9572357b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692200999; x=1692805799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iT0YlCUUEWGIL1xiG1wfsHzxu/rA8CnFEMGG0g8NF0=;
        b=V2YXQXx9jFHBXHTQ33a358ZDyn2huODhPXIJEzTD30jr1uwrk2lyEUmoueqLawK63P
         nXRZAKhQ8LWMlJg4FR7LJm8db9A8Qgv3I5B6fdk0yPUMlCNl1DogzbXPqx0kXz83RSsm
         uVMkMs7sPOtpzNaugtdApD5N5UHncF5BUPCpLFM7FuePbPzuM8XWjjmqb/8OmnMHhJT2
         wk5eHqB1hE8TIx9unJVIpYIEmgTU2zQEizTcADeAJw8Y4r4rK3KSfMjJ11XiVYKX9hrd
         K+wEm5Qe9QdZ14dizxXvpAOawhjc7KIylye0/vlJuAUK1Ya0/3Ah6kAt9gYP5ltIeZOb
         q8NQ==
X-Gm-Message-State: AOJu0YxEF6zHi4IuLfrIaPw+r/AjNS7Dc53CV81a7Yh+X2InVZaBbmug
        SCwMkZo5v4EOBHn3tzeLsYhMeRWhuUheUw==
X-Google-Smtp-Source: AGHT+IGTVZ2QIUEHjik/EeRP8AbYwqeIaZBHIgxNdE/jKupSzhPGCSF3/wfYI04L+UbaC6cECOrDAw==
X-Received: by 2002:a81:9e41:0:b0:577:3aaf:c876 with SMTP id n1-20020a819e41000000b005773aafc876mr2324981ywj.30.1692200998810;
        Wed, 16 Aug 2023 08:49:58 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id w22-20020a814916000000b00576e5af0249sm4012544ywa.20.2023.08.16.08.49.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:49:58 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso6573875276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:49:58 -0700 (PDT)
X-Received: by 2002:a25:6b44:0:b0:d01:2e8:740e with SMTP id
 o4-20020a256b44000000b00d0102e8740emr2125365ybm.37.1692200998153; Wed, 16 Aug
 2023 08:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <20230810141947.1236730-11-arnd@kernel.org>
In-Reply-To: <20230810141947.1236730-11-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 17:49:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuFSX+W6-MaiUAf+s4pqmGZnX2z5NV1vyGVQaMz5CaWw@mail.gmail.com>
Message-ID: <CAMuHMdWuFSX+W6-MaiUAf+s4pqmGZnX2z5NV1vyGVQaMz5CaWw@mail.gmail.com>
Subject: Re: [PATCH 10/17] zorro: include zorro.h in names.c
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Aug 10, 2023 at 4:22 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The zorro_name_device() function is defined in drivers/zorror/names.c, but
> the declaration is not visible there:
>
> drivers/zorro/names.c:58:13: error: no previous prototype for 'zorro_name_device' [-Werror=missing-prototypes]
>    58 | void __init zorro_name_device(struct zorro_dev *dev)
>
> Include the header to avoid the warning.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.6 branch, with the "zorror" typo fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
