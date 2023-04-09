Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA7CC761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 04:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDIE4E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 9 Apr 2023 00:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDIE4D (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 9 Apr 2023 00:56:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222FA5BAE
        for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Apr 2023 21:56:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id b3so1959524pjq.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Apr 2023 21:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681016161;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVFrAgDtVgt3YBTPTGhKGSnpXpFOA3xvkKl2p+Zhyk8=;
        b=iq5UxjOmO5GxxLC5fIhMnvQ/hDHbwbHQIyJrmdJZL8474xXtDooTxoqXPgEHWWPAv3
         pbZPB2v0jV0Ns1UDqnaAjmlsJgAAszgydvSttJl1b6O7/1wMEXsFa0bUHx17VWBwrsdH
         WH9SfB5MFqO16VFjK6Xegmxd7z+/53mW+zLZQVqFxpHxpqO5npD9BEV/988LJhbnu+yL
         stAnojKQN9xYOpntdiOXjLqwpwvdulCwG5/ob5BRUtqiWHq/Ero8gosYK9fVh/+r5OX2
         YvL1Wui5XYvksL3d2iPTZr9UXlO0W+n5vhF5ATcmaxEsCDkRmVSpv1cQOQlCSm/aY4/N
         /c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681016161;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iVFrAgDtVgt3YBTPTGhKGSnpXpFOA3xvkKl2p+Zhyk8=;
        b=2F1zYbX6WUMGSxSZDhfgwElFL+BuReWhDCPE4clZkyOVV/FG5K9rGT1HJWTzeoqnTF
         Y+s8VbW16EmQbH8TbtA8GuPlhIuWvROmSXygDuEBUfRQHCSYNIcU9Xho91LvT2V62ude
         q2XZiy01wHiVux6dHgClLNwojeaTcT9y/akrNPS9BFEyeeQj47KvHj9aNI0fbsdOOzZN
         +MWf2dR7w7edEY8MpOFUDuZOpXbp+alThcjv9NSiuDY5Ot/cUdDRU9UMoCRBi/y8lVzb
         e+noqSEQYG2VwO/+RqxObsI43s2UdwG/VdAFjQUqJUObCmjjSMSrhJaZgHLKK6cY/zmv
         t/dg==
X-Gm-Message-State: AAQBX9dYxCbioy5kP+o9uzg/+SNjtoamPYBtyVdEXkroL2Lx19/6NXYs
        J7c1g0gmTEKfNi2ImklwuTxMgkFfjsA=
X-Google-Smtp-Source: AKy350YeCe+GL/SeRUGZ6/kGaZETyuPk2h3piQVkxu5P/c7OctFQsBOfNxKZVFVhMiQ+8mrFydqVIg==
X-Received: by 2002:a17:903:1211:b0:19a:9890:eac6 with SMTP id l17-20020a170903121100b0019a9890eac6mr4954017plh.24.1681016160990;
        Sat, 08 Apr 2023 21:56:00 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id v6-20020a1709028d8600b001a1faed8707sm5252588plo.63.2023.04.08.21.55.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Apr 2023 21:56:00 -0700 (PDT)
Subject: Re: dash behaviour, was Re: core dump analysis
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
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
 <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
 <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
Date:   Sun, 9 Apr 2023 16:55:56 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 09.04.2023 um 16:42 schrieb Finn Thain:
> On Sun, 9 Apr 2023, Michael Schmitz wrote:
>
>>>
>>> The only way I have found to alter dash's inclination to crash is to
>>> reboot. (I said previously I was unable to reproduce this in a single
>>> user mode shell but it turned out to be more subtle.)
>>
>> I wonder what could change from one boot to another - can you have dash
>> (and its subshells) dump /proc/self/maps and see whether there's any
>> variation in that? But what we really need is the physical mappings. How
>> can we find those?
>>
>> With the kernel RNG disabled, I would expect neither of these mappings
>> to change between boots?
>>
>
> It looks like the stack area still changes across invocations:

Yep, but running the same commands in the same order across different 
boots, does it still change?

(I'm making a huge assumption here - that timing of the boot process and 
hence evolution of the kernel RNG is sufficiently deterministic. And 
this might apply only to the shells run from sysvinit, since that does 
require no keyboard input ...)

Looks like cat < /proc/self/maps | grep stack would give us enough 
information without overwhelming the serial console?

OTOH - if you can show the error is gone without stack address 
randomization, that would be a hint maybe?

Cheers,

	Michael
>
> # sh
> # cat < /proc/self/maps
> c0000000-c0021000 r-xp 00000000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0021000-c0023000 rw-p 00000000 00:00 0
> c0023000-c0024000 r--p 00021000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0024000-c0026000 rw-p 00022000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c002a000-c0199000 r-xp 00000000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c0199000-c019a000 ---p 0016f000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019a000-c019c000 r--p 00170000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019c000-c01a0000 rw-p 00172000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c01a0000-c01aa000 rw-p 00000000 00:00 0
> d0000000-d0019000 r-xp 00000000 08:06 32713      /usr/bin/dash
> d001b000-d001c000 r--p 00019000 08:06 32713      /usr/bin/dash
> d001c000-d001d000 rw-p 0001a000 08:06 32713      /usr/bin/dash
> d001d000-d001f000 rwxp 00000000 00:00 0          [heap]
> d001f000-d0040000 rwxp 00000000 00:00 0          [heap]
> eff9f000-effc0000 rw-p 00000000 00:00 0          [stack]
> # sh
> # cat < /proc/self/maps
> c0000000-c0021000 r-xp 00000000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0021000-c0023000 rw-p 00000000 00:00 0
> c0023000-c0024000 r--p 00021000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0024000-c0026000 rw-p 00022000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c002a000-c0199000 r-xp 00000000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c0199000-c019a000 ---p 0016f000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019a000-c019c000 r--p 00170000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019c000-c01a0000 rw-p 00172000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c01a0000-c01aa000 rw-p 00000000 00:00 0
> d0000000-d0019000 r-xp 00000000 08:06 32713      /usr/bin/dash
> d001b000-d001c000 r--p 00019000 08:06 32713      /usr/bin/dash
> d001c000-d001d000 rw-p 0001a000 08:06 32713      /usr/bin/dash
> d001d000-d001f000 rwxp 00000000 00:00 0          [heap]
> d001f000-d0040000 rwxp 00000000 00:00 0          [heap]
> effd8000-efff9000 rw-p 00000000 00:00 0          [stack]
> # sh
> # cat < /proc/self/maps
> c0000000-c0021000 r-xp 00000000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0021000-c0023000 rw-p 00000000 00:00 0
> c0023000-c0024000 r--p 00021000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0024000-c0026000 rw-p 00022000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c002a000-c0199000 r-xp 00000000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c0199000-c019a000 ---p 0016f000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019a000-c019c000 r--p 00170000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019c000-c01a0000 rw-p 00172000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c01a0000-c01aa000 rw-p 00000000 00:00 0
> d0000000-d0019000 r-xp 00000000 08:06 32713      /usr/bin/dash
> d001b000-d001c000 r--p 00019000 08:06 32713      /usr/bin/dash
> d001c000-d001d000 rw-p 0001a000 08:06 32713      /usr/bin/dash
> d001d000-d001f000 rwxp 00000000 00:00 0          [heap]
> d001f000-d0040000 rwxp 00000000 00:00 0          [heap]
> effdf000-f0000000 rw-p 00000000 00:00 0          [stack]
> #
>
> That can be disabled easily though (see below). I'll have to modify some
> init scripts to find out what effect it has.
>
> # setarch -R sh
> # sh
> # cat < /proc/self/maps
> c0000000-c0021000 r-xp 00000000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0021000-c0023000 rw-p 00000000 00:00 0
> c0023000-c0024000 r--p 00021000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c0024000-c0026000 rw-p 00022000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
> c002a000-c0199000 r-xp 00000000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c0199000-c019a000 ---p 0016f000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019a000-c019c000 r--p 00170000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c019c000-c01a0000 rw-p 00172000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
> c01a0000-c01aa000 rw-p 00000000 00:00 0
> d0000000-d0019000 r-xp 00000000 08:06 32713      /usr/bin/dash
> d001b000-d001c000 r--p 00019000 08:06 32713      /usr/bin/dash
> d001c000-d001d000 rw-p 0001a000 08:06 32713      /usr/bin/dash
> d001d000-d001f000 rwxp 00000000 00:00 0          [heap]
> d001f000-d0040000 rwxp 00000000 00:00 0          [heap]
> effdf000-f0000000 rw-p 00000000 00:00 0          [stack]
> # md5sum < /proc/self/maps
> baacbaf944fb01d3200d924da7f7a815  -
> # sh
> # md5sum < /proc/self/maps
> baacbaf944fb01d3200d924da7f7a815  -
> # sh
> # md5sum < /proc/self/maps
> baacbaf944fb01d3200d924da7f7a815  -
>
