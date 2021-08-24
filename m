Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C589C4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4561561262
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhHXIqB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 Aug 2021 04:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235023AbhHXIqA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 Aug 2021 04:46:00 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971C5C06175F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Aug 2021 01:45:16 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q68so2041417pga.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Aug 2021 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iyCzOIQuKGulNC4TwvKCJfgU2v/ye1+vHcy93/W4G4I=;
        b=aZlie5mazCUm5PVevQd7ExDU5Dpy6A4fPevVAyTvBrydh6bebHJSueCuuTXtg74O51
         +YHDAe2knOQF48rR28rROu+cngz0KjRpmKX5tKgcKhiQ3XAo8VTmoVU4xGMOsbxxaZQc
         /d0OoAj+uz8ooywJHB0mpT9mJMnq1fx+pVecbziAY29+uAPfkyvs00R5B0sC016QkWx8
         PR9gxtl9nyVg5jQab661OQNrX6gTdIsv4aZcvqDQ6gMYwGsE8pAgzDlgR44BovolqM8n
         k2wAIxsGXm/rQSOKkkPEDoYSnnZO+26qkSuECuJNBkIdUYCcZQeUcRM0fYzo8XgQC7oa
         TxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=iyCzOIQuKGulNC4TwvKCJfgU2v/ye1+vHcy93/W4G4I=;
        b=KV+Xws348R2vsm1wJcyGSa7Hkl19jyB3gHsHeF5lguYGPo14EpaHBsH7TCdOPHvJOS
         nR7X9xSIYoYDBas90vtqA4BXRg5KM/6+9TGW7kjZ4bBkdK61YY1nwyjt/P39ufRpxB61
         1Judo0ELxKRAag9JzEyTmUQ1XrAhuDcWuqbd+RmJ2CcHNKo9JowOkllGYXkNcGPpWw/x
         CMcnk2dfQl95xJjR+969aHLgQNON9SxtzedGmWY1svhVNk3umjbs0/yElwBwZhjEurtU
         oQGR2pIxScDX3HqRQtqX3OL3aWV5GIFPqZok96A+mNNjluWT5wwRxOQAZBT22oQPHlt6
         CUqA==
X-Gm-Message-State: AOAM533mvzAwo7HcSu9MqevShHM5PuTooGz1Zl8jG89lvZM0eYlGGpz+
        R49elkJX/2vUcXkODFv8KCZv4K1EA0U=
X-Google-Smtp-Source: ABdhPJxZQ4AjLqyubNtz1g8g/bG9yZwliDSjFHPgzshHsNXRCHuGTSd4fbwl/yet7HRFdrvClHH36g==
X-Received: by 2002:a05:6a00:10d3:b029:3c8:d7c4:973f with SMTP id d19-20020a056a0010d3b02903c8d7c4973fmr38015744pfu.16.1629794715802;
        Tue, 24 Aug 2021 01:45:15 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id a25sm1681355pfo.200.2021.08.24.01.45.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 01:45:15 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Linus Torvalds <torvalds@linux-foundation.org>
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
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
 <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com>
Date:   Tue, 24 Aug 2021 20:44:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Linus (and Andreas),


On 24/08/21 09:49, Linus Torvalds wrote:
> On Mon, Aug 23, 2021 at 2:31 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Hi Linus,
>>
>>
>> On 24/08/21 05:59, Linus Torvalds wrote:
>>> On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> Got this overnight:
>>>>
>>>>> [536154.200000] *** FORMAT ERROR ***   FORMAT=0
>>>>> [536154.210000] Current process id is 4656
>>>>> [536154.230000] BAD KERNEL TRAP: 00000000
>>>>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
>>>>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>>>>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
>>>>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
>>>>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
>>>>> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
>>>>> [536154.330000] Frame format=0
>>>>> [536154.340000] Stack from 00cc5fa4:
>>>>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
>>>>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
>>>>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001
>>> Strange. If I read that stack frame correctly, that seems to be an
>>> exception frame of type 0xb ("Long Bus Cycle").
>> Not sure where you get the 0xb from - the frame format I see is 0.
> The "Frame format=0" is, afaik, the format of when the error happens.
>
> But I'm looking at what the stack contents are at the time of the
> exception, to see what actually *triggered* the error.
>
> And if I read it right, the RTE that took the format error fault had this stack:
>
>          02088004 3666b008 1c0eb209 ..
>
> and that means that it tried to return with status register 0208
> (which looks correct: supervisor bit clear), to PC 80043666 (which
> might be right - it's a similar address to the ones in A0/A1).
I see - found some information on the 030 exception stack frame format 
online now.

>
> And then the format/vector value is b008.
>
> That is, if I read it right, format 0xb, which is that "Long Bus Cycle" thing.
>
> NOTE! I may be misreading this entirely. My m68k knowledge is so
> out-of-date that it's not even funny, and it actually predates all
> this fancy format stuff. So I'm just pattern-matching with the manuals
> I found online.
I'll take your word for it (especially after Andreas confirmed it :-). 
The information in our show_registers ought to be enough for me to 
decode the various faults of this type I've seen, and spot any patterns.

Cheers,

     Michael

