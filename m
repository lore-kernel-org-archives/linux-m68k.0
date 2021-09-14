Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C07C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 16:39:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF79361151
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 16:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhINQkk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 12:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhINQkg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Sep 2021 12:40:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFA3C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 09:39:18 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k4so30154597lfj.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 09:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eabaUKIAOkWHOaE/+sPU+65wzw7LINpAm76whKtOXdQ=;
        b=Rar0qDqMJopiYMb3lFbU+hm3N+TXY1EN9F6OBBm3OyT8QKqwcW1df61f6clmEuXTO+
         T8CAgmc7uRvm21NedcBz8omnqvaxix8KEi//HQ9bxGToKsbNbNLVQuLy/8MxYHCa1ool
         wSIF0kC9Ae+N2BeTMQq4fUZ+naAiyhWk2Nhrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eabaUKIAOkWHOaE/+sPU+65wzw7LINpAm76whKtOXdQ=;
        b=4QsK+5P6sHEGLJ7e/T63EJ79dq6L+C8Pm2hjKhUdaYjBPVUSwrCLIACYA+g/9aZ+xr
         HcX6kR6SHauKG/CZursGqqvvi0HmMLP9OpEY/Yh8L+p/V+znfhdLVrSrLNUmGSKjXbUp
         iZm18ef2TNZKWtigJ9YZdc1MP4uM58LKGD+tNJuoHibf3RMTB7e52WgiPOFlwa9GuTDQ
         c8vx7R55Z+MnUcK2Jx+8D9cFFwS3Pxe/vipT8GztNfe4wa4f9qLveRC1h4wQ8+XJP6NH
         T8batssw3yKqdE+KOnSY79ZH4MSg65VB0ScVXzm6uQFB16TWmKRYwV81Nv0tlehYbFQz
         +7Kw==
X-Gm-Message-State: AOAM530aL/AABS+sCSonyxsZh8ZZRQYyNnmiapS/TMsPL0ba/RBMXS7+
        PukF8ZcqR9Hnmv7ulU4u94scxvz+2A2AMHQ3y1A=
X-Google-Smtp-Source: ABdhPJzS8Qg7Had1hNTEFbpQGZwmMSUuJFDi+cAX7Tuq+Lj5Y7LL8/UxvZ2wUc+yQ0SGEmHOEZHj9A==
X-Received: by 2002:a05:6512:2619:: with SMTP id bt25mr14051772lfb.168.1631637556878;
        Tue, 14 Sep 2021 09:39:16 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id d20sm1161892lfv.117.2021.09.14.09.39.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 09:39:16 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id y28so5914404lfb.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 09:39:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr2408581lfu.280.1631637554229;
 Tue, 14 Sep 2021 09:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com> <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com> <CAHk-=wj86gMUzK4XPO+ibZqS77fAgU5eZXRPejn61OZk+rQiRA@mail.gmail.com>
 <YUDNviFDCFCzsh/E@zeniv-ca.linux.org.uk>
In-Reply-To: <YUDNviFDCFCzsh/E@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 14 Sep 2021 09:38:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2QPH3Ay+Xh-oKMEZ91SkKXUkBtYT8ex8Ke4GSas6JDQ@mail.gmail.com>
Message-ID: <CAHk-=wj2QPH3Ay+Xh-oKMEZ91SkKXUkBtYT8ex8Ke4GSas6JDQ@mail.gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 14, 2021 at 9:28 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> See https://lkml.kernel.org/lkml/YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk/T/
> for original thread.

Ok, thanks for the pointer.

I'm actually surprised we have that "multiple nested signals" thing
still. I had this memory of us having removed that, and just returning
to user space with the one signal frame set up.

I was clearly wrong.

           Linus
