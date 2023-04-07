Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F8FC76196
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Apr 2023 01:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239385AbjDGB54 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 6 Apr 2023 21:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDGB54 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 6 Apr 2023 21:57:56 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53336181
        for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Apr 2023 18:57:54 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51422066a10so62875a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Apr 2023 18:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680832674;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6lEqOakEHWskmSk/2mhq8zaIbOASWhFmxLQek43ecM=;
        b=p5YpzfDMsOdFqYjKosQSOKp2fIkMcstlAuuZbnifk6ABa+pKNS84lIevg1UCoS0oI6
         zZ5vHAImM/7ikq+W3Z4xumgv9NAXo2QOdlTE3wHcnbJVielYzfJ6E5ta4t0ZqR9HxbbG
         wFg/zwhdmPzc2Sly1oJ1vAdsO5FIHr+a+zjqTQbAh8O/dURVS5jzVuqu6xR30pzHIooo
         wI1tdLHqytkW18J7nOAzTGc2/2q5UwlmnWBfmGbBK0+jXxh+d5xPUebPp7g/qDZFAOLA
         1ST2yImTF6EQmDdnpea25ae7v5twXEdBj4fVfRVbA3OGxxSIm+0K/ZohlCumhJvBfb8W
         I+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680832674;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A6lEqOakEHWskmSk/2mhq8zaIbOASWhFmxLQek43ecM=;
        b=KdJrJAvdh+zf986XIghLR6XFTxW72fNnHug1eGp6PBKrfMVXATuFLsb+sPXNbJOHm6
         23yXjJiSmXyax6Fjpnd4gr6DB3f5mTXZivojjh7xCD6WOzu/GBwHu+jJWSjxmT6lObbJ
         Yj41AvtxBxkbRsq9ifBQ3avsQGxXVAXBIYUWOWJPGpnn6zgXtqp3Ognx8wP8DmpncGgq
         y8fSdAAl0+VsuJG1SSV1hOaIM4/vJWzIX3pk1U5QbxdSn9Rnduy3aCquPal1MV438hnY
         cDNMZCi1E+GBJYiZXot7fv47ZBvlaFmZRSq75X+bsMRhBUzcKT8Fg9j/xoUUB1ozHlQ6
         DxzA==
X-Gm-Message-State: AAQBX9cD2WBjE7laN3drT3N/hcINzo8R8ngjtiOZUtArLbg8hkXGqQxO
        zq1KL7j5Q42H83gjabwIBVjPhOEV7kY=
X-Google-Smtp-Source: AKy350YOv+wHZjEmKQVXzTCU2ZZUCuyPU94zHrfBLUxFhbYN4rcDlVttSog/dKO+sdtTlQDB9ayTJQ==
X-Received: by 2002:a62:5211:0:b0:626:2cc8:311e with SMTP id g17-20020a625211000000b006262cc8311emr752713pfb.12.1680832673879;
        Thu, 06 Apr 2023 18:57:53 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79257000000b0062dd284a7a9sm1955742pfp.68.2023.04.06.18.57.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Apr 2023 18:57:53 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
