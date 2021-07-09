Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD00C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 19:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A3EC613CC
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 19:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGITzi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGITzi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 15:55:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76D2C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 12:52:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso8253732pjz.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GdLc5FzSb+yImN+W4r7AQmT5Srr/lu6NzKX/tIS7/Oc=;
        b=NyA/BVMo2buNM6W7vJEjTxTh275m5UoQ7elmVOENVzaoma9S0wfi1PyG4UbofTYdpY
         dQU/+Go62Vx4wNPJthYRXOjv1STGPq3Kb5+pVA2XR0+xQMlOI63aiImX6cXUkDtlQPpM
         JRgoqvpL1PqaLNH7/mXVgBUmBNc4coKBrSFobNKG3eGYKrv+udkExPiKo/yFJXQLowUw
         tZyMY6QIuPJpbR9DlnCxCrH50AKwWAfTz0sxEkkLrA+lmkJXUekWyxKccQ2fXzI84v0P
         GcBpqiJqS1ce3EccG+A8CEGUgBcrU2ur8iAVXYOvLpM8wN9tmwaOX7AEpbihfNRn4qXq
         bRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GdLc5FzSb+yImN+W4r7AQmT5Srr/lu6NzKX/tIS7/Oc=;
        b=tpid+TIHNuLikpNbTHr/NbrIx+3MPuulEcCeoebYTAlIqCRa7G8gOnOM0XPXh1VjVV
         cZwh84VA9e8McAgKVAXmkwDLzq5SSKwX8XZJBk/GIi5pqiTlv/z+NpUm2hk9rZjt3xlm
         RyhRAqcYGeU+N/NWu7KwpN+4/8u+KaNMbPNaRuCSAO40s8IsIgznA19w12TKDQ2PULtZ
         UXtxCr2VqxhZoAyUXLfwMx/KbbFCqYuCrojYrrShE51cIpei4vbTEKQcVLhsot8Pbtiz
         hFaRCXAQsB8DlgKr0V5Uo9F/xJEtGnyvn5rIoPzmfB5V/ok5mm6KMofJmLddgc0dPhUi
         yVWw==
X-Gm-Message-State: AOAM5327fRVeQzMwrRMaZ7GjFVqJweirFIE6z67z6DSJmv8zpxwnYLBh
        sltihcTeOr6o/H8izliGGFXOf0atho4=
X-Google-Smtp-Source: ABdhPJxrQOBkLmk/5xJT9+RuMQ7hS0pslwNUqLOjo5IaAQVtUHkExIGv7hNQamhM8YJBpEube3sOlQ==
X-Received: by 2002:a17:902:d395:b029:129:c8a4:2302 with SMTP id e21-20020a170902d395b0290129c8a42302mr12542410pld.2.1625860373080;
        Fri, 09 Jul 2021 12:52:53 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id u125sm7680415pfu.95.2021.07.09.12.52.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 12:52:52 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <34ba1bc1-9e15-3d14-55ec-a5b4ca118e63@gmail.com>
Date:   Sat, 10 Jul 2021 07:52:47 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 10.07.2021 um 07:25 schrieb Michael Schmitz:
> Hi Geert,
>
> Am 09.07.2021 um 23:20 schrieb Geert Uytterhoeven:
>> Hi Michael,
>>
>> On Fri, Jul 9, 2021 at 11:00 AM Michael Schmitz <schmitzmic@gmail.com>
>> wrote:
>>> Am 09.07.2021 um 20:53 schrieb Christoph Hellwig:
>>>> On Fri, Jul 09, 2021 at 08:34:07PM +1200, Michael Schmitz wrote:
>>>>> Just booting to a login prompt: Quite a few with 8 bytes, some with
>>>>> 4 bytes
>>>>> (those from the keyboard driver), the rest is 16, 24, 36 and 92
>>>>> bytes (a
>>>
>>> Over 400x 8 bytes, 20x 4 bytes on a count with the larger one
>>> suppressed.
>>>
>>>>
>>>> The 4/8 byte ones can usually be switched to just use get/put_user
>>>> easily.
>>>
>>> Need to log the call sites then ... that should be fun. Something to do
>>> tomorrow :-)
>>
>> WARN_ON_ONCE() is your friend.
>
> Sure - here's the result:
>
> WARNING: CPU: 0 PID: 1 at ./arch/m68k/include/asm/uaccess.h:395
> raw_copy_to_user.constprop.27+0x26/0x42

That one got called from sys_llseek+0x5c/0x86

Cheers,

	Michael


> WARNING: CPU: 0 PID: 819 at ./arch/m68k/include/asm/uaccess.h:395
> do_pipe2+0x4a/0xbc
> WARNING: CPU: 0 PID: 838 at ./arch/m68k/include/asm/uaccess.h:395
> __put_old_timespec32+0x36/0x58
> WARNING: CPU: 0 PID: 854 at ./arch/m68k/include/asm/uaccess.h:303
> vt_do_kdsk_ioctl+0x38/0x28a
> WARNING: CPU: 0 PID: 950 at ./arch/m68k/include/asm/uaccess.h:395
> tty_ioctl+0x27a/0x6c4
>
> uaccess.h:303 is __constant_copy_from_user.
>
> Cheers,
>
>     Michael
>
>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
