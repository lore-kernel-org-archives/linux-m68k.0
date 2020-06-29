Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA32C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 21:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51B4620656
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 21:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391473AbgF2Vrr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:47:47 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33507 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391467AbgF2Vrq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 17:47:46 -0400
Received: by mail-ot1-f65.google.com with SMTP id n6so16862032otl.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 14:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bg/8+MNYJDDCvPfevV5MmVW6eomjiYjuKJdPS9BuKRc=;
        b=Dp4pb5uErx+wuJC0jQR8Cs2gZcvJ5SHVDSVgfp3Epb8Gad/KMpH3+6nO2mvotXtfe9
         HbOR5+CqmTYM3ULShYrhx7MqNe5SoqCtqFpQi6dfNu9TQbPmXB/0UL9hGymMD91hrbTz
         7L++tg9mso2zzCvQfsVUsCIKUv9XEdd96iDQQO+fe75mfBp1Jswfy275e9MEC6UpQZXt
         ZBZtp7WmxbvRvwBjr3qPkd279UBstuLyOMsvLdbPxOlktK4cJgCAABA1jmK0bxFJJ+hM
         9cB1CmkqSZj/2RNjF0TG/8WK8A5zPhQ++H1TFRuUAUzYsyJLA2LMikft1NedR2TDVhFj
         KhEw==
X-Gm-Message-State: AOAM5317Go6p5fLajCWC1BQ4/4lnHK8fdqP4e9BsvZPQ+Ql0pUjK3eA8
        Gms6fNrEzW2CmhTMD9gpntvrxX3EhKE0jpRK9dQ=
X-Google-Smtp-Source: ABdhPJyLaroA0htJgp6XAeP34onG9mo2tlAy+lOvoV/8lvJ36fwjwGDczPcQeW26SHMu76Ngn9P5yzkiLg9cpAETRvQ=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr14223999otb.107.1593467266175;
 Mon, 29 Jun 2020 14:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200629193947.2705954-1-hch@lst.de> <20200629193947.2705954-2-hch@lst.de>
In-Reply-To: <20200629193947.2705954-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 23:47:35 +0200
Message-ID: <CAMuHMdXXORM_yD4bqk+MQ1yEA1jmOjO9eyfnsjxY1a5E5isEcg@mail.gmail.com>
Subject: Re: [PATCH 01/20] nfblock: stop using ->queuedata
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Lars Ellenberg <drbd-dev@lists.linbit.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
        linux-nvme@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 29, 2020 at 9:40 PM Christoph Hellwig <hch@lst.de> wrote:
> Instead of setting up the queuedata as well just use one private data
> field.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