Date:   Fri, 7 Apr 2023 13:57:48 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 05.04.2023 um 14:00 schrieb Finn Thain:
> On Wed, 5 Apr 2023, Michael Schmitz wrote:
>
>> On 4/04/23 12:13, Finn Thain wrote:
>>> It looks like I messed up. waitproc() appears to have been invoked
>>> twice, which is why wait3 was invoked twice...
>>>
>>> GNU gdb (Debian 13.1-2) 13.1
>>> ...
>>> (gdb) set osabi GNU/Linux
>>> (gdb) file /bin/dash
>>> Reading symbols from /bin/dash...
>>> Reading symbols from
>>> /usr/lib/debug/.build-id/aa/4160f84f3eeee809c554cb9f3e1ef0686b8dcc.debug...
>>> (gdb) b waitproc
>>> Breakpoint 1 at 0xc346: file jobs.c, line 1168.
>>> (gdb) b jobs.c:1180
>>> Breakpoint 2 at 0xc390: file jobs.c, line 1180.
>>> (gdb) run
>>> Starting program: /usr/bin/dash
>>> [Thread debugging using libthread_db enabled]
>>> Using host libthread_db library "/lib/m68k-linux-gnu/libthread_db.so.1".
>>> # x=$(:)
>>> [Detaching after fork from child process 570]
>>>
>>> Breakpoint 1, waitproc (status=0xeffff86a, block=1) at jobs.c:1168
>>> 1168    jobs.c: No such file or directory.
>>> (gdb) c
>>> Continuing.
>>>
>>> Breakpoint 2, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
>>> 1180    in jobs.c
>>> (gdb) info locals
>>> oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
>>>      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
>>>      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
>>>      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
>>>      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
>>>      3844132865}}
>>> flags = 2
>>> err = 570
>>> oldmask = <optimized out>
>>> flags = <optimized out>
>>> err = <optimized out>
>>> (gdb) c
>>> Continuing.
>>>
>>> Breakpoint 1, waitproc (status=0xeffff86a, block=0) at jobs.c:1168
>>> 1168    in jobs.c
>>> (gdb) c
>>> Continuing.
>>>
>>> Breakpoint 2, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
>>> 1180    in jobs.c
>>> (gdb) info locals
>>> oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
>>>      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
>>>      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
>>>      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
>>>      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
>>>      3844132865}}
>>> flags = 3
>>> err = -1
>>> oldmask = <optimized out>
>>> flags = <optimized out>
>>> err = <optimized out>
>>> (gdb) c
>>> Continuing.
>>> #
>>>
>> That means we may well see both signals delivered at the same time if the
>> parent shell wasn't scheduled to run until the second subshell terminated
>> (answering the question I was about to ask on your other mail, the one about
>> the crashy script with multiple subshells).
>>
>
> How is that possible? If the parent does not get scheduled, the second
> fork will not take place.

I assumed subshells could run asynchronously, and the parent shell 
continue until it hits a statement that needs the result of one of the 
subshells.

What is the point of subshells, if not to allow this?

>
>> Now does waitproc() handle that case correctly? The first signal
>> delivered results in err == child PID so the break is taken, causing
>> exit from waitproc().
>
> I don't follow. Can you rephrase that perhaps?

The first subshell exiting causes the wait3() to return, and the return 
code is > 0 (child PID). The break statement executes and waitproc() 
returns that PID.

I was wondering how multiple child processes exiting would be handled, 
but I now see that repeatedly calling waitproc() until all outstanding 
jobs have completed is the only way. dash implements this method, so it 
must expect multiple jobs / subshells to run concurrently.

> For a single subshell, the SIGCHLD signal can be delivered before wait4 is
> called or after it returns. For example, $(sleep 5) seems to produce the
> latter whereas $(:) tends to produce the former.

I don't think wait4 can return with success before SIGCHLD has been 
delivered. Delivery of SIGCHLD is what makes the wait syscalls unblock 
as far as I understand.

>> Does waitproc() get called repeatedly until an error is returned?
>>
>
> It's complicated...

Yep, but I'm now satisfied that is the only way ... sorry for the noise.

> https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1122#L1122
>
> I don't care that much what dash does as long as it isn't corrupting it's
> own stack, which is a real possibility, and one which gdb's data watch
> point would normally resolve. And yet I have no way to tackle that.
>
> I've been running gdb under QEMU, where the failure is not reproducible.
> Running dash under gdb on real hardware is doable (RAM permitting). But
> the failure is intermittent even then -- it only happens during execution
> of certain init scripts, and I can't reproduce it by manually running
> those scripts.
>
> (Even if I could reproduce the failure under gdb, instrumenting execution
> in gdb can alter timing in undesirable ways...)
>
> So, again, the best avenue I can think of for such experiments to modify
> the kernel to either keep track of the times of the wait4 syscalls and

The easiest way to do that is to log all wait and signal syscalls, as 
well as process exit. That might alter timing if these log messages go 
to the serial console though. Is that what you have in mind?

> signal delivery and/or push the timing one way or the other e.g. by
> delaying signal delivery, altering scheduler behaviour, etc. But I don't
> have code for that. I did try adding random delays around kernel_wait4()
> but it didn't have any effect...
>

I wonder whether it's possible to delay process exit (and parent process 
signaling) by placing the exit syscall on a timer workqueue. But the 
same effect could be had by inserting a sleep before subshell exit ...

And causing a half-dead task to schedule in order to delay signaling 
doesn't seem safe to me ...

Cheers,

	Michael
