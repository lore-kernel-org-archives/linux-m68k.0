Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04585C7619A
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 04:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjDKE45 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 00:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjDKE4y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 00:56:54 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723F12109
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 21:56:53 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id p8so6786803plk.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 21:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681189012;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/k+XIFw8PDvRq/y0LeYpQrDL+Fu5tG5GpME0RTGphw=;
        b=qhy/DHgNtqH0uBelqWQVJkWIRxGW6idHbvRHzHeW3puj/UhOG8Iq3yn7aPk9wMf+Fv
         tyuqM0Y87bVEVqyRf77zuEMKhHaWsoia3qtx7oPwkaEMs/VFEAQ8qYjOTTL2Cl3cpHb8
         IGRPHfUSClW2kD0gK/x7tnqhl7zlhd2dbjEN9zu82POJaN+lMmATpg410MYcrw3fvpTl
         11gTeSiavXFwSah4nNRGm5XKReCd+gf2+U+H6dqYhVCSkzRJA2OFe8ysHo/7k3AM3K/3
         SMMKiFSFf6aG2EBegAKl8DdGjFrpwmqEEgJGr3caA51xySnHyuDU/LXashdOeXNbgZWB
         GxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681189012;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/k+XIFw8PDvRq/y0LeYpQrDL+Fu5tG5GpME0RTGphw=;
        b=ShenGKGkCW8YbD2Z9kO3MxiNbAz6Pxydrr/J4A+RQ1qBdnV/Qoo1V0QWHwSXk/q/iz
         ESE22pux5pHebjlQ1yGAHlY5RBce2ECT/Hnpdu7IxOLBBFHRm4EyC6AAtaHAwOBLtvOF
         mnypNzMNs1aUQ7p0hDuWZBRshBSfwvbA/qeF7cqlIThWkfM4JuK88yh/+Q8gpq5celch
         wd/Cf5Jz7zOvurbsv2KpbkjxrWXF/IyoWLQiyZdSFD0IJ1YK1Zh3sGiSwbbGbDsOUDor
         EMEcuOYL4BKw1YS/TMps950qyaAarv1Qfk1LONzdMwV4mz+SbeHa2bWEow1IQy015gnF
         WWBA==
X-Gm-Message-State: AAQBX9c83gAlj/ZiIiXsrCIsUwsUtTDmjoXYrhWzFwj2oTzUlZ5ghRJq
        PXVtUpGjYvrFC5WK2rzQOKbVtlPMQ/o=
X-Google-Smtp-Source: AKy350a87wuSZYH52NE8dL16WvHU0oA7JlgnygMBz0fQLXzS7f3jvJvThLnvgiBNDWtsW84jjvXWsg==
X-Received: by 2002:a17:90b:3908:b0:23b:32e5:9036 with SMTP id ob8-20020a17090b390800b0023b32e59036mr15620064pjb.17.1681189012474;
        Mon, 10 Apr 2023 21:56:52 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902778c00b001966d94cb2esm8606050pll.288.2023.04.10.21.56.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Apr 2023 21:56:52 -0700 (PDT)
Subject: Re: instrumentation, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
 <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
Date:   Tue, 11 Apr 2023 16:56:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 11.04.2023 um 12:20 schrieb Finn Thain:
> On Sun, 9 Apr 2023, Michael Schmitz wrote:
>
>> Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
>>>
>>> On Fri, Apr 7, 2023 at 3:58 AM Michael Schmitz <wrote:
>>>> The easiest way to do that is to log all wait and signal syscalls, as
>>>> well as process exit. That might alter timing if these log messages
>>>> go to the serial console though. Is that what you have in mind?
>>>
>>> Store to RAM, retrieve through a new /proc file?
>>
>> Yes, that could be done, though I'd rather avoid duplicating a lot of
>> the generic message formatting code (printk and friends).
>>
>> I'll have a look around ...
>>
>
> A better solution might be be to port the existing instrumentation like
> ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder
> how portable that stuff is.
>
> If you use printk, you could probably avoid most of the delays by enabling
> the dummy console. Then the kernel messages would be collected with dmesg,
> given a sufficiently large CONFIG_LOG_BUF_SHIFT. But it would be
> inconvenient to have no serial console available for the usual purposes.

Can we disable the serial console after boot, by registering the dummy 
console? Or will that just log messages to both?

Cheers,

	Michael

