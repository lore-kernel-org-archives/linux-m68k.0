Return-Path: <SRS0=oftE=EF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A4DC4363A
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 13:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0FCD20637
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 13:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="qgEeHwBz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgJ3NW3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 30 Oct 2020 09:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NW3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 30 Oct 2020 09:22:29 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FB2C0613CF
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2020 06:22:29 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id v18so6508105ilg.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2020 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RiJM0N+P9MfW6VzzACq5Pg+q3WbBm9QpaMXg3W/6JAM=;
        b=qgEeHwBz0pZzvqJRsuLXSpffaVxjMMK8BoI3BneXcmtCOyind6V4xXfqDR0TAgsrx6
         KPig0QKu0QFYV7Ae6JqKX/8xmNrRTqyUnYYx6NEYBwkYoWhmTAkI08pCgBmrSvbgqBzG
         gXjoLOtbJPcehQWkfyLmyRkanJbkNzml3bLzwRz7h0wgT5m+m1/Z8dIkA6dAMF1QgNBm
         SYE0QwF8QkJzp3zOVGvYoEjz9az7B+8YklOv00S4LUAZboAkZ4iBHZ5hQTHFxces5bf3
         pIt1/cIcBAUvPt2gL74esclDTp0Oq6k3VMLJqYRS1fJSerJXLCNIxoFnQ1AJhKjjSfnL
         JDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RiJM0N+P9MfW6VzzACq5Pg+q3WbBm9QpaMXg3W/6JAM=;
        b=U29C6VAzrKIIB5Kv8F5ubwhJT6E0fRT1hn9Z/95j8/+7OzN8AW44EcRz1xcjlq+giH
         pzosxo22n9DiZSRdO3fTWMvgpN0QJ9MtRy1zzv+hg3tRqoE5NyDT1RzRs7BVI2OmbRV4
         vRUN9SJ5gCUWWws4LsK+ItlA5IT0JEB8FoUXAkD2h5vJnq/aF6QMsE/s5PtNnZWx02bi
         LY+6kLbUEwFiG+66CN2gqhddHl2qWM6TCEkK1NvYYH1QdDCCHZmzSaivt+yRbSG9tMtM
         unG2pWsYXYQzyljIsKHzKozSNuoSb5YU+78VLr+n9LfwBE6K3NUjigofqrz59QLbH7v6
         N+ag==
X-Gm-Message-State: AOAM533MmciH+1qBzttmJK4GfbMOj43Ah1+RKOeHv1tPQgHw1phAp0R9
        bzE1ySkL0dpTlAF9+083m2FiuLjBfBn6xg==
X-Google-Smtp-Source: ABdhPJwcrJ+FXVgXa+1dMwcF6g0He31VgNmpYsi4l23v8+zCL813QIBMcWF7cSiSKzkBipFaVnOeaQ==
X-Received: by 2002:a92:ba14:: with SMTP id o20mr1880041ili.268.1604064148011;
        Fri, 30 Oct 2020 06:22:28 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e2sm469888ioc.3.2020.10.30.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 06:22:27 -0700 (PDT)
Subject: Re: [PATCH] m68k: add support for TIF_NOTIFY_SIGNAL
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <63245c79-6fa4-49f6-d468-becf9a805ca8@kernel.dk>
 <CAMuHMdXXYdBadH4zj=bBsTzMBDxjQtAp=sYaz62ueOHqtWnDWw@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <21c936be-26ac-bd2b-fa05-963ad8968012@kernel.dk>
Date:   Fri, 30 Oct 2020 07:22:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXXYdBadH4zj=bBsTzMBDxjQtAp=sYaz62ueOHqtWnDWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/30/20 2:52 AM, Geert Uytterhoeven wrote:
> Hi Jens,
> 
> On Thu, Oct 29, 2020 at 5:16 PM Jens Axboe <axboe@kernel.dk> wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for m68k.
>>
>> Cc: linux-m68k@lists.linux-m68k.org
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Thanks for your patch!
> 
>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>> for details:
>>
>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>
>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>> as that will enable a set of cleanups once all of them support it. I'm
>> happy carrying this patch if need be, or it can be funelled through the
>> arch tree. Let me know.
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> hence please pick it up. Thx!

Thanks Geert! Added.

-- 
Jens Axboe

