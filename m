Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4C7C76196
	for <linux-m68k@archiver.kernel.org>; Sun,  2 Apr 2023 22:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjDBWBT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 2 Apr 2023 18:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBWBS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 2 Apr 2023 18:01:18 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6620472B7
        for <linux-m68k@lists.linux-m68k.org>; Sun,  2 Apr 2023 15:01:14 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id kc4so26228629plb.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 02 Apr 2023 15:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680472874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtCIaTpr1MkHGX64VEbyA8CqC7gNyb9PcUVq99Js0NA=;
        b=lU10DvnrhK/iAghE1aOxJKo+W2Zk0njjXioZx1zD2s3YnBQ3SADtX3i9gG/uS8hgl4
         ZxmdPkxUyizaIMsO9zN4KHtijtnwotSSHVSdwkVTtZkufridySfjQY/kfYrtmbocViz3
         he6QL24n5sb4CX9jl7P1gePGEv973bkL9pUKDLDtmnj8bbEmHHtgnPBDn5LQIt3TT4eM
         KNWV923ptHiHuil0LubyBAMS0XbrfeOmssbRn9rvjxRyJJ3stMfjYta5bS85O/LNVFq6
         aHJAkAVcarys8DP/pcU/z29AbsYBFZZPjMi/GELGLWY4TXhmMQdJK7DJLtDQ19U5r5Mi
         II3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680472874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtCIaTpr1MkHGX64VEbyA8CqC7gNyb9PcUVq99Js0NA=;
        b=adbVQfnR3+T69zqu8N9XcSd3L6WpPD3fKSjGpf5YCA6usc+XF3nIEB5UuMvzz9rF6B
         yIa2o1F5cBHHoQlL5y2c2Bvv1LivMKdzmhbyyn+LA8PVouWcJ2iBPJUo6Fp4zjcwWiGF
         bkgpqiMZxqxm3Jlekby8D9/ay0Su6EWyfnaVGS9A0dvF5wRyZx0FlOCVJDcCcPW1MHBl
         +s/hXF4oe1wSQN/ooUo+fOYWmddr2IwS7TXrXreo9MEs8jXKvEMLtyRJvTv4vGb7rZnT
         h+hVpAUSj65c1qawQUd5bFQRV3hz1Vyc9ibikRMGQr4rGCeAJgH3IWjbDrXn3PpvyvSh
         11mA==
X-Gm-Message-State: AAQBX9dTd5EBuM18lZu/6+qWnWoh5UnqUIrGt/1E61mdAhsUjdmOGreY
        tM/dx7BnSB+h3mFH3JnrNm4=
X-Google-Smtp-Source: AKy350aVtG7uLnnRjW4HiMM0kREwYmMlwnFdPaP03LCcPNFB3AvC0pWfglq1Ipu9xwj+a7ga2w9c5Q==
X-Received: by 2002:a17:902:ec91:b0:19e:72c5:34df with SMTP id x17-20020a170902ec9100b0019e72c534dfmr45956751plg.52.1680472873654;
        Sun, 02 Apr 2023 15:01:13 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:881c:cc8a:9c95:fa9e? ([2001:df0:0:200c:881c:cc8a:9c95:fa9e])
        by smtp.gmail.com with ESMTPSA id a23-20020a1709027d9700b0019cd1ee1523sm5229810plm.30.2023.04.02.15.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 15:01:13 -0700 (PDT)
