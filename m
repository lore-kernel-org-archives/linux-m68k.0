Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C97BC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 19:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5225B6124E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Aug 2021 19:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhHVTem (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Aug 2021 15:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbhHVTem (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 Aug 2021 15:34:42 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5125FC061575
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Aug 2021 12:34:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so17268567pjr.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Aug 2021 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=qjDQAHh9X0S7Ct9D9WoAPQJqkBtwqnDzEkzOFcQMu2U=;
        b=EMxLfpUVMywhsCujNNYJG4qOmARtepjNQ10476ExxPbOmb6MZGe4B7UXMclPoBY9xr
         69CvQisehXZv4JAqVx8AO/RmiQ+MFjeda040ZFgQcEesYOPRYFUltsiSUfXsA0F5SVQZ
         sO3o+cuEO/WN6XudDKmcWJxGPLLvsRUu7I1K+H/77Sb0C0m5nWf8ChWjtYOecv1KvQaS
         3C48FL22/MJQbuDRSUAa0LGmlCrxChd35ibKzTEfNSXfZiauDAKghtB7Ndl17mv/rq5X
         bFDejvbWYaKMowkkdKaT2RiZYPuFYNYUhS3qGPBF7SzdAyPS2ohh69LKKCoxAInS9oWG
         SSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=qjDQAHh9X0S7Ct9D9WoAPQJqkBtwqnDzEkzOFcQMu2U=;
        b=Z7Gdb5clZBC+ArJudbVeCuIsNZfPZeI0dOPZgAdC5+R+iGsxjPjGcBCGVQovDcVhAf
         4UWwFwtPKPkb2WzuAwCpMyje4mfl/5E5SbbIb8jbTuTU5XLiUGohWvEyO3QPFai9mdq7
         jBr4gr024dkJn2QIPm9b/YEnSbI9mD13yWN1ZtuW7+yQM86amDkyGEKFcLmPjbujtKm3
         1aVaWBHMMW+sinKRpm/XtwoyfKCoKFYvj6lkowR/spWUI7MPBYS93bFN7jv+3uvO4rgp
         KgnbNqfLrRhn4UPud4GKIWstMA+bzKettl54seX0W+nP2FHzC+LFXYobWNwfT77F2qnx
         +3uA==
X-Gm-Message-State: AOAM532ZsZnbuQhOdR0dYmGPTd6GeFTU2B+Rq8Wor7l/8MV9QF5rMCb/
        KRR8JMkvESczIJyYsKP/2g4=
X-Google-Smtp-Source: ABdhPJzmSMd8O6jznkMADyy1Wx/gkpTvGeBOHm/IIQR3THm4qY/HAhTifhldh+7HxDvkpF2hKMQHXA==
X-Received: by 2002:a17:90a:2c0c:: with SMTP id m12mr16240563pjd.107.1629660840814;
        Sun, 22 Aug 2021 12:34:00 -0700 (PDT)
Received: from [10.1.1.24] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id u20sm15438605pgm.4.2021.08.22.12.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Aug 2021 12:34:00 -0700 (PDT)
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
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
Date:   Mon, 23 Aug 2021 07:33:54 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 22.09.2021 um 09:14 schrieb Michael Schmitz:
> Hi Christoph,
>
> no errors seen after five days of testing. Adding in a VM stressor now ...


Got this overnight:

> [536154.200000] *** FORMAT ERROR ***   FORMAT=0
> [536154.210000] Current process id is 4656
> [536154.230000] BAD KERNEL TRAP: 00000000
> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
> [536154.330000] Frame format=0
> [536154.340000] Stack from 00cc5fa4:
> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001
> [536154.460000] Call Trace: [<00049b66>] __handle_irq_event_percpu+0x38/0xce
> [536154.530000]
> [536154.540000] Code: 1029 0007 660c 4cdf 073e 201f 588f dfdf <4e73> 254f 0400 e308 660a 487a ffe0 60ff 002d 13c6 598f 48e7 031e 486f 001c 61ff
> [536154.630000] Disabling lock debugging due to kernel taint

I'll try Finn's script next. Any advice what part of your patch to 
revert next? Maybe flush_icache_range() ??

Cheers,

	Michael


>
> Cheers,
>
>     Michael
>
>
> On 16/08/21 18:58, Christoph Hellwig wrote:
>> On Mon, Aug 16, 2021 at 07:17:15AM +1200, Michael Schmitz wrote:
>>> Would it be acceptable to add this on top of the
>>> probe040/do_040writeback1
>>> patch that I'm currently testing?
>> Sure.
>
