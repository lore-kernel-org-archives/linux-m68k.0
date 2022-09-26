Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA333C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 21:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiIZVm6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 17:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiIZVmz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 17:42:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A221979C3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:42:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15BBEB80EF8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 21:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97506C433B5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 21:42:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ApVTPV3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664228569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G3jnuCsKMQZo8/iMFxkmC6/v9Au+LPdCR3w6QTCfbEs=;
        b=ApVTPV3nWMfpht+O5md87+wb9Oxq1g00+LMG7lsugFwqcAo3/bkCp0W7q64lXJQ37j012C
        YnMdDZfhSmMbDMFDlaAoV6a1DDDZxT+3OdYs5rLiQxGfCIJ0hUTA+mfNaa3Fax2Z0RjUll
        mMGKjLEdOCYUs/zc5os5UVv7r+aMRvY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f2f890d4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 21:42:49 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id m65so7944069vsc.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:42:49 -0700 (PDT)
X-Gm-Message-State: ACrzQf1QQZdnARkbEAQz61pPb5R7HTQAmflkuXgWzsNAQhcwnFkRMbsS
        MqaDSiccSrMZrdTZKvX5difQ6gynMq0DMhI82bc=
X-Google-Smtp-Source: AMsMyM4ljHjfRvVHl8ZRyGKK1+syRtfkJUf7lIFJ4spQr/tikZeDGJQ0nQDFJXNaXJj31mqHpddc7eNedREbE3A5J2Q=
X-Received: by 2002:a67:c289:0:b0:398:cdc:c3ef with SMTP id
 k9-20020a67c289000000b003980cdcc3efmr10126690vsj.76.1664228568439; Mon, 26
 Sep 2022 14:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220926113900.1256630-1-Jason@zx2c4.com> <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu> <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
 <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
In-Reply-To: <5ebf4a4a-031b-0706-d199-d116cd518226@vivier.eu>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 23:42:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Message-ID: <CAHmME9qFuKwUKvqOZZMuy8v+SLBh1Dt5+5xRM=+v6ynGktbj8g@mail.gmail.com>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4 bytes
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 26, 2022 at 11:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/09/2022 =C3=A0 23:40, Jason A. Donenfeld a =C3=A9crit :
> > On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wro=
te:
> >>
> >> Le 26/09/2022 =C3=A0 13:39, Jason A. Donenfeld a =C3=A9crit :
> >>> Various tools, such as kexec-tools and m68k-bootinfo, expect each
> >>> bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> >>> padding to fill this out as such.
> >>>
> >>> Also, break apart the padding additions from the other field length
> >>> additions, so that it's more clear why these magic numbers are being
> >>> added, and comment them too.
> >>>
> >>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> Cc: Laurent Vivier <laurent@vivier.eu>
> >>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >>> ---
> >>>    hw/m68k/bootinfo.h | 10 ++++++----
> >>>    1 file changed, 6 insertions(+), 4 deletions(-)
> >>>
> >>
> >> Applied to my m68k-for-7.2 branch
> >
> > What about 1/2?
> >
>
> I'd like to wait a little to see what happens on the linux side.

Alright, makes sense. Just please don't forget about it.

Jason
