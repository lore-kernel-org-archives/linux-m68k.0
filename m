Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5096CA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 20:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B39192054F
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 20:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBBwHPmb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfJ2URE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 16:17:04 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:41910 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfJ2URE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 16:17:04 -0400
Received: by mail-pg1-f182.google.com with SMTP id l3so10383886pgr.8
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hEDItDG+Z/cbIg/LKYBv0MdNlT67xSB/CNDZwhZ0LXg=;
        b=WBBwHPmb77VoVwq/POFV3kvsY731XCOH7i0ih7KINhKwO8AmOMgz7emlhuj4x5Pj9G
         BfZarGkch2KxcE8u4tKaoc31EZlGrruEp2xFw8SXwc1sDu8LDwPZQ7AOqMD+N0HCoH5j
         bmdHiyNfQ8wo7qrcsDpvSkuF7dWXol9UOLVztxGr+TJofv+erVqO3I6ErpuN78SsYF1l
         CU1mc8pCbRRQNnNewbvPZEc+3fEo29NAM3poGCgpNKLzfP8TFF7b1z0xsLGvHg3SALTj
         k5KyDQ1zw5rBd6UZuUgIqr/6x3b3HUkMI/+QVFcNBGvT2KjKhS8FfAZ/3bWAxLFCdEa7
         M7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hEDItDG+Z/cbIg/LKYBv0MdNlT67xSB/CNDZwhZ0LXg=;
        b=ONglU25yd4EP9RgqiqAbHrtzD0ji2za078xHgf2EWdWx0/hIFq8ix5fpIW5+PkUTMz
         fdqSWbuAeeETeZlzZI5JrgYAFamPN6Wr8DzD5kt1iXrnUQPI43PPOTKw0d/yKbs9j9uG
         iczpkAV9O2+n1tV6DrRQa7qUcPomu1kL68LrKKBmMKCu1trMOUN+BYNVik3D4vMB0P25
         oxOrA5dH48V3ooLakc5nIYvch4KFDn/VY196iD9VEbIpqjzP6RZOW6Xb+u0Ww3WbL0zJ
         l6XZpWr98ZATvO7/wORnllykl+hVeiWWjyHmhOBAK2deCSlEXDbdPLkwz3AgIyM3Fw3E
         EgKA==
X-Gm-Message-State: APjAAAVZfOCZzKcRja3crD4cZDOwz/ySf7sN1W4TdYEXJH0atjYSizGs
        UShU8mudCQFls+OMaI7PSbOJfLdJ
X-Google-Smtp-Source: APXvYqyPuxzZ71cAkfyzBntASRh0lArRalmkI4+0YjGROpH/31FlC91rjqjSw+tKkQKJ5y5HOgTN2w==
X-Received: by 2002:a17:90a:2326:: with SMTP id f35mr9099110pje.134.1572380223432;
        Tue, 29 Oct 2019 13:17:03 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:11df:7631:1f59:7f58? ([2001:df0:0:200c:11df:7631:1f59:7f58])
        by smtp.gmail.com with ESMTPSA id z2sm74183pgo.13.2019.10.29.13.17.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 13:17:02 -0700 (PDT)
Subject: Re: ESP SCSI driver
To:     Kars de Jong <jongk@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de>
 <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
 <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
 <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
 <alpine.LNX.2.21.1910291030480.49@nippy.intranet>
 <CACz-3riDMqySQ-uMjpfn-GeQyD0CjyeAMk2ZpcpAqAekGn7UTA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <13e30170-4e73-1391-3060-73b86476e571@gmail.com>
Date:   Wed, 30 Oct 2019 09:16:58 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACz-3riDMqySQ-uMjpfn-GeQyD0CjyeAMk2ZpcpAqAekGn7UTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On 30/10/19 12:52 AM, Kars de Jong wrote:
> Hi Finn,
>
> Op di 29 okt. 2019 om 00:38 schreef Finn Thain <fthain@telegraphics.com.au>:
>> On Mon, 28 Oct 2019, Kars de Jong wrote:
>>> It probably uses a different chip. The text and images show it's a
>>> QLogic FAS216 (which is the same as a FAS236, FAS236 is the differential
>>> variant). The type should more accurately be presented as "FAS2x6" since
>>> you can't tell which type it is in software.
>>>
>> FWIW, the old driver, removed in commit a2c6ef71364e ("[SCSI] NCR53C9x:
>> remove driver", has this:
>>
>> -               if(family_code == 0x02) {
>> -                       if ((version & 7) == 2)
>> -                               esp->erev = fas216;
>> -                        else
>> -                               esp->erev = fas236;
> The fas236 type was from the original Sun-only esp driver (I guess the
> only Suns with a FAS2x6 had differential variants hence the name). I
> got a confirmation for the detection of the FAS216 from someone with a
> Cyberstorm board, so that one was added then (including the specific
> match on version). Since the NCR53C9x driver was never used on a Sun,
> this was never confirmed for the FAS236.

Do we need to distinguish between fas216 and fas236 at all? From the old 
driver code, they would seem to behave just the same.

Making use of the distinction between fsc and fas236 for enabling active 
negation would not require figuring out the SCSI bus mode (differential 
or single-ended) from my reading of the data book. Enabling back to back 
transfers might requrire more work on the driver.

Cheers,

     Michael


>
> Kind regards,
>
> Kars.