Message-ID: <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
Date:   Mon, 3 Apr 2023 10:01:02 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: core dump analysis, was Re: stack smashing detected
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com>
 <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com>
 <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com>
 <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
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
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 2/04/23 22:46, Finn Thain wrote:
> On Sat, 1 Apr 2023, Andreas Schwab wrote:
>
>> On Apr 01 2023, Finn Thain wrote:
>>
>>> So, in summary, the canary validation failed in this case not because
>>> the canary got clobbered but because %a3 got clobbered, somewhere
>>> between __wait3+24 and __wait3+70 (below).
>>>
>>> The call to __GI___wait4_time64 causes %a3 to be saved to and restored
>>> from the stack, so stack corruption seems to be a strong possibility
>>> to explain the change in %a3.
>>>
>>> But if that's what happened, I'd expect __GI___wait4_time64 to report
>>> stack smashing, not __wait3...
>> The stask smashing probably didn't fire in __wait4_time64, because it
>> hit the saved register area, not the canary (which reside on the
>> opposite ends of the stack frame).
>>
> OK.
>
> This is odd:
>
> https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1165#L1165
>
>    1176          do {
>    1177                  gotsigchld = 0;
>    1178                  do
>    1179                          err = wait3(status, flags, NULL);
>    1180                  while (err < 0 && errno == EINTR);
>    1181
>    1182                  if (err || (err = -!block))
>    1183                          break;
>    1184
>    1185                  sigblockall(&oldmask);
>    1186
>    1187                  while (!gotsigchld && !pending_sig)
>    1188                          sigsuspend(&oldmask);
>    1189
>    1190                  sigclearmask();
>    1191          } while (gotsigchld);
>    1192
>    1193  return err;
>
> Execution of dash under gdb doesn't seem to agree with the source code
> above.
>
> If wait3() returns the child pid then the break should execute. And it
> does return the pid (4107) but the while loop was not terminated. Hence
> wait3() was called again and the same breakpoint was hit again. Also, the

I wonder whether line 1182 got miscompiled by gcc. As err == 4107 it's > 
0 and the break clearly ought to have been taken, and the second 
condition (which changes err) does not need to be examined.  Do the same 
ordering constraints apply to '||' as to '&&' ?

What does the disassembly of this section look like?

> while loop should have ended after the first iteration because gotsigchild
> should have been set by the signal handler which executed before wait3()
> even returned...

Setting gotsigchild > 0 would cause the while loop to continue, no?

The second wait3 call then returns an error (errno ECHILD), leaves 
gotsigchild clear and exits the loop (returning from waitproc with 
error, which it shouldn't have).

>
> ...
> (gdb) c
> Continuing.
> #
> #
> # x=$(:)
> [Detaching after fork from child process 4107]
>
> Program received signal SIGCHLD, Child status changed.
> 0xc00e81b6 in __GI___wait4_time64 (pid=-1, stat_loc=0xeffff87a, options=2,
>      usage=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:35
> 35      ../sysdeps/unix/sysv/linux/wait4.c: No such file or directory.
> (gdb) c
> Continuing.
>
> Breakpoint 3, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
> 1180    jobs.c: No such file or directory.
> (gdb) info locals
> oldmask = {__val = {1101825, 3844132865, 2072969216, 192511, 4190371840,
>      4509697, 3836788738, 1049415681, 3837317121, 3094671359, 4184080384,
>      536870943, 717475840, 3485913089, 3836792833, 2072969216, 184321,
>      3844141055, 4190425089, 4127248385, 3094659084, 597610497, 4137734145,
>      3844079616, 131072, 269156352, 184320, 3878473729, 3844132865, 3094663168,
>      3549089793, 3844132865}}
> flags = 2
> err = 4107
> oldmask = <optimized out>
> flags = <optimized out>
> err = <optimized out>
> (gdb) print errno
> $6 = 2

Is that ENOENT the returned status from the child process?

Cheers,

     Michael

> (gdb) c
> Continuing.
>
> Breakpoint 3, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
> 1180    in jobs.c
> (gdb) info locals
> oldmask = {__val = {1101825, 3844132865, 2072969216, 192511, 4190371840,
>      4509697, 3836788738, 1049415681, 3837317121, 3094671359, 4184080384,
>      536870943, 717475840, 3485913089, 3836792833, 2072969216, 184321,
>      3844141055, 4190425089, 4127248385, 3094659084, 597610497, 4137734145,
>      3844079616, 131072, 269156352, 184320, 3878473729, 3844132865, 3094663168,
>      3549089793, 3844132865}}
> flags = 3
> err = -1
> oldmask = <optimized out>
> flags = <optimized out>
> err = <optimized out>
> (gdb) print errno
> $7 = 10
> (gdb)
