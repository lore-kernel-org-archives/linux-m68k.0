Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75789C4338F
	for <linux-m68k@archiver.kernel.org>; Sat, 31 Jul 2021 19:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 469C260E97
	for <linux-m68k@archiver.kernel.org>; Sat, 31 Jul 2021 19:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhGaTcI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 31 Jul 2021 15:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhGaTcH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 31 Jul 2021 15:32:07 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BA9C06175F
        for <linux-m68k@lists.linux-m68k.org>; Sat, 31 Jul 2021 12:32:00 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id k1so15041503plt.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 31 Jul 2021 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=waq84VENoOKVMSZwqElOjBUHnLmgcEIHOtnqylFufrE=;
        b=icDCxN7c+bGXRVxlwhXdidnubqAUUG6VQSz++buE99ORXGZWFEtzUTpp7BEFeYsr0E
         oNmqO+fpV9q9wOmy7lztmU9Ca/G/W+vFj+j1mCHMNUtzDfX5WxIjXxNeXSA6J7BxGLkr
         Y2Rs8qOj03Tpy7YQnmWK5ol8y0bKpECuid4mWzIhDt6etxsFy2JRNVCgCpzkdx4DnONC
         kqvu90d/lffnV+JCqKzbLLXVyySgndp1R1LwfelKs/vkfQmQzBerSzf5q1qGq5AoHHKt
         p8DH903yG/1o40gb7DyTqp5rOaSCUPNYXraP+3/stbzE6mL9n+Xq5dDnF7f9gvbmcYWt
         srNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=waq84VENoOKVMSZwqElOjBUHnLmgcEIHOtnqylFufrE=;
        b=bPDakT5q+Vo7zq1/m02N93p/nM8GPSdVoxTHt0SP+qcj5FSGJUbYUUdY1ibJl/+7MS
         LkkD7ZQIdY3BFIJzlA+BCh5Y0KijRz6AvoqTyCX/8D17+jIk27YmDbgt3HCJr6ww+2V7
         Lzn6SntJiALq5JtCVGhjN6VahBJvf3nyJ7v9tJVuK9IniAQPO++cXrdaLqxH5Wy/E64+
         I4Snp2E6V2A60UGu9YkM70TFFC5ARZSDfMeIKDAI4+MFR+Knwb7MJhOdXy9nFlTNk1yH
         1D9hmymcxAlMsoiGJN0GeePXqp+zrBdGPJACd6YtpihO81rTdplZS+ckJlmvykd0Rr55
         KK8Q==
X-Gm-Message-State: AOAM531OaL+88C/en3fQGng/Fw4wZ8+rLlsxa4enlNZNRj/tI0kLRNrV
        sm9LKTNzFf6qOw7yhTmrd8Q=
X-Google-Smtp-Source: ABdhPJwO6wCrWklNARN8gzC3jWxi+4dNjNwHrltHTJIgC/ZZ/0Ef7w4GuNHWMzaf/aWDO0Sx9yD45w==
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr9905459pjr.52.1627759919287;
        Sat, 31 Jul 2021 12:31:59 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id z33sm1100130pga.20.2021.07.31.12.31.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Jul 2021 12:31:58 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
Date:   Sun, 1 Aug 2021 07:31:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 25.07.2021 um 19:36 schrieb Michael Schmitz:
> Hi Christoph,
>
> Am 23.07.2021 um 17:11 schrieb Christoph Hellwig:
>> On Fri, Jul 23, 2021 at 04:00:26PM +1200, Michael Schmitz wrote:
>>>> FYI, I've pushed out a new version - this contains the fix from Andreas
>>>> and drops all these uninlining tweaks as they very obviously cause more
>>>> harm than good for now.
>>>>
>>>> And sorry for the delay, life has been a little busy lately.
>>>
>>> The new version passed two rounds of tests OK - looking good so far.
>>
>> Thanks a lot!  I'll wait a bit and will send it out as a formal series.
>
> Just saw this:
>
> [256262.110000] *** FORMAT ERROR ***   FORMAT=0
> [256262.140000] Current process id is 2969
> [256262.170000] BAD KERNEL TRAP: 00000000
> [256262.190000] Modules linked in: atari_scsi ne 8390p
> [256262.220000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> [256262.250000] SR: 2200  SP: 4b4338bf  a2: 00000000
> [256262.290000] d0: 00000008    d1: 00000003    d2: 00000ba1    d3:
> 00000000
> [256262.300000] d4: ffffffff    d5: 00000000    a0: 00000ba1    a1:
> 00000080
> [256262.320000] Process savelog (pid: 2969, task=d81f6132)
> [256262.340000] Frame format=0
> [256262.360000] Stack from 00c1bfa4:
> [256262.360000]         02108005 0d06b008 00000009 00000000 00000001
> 000347ba 0080ab00 00778b6c
> [256262.360000]         00c1be0c 0003e68e 00d11970 00000003 00000000
> 002c7bca 00035a66 00d11970
> [256262.360000]         00778b6c 00809014 00000000 00002700 0000006d
> 00002600 00049ef6
> [256262.470000] Call Trace: [<000347ba>] get_work_pool+0x0/0x38
> [256262.480000]  [<0003e68e>] wake_up_process+0x12/0x16
> [256262.500000]  [<002c7bca>] printk+0x0/0x18
> [256262.520000]  [<00035a66>] __queue_work+0x1a8/0x1be
> [256262.540000]  [<00002700>] wait_for_initramfs+0x50/0x58
> [256262.570000]  [<00002600>] name_to_dev_t+0x2b0/0x360
> [256262.580000]  [<00049ef6>] __irq_wake_thread+0x0/0x40
> [256262.600000]
> [256262.610000] Code: 1029 0007 660c 4cdf 073e 201f 588f dfdf <4e73>
> 254f 040c e308 660a 487a ffe0 60ff 002d 336e 598f 48e7 031e 486f 001c 61ff
>
> Same PC as the one I reported on the 18th. Kernel locked up hard and
> needing a hardware reset this time.
>
> I'll back out the top commit of your series (the one removing set_fs())
> and retest. Again, this may take a few days to show any results.

No further format errors, kernel panics or lockups seen after almost a 
week of tests.

That suggests something is wrong with your 'm68k: remove set_fs()' commit.

I'll try adding a get_fc() and warn whenever FC does not match what your 
patch expects, maybe that can help to get a clearer picture.

Cheers,

	Michael

