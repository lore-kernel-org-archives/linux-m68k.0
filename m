Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27660C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  2 May 2022 08:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383826AbiEBImN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 May 2022 04:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383869AbiEBImK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 May 2022 04:42:10 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E710E4C78D
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 May 2022 01:38:38 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id hh4so10628866qtb.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 May 2022 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nIzQZnMpTAmjQQOkm7iT5MX1+3DBposIe0eGJZB2fQ=;
        b=eqxNgLh4ggu11vFe2NZuLLIKdMsho+pMoQ/5Xf4WbY5ZJLSJaTppiBmvbizbhblosM
         R/d/6x7DAElBBj0waeTnR53bojPXpy9C0Wxw3agHIy8u6PG/VtYZBcFQRoc0aXuNzHwr
         IA5c+EUWBi0UYTH3oIJ6GfhGOa6rLEuuw19vhQOVwrBd6ZUkkXPI26wN4XQgE7oKR6mR
         EMLyAv3HBsTT/aKurXufO2OR0jRuyu0CD/LfsOWd4YOabAWrUB/NV5XqUTUwoI+LuWaK
         g280Mh0bM/6q/CDyXlytxbSmOqbfflGQCB2BqW80hIUKDnBy5T0+WWkYyV1x6ybIIMZQ
         LeLQ==
X-Gm-Message-State: AOAM532kSMgrjZD9mL0m1jjpqiLpGjf3BR9r45RzRRMkW8VyvVPdQASE
        JVmcOQ2JGdeAK0vpsc62SVP3yNLzNsQ3xg==
X-Google-Smtp-Source: ABdhPJyIxv+m2zMnEQnGYIIX7fpx6VWR56C4Lk4n1Upe9YVI3O8IBs5W2PgaRvHA/FOsWD2uEuOjWw==
X-Received: by 2002:a05:622a:552:b0:2f2:538:d951 with SMTP id m18-20020a05622a055200b002f20538d951mr9295075qtx.466.1651480717733;
        Mon, 02 May 2022 01:38:37 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id c13-20020ac8518d000000b002f39b99f688sm3743622qtn.34.2022.05.02.01.38.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 01:38:37 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id g28so24840228ybj.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 02 May 2022 01:38:37 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr9787048ybu.604.1651480717160; Mon, 02
 May 2022 01:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-4-Julia.Lawall@inria.fr>
In-Reply-To: <20220430191122.8667-4-Julia.Lawall@inria.fr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 10:38:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnbbURooc7bePQX4E0FZVPO+eiKd8kYW2cz0mx3r82ZA@mail.gmail.com>
Message-ID: <CAMuHMdVnbbURooc7bePQX4E0FZVPO+eiKd8kYW2cz0mx3r82ZA@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix typos in comments
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        kernel-janitors@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Apr 30, 2022 at 9:11 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
