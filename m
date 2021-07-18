Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7A4C636C9
	for <linux-m68k@archiver.kernel.org>; Sun, 18 Jul 2021 01:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D418F60200
	for <linux-m68k@archiver.kernel.org>; Sun, 18 Jul 2021 01:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhGRBRp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 17 Jul 2021 21:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhGRBRp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 17 Jul 2021 21:17:45 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB3FC061762
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Jul 2021 18:14:48 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id j199so12848936pfd.7
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Jul 2021 18:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=qiQngWY5sNnwdOvM0bb3l2GzENg60JThAPgtPL/cfOc=;
        b=YNgFPaKX7wSjTIP5xBHGT6/noiPZ8MN/NIOWk/mR7Mbo4c+ms0QRh/drfJrxkDd7U2
         0dZ3bwHNwO53S4f1tH5ozaEwCLYZA4UpeB1ws0AGauHA7swumBxAY7QHCT1J6l+9bgig
         8bdj7clBmhz1h0Hwqa1CC+1NjevFDZQALyMKgOffxVj3ORDZGtwY41r90nqEj+fsxmQz
         QV1Jnr2zldnp3Jx2817+WF1L53610GsPG5Vkh3RNv3BdFMevgb608luKfCzkwu5JONFa
         EoKH7OY8MTMTQy6HEI8Kqw2jb3QVRihlOIH1Xf9egnRRKqwGyxn8SShoUxSdcNHZHTsn
         xyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=qiQngWY5sNnwdOvM0bb3l2GzENg60JThAPgtPL/cfOc=;
        b=qguWwkGhn6Fe2iKOFd/6njxOfBwHoOZjiAahECM43ZmHjauC7bhQ1D9+hurrZCI6iE
         XV6RXsF/0Q+SD37KOeTxMioSsVk3abpp1s7PyYXlSqAMyON5q5d3JVjZ8pqx8N9XTQ72
         cG7yq+zExXkjw2A0mLDdHZSzie1zLCKGuzLflULB394ZpFGtGQjZC5l8MQTQXsrlFr1n
         b0lApv+e8sOwQT6RUgsSDs4LTRTLonh8xkvM2XxrBxuqD29HjCSQX/2HYeXrbf9taGMM
         zGD7wI8+i8KCs2sdIdS5G7v4L5A3gYM8UIEnZ31bQqo8Ihr+YUiwWl0yvg7KS9zsbtx2
         a24Q==
X-Gm-Message-State: AOAM533/ZJoGfKRTZRNBM7EK8oTlaROoV9yGJQphfob7jtdsq3ySOvdO
        u5Q1Se0HwhD3EHEuVMGTHns=
X-Google-Smtp-Source: ABdhPJw2xdG95xm7czP1ryZEiUd8csNoGwCKmOz7S6rlg9c/MPtyVyiL4/TRvPu8K0rRd4EfAMIScA==
X-Received: by 2002:a63:210a:: with SMTP id h10mr13962412pgh.135.1626570886038;
        Sat, 17 Jul 2021 18:14:46 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id d2sm14916776pfa.84.2021.07.17.18.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Jul 2021 18:14:45 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
Date:   Sun, 18 Jul 2021 13:14:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



Am 17.07.2021 um 17:41 schrieb Michael Schmitz:
> Am 16.07.2021 um 14:03 schrieb Michael Schmitz:
>> Hi Christoph,
>>
>> On 15/07/21 7:26 am, Michael Schmitz wrote:
>>> I've got a vague recollection that I've seen weird crashes in the past
>>> related to temperature extremes (we've had a few unusually cold days
>>> in our parts just now), so I've gone back to a kernel from the switch
>>> stack / refactoring exit tests (which ran the stress tests fine
>>> earlier) to rule that one out. Looking good so far, so I begin to
>>> wonder whether we need to introduce get_fc() and use that to restore
>>> the original sfc/dfc instead of assuming USER_DATA is always correct?
>>
>> No crashes with the known good kernel after over a day of stress testing
>> - I'll try Andreas' patch once the current test run has completed.
>>
>> One thing I noticed with either your final or your v2 patch series - as
>> far as the tests ran at all, run times were 30% increased. That's a lot
>
> With Andreas' patch applied, the run time increase is now less severe
> (11-13%). I'll repeat that a few more times but it's looking a lot
> better so far. No instruction format errors seen anymore.

Alas - got another one:


[124760.720000] *** FORMAT ERROR ***   FORMAT=0
[124760.740000] Current process id is 1108
[124760.750000] BAD KERNEL TRAP: 00000000
[124760.770000] Modules linked in: atari_scsi ne 8390p
[124760.800000] PC: [<00002a8c>] resume_userspace+0x14/0x16
[124760.820000] SR: 2200  SP: 96ae8faf  a2: efc67932
[124760.850000] d0: 00000047    d1: 0000000a    d2: 00000001    d3: 80007c40
[124760.880000] d4: 00000000    d5: 80004326    a0: 80009d78    a1: efc678f4
[124760.890000] Process syslogd (pid: 1108, task=742727e0)
[124760.920000] Frame format=0
[124760.930000] Stack from 00929fa4:
[124760.930000]         02048000 252cb008 0eee0749 660000c2 00929e18 
00000000 00000001 0003469a
[124760.930000]         00033fd8 0002f7a6 00000006 00000000 00000001 
0003469a 00513d00 00ad320c
[124760.930000]         00929e2c 0003e514 006616e0 00000003 00000000 
002c6f0a 00035946
[124761.030000] Call Trace: [<0003469a>] get_work_pool+0x0/0x38
[124761.060000]  [<00033fd8>] find_worker_executing_work+0x0/0x40
[124761.090000]  [<0002f7a6>] sys_rt_sigprocmask+0x5a/0x9a
[124761.100000]  [<0003469a>] get_work_pool+0x0/0x38
[124761.120000]  [<0003e514>] wake_up_process+0x12/0x16
[124761.150000]  [<002c6f0a>] printk+0x0/0x18
[124761.170000]  [<00035946>] __queue_work+0x1a8/0x1be
[124761.190000]
[124761.200000] Code: 1029 0007 660c 4cdf 073e 201f 588f dfdf <4e73> 
254f 040c e308 660a 487a ffe0 60ff 002d 26ae 598f 48e7 031e 486f 001c 61ff

The faulting instruction is the 'rte' at the end of resume_userspace 
from our entry.S.

Any idea what's gone wrong this time, Andreas?

(All processes except probably syslogd kept running and my tests 
completed OK - rerunning that again now to see what else I get...

Cheers,

	Michael
