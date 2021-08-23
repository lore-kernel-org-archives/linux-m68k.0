Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20532C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 04:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0E9161250
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 04:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhHWEFl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 00:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhHWEFk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Aug 2021 00:05:40 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EA4C061575
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Aug 2021 21:04:58 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id k24so15467669pgh.8
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Aug 2021 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=k33wR2RtghAhA72biI/vliCf/dx4e6t0XGeFrSfPxS4=;
        b=u0lMIe33n3QsKP9auUiGR//mUNQNxUNj9fc6KVtfUsFG2P9gVJ+8Kc2LuU5C7C5hrt
         axTaTa7GMGBDpTV8Zk6W4mtrLH+bxDxJd0aLt5+ZjT0C4qnaesdrqRbBtQ+7ii6smBlM
         qK46YgjVR/a+sI+8Jdcgb9kUQJLdZ0f9dBIgN6xBovs8BrkUquGFAdbQaIneD1CJ/EJb
         MWEg/EU4lLOjKa5V6IoIa0XyHa4cUfLhaDa5+qDk4w1JoUfA70PJ/3XntE/cnJTuIZao
         Yao2a7iE6An/waScGKw8MqXe4vLwPTZsi54+nYexjxMRghtZjKGXNsE+aWolK4cDKCNS
         nfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=k33wR2RtghAhA72biI/vliCf/dx4e6t0XGeFrSfPxS4=;
        b=es2Tx5Gby3jc65Kps0yWFUv2KREchH8syfJ5wyd0U1XaHTBLFwJzY3U+D0O53p+Ph/
         CO+1HLgLbA5QAln88yir+oqZsREGZ+ykIfOr/UWdpzcXBc2Z6NqjQuLR0XPV/ccsqtVo
         L+A/3ScZoosPHvhJv7qVf7bqnfjxFV5W7Yd4dW13Obwj3tqo3TrQKpHvwEbIUeGH4A1+
         vBTuCwoHjImpyPaZIPddScw7Ts2mNqm83VXhfCA7JYSJF6pVQfOPaFarDtkAsdM7FHIF
         GYRksBMXB09WGCc++nMM1nW+mvXXzvU/2msqt7lGyWGtIYO9x+PzLflyalgl5k+eDb0W
         Ecmw==
X-Gm-Message-State: AOAM531TzvwZsHWxrufo3e8yIbfFUy5v7GNhMTzV1ieEXI3gjGylVmwp
        yiZnBhyIddPihZilzo6OmLo=
X-Google-Smtp-Source: ABdhPJzOOe+W6U/45N9cQYjR20ZvJdDkC6H5uTs2FAFUhBZeBzU7RQOmeAq1FfWGfxC7+pcdUH1bVg==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr29910038pgm.226.1629691496351;
        Sun, 22 Aug 2021 21:04:56 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id 64sm14110478pfy.114.2021.08.22.21.04.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Aug 2021 21:04:55 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2eb4981b-a3cf-b310-9ac0-2deadb209ca4@gmail.com>
Date:   Mon, 23 Aug 2021 16:04:11 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 23/08/21 07:33, Michael Schmitz wrote:
> Got this overnight:
>
>> [536154.200000] *** FORMAT ERROR *** FORMAT=0
>> [536154.210000] Current process id is 4656
>> [536154.230000] BAD KERNEL TRAP: 00000000
>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last 
>> unloaded: atari_scsi]
>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000 d3: 
>> ffffffff
>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108 a1: 
>> 8009b7df
>> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
>> [536154.330000] Frame format=0
>> [536154.340000] Stack from 00cc5fa4:
>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 
>> efaec378 8004366c 61ff61ff
>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 
>> 0e000000 fffa1a00 fffa1c00
>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 
>> 005f5800 00000001
>> [536154.460000] Call Trace: [<00049b66>] 
>> __handle_irq_event_percpu+0x38/0xce
>> [536154.530000]
>> [536154.540000] Code: 1029 0007 660c 4cdf 073e 201f 588f dfdf <4e73> 
>> 254f 0400 e308 660a 487a ffe0 60ff 002d 13c6 598f 48e7 031e 486f 001c 
>> 61ff
>> [536154.630000] Disabling lock debugging due to kernel taint
>
FWIW - that's the 'rte' at the end of resume_userspace / 
ret_from_exception, which is on our interrupt return path.
Stack smash??

Cheers,

     Michael


