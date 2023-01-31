Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033D3C636D3
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Jan 2023 03:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjAaDFX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 22:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjAaDFW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 22:05:22 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8719B29E08
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 19:05:21 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id m11so12996350pji.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 19:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJUhplyXfCpKa6xSQNOt49RdO8/cRnMFdEc/bPdI1lc=;
        b=TJ9wqSNCT38GX4OyBSBrHeGYqTD16Snf9+SwdPvOsVRva/DmarC2Wvrmwmh0E5Yaiy
         GrszcCdboxQij9EJ4Vy1xHNXs1n93dE9onPc9boHUW5fC3lunFK1qmlxrAX5ms/LIgTY
         4p4XQFBQpSsNAdqiAqiYGd5BoHT5du5yqrD0vsd3h8RfNjWR+Hm1QbntUwrYFjC7XYVp
         LTQEpVFZpAT+Zk3bvmGnWDXD/oB4THfhSD2ItemmoJcL2gxqUsZ+akKGnYmLDDgG8wm7
         V9nPKj8LrRCf6SOigE28IgnpC49WNsCbKq70rrG6CL9Kl1zqCVsmu2Y5fp8H5fdGLQmN
         bRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJUhplyXfCpKa6xSQNOt49RdO8/cRnMFdEc/bPdI1lc=;
        b=vu1t4dfgLV9yUH0JfWrRdNBh0kwPl/E1Gfm9sR/kFFVxKEUZ6fngy5tqUUGn3OzgzA
         VT6ZEAvhzMNLYjAHk2dSGmBRfMTGKJcFK3sVbXTURRVLuEmhXx6IZTkr0X4hZOIgaQx1
         x2pcojkN+H6yJyMYh6p9Aw1ENf5zL5FuTosTWxqNxICa0JS5/LwJ63WQILKYgLIzMvWK
         3tbbt8rirYV4Z51nv1q2nli+VJ9E4cqtOJ7ymxtOJ4fpQvsnjJlChpEfiI++HV8qIHOl
         bT6hTQuaw1oR1LAnmyUuu0wzBqQ6riksiNeyMpI3J1x6HIyE5hieFiZWvEkm7WfjyVTl
         xZVw==
X-Gm-Message-State: AO0yUKXOvuCnThDysNO3ZLYSdoThqODptVwI1qi94jaGVdAK9TvucYIi
        h5MtP8rOcuUwD/DiThPluu5c7ussiWY=
X-Google-Smtp-Source: AK7set+z6xvSPJ74bLrXoj4zy6cIAI07QjL+s1gh9fht0ImrUTJyTajisYn8vA5MxiZUDMdcyMOiTQ==
X-Received: by 2002:a17:902:e312:b0:195:efa7:d54e with SMTP id q18-20020a170902e31200b00195efa7d54emr8715594plc.12.1675134319921;
        Mon, 30 Jan 2023 19:05:19 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b0019300c89011sm8550835plb.63.2023.01.30.19.05.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jan 2023 19:05:19 -0800 (PST)
Subject: Re: stack smashing detected
To:     debian-68k@lists.debian.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
Date:   Tue, 31 Jan 2023 16:05:15 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stan,

Am 30.01.2023 um 17:00 schrieb Stan Johnson:
> Hello,
>
> I am seeing anywhere from zero to four of the following errors while
> booting Linux on 68030 systems and using sysvinit startup scripts:
>
> *** stack smashing detected ***: terminated
> Aborted
>
> I usually (but not always) see three of the errors while init is running
> the rcS.d scripts, and one while running the rc2.d scripts. The stack
> smashing messages appear only on the system console (nothing is logged
> in an error log or dmesg). Despite the errors, the system continues
> booting to multiuser mode without any obvious additional problems. I
> haven't tested systemd, which is too slow to be useful on my m68k
> systems (though I have a Debian SID with systemd that I can restore for
> testing if necessary).
>
> I'm using the current Debian SID and Debian kernel, and I've confirmed
> the errors on a Mac IIci and SE/30. I haven't seen the errors on any
> 68040 system (I only tested on a Centris 650 and PowerBook 550c). I also
> notice the errors on 68030 systems using custom kernels that I have
> cross-compiled using GCC 12 or GCC 10 on a x86_64 system running Debian
> SID; however, I do not see the errors as often if I cross-compile using
> GCC 8.3.0 on a 686 system (running Debian 10.7 Buster) -- I saw the
> errors a few weeks ago with an earlier kernel, but none today using
> Linux 6.1.8 cross-compiled with GCC 8.3.0.
>
> I'll be happy to help debug or troubleshoot, though at this point, since
> the "stack smashing detected" errors aren't reporting which processes
> are being terminated/aborted, I'm not sure where to start.

The man page of init states that init logs process and reason for 
termination in /var/run/utmp and /var/log/wtmp each time a child process 
terminates. You're looking for processed terminated by SIGABRT as far as 
I can see.

There does not appear to be any tool to extract that information from 
utmp/wtmp files though - utmpdump only shows login process information 
for me, nothing on init processes.

Another way may be logging the start of each of the rcS.d or rc2.d 
scripts until you know what scripts to look at in more detail, then 
adding 'set -v' at the start of those to log every command in the 
offending script.

Once the offending binary is known (and the crash can be reproduced 
after system boot), gdb can be used to find the function that overwrote 
its local stack guard.

That's a lot of work on a 030 Mac - have you tried to reproduce this on 
any kind of emulator?

I suppose one difference between your 030 and 040 Macs might be the 
amount of RAM available. I wonder if this bug results from a combination 
of 030 MMU and memory pressure, or 030 MMU only.

Cheers,

	Michael

>
> thanks for any suggestions
>
> -Stan Johnson   userm57@yahoo.com
>
