Return-Path: <SRS0=Gn/+=7B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE19C433E0
	for <linux-m68k@archiver.kernel.org>; Tue, 19 May 2020 19:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 072AB20578
	for <linux-m68k@archiver.kernel.org>; Tue, 19 May 2020 19:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="DIr2jVq0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgESThQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 May 2020 15:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgESThQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 19 May 2020 15:37:16 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD95C08C5C1
        for <linux-m68k@vger.kernel.org>; Tue, 19 May 2020 12:37:15 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id z12so377140uap.6
        for <linux-m68k@vger.kernel.org>; Tue, 19 May 2020 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nbrp/LAnuLBxSPtlONuQw444EY5ahg5VqvIIJlCXM2w=;
        b=DIr2jVq0KOhkpSdmZAgmC/qq+bcuWIyH47knuQh+KJx0s6VUooieZgl17R2zZPG8Ij
         jKmBiqqNJHrJEtLZSikNsYvJV7snZhC1hR0JBhiSrQPoxjt9k+jBsFr8h72Gf/2XPq1P
         fFI9ZIZUtmZD1dArWnfjyHo/2OR2KiIUcsX5RZC8vTyakb5W0jSQ67MZSZLk3s6S3gRr
         CVAl57+knQuFAuAXZSY88ukWCgnCyWH1HZItzJIF4IDNPGA6PXUM49CEu+5AoG6wHT65
         l8OtvXChAJ3ZJdNNYMXC67t6YqByXdrAxP5vGXnLLYoV0Xq8Smo6yUG56wwQZtblb0Y+
         K1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nbrp/LAnuLBxSPtlONuQw444EY5ahg5VqvIIJlCXM2w=;
        b=Sr9HjGqvCk+VgfRr/ASFu8kMAaa+HcFGbfxeBdALnkWVfBoo7xWDQH5qhSVoUgu82/
         zAK1/rlOF8LhEc2qhBEMWZ0Hgo6e7B/KQW5yNLjZkrSflMuMBX3ow0IJXDTSnSm15TiB
         XIoKLqMZpG2/2eqE6700ZXYxiXhx489p9Ef/EvtHvTGk8zdj02RyiVA2wYzzymb/STTS
         6DEMETbA0SVlib4b0V43E15bDeDLxP1v7glLuuHME9Mj6ewPV8ZkVuInO1J6vO2qjE5T
         7m9B64b0zbPalrmBdyw90EkJAnzvGy2zSwW3xn+ecYGzwVjBhrz0xNo/Ck1OsuCknB8G
         /WJg==
X-Gm-Message-State: AOAM533HxKnvx2wKAFo1HxoFIsnNl0HxttTy6R0j7ElEVvK1A8ZVgwL5
        xun9QBA9Fh4nZtqYmf/uE3R1se4xtowBi5fDVwll8QgKWoY=
X-Google-Smtp-Source: ABdhPJyfp8AiLwJMIhMDCZy79oLE/+vFIfY5EQRGBQ54rMoDYSLIBkjAEcVJYs6GoTab1rxkKJ7IDpz+5FrBtLyOesE=
X-Received: by 2002:ab0:6713:: with SMTP id q19mr889699uam.114.1589917035031;
 Tue, 19 May 2020 12:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200518191742.1251440-1-angelo.dureghello@timesys.com> <CAPDyKFrj3Xh5uahMroWb7EMBh7bJ_yyambE+Yn3WQBHNB_CROA@mail.gmail.com>
In-Reply-To: <CAPDyKFrj3Xh5uahMroWb7EMBh7bJ_yyambE+Yn3WQBHNB_CROA@mail.gmail.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Tue, 19 May 2020 21:42:07 +0200
Message-ID: <CALJHbkD2PHF=nTvyeL9gz2sQChhUOB4tB7aF4qkJCW-h8yy86A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] m68k: mcf5441x: add support for esdhc mmc controller
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hurra !

Thanks all for the support !


On Tue, May 19, 2020 at 5:30 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 18 May 2020 at 21:12, Angelo Dureghello
> <angelo.dureghello@timesys.com> wrote:
> >
> > Add support for sdhci-edshc mmc controller.
> >
> > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> > Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>
>
Regards,
angelo
