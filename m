Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA41CDB47E
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Oct 2023 07:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376319AbjJTHSr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Oct 2023 03:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376356AbjJTHSq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Oct 2023 03:18:46 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4958BD51
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Oct 2023 00:18:45 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7d532da4bso4988307b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Oct 2023 00:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786324; x=1698391124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OizVgKEhlDyqgQ+n9W+hpcjW/zmDsIX6WVqXAdIMLco=;
        b=EJk87AszgRgcu9v68cHvDjJBQSv8NGy7eblQoejyaEJulSY3qNVwlfHNlJddAwVkMj
         42t9tggsy8xD3Xk2sjQgYbmnl9fM/HgvWaBeduqf0n1Y7sOs/jw4hGj5wwLe0ms+R4tw
         /Pvv3T/1Wu5fH/AUjMvCoHPGci+ptVapsd5HhfdER63K2ZJosCFeclvKq6CsqZYlq12j
         rW+hmUmLEEs1gP4nECFL4uKPvMHGc7529cwa9dWbsZvnE29RRiOtKcfElZ+CZRnF5jmX
         TpZDUI1yqIxtVVoiHmDjy0Rl99Xu4INaW1R79piI4JcIswc9xN0ub4bfh6q0bStswhLg
         7xlQ==
X-Gm-Message-State: AOJu0Yy/6XFnRuh1vfnwqvuUrtxVN2nl2ECn1d8CQr6arkwQaZzUfYMY
        Hn6HwCGRws+xebsn4H7ssFCpexcwLEi1KQ==
X-Google-Smtp-Source: AGHT+IHjLQos7VGyZ2FkuFD7N38R32dQugwbEGl3k6mC+NaU/EBUhUkuCTmFjjCyTG5/5MreNQOZsA==
X-Received: by 2002:a81:a050:0:b0:5a7:ba54:af02 with SMTP id x77-20020a81a050000000b005a7ba54af02mr1124155ywg.38.1697786324016;
        Fri, 20 Oct 2023 00:18:44 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id z1-20020a81ac41000000b005a7e429f9d0sm487109ywj.43.2023.10.20.00.18.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 00:18:43 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7d532da4bso4988017b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Oct 2023 00:18:43 -0700 (PDT)
X-Received: by 2002:a0d:ddd7:0:b0:59f:4dcd:227e with SMTP id
 g206-20020a0dddd7000000b0059f4dcd227emr1147454ywe.37.1697786323167; Fri, 20
 Oct 2023 00:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231020054024.78295-1-hch@lst.de> <20231020054024.78295-2-hch@lst.de>
In-Reply-To: <20231020054024.78295-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Oct 2023 09:18:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNmbMsqBF3gozT7yqUVJZ+9Eg2wjTuQF+1W4jKXdAZVQ@mail.gmail.com>
Message-ID: <CAMuHMdVNmbMsqBF3gozT7yqUVJZ+9Eg2wjTuQF+1W4jKXdAZVQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

s/depdenencies/dependencies/

On Fri, Oct 20, 2023 at 7:40 AM Christoph Hellwig <hch@lst.de> wrote:
> CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.

unmet


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
