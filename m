Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D31EC77B6F
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Apr 2023 08:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjDJIND (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Apr 2023 04:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDJINB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Apr 2023 04:13:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1563421F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 01:12:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id w11so4009267pjh.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114379;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKfyAGRKLLmnu+pjny6b42soryJCG7L6cAHsY+wH1pA=;
        b=fMsN4YW4wW+UsxcWuLLDDCIZhs6n1nCMLNi6Tt0dTD+XwZzt+WBPKXOsur/hmIg8rU
         YAFq+UhU1BttiroWiBtO20ma+bgXXkKR+rk/ayGjsyBPwzOkqczAFZQwDweXwGnh3hA+
         m1UMjsa15iAur7qF+72YDnXYjUwgiqmnREompNqnXfa/W7llsgLB9hIeq3ndGFeED0Ut
         uYAdSMd0sGr5oG5oaBkL09SW1xw0g+7VL34hhigZ+UAeWrIYMVQkO/6i8x88n3CXCp4G
         CeFtFUYzUEJGAT/QcTjvNPkv2GnNvopFYwhq1qeI5dD/9VmRUgX8XWGBBpIkFqNPY8C6
         ZZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114379;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IKfyAGRKLLmnu+pjny6b42soryJCG7L6cAHsY+wH1pA=;
        b=M4q6jeqQphQtywJxNR8oLBNVkqgUoVsPS2ig7cS+XPWgHAPayk6j92AGzVxvJJAh33
         fORUWM07YE3CoAZVt+lPNJTKu40GPZOckX3fOJIFJky9dD0T1rq+VVe8hF4/aGMKmfa8
         rIMDAQN9GhWnq3mr53MuCefosqHHf610dzBeNyJ03i5X0zZeavGbYqj5FSlJJ0aC1grx
         1gPtZsQfySYRJrnIOU4EB3ET9+u35tVbJtX+NDKQi5apD06KyvwJIsY8Eg9PGp9fGau3
         UduSVNjL5h3J4OwEVYYitbHAD/v3vEyREpE4NV9gzDN+KJix0zFGuFnotfmD/WPZxDOp
         Zw2g==
X-Gm-Message-State: AAQBX9fwt2EKkWvZmYZbl/zUj3KUu0DcYKFj8HcxOOes65vAkSo3Ednd
        RfdwbYOcRI1UBGImXY+4/GhXoth3m8A=
X-Google-Smtp-Source: AKy350ZYceMgJDINfSoNnih2sBfjeAhOVvCxDbZYHBI3OROKxNHN9M4yZSkS1B0j1QKpzX4Yum1R2g==
X-Received: by 2002:a17:902:d4d1:b0:1a0:57dd:b340 with SMTP id o17-20020a170902d4d100b001a057ddb340mr14777920plg.64.1681114378829;
        Mon, 10 Apr 2023 01:12:58 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id iy11-20020a170903130b00b001a642d5fa0bsm1086423plb.181.2023.04.10.01.12.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Apr 2023 01:12:58 -0700 (PDT)
Subject: Re: dash behaviour, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
 <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com>
Date:   Mon, 10 Apr 2023 20:12:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 09.04.2023 um 19:32 schrieb Finn Thain:
>> Looks like cat < /proc/self/maps | grep stack would give us enough
>> information without overwhelming the serial console?
>>
>> OTOH - if you can show the error is gone without stack address
>> randomization, that would be a hint maybe?
>>
>
> The results below were produced with 'norandmaps' added to the kernel
> parameters to avoid ASLR.
>
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# echo 3 > /proc/sys/vm/drop_caches
> [  913.560000] bash (1024): drop_caches: 3
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
> *** stack smashing detected ***: terminated
> Aborted (core dumped)
> root@debian:~# sh -c "md5sum < /proc/self/maps"
> baacbaf944fb01d3200d924da7f7a815  -
> root@debian:~# sh -c "md5sum < /proc/self/maps"
> baacbaf944fb01d3200d924da7f7a815  -
> root@debian:~# sh -c "md5sum < /proc/self/maps"
> baacbaf944fb01d3200d924da7f7a815  -
> root@debian:~# sh -c "md5sum < /proc/self/maps"
> baacbaf944fb01d3200d924da7f7a815  -
> root@debian:~# sh -c "cat < /proc/self/maps"
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
>
>
> So I guess this bug has more to do with timing and little to do with
> state, contrary to my guesswork above. And no doubt I will have to

What may still vary is physical mapping - I remember you had used some 
tool before to parse proc/<pid>/pagemap to determine the physical 
addresses for task stack areas? Or am I misremembering that from some 
other bug?

> contradict myself again if/when it turns out that uninitialized memory is
> a factor :-/

I haven't found a config option to initialize memory returned by the 
kernel page allocators, so not sure how to test that ...

Cheers,

	Michael
