Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33301C77B71
	for <linux-m68k@archiver.kernel.org>; Sun, 16 Apr 2023 01:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjDPBuj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 15 Apr 2023 21:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDPBuj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 15 Apr 2023 21:50:39 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A3426AA
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Apr 2023 18:50:36 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id kh6so20670167plb.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Apr 2023 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681609836; x=1684201836;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfQruGuTktcF0O700FviyelL+2PT0e6zLn+5QxJc614=;
        b=bdW41sjwdjCK8JF2jd5yJMU+zH4hqrStaLoTJ+5Xxguo37OOCBQhj1JB9YsRxwuMpJ
         WVDaZXWyCnAtGdGiXhU269EOfyNgHEoPiiTghOjuIwqdZdh9H7K5HRNeAPmJzkhtd/+i
         WX3tt+oHLdqHCTuXr0FVid0nZme+PdNZc7IFLS623L9rs+rpi3oelkSx1e8U/Ljs30fd
         Eaz+t1MlBZ/hV6jkIx1rF3euNm+jqU7eu/EDU2qBSTrXaZIiifkTaANuArxuJhizZkLG
         d1E2FajkBx+OvefbRErUZ5Nov7B0mHjH9fr7Bttf0cTAjgBJZQgfvkihg6JF6HN7NtdE
         NQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681609836; x=1684201836;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfQruGuTktcF0O700FviyelL+2PT0e6zLn+5QxJc614=;
        b=TvFNy14DzL9MqDRqRIjArHAiW7qPtILPMOrp/oEyxHJ5nRJR7Z3zTpJ/kSJDkAS0HC
         T6ZrXJA+o421BEdpuyLATObCT9LeCIifPJMs8ABqnbUgqspXwRMScIxpDyGNtaTAy6gH
         e7FMsLvRaUGq+DVy2wMH/jfyViOPWuiQp40ITyjMV5HSWHdWRiSEenJaCdnGMEWnl/oH
         1TAaWt5I8ke0MLqEsohTJk65jdyxezLzxV2A+3FKQi0MMsfUqLHQv9VRvS1+olyOgkXn
         Jj7C6UHL6XOBm3nzX6+zapyP7QyYjvnNWDhMfoR2qATjQO1yxlSXQY2dhFWSt66H8kFv
         A2Qw==
X-Gm-Message-State: AAQBX9emq3KVWweOxXPM2vwyYW0n6oyJQwryfvebPIxRf0h7j0ieTYsL
        RbaPlPnZkT9Xnjz6oMw3s09L3Giw5K4=
X-Google-Smtp-Source: AKy350aVfnQMihOWVoNrWVOEm2IXgx30lh/3eXK3X4jd4NFyCbd0MCsZntmYMVyjnZuEs9oolPsYPg==
X-Received: by 2002:a17:902:e391:b0:1a4:f295:32fa with SMTP id g17-20020a170902e39100b001a4f29532famr7233966ple.15.1681609835639;
        Sat, 15 Apr 2023 18:50:35 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902724300b0019cad2de86bsm5170829pll.156.2023.04.15.18.50.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Apr 2023 18:50:35 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
Date:   Sun, 16 Apr 2023 13:50:29 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 14.04.2023 um 21:30 schrieb Finn Thain:
> Would signal delivery erase any of the memory immediately below the USP?
> If so, it would erase those old stack frames, which would give some
> indication of the timing of signal delivery.

The signal stack is set up immediately below USP, from my reading of 
signal.c:setup_frame(). Old stack frames will be overwritten.

>
> If I run dash under gdb under QEMU, I can break on entry to onsig() and
> find the signal frame on the stack. But when I examine stack memory from
> the core dump, I can't find 0x70774e40 (i.e. moveq __NR_sigreturn,%d0 ;
> trap #0) which the kernel puts on the stack in my QEMU experiments.

As I understand this, the call to sys_sigreturn() removes both this code 
(signal trampoline IIRC) and the signal stack. At that point, the kernel 
signal handler (which in turn calls onsig()) has already been run.

Again as far as I understand, the core dump happens on process exit. 
Stack smashing is detected and process exit is forced only at exit from 
__wait3() or __wait4_time64(), and those would have only been woken by 
receiving a signal. Both signal delivery and removal of signal stack by 
sys_sigreturn() must have happened before return from the wait syscalls.

Cheers,

	Michael


> That suggests that no signal was delivered... and yet gotsigchld == 1 at
> the time of the coredump, after having been initialized by waitproc()
> prior to calling __wait3(). So the signal handler onsig() must have
> executed during __wait3() or __wait4_time64(). I can't explain this.

