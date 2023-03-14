Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FABC6FD1C
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Mar 2023 08:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjCNISO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCNIRr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Mar 2023 04:17:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282FD2210E
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 01:17:25 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id ks17so9826363qvb.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 01:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiJgM0zkHAfbZPMbynbV1kk7pqKS5IZIYvWVi1CRCcc=;
        b=raqV6NEAJ6X7HdqExci57yn4a86aQbqHQNYwVVVCK66Eh689XIgESF9i1kDW27fcYQ
         1hV6vKZF2Kpnqpr6Tg2GRVjLPeDbGYyz4lJsKm1Fzu89oMOGEFPrOvDsXxciuldy3B9s
         7VjuIOKw67/p5bYechO7JwgZ3jtPhcxAcIdx3SpvOKuLxRGTyuCS/7AuAp+wdDPluVvH
         hWDSeus/cgNIQPQBIE6vRapsv7Npe3nPRXx2RrKqmx9AGwrIv4f9FGE2L7BDjNh+gQiA
         S1N0oOCnoJemv6iCxzCmAqOBq6izl+1qahulXZ4BZJzQPKQ/IPpXctH7IeRHjrRKpiAB
         0E3g==
X-Gm-Message-State: AO0yUKWPZn67cvFI3KuY7M9odGGsbUgkRZTWODkFcqFV0XBCvFK6PmbQ
        TsOLJZm7hNMYgYsJgqumTsQ54AOhtsAzRA==
X-Google-Smtp-Source: AK7set/QWBBDtf5h4eDgap6RTXdIBdItpwHl6AZIXADWdJyNks+AHT1HFSTb3phZr9pPVPYLvkhGpw==
X-Received: by 2002:a05:6214:1d26:b0:56e:b88b:7a9f with SMTP id f6-20020a0562141d2600b0056eb88b7a9fmr18431917qvd.44.1678781528528;
        Tue, 14 Mar 2023 01:12:08 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id l16-20020a05622a175000b003bfa932525dsm1461072qtk.51.2023.03.14.01.12.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:12:08 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id j7so3741859ybg.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Mar 2023 01:12:07 -0700 (PDT)
X-Received: by 2002:a25:e6c5:0:b0:a27:3ecc:ffe7 with SMTP id
 d188-20020a25e6c5000000b00a273eccffe7mr8957488ybh.3.1678781527769; Tue, 14
 Mar 2023 01:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230313180848.2770504-1-u.kleine-koenig@pengutronix.de> <5b61f399-7263-a93b-f6e6-626443d28bbf@linux-m68k.org>
In-Reply-To: <5b61f399-7263-a93b-f6e6-626443d28bbf@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Mar 2023 09:11:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQPh0BaQA1csgJbPxjorY15-V9=jb7ZL8Yq24Qe7k9jQ@mail.gmail.com>
Message-ID: <CAMuHMdXQPh0BaQA1csgJbPxjorY15-V9=jb7ZL8Yq24Qe7k9jQ@mail.gmail.com>
Subject: Re: [PATCH] nubus: Drop noop match function
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-m68k@lists.linux-m68k.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 14, 2023 at 7:26 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 13 Mar 2023, Uwe Kleine-König wrote:
>
> > nubus_bus_match() returned 1 unconditionally. This is equivalent to
> > no match function at all. (See driver_match_device() which does:
> >
> >       return drv->bus->match ? drv->bus->match(dev, drv) : 1;
> >
> > .)
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> Acked-by: Finn Thain <fthain@linux-m68k.org>
>
> Geert, would you please queue up this patch for the m68k tree?

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.4 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
