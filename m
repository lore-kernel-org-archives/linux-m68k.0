Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71484C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 20:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A69B613BD
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 20:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIUQu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 16:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGIUQu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 16:16:50 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188F3C0613E5
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 13:14:06 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q184so9397298ljq.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=om3/tquiPRwJI5801Mk3pfJdMWk5Se4hEpSuQIq2E5o=;
        b=SHsg7Kb2mZywnx6e9hjPTlLtdEPpLsMsoHarQnq0jiVIQC0DgR2QQV0qk+QVOz3Ra/
         JI/f8tWVABGsMcGLlt6j+dpiomdXIMzTS3+NkMkW7+LYbPy/lpPDZp/43bYZ+fVyYOf0
         S7PasHQlzdEqLBn1ZMEv26ThxnzN+yGbh5UQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=om3/tquiPRwJI5801Mk3pfJdMWk5Se4hEpSuQIq2E5o=;
        b=Sv8eNybq3+ZXB2dUMLc4murIEp9MH+rOyqyz7v1PQF00WnyXh3z6QlyPmaH5Rie+ZE
         4VwTGHln+wJ3onb3JnIV9EsicoKFlVomoRqnyQN/PZufTX2dPqJ4/cz7VS8JVoTB6Kss
         GG6bYZwygudc8IljFpsvNIEh7FBuSMmJsSfQWrK/JgKPiyHuoEHKZOJFUkucX7oqUJQ7
         GQKooo7dtNQCx78dMI/Y7hhC1Kp108cP23giBweOIiv2GJv3q8HswnOEXY6InnGX6q5a
         Lic85CX3ZRIH9mXpc/fFmd+3eb0gwmiHFgQQFH5RwuuMeaKHp9N8TXKYSaRhf5CdgS0f
         ulNg==
X-Gm-Message-State: AOAM531dP5WfRxSmKAB2RL96QVwhRmjKj+SYKz52xFmuHPsqH2W1dZoi
        0c/39DgkwDkqYnn7aM7YAT0svtD17wVhflV0
X-Google-Smtp-Source: ABdhPJyAx9ZwO5jf6iwkaZrJI/SFpdruX35iLegAdAfyQ2WfX0f+Da3PoSThAFtSlWMXLr22kMuX9Q==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr801933ljc.312.1625861644269;
        Fri, 09 Jul 2021 13:14:04 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id v13sm660794lji.30.2021.07.09.13.14.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 13:14:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id y42so25615010lfa.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 13:14:03 -0700 (PDT)
X-Received: by 2002:a05:6512:404:: with SMTP id u4mr3195956lfk.40.1625861642795;
 Fri, 09 Jul 2021 13:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com> <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
 <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com> <34ba1bc1-9e15-3d14-55ec-a5b4ca118e63@gmail.com>
 <CAHk-=wgK9tKr4EG9B0YhW28XDUOUTc5-Ds1=pa1wtvFyNbExhw@mail.gmail.com>
In-Reply-To: <CAHk-=wgK9tKr4EG9B0YhW28XDUOUTc5-Ds1=pa1wtvFyNbExhw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Jul 2021 13:13:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4OM6wWh14y+AEOh2rwTz-61jviB5kyFYUY0ndc0q3gw@mail.gmail.com>
Message-ID: <CAHk-=wj4OM6wWh14y+AEOh2rwTz-61jviB5kyFYUY0ndc0q3gw@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 9, 2021 at 1:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Except maybe there's some 32-bit architecture that doesn't support
> 8-byte get/put_user(), which may be why it's a copy_to_user().
>
> I _think_ we made the rule be that everybody had to support 1/2/4/8
> byte accesses, but maybe I remember incorrectly.

We're _almost_ correct.

nios2 doesn't seem to support 8-byte user accesses.

Everybody else does seem to have a 'case 8:' at least according to my
simplistic grep (but that grep might have been _too_ simplistic).

Added nios2 and the arch list.

I think we could easily just say "you have to support a 8-byte
get/put_user()". At worst, an architecture can just implement it using
copy_from_user() like some already do, ie something like

        case 8: {                                                       \
                u64 __x;                                                \
                if (unlikely(copy_from_user(&__x, ptr, 8))) {         \
                        retval = -EFAULT;                               \
                        (x) = (__typeof__(*(ptr)))0;                    \
                } else {                                                \
                        (x) = *(__force __typeof__(*(ptr)) *)&__x;      \
                }                                                       \
                break;                                                  \
        }                                                               \

so if somebody wants to make 'sys_llseek()' use put_user(), I'm ok with that.

              Linus
