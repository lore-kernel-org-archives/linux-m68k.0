Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C17C433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 07:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9776560F51
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 07:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhKMHFX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 13 Nov 2021 02:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhKMHFW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 13 Nov 2021 02:05:22 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2D0C061766
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 23:02:30 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id b13so10250863plg.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=t3HtgqZ9lXJnfnTm5YvKEnib5/55ENu4R0VlpnRrsMM=;
        b=Obd06hzN7HFneA6LaM1rUUZzt0pi1uExyqnis6phkevDFBO4/NAE3CjBMa3BKDZht0
         vrQcpfa0YMtn9JRVqnjHGrqznCpiYwvUsxCssrHqiMQ5dnKrlPue0uBmr+VBPCKjPGKG
         /h4tmGMCgY5jh6xmjN4Z5RKON8WaW8HWge0tVegOAtCsfZxmmvjtpxwPRhvnzobq5jDU
         DjWtqFq7NRLzSrxhBiFsvAUrgMO04gAkSFY1wfSRxbPRtIrqsMUw9id0nKPsuYiDe/hv
         AsVLWfjyIl+4AeBvhy0381wvxQW3GCVjpyPPKLi1DvKKRS/+sRJODW78cda9AJyPKLh4
         T+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=t3HtgqZ9lXJnfnTm5YvKEnib5/55ENu4R0VlpnRrsMM=;
        b=jaVit+qoncWT/SpMIQnSpSDZIQBI27gnbzG+3NSS6N7FA4KPq0y98jm+qaSYWmzPHF
         KMm3zkGiAmC7eWXxudj9LOZASQrHaOMve0w+pK5L2/QpLqdbG/2GGNFYutuJoUv4BJDJ
         rWqUD5fv+dGKzMEFdRnHUMFaymwvSUzcPXEbK/nGbFtlAWM47sLwOD0IULmPPcDmxTmF
         +g86Y1Eca73y7A4XHOD1FBsjQjMfuin1ttTlfF6xaa4INwyiSBVKGMFxlNeej6BrikNS
         /MAxd8gAlL08gSnL/qMyp9vH/Q+4vJXQfTMmrprk/9eA902MsUhIygMHjZDwkzW7P39o
         ch/w==
X-Gm-Message-State: AOAM530t82rN4Nj/IX3SHGayjRbNlLhS3deHmAWYUBn9hqr8ASw5+yKG
        GFHLJsrGZTiiYb3B6AJXUwo=
X-Google-Smtp-Source: ABdhPJye84ThKKbLEGGiWrYe4aUuE6mNmwxdCDrWN/w7SrtioObGfdbVTse5Cwu3zJJtNH4WqJa98Q==
X-Received: by 2002:a17:90a:6b44:: with SMTP id x4mr25303556pjl.27.1636786949862;
        Fri, 12 Nov 2021 23:02:29 -0800 (PST)
Received: from [10.1.1.26] (222-155-101-117-fibre.sparkbb.co.nz. [222.155.101.117])
        by smtp.gmail.com with ESMTPSA id n13sm8360612pfj.188.2021.11.12.23.02.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 23:02:29 -0800 (PST)
Subject: Re: [PATCH 4/5] block: move queue enter logic into
 blk_mq_submit_bio()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211104182201.83906-1-axboe@kernel.dk>
 <20211104182201.83906-5-axboe@kernel.dk> <YYQoLzMn7+s9hxpX@infradead.org>
 <2865c289-7014-2250-0f5b-a9ed8770d0ec@kernel.dk>
 <YYQo4ougXZvgv11X@infradead.org>
 <8c6163f4-0c0f-5254-5f79-9074f5a73cfe@kernel.dk>
 <461c4758-2675-1d11-ac8a-6f25ef01d781@kernel.dk>
 <YYQr3jl3avsuOUAJ@infradead.org>
 <3d29a5ce-aace-6198-3ea9-e6f603e74aa1@kernel.dk>
 <YYQuyt2/y1MgzRi0@infradead.org>
 <87ee0091-9c2f-50e8-c8f2-dcebebb9de48@kernel.dk>
 <alpine.DEB.2.22.394.2111111350150.2780761@ramsan.of.borg>
 <yq1sfw2g7xr.fsf@ca-mkp.ca.oracle.com>
 <CAMuHMdVdwwT5yQPpQ5Frr-Un5OMk9LX3sF_zocOejrouSjaO-w@mail.gmail.com>
 <fbe43b88-720f-6956-60ea-18e07d73244e@gmail.com>
 <CAMuHMdXe4bA-a968cUcdaCKesMtkMc+qs=4L8nF2QQ0rWvAVHw@mail.gmail.com>
 <39bfc824-61d8-02a8-30fe-e9ea0efae100@gmail.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-block@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4586fc98-1350-c0f0-594d-888514cba277@gmail.com>
Date:   Sat, 13 Nov 2021 20:02:23 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <39bfc824-61d8-02a8-30fe-e9ea0efae100@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert, Jens,

On 13/11/21 11:34, Michael Schmitz wrote:
> Hi Geert,
>
> On 12/11/21 20:37, Geert Uytterhoeven wrote:
>> Hi Michael,
>>
>> On Thu, Nov 11, 2021 at 10:35 PM Michael Schmitz
>> <schmitzmic@gmail.com> wrote:
>>> how easy is that to reproduce?
>>
>> Fairly easy: it happens either on mounting, or after a few seconds
>> booting
>> into my old Debian userspace.
>
> I must be too thick for this:
>
> EXT4-fs (sda1): Cannot load crc32c driver.
> VFS: Cannot open root device "sda1" or unknown-block(8,1): error -80
>
> (linux-block 5833291ab6de, from kernel.org)
>
> Same config on m68k 5.15 works just fine.

FWIW - I had to revert cad439fc040efe5f4381e3a7d583c5c200dbc186 to 
overcome this, and reproduce Geert's finding.

Cheers,

	Michael

>
> But this looks resolved now, so I'll punt for now ...
>
> Cheers,
>
>     Michael
>
>>
>>> sd_setup_read_write_cmnd() does not validate the request's FUA flag
>>> against sdkp->DPOFUA (not suggesting that it should ...). I'd like to
>>> try and trace when such a mismatch happens.
>>
>> Thanks!
>>
>>> On 12/11/21 03:48, Geert Uytterhoeven wrote:
>>>> On Thu, Nov 11, 2021 at 2:19 PM Martin K. Petersen
>>>> <martin.petersen@oracle.com> wrote:
>>>>>> sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
>>>>>> driverbyte=DRIVER_OK cmd_age=0s
>>>>>> sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
>>>>>> sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid field in cdb
>>>>>> sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 08 00 00 00 01 00 00 08 00
>>>>>> critical target error, dev sda, sector 1 op 0x1:(WRITE) flags
>>>>>> 0x20800 phys_seg 1 prio class 0
>>>>>> Buffer I/O error on dev sda1, logical block 0, lost sync page write
>>>>>
>>>>> Peculiar. That write command looks OK to me. I wonder if it's the FUA
>>>>> bit that trips it?
>>>>>
>>>>> What does:
>>>>>
>>>>> # dmesg | grep FUA
>>>>>
>>>>> say?
>>>>
>>>> sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
>>>> support DPO or FUA
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
>> geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a
>> hacker. But
>> when I'm talking to journalists I just say "programmer" or something
>> like that.
>>                                 -- Linus Torvalds
>>
