Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF57C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 20:03:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55452613C8
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 20:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIUGZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 16:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGIUGZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 16:06:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E1CC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 13:03:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p16so25619452lfc.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GjLxl/5A6eJuzPoZbXrgSLTd3V4aS/hp4FhDUnvpL78=;
        b=e/G3P98BpmKF6+wMkSU6/W85uffPSsl+vCCjuVvUTNHAPoGuSi1bhKcQH0ndwEujk2
         2ueaCL864x5nGokSyBA1HXbkBPYC+5uxHSd8g2GL/kY1EKI6UNEBfF2fqJnF0Loq5vbc
         XLzq/c2+ppPsIsZ/y4kAOboTeV/3kvUXIrRI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GjLxl/5A6eJuzPoZbXrgSLTd3V4aS/hp4FhDUnvpL78=;
        b=bULpEIqfUtxFnN/erJEx+7MrtYKFJg10Oo55lW2eyV8IY53pEFMvlUNTtC4X3DA8qU
         +yfY2o/KYif38woI1EBdDNbxfCWxh0bb/zzsPd6FXvI4V54T6l+bie7RC3ygQ65E+5QH
         PrHHtUruNydnRRjdTPFldz+rbOxwE2UYl5LYb4zV41NpoBdGCbXEaI0LkHOxQSY7EKnT
         TmFBQGr/mTGlw0a7/oRrE4p9OIHVwNu3OKYKFbg2QiXfFX5Nv66MQUOymYKb2fjuBmC5
         AJFycUnxzRc36FCleXRYAUIZdYI6b+9zJSxbYik+d1fjTS06SIg/Ak5GEeJdrWAWHu1d
         uXaw==
X-Gm-Message-State: AOAM532biz+v8I8XXnbCwGXlFCzaWFaQ8+6/yV8Dhp8jz3jwNy8nRgbV
        82VxsWI/aP53//xoZpgWImpCVQbikJSE5T9N
X-Google-Smtp-Source: ABdhPJyczqhxPBolOgqIcSr1siDmIOqZUUoU3LglwDdJwo8+tN2nxcRF9qmRnEDKDSDrYT+0oxQFQA==
X-Received: by 2002:ac2:5f47:: with SMTP id 7mr6426820lfz.69.1625861019305;
        Fri, 09 Jul 2021 13:03:39 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id t12sm535957lfg.148.2021.07.09.13.03.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 13:03:38 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id p16so25619320lfc.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 13:03:38 -0700 (PDT)
X-Received: by 2002:a05:6512:404:: with SMTP id u4mr3169510lfk.40.1625861018497;
 Fri, 09 Jul 2021 13:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com> <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
 <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com> <34ba1bc1-9e15-3d14-55ec-a5b4ca118e63@gmail.com>
In-Reply-To: <34ba1bc1-9e15-3d14-55ec-a5b4ca118e63@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Jul 2021 13:03:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK9tKr4EG9B0YhW28XDUOUTc5-Ds1=pa1wtvFyNbExhw@mail.gmail.com>
Message-ID: <CAHk-=wgK9tKr4EG9B0YhW28XDUOUTc5-Ds1=pa1wtvFyNbExhw@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 9, 2021 at 12:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> That one got called from sys_llseek+0x5c/0x86

That's the

        if (offset >= 0) {
                retval = -EFAULT;
                if (!copy_to_user(result, &offset, sizeof(offset)))
                        retval = 0;
        }

and it might be worth doing a put_user() for. That would actually
simplify the code to just

        if (offset >= 0)
                retval = put_user(offset, result);

or something like that.

Except maybe there's some 32-bit architecture that doesn't support
8-byte get/put_user(), which may be why it's a copy_to_user().

I _think_ we made the rule be that everybody had to support 1/2/4/8
byte accesses, but maybe I remember incorrectly.

             Linus
