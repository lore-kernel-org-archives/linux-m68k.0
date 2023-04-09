Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1840DC761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 03:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjDIDtF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDIDtE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 8 Apr 2023 23:49:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D65B89
        for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Apr 2023 20:49:03 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id pc4-20020a17090b3b8400b0024676052044so1942285pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Apr 2023 20:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681012142;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvoeFcV/++8h80Rmf1zZGqfWdnYviAB4AnMmxrmEctc=;
        b=Mri89+EAdPr7/qNne4xn/H7zP5CABX9s2ZLA+DoV6pq4KmZYQM8FtV8sP6xdKvR0wp
         MyViu0p7JUL3wJCWa8QBTVGzxAMVgOh1nJZtUPB9BsHDGR5eF4Y+hLhG9AgJJM33Tt5n
         kBWPb/5Yehfxs/rA75hVYlVkrXpXhsDUjB6XwgphrNJrwpL7dg/ekouY1Alf+LS9tirO
         etLWjIVOYiICWNQAJc1DtlfiRSlC4yUAs3e9hVSzR8PSVtNtIU8gVCeFKx52xK8HAKxT
         aNA9i2u+qaRIWtGsFXW6uTX4i17tfPWMABRVlxQmCJrGIfA1/YZMPYplUyS/+xN01ck2
         pzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681012142;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvoeFcV/++8h80Rmf1zZGqfWdnYviAB4AnMmxrmEctc=;
        b=6YO5ecYf0h0ut3oP3XmTavIlzcGoI3/AucE7ai2G+iXRaiiKrNi/Qq79aw2xu+bs/1
         mSG9dbbDB+9oaHZ89cja5yJBRO23Q3csQjrJ6TFnrx1Y8pIWATgrBrxZA4jN0q2Grv5t
         LFsrpGT58HkA4KzSqX3TByVzQO31RcgDlczCwuQoeuTqrnm7E25C2O4XO5Hfcf8DYUCU
         IxGKrAF7fe2CA3IIyKtWQR2c8lZ51vRMDPJvxUiqMFKHpyy9ITi+hkvBiTRjnWAaXC+P
         6bRiwSrKv02FCp8GqV0Vmnof6NqPgVv7MeDBIZRlRFtmoP07ACpJaG17BdX1gCdkbHa1
         JHaw==
X-Gm-Message-State: AAQBX9d/74M/cMV7iVCQPhIhwjFQEy2J0/1wqNknqf+sbGl2Yw+vErj/
        btzwntX9Zl6L+WeY7Ajg94raNBR7elY=
X-Google-Smtp-Source: AKy350ZX6fDO2gUO5CCAp+pns2FJm9ijKOkgUtXCEO703DuqCC8QGHAZ19AbNeH4K1+WSDhSGhmlxA==
X-Received: by 2002:a17:902:d512:b0:1a5:918:df40 with SMTP id b18-20020a170902d51200b001a50918df40mr10324936plg.13.1681012142165;
        Sat, 08 Apr 2023 20:49:02 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id k125-20020a632483000000b00512fbdd8c47sm758413pgk.45.2023.04.08.20.48.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Apr 2023 20:49:01 -0700 (PDT)
Subject: Re: dash behaviour, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
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
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
Date:   Sun, 9 Apr 2023 15:48:57 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 07.04.2023 um 16:03 schrieb Finn Thain:
>>> So, again, the best avenue I can think of for such experiments to
>>> modify the kernel to either keep track of the times of the wait4
>>> syscalls and
>>
>> The easiest way to do that is to log all wait and signal syscalls, as
>> well as process exit. That might alter timing if these log messages go
>> to the serial console though. Is that what you have in mind?
>>
>
> What I had in mind was collecting measurements in such way that would not
> impact timing, perhaps by storing them somewhere they could be retrieved
> from the process core dump.

Storing such information to the process core dump would need 
modifications to dash (allocate log buffer and pass the address to the 
kernel) in addition to the kernel. Taking Geert's suggestions to have 
the kernel allocate a log buffer (similar to the kernel message log) and 
read that out through procfs after the tests would be a lot easier.

>
> But that's probably not realistic and it's probably pointless anyway -- I
> don't expect to find an old bug in common code like kernel/exit.c, or in a
> hot path like those in arch/m68k/kernel/entry.S.
>
> More likely is that some kind of bug in dash causes it to corrupt its own
> stack when conditions are just right. I just need to figure out how to
> recreate those conditions. :-/
>
> When dash is feeling crashy, you can get results like this:
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~#
>
> But when it's not feeling crashy, you can't:
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh
> Warning: mountdevsubfs should be called with the 'start' argument.
>
> The only way I have found to alter dash's inclination to crash is to
> reboot. (I said previously I was unable to reproduce this in a single user
> mode shell but it turned out to be more subtle.)

I wonder what could change from one boot to another - can you have dash 
(and its subshells) dump /proc/self/maps and see whether there's any 
variation in that? But what we really need is the physical mappings. How 
can we find those?

With the kernel RNG disabled, I would expect neither of these mappings 
to change between boots?

Cheers,

	Michael

