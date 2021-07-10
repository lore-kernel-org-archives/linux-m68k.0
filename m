Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C57C07E99
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Jul 2021 02:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D04D2613BE
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Jul 2021 02:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhGJCqm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 22:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235556AbhGJCqk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 22:46:40 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87BBC0049BF
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 19:30:57 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso7124167pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 19:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=e164slDPVtOS5ICQh1g3izRabE0A5nDJNbSTDw7Ehk0=;
        b=l6nHaGIsCeDXv/g8NSE7nx5xagyKWeIQn0cLIYQL9MmoR+ymfHV6QWcHM8yiOtimBm
         RHg+LFqsZtI9Mz6uEIg7mxUU/cyWvX/qD/PM+lKc9lj2qpWOd9zp3GTqOgZMWvfmFpw7
         q3UOhNjZP2F18y6zzl6P81rRqoRnxoSfTfZ9HsOw/9U0XafNgGagE97IkY304akBeh9I
         r817cRZ24Fb129mGuyQEMRiEp9O3eYsxs4gFvOomOYPm+FtBQLipxFPsjzXOPKYCKQAt
         h0h/XObJk8n9kAy4TZevgAJx0Sb+1cCJAg/SNWZ2odLCPGtNeDdJnYC6yE8IRTbIyDdm
         ZQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=e164slDPVtOS5ICQh1g3izRabE0A5nDJNbSTDw7Ehk0=;
        b=YKyoIds3q0IZJyUsD+KzX/GoyiM6cjq2lp1hT3rPPKJA2GOmiunOgK3Y3it6s5ht4c
         +4mKXKF/Eu4SjQVkMuuYrmLadOBA/S/pWCvmVQRNNmt6nkGW1ZCE1G9JbE61C08aruvF
         ahINNuTyBHtylRx+3HnYZi5bCu92BpZzmUD9fK5rmrdH3Teuj35B2KCDs6k357oHpJwc
         1+2u0R6F3db+6cqkf8K2pdOZBRlXQQvaRUcBO+cSpaBj0kPSDukxWzBS7eoq968SVIBy
         twWaQDl7j4Y9ZtwlcBm5Ws4Z3piq0It1NPfIuigo9hE/RU95AXHt1GlQkRho9aq6DjJ8
         ZxWg==
X-Gm-Message-State: AOAM5321EEpfl5XMyuopUYjIydyJRed7tXSixZYl4yUBiJ+skuYKjanI
        0jkzKtLl04VmwZgDMIZyJzA=
X-Google-Smtp-Source: ABdhPJwvgdlLWKd+A40glLg7IKQNwIp19lJrY72N76qxl/J5QjWcU8P5umas/SVM045FXRqxhC83Wg==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr25080131pjj.233.1625884257222;
        Fri, 09 Jul 2021 19:30:57 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id k198sm4064319pfd.148.2021.07.09.19.30.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 19:30:56 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
 <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com>
 <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com>
 <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
 <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com>
 <CAHk-=whZOcS31_rKL6BBg7Ln5hqvO=ZiFm8MCmvAHZe8F_Acrg@mail.gmail.com>
 <144440f4-741e-c305-2a8f-b9c1a02e1aa7@gmail.com>
 <CAHk-=wjNcVijop--SC6XABVH675jr8oZ0XACbeXZX-j5QTtxjQ@mail.gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <314437f7-4223-d841-e1e1-87cbf9a4313d@gmail.com>
Date:   Sat, 10 Jul 2021 14:30:51 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjNcVijop--SC6XABVH675jr8oZ0XACbeXZX-j5QTtxjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 10.07.2021 um 09:18 schrieb Linus Torvalds:
> On Fri, Jul 9, 2021 at 2:08 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> The 8 byte copies are by far the majority.
>
> llseek might actually not be unusual. And the timeval structure is - I
> think - 8 bytes on 32-bit architectures and common for select timeouts
> etc. And select/poll can be one of the most common system calls out
> there depending on loads (usually graphical programs).

There's more const short reads in the old IDE code (1, 4 and 7 bytes, 
the latter two in the ioctl syscall), and one 8 byte one in the libata 
code (ata_get_identity()). None of this looks anywhere near performance 
critical as llseek or select/poll.

> But again - I don't think it's even worth worrying about in
> architecture code. If you actually can measure it, I think we should
> fix it in generic code rather than have architectures work around some
> issue one by one.

I doubt it makes enough of a difference to measure, but maybe the llseek 
impact is large enough to show in IO benchmarks. I'll run tests on 
Christoph's latest patch series anyway so I'll have data to decide that.

> I think the main issue for m68k should be "is it stable and works". At
> least first. And then worry about copy_to/from_user() with a constant
> size as a very very distant second concern.

So far, it looks like there's no regressions on either 030 or 040. Can't 
see much difference on 060 other than its use of sfc/dfc in the ifpsp060 
support code, but that's all inside 'unimplemented instruction' trap 
handlers that can't be preempted AFAIK.

I'll ask Adrian to test these patches on 060 as well though.

Cheers,

	Michael

>
>               Linus
>
