Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D9EC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 21:08:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7A5A613C3
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 21:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhGIVLg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 17:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhGIVLe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 17:11:34 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFBEC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 14:08:49 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 62so11216275pgf.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=7SfzQ5pejVvMf2XKIKg8xpc6+j0jKPSDzDj3JU3zIDs=;
        b=YN/++rBYWjZ1RN1DK2R0rrharV0jtN4rFohD4euFvSiTDyQaS2t2Yan5qbmxnNd9k5
         Q9olKCSr9Ag0UIvWj7YpVsC+2xj12ykoNtVIGhqhtEuEVT+MrwWIoqeJakKjRvO7eqrT
         Tj3bZ5AtsSaTkRAJ1ESt7rAZM7D4HMx0GwdDTGnHuAQessS/+Kq4ZBy+KIrwxALHFM+/
         WXRZgLIQVoltjJdeuIYaJ/uzsmEc7D4uDhy+K9tG3SB4WDNMNemkduWZsEWqRWTZ4gvs
         o3vILn3mkC8gdPSbJnud6VfXnfR9tP5Efs6/CduSTo+d2tLXIoiqP5c/2Vg2FKzVTBB4
         LBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=7SfzQ5pejVvMf2XKIKg8xpc6+j0jKPSDzDj3JU3zIDs=;
        b=KjBJdt2mPVeI3oHdny6jm7t+UbVz4W39jPEQtvFGuyFhiK9Jv+ZLeRxpCzNG3kv4dO
         ht0e8zCpobntuDiRkEWq1fGhXDOuh4r17xODVrk/7UztvnqggeZtZz+keTiV9+V4dRIk
         3Noal2r88JyXrQFH0fnhr2ilotKCC8V+09V9Wz0kw2bYCol7yLvePZfVER9JnWeNuvfz
         ttdBO8ngDuzvWUOJcRFnO/RBjZr+BRY9wD09tUxaAuJV0UkKitijDyrHixYoUBqAX2HG
         FIrr9LCtoAPfkwjNajb49R7IRxo3PYCVrStIIdfRlcsScBQ/ZlL2nSss++CAIeefdeql
         2/1A==
X-Gm-Message-State: AOAM533Y0sNZQscjPZ/vr/b9ZLQD2wCxjyGDnmMhUwQZp7URX9EoYnlL
        r7KMIUP0xKqRiEFssaC6Y+2MFZ8MIoA=
X-Google-Smtp-Source: ABdhPJyhtoHaEVSemENzsfVyFQCEKlgy+h/Ie0MwmQzdHXcah0vSAmBhGwzMoZyIf2yLewEaCf3CDg==
X-Received: by 2002:a05:6a00:194a:b029:324:be70:4653 with SMTP id s10-20020a056a00194ab0290324be704653mr19952588pfk.20.1625864929196;
        Fri, 09 Jul 2021 14:08:49 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id f20sm6980972pfv.47.2021.07.09.14.08.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 14:08:48 -0700 (PDT)
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
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <144440f4-741e-c305-2a8f-b9c1a02e1aa7@gmail.com>
Date:   Sat, 10 Jul 2021 09:08:44 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=whZOcS31_rKL6BBg7Ln5hqvO=ZiFm8MCmvAHZe8F_Acrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 10.07.2021 um 07:53 schrieb Linus Torvalds:
> On Fri, Jul 9, 2021 at 12:26 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> WARNING: CPU: 0 PID: 854 at ./arch/m68k/include/asm/uaccess.h:303
>> vt_do_kdsk_ioctl+0x38/0x28a
>
> It's apparently the
>
>         if (copy_from_user(&kbe, user_kbe, sizeof(struct kbentry)))
>
> which is 4 bytes in size.
>
> Honestly, it could be done with a get_user(), but it could also just
> be ignored. We're not talking performance-sensitive code here.

Yep - that one was quite rare. But I haven't actually done anything 
meaningful on the system yet :-)

The 8 byte copies are by far the majority. Got another one, just after 
logging in:

tty_ioctl+0x2ca

I'll run that instrumented version on my 030 for a IO stress test once 
the current test has finished. Just for the record - the 
WARN_ON_ONCE(in_interrupt) that Christoph added in set_fc() hasn't 
triggered yet.

Cheers,

	Michael


> x86 got rid of the constant-sized user copy games not because they
> don't exist, but because they just weren't worth the pain.
>
> If somebody really wants to do it, then I suspect it would be better
> to special-case the 1/2/4/8 byte case in generic code, than have
> architectures special-case the odd sizes.
>
> But it really shouldn't matter.
>
> On x86, we found that
>
>  (a) inlining get_user() was bad, because it just caused lots of
> duplicated code for the range checks.
>
>  (b) turning copy_to_user() into get_user() didn't really matter and
> caused tons of duplicated code
>
>  (c) the (few) places that cared about performance should use neither,
> and should use "uaccess_begin() + unsafe_get_user() + uaccess_end()"
> because the reason they mattered was that they ended up doing multiple
> accesses and the overhead was elsewhere.
>
> Of course, on x86, the big reason for (c) is that the biggest cost
> often ends up being the "enable/disable user space accesses" overhead,
> which is about security and a feature that m68k doesn't have.
>
> So the trace-offs are certainly a bit different on x86, but on the
> whole I suspect the lessons from x86 are not wrong.
>
>                Linus
>
