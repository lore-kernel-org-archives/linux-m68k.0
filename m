Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56621C76188
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Apr 2023 23:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbjDDXW0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Apr 2023 19:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbjDDXWV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Apr 2023 19:22:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B6E40E4
        for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Apr 2023 16:22:20 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso37830014pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Apr 2023 16:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680650540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9akxyPd/wq477qZ2Bvb+APqehupffsZ95DNaG060Wk=;
        b=b+FJkCH7feIYtsQOe3xudaBpCO03pW944jj5amC/J0QKN0roiFGNT8jmrJIbCu/31s
         PZA4ZJChcVIe/z9caFimV0OLk/fpRnJPpdEuftdg92IrXH8PiQGaYBw8kI6lhHohTA80
         PEIhryWornQFThpEzW3IUl1qPTpqU9bOisp/k9tYcCqah0j85BCu/YA9Pb/vWZPISQNn
         VnnK94xp5EJ/Ec2UgcL+ohynebf0LAqfwBZochHLf0y7UmLpqYn8l5ZqR/KlHFeBxfJ4
         PF+Oa7vWmHadDTnnA2QMzyOGN8732T2VbO/9GAP+Rj5fexSl5CQSr9MRs/86RRzgVIew
         6+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680650540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9akxyPd/wq477qZ2Bvb+APqehupffsZ95DNaG060Wk=;
        b=sioFt6lrnBCKTNWLytRrXukjuQhaVgxJaVTMFYFP1MYAC1F2oRTck4KQFYijChjILG
         WMptfgzbPueUsmaG4vRAE4xFgVhkkukRYvT3RjxL41LE7o/DLJIRfr7gDrBrT2532uOe
         zkmk3u1S/9s07IFm5+neXqYGSeFgpWv0y71L7H8Fa3PqOYJ7yJ4nuJDDIt/fSxdELrrd
         +zxN3go5B313r7POoHIFWBpeaRp6O792u9OK86zoLbKKwqY11n498/w7Mh75xthiOI8Z
         1eO0zQIQsukd1/4QIE7KSChmOTGhD5IytQukRlFfxZqfh+HfaGOb82H5bv1C+nWa+bSa
         09pA==
X-Gm-Message-State: AAQBX9e4qXfC3oG9L1Xindtb1ZCWyCa7QHeJRLaezCJ7b4hrT2Y/BqEz
        G0qkzll/HUqyoxQ2PcVERZw=
X-Google-Smtp-Source: AKy350bult5mtVCiFaf4FTfEqpyV8zVVMYM3kj/k0MjyD0k7GQLKmd2yQG0WQQaNqstr+bZgcIbnMg==
X-Received: by 2002:a05:6a20:4fa7:b0:da:bace:b06a with SMTP id gh39-20020a056a204fa700b000dabaceb06amr3381001pzb.50.1680650539683;
        Tue, 04 Apr 2023 16:22:19 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:4c9b:c09b:9f20:f86? ([2001:df0:0:200c:4c9b:c09b:9f20:f86])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78e51000000b006089fb79f1esm9541665pfr.96.2023.04.04.16.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 16:22:19 -0700 (PDT)
Message-ID: <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
Date:   Wed, 5 Apr 2023 11:22:14 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: core dump analysis, was Re: stack smashing detected
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 4/04/23 12:13, Finn Thain wrote:
> It looks like I messed up. waitproc() appears to have been invoked
> twice, which is why wait3 was invoked twice...
>
> GNU gdb (Debian 13.1-2) 13.1
> ...
> (gdb) set osabi GNU/Linux
> (gdb) file /bin/dash
> Reading symbols from /bin/dash...
> Reading symbols from /usr/lib/debug/.build-id/aa/4160f84f3eeee809c554cb9f3e1ef0686b8dcc.debug...
> (gdb) b waitproc
> Breakpoint 1 at 0xc346: file jobs.c, line 1168.
> (gdb) b jobs.c:1180
> Breakpoint 2 at 0xc390: file jobs.c, line 1180.
> (gdb) run
> Starting program: /usr/bin/dash
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/m68k-linux-gnu/libthread_db.so.1".
> # x=$(:)
> [Detaching after fork from child process 570]
>
> Breakpoint 1, waitproc (status=0xeffff86a, block=1) at jobs.c:1168
> 1168    jobs.c: No such file or directory.
> (gdb) c
> Continuing.
>
> Breakpoint 2, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
> 1180    in jobs.c
> (gdb) info locals
> oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
>      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
>      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
>      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
>      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
>      3844132865}}
> flags = 2
> err = 570
> oldmask = <optimized out>
> flags = <optimized out>
> err = <optimized out>
> (gdb) c
> Continuing.
>
> Breakpoint 1, waitproc (status=0xeffff86a, block=0) at jobs.c:1168
> 1168    in jobs.c
> (gdb) c
> Continuing.
>
> Breakpoint 2, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
> 1180    in jobs.c
> (gdb) info locals
> oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
>      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
>      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
>      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
>      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
>      3844132865}}
> flags = 3
> err = -1
> oldmask = <optimized out>
> flags = <optimized out>
> err = <optimized out>
> (gdb) c
> Continuing.
> #
>
That means we may well see both signals delivered at the same time if 
the parent shell wasn't scheduled to run until the second subshell 
terminated (answering the question I was about to ask on your other 
mail, the one about the crashy script with multiple subshells).

Now does waitproc() handle that case correctly? The first signal 
delivered results in err == child PID so the break is taken, causing 
exit from waitproc(). Does waitproc() get called repeatedly until an 
error is returned?

Cheers,

     Michael


