Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F560C77B72
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 04:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbjDTEIy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 00:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjDTEIv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 00:08:51 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847E7E5F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 21:08:49 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-524b02cc166so202016a12.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 21:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681963728; x=1684555728;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80ok0FSPmvoeWbNS2wrXPoVzj+k5NMZtTBw5B7xZqx0=;
        b=RJebNfulVaBd2ZzxHSgVAzc9mM5qOm+l4jIHOrSzWh0zAp7MxQEnohPvedFKzNy0HM
         /cIGoKyLtP2lBpHCaXLZbv1Oo93ImaNrvPyIkp8eV5ZL6qE/vEHKWVneJs8stiUTzzoh
         eVDzjE/FqjlAIEEwK9zLpWjTc2FbHcTkyRNBmiLmre6idL0/bK+nMsPK4Icd7KCsbaeo
         E7FGf4dERatOkhVqi6Q3p4Z46JD5T6dO28UTpbNz+vRQP8d/VQGol4o0EHpPm5y6KSoy
         rhLVJvZOBW2DFnC4GBIDbtb/5bnkG4HDZFsgKGA+e+U8MA3P/T1qotq3ds5NpO4VK4Yd
         k8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681963728; x=1684555728;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80ok0FSPmvoeWbNS2wrXPoVzj+k5NMZtTBw5B7xZqx0=;
        b=iAT/LMAvg7QIuhl6AUZO8Rj1CY+PCKSHyxWb0eguLXkwWWwnlrXTUN+wEGf+ATr2ip
         87ET6mmEt8R+xYc9sYCr7pvtGgNGBZ82FiJCyNylDlNAuoxdQ8u2HvdmuH0Ockq0I5xh
         n5JVotQZ/bbVvCwTxibr9MM5V/X2YFCVPJJ/HEcIkEGvZ935vY5VT9L+mfxjiVrobFSz
         TCLjGzS15I324gqb6uyHhjJVuL3Umw7pzILca54UTig0mFSgsmocU+jJNgpuKQdgUGa4
         6s8bOQ9BzwtUXr/lzGJ/lVk9U3O2KNgbeHL0FeoJNpkdEE8+Bopfi6Lw8FHNtGajuV4L
         tbDA==
X-Gm-Message-State: AAQBX9e+t/OClqKagC1Nmpv7zP1VPgejT+ZiZSw9Rtt2YYrNySDogWMI
        d6Fkf/RBLbTdOHqQ0fuNJDQVC+6/EyI=
X-Google-Smtp-Source: AKy350Yi8RPsT3hPN8e2Y7xjKResqIQa1BV+zwdFmwX53ad9z9stF7jB2l6jJWtF5HuSygLwqixrFQ==
X-Received: by 2002:a17:90a:d802:b0:246:cac9:330d with SMTP id a2-20020a17090ad80200b00246cac9330dmr431489pjv.8.1681963728245;
        Wed, 19 Apr 2023 21:08:48 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id mi18-20020a17090b4b5200b00246f76e8c04sm2092660pjb.40.2023.04.19.21.08.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Apr 2023 21:08:47 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <60cf61c8-8449-282e-8216-02318fc48c0b@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <57a5c651-62de-1eb7-4a9a-b7a47ddc518d@gmail.com>
Date:   Thu, 20 Apr 2023 16:08:42 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <60cf61c8-8449-282e-8216-02318fc48c0b@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

reproduced on my Falcon (with minor mods to the C source - my version of 
gcc didn't like asm with no clobbers, so I added "memory" as clobber in 
the second asm block). In this case it's a4 that is corrupted, but that 
varies.

depth of 4096 gets me two core dumps on 20 attempts so this isn't quite 
as fast on my Falcon. With 8192, it's nine.

Example:

Core was generated by `./moveml'.
Program terminated with signal 4, Illegal instruction.
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...done.
Loaded symbols for /lib/ld.so.1
#0  0x8000060e in rec ()
(gdb) info reg
d0             0x8000057c	-2147482244
d1             0xc0017000	-1073647616
d2             0xd1d2d3d4	-774712364
d3             0xe1e2e3e4	-505224220
d4             0xf1f2f3f4	-235736076
d5             0x80096168	-2146868888
d6             0x80093108	-2146881272
d7             0x0	0
a0             0x0	0x0
a1             0xefdadbdc	0xefdadbdc
a2             0x91929394	0x91929394
a3             0xa1a2a3a4	0xa1a2a3a4
a4             0x8000057c	0x8000057c
a5             0xc1c2c3c4	0xc1c2c3c4
fp             0xef87402c	0xef87402c
sp             0xef874010	0xef874010
ps             0x209	521
pc             0x8000060e	0x8000060e <rec+242>
fpcontrol      0x0	0
fpstatus       0x0	0
fpiaddr        0x0	0
(gdb)


Am 20.04.2023 um 14:57 schrieb Finn Thain:
> On Thu, 20 Apr 2023, Michael Schmitz wrote:
>
>> Can you try and fault in as many of these stack pages as possible, ahead
>> of filling the stack? (Depending on how much RAM you have ...). Maybe we
>> would need to lock those pages into memory? Just to show that with no
>> page faults (but still signals) there is no corruption?
>>
>
> OK.
>
>>> Any signal frames or exception frames have been completely overwritten
>>> because the recursion continued after the corruption took place. So
>>> there's not much to see in the core dump.
>>
>> We'd need a way to stop recursion once the first corruption has taken
>> place. If the 'safe' recursion depth of 10131 is constant, the dump
>> taken at that point should look similar to what you saw in dash
>> (assuming it is the page fault and subsequent signal return that causes
>> the corruption).
>>
>
> It turns out that the recursion depth can be set a lot lower than the
> 200000 that I chose in that test program. (I used that value as it kept
> the stack size just below the default 8192 kB limit.)

And it does keep the core a lot smaller. Still not hard to work with on 
my 14 MB RAM Falcon...

>
> At depth = 2500, a failure is around 95% certain. At depth = 2048 I can
> still get an intermittent failure. This only required 21 stack pagefaults
> and one fork.
>
> I suspect that the location of the corruption is probably somewhat random,
> and the larger the stack happens to be when the signal comes in, the
> better the odds of detection.

Yep, but there must me some more to that. Timing of page faults due to 
swap bandwidth, perhaps?

Cheers,

	Michael

>
