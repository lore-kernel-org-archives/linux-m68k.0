Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E8DC54EAA
	for <linux-m68k@archiver.kernel.org>; Fri, 27 Jan 2023 14:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbjA0Oo0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 27 Jan 2023 09:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjA0OoZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 27 Jan 2023 09:44:25 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C3416302
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jan 2023 06:44:24 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id q15so4169376qtn.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jan 2023 06:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBQ69gJhNdmdww116vm2vV2vkXQkHC2R7rjBsdtBkvY=;
        b=cS15VFvBHhrZUvPhoGcWLkUQ52Xyoe+JYQUgiV5goZKY3XnBrdaKArGiHJCt+12jvh
         AB7bx7y7sti78ghJYXFKlS5TnWU4uBFzvoCnwKeuyQ6j4wRBfg4fxV/di8rdTs2Bpa7m
         hOkWgFP3rTmbbP6fj04bdRSKpXSyySSGQSdFMagzm1YbY/hYI0av1/dItXz+zuQUez8z
         0HUb91sbN7y7IhwAYYImgzDXZUYJUtFIjUQeq7cdNBE6ByYDUx1EYb9iTYgjrWG/phSi
         qmb7oZfJu4Grascd9iJi0Q2+7GQ7Dusrr6eJ1fM3UFWzLttZR5AwAgVp7HuGJHKnJo2D
         e23A==
X-Gm-Message-State: AO0yUKW7qSrcdSgjmEp44VfNPtVLAbpZajbQcBKZDmQYnKWB7oLVTaLo
        rA4qMr8NaoBuwu3gJOHoOLYc8IWfAvJznA==
X-Google-Smtp-Source: AK7set/A2WY7lI54EE9XFQi35IYuDrsCCQ9GwKiD5kXfJADYSfz/qroAUE994lCFc2vPJm+ocZSnkQ==
X-Received: by 2002:a05:622a:100f:b0:3b8:2ce7:4ea7 with SMTP id d15-20020a05622a100f00b003b82ce74ea7mr1708464qte.1.1674830663384;
        Fri, 27 Jan 2023 06:44:23 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id ej4-20020a05622a4f8400b003b2ea9b76d0sm2741878qtb.34.2023.01.27.06.44.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 06:44:22 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-50660e2d2ffso69973007b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jan 2023 06:44:22 -0800 (PST)
X-Received: by 2002:a81:1216:0:b0:506:6b5d:523c with SMTP id
 22-20020a811216000000b005066b5d523cmr807528yws.283.1674830662465; Fri, 27 Jan
 2023 06:44:22 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
In-Reply-To: <Y9PWhU7DVQCLP9EX@bill-the-cat>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Jan 2023 15:44:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
Message-ID: <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     Tom Rini <trini@konsulko.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC Angelo's other address, as sysam.it is MIA.

On Fri, Jan 27, 2023 at 2:50 PM Tom Rini <trini@konsulko.com> wrote:
> Hey all (and especially the non-U-Boot folks / lists),
>
> U-Boot has had support for the m68k architecture for practically forever
> it seems like. Unfortunately, it's also been a few years now since I've
> seen anyone active in reviewing general patches to the architecture and
> doing the little things to keep it up to date and following best
> practices. So I'm here asking, does anyone know someone interested in
> maintaining U-Boot on m68k, for whatever platforms interest them?
> Otherwise, sometime this year I'm likely to drop the architecture.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
