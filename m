Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B78C05027
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Feb 2023 18:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbjBASvj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Feb 2023 13:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBASvh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Feb 2023 13:51:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251CF77520
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Feb 2023 10:51:36 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id o13so18194313pjg.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udkYaNEcDWRXPFkA45YNYtcqs2ZMvIxkOJ8QJf/2KLA=;
        b=XRlmzn4UOD4hiDAGbxnS+tVwolRtNWWcRwarKd9MbjoTU11lXapLzX549+Ic/Tq7gA
         hWiAEY1WU6TsuWRhptaNS5Mh/tjjeNE0u3NcbUwq5TkUA682ZYg9JSV1l3pHIJ/9LuL8
         cpBRlamkoavK7hO6pE8fPZ2xEuewiIVe0hT3o80zVyc57GZKcwGeSCHVScTWdy26VGvc
         yltp9goCdE90bBUfZHRzgnh33ED2jDno6b04kN3FCPlYQrTM4+vlefq8UA81nr07NHJ1
         c3FukPSQYfefUghmrvB92iVlMsJn20TBf9sLe4VeiFf25Of0+xCaXoZA09Bg3vvQQrC+
         UZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udkYaNEcDWRXPFkA45YNYtcqs2ZMvIxkOJ8QJf/2KLA=;
        b=JtigokqpHzBQ7zUkhLYd+99Guo148kFDpkQOb1SOLpTWrTl3rAAJ1W2Xqk1wOoXYuK
         TPT72SKZB7u0wqrAJUB5ymrOb78DhiX6qEnaSoe0+jG/M3zKw4wug2h6J6m5AO7Gfyfg
         LM/Vd3+N1Fo50/G9Vwa9ReM5JY9qsk19JfOsFgb6xXomjo1aUnWRCOzxGnhE1NlqEFYX
         A0mFb6icmyI43l5A6ynWDOqh7brQ3dsxYamgwLkIO+7ScoVUmGx9Vrf9lm7p8gPPb5tR
         PqpPEulZTAKTai+W3MRcjf9dAMemH2etH7EyweiT4INatVzDj4fFjQArlrirVqxnpXO7
         drPQ==
X-Gm-Message-State: AO0yUKW3hTFPDetj2MAgBcDsGv8lk5vt4UEA8iycJg0p7HJMuErnyNjK
        kt5l3gNcWUmocC35Or6HP9U=
X-Google-Smtp-Source: AK7set8q5eUD99OGHBoI9lROwsPk2OFpm5Baz4xyYlc6gw4wVZBf/hk5XzhqtB8qQdzLEIh4qAUD5Q==
X-Received: by 2002:a17:90b:350f:b0:22c:55fc:1aed with SMTP id ls15-20020a17090b350f00b0022c55fc1aedmr3217773pjb.49.1675277495319;
        Wed, 01 Feb 2023 10:51:35 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f825:9b99:1727:4ae0? ([2001:df0:0:200c:f825:9b99:1727:4ae0])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a174200b00226ed9cbd3esm1632363pjm.1.2023.02.01.10.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:51:34 -0800 (PST)
Message-ID: <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
Date:   Thu, 2 Feb 2023 07:51:30 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: stack smashing detected
Content-Language: en-US
To:     Stan Johnson <userm57@yahoo.com>, debian-68k@lists.debian.org
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
 <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stan,

On 2/02/23 05:38, Stan Johnson wrote:
> On 1/30/23 8:05 PM, Michael Schmitz wrote:
>> ...
>> Am 30.01.2023 um 17:00 schrieb Stan Johnson:
>>> Hello,
>>>
>>> I am seeing anywhere from zero to four of the following errors while
>>> booting Linux on 68030 systems and using sysvinit startup scripts:
>>>
>>> *** stack smashing detected ***: terminated
>>> Aborted
>>>
>>> I usually (but not always) see three of the errors while init is running
>>> the rcS.d scripts, and one while running the rc2.d scripts. The stack
>>> smashing messages appear only on the system console (nothing is logged
>>> in an error log or dmesg). Despite the errors, the system continues
>>> booting to multiuser mode without any obvious additional problems. I
>>> haven't tested systemd, which is too slow to be useful on my m68k
>>> systems (though I have a Debian SID with systemd that I can restore for
>>> testing if necessary).
>>>
>>> ...
>> Another way may be logging the start of each of the rcS.d or rc2.d
>> scripts until you know what scripts to look at in more detail, then
>> adding 'set -v' at the start of those to log every command in the
>> offending script.
> Hi Michael,
>
> Thanks for your reply.
>
> After logging the start and end of each script, I see that the "stack
> smashing detected" error often happens while running
> "/etc/rcS.d/S01mountkernfs.sh" (/etc/init.d/mountkernfs.sh). I'll try to
> isolate it to a particular command.
>
> This may be a coincidence, but the error seems to happen (up to about 4
> times) after a warm boot into Mac OS 7.5.5 and a subsequent boot into
> Linux that when starting with a cold boot into Mac OS 7.5.5, but it
> doesn't seem that that should make any difference for Linux. This
> morning, after a cold boot, I saw two of the errors, while after a warm
> boot, I saw four.
Hmm - that might well indicate a hardware issue rather than software. 
Bits flipping at random in RAM (and getting picked up because the stack 
canary changes).
>
>> Once the offending binary is known (and the crash can be reproduced
>> after system boot), gdb can be used to find the function that overwrote
>> its local stack guard.
> Is there a way to configure the kernel to use the stack guard for every
> function, and then log every resulting abort? I realize that that would
> be very slow, but it might also be useful for debugging.

The stack canary mechanism pushes a token on the stack at function 
entry, and compares against that token's value at function exit. This is 
all code generated by gcc in the user binary.

The kernel is not involved in function calls other than syscalls. For 
syscalls, we could try to find the user mode stack, and do a similar 
canary trick, but I don't think that would be necessary for all 
syscalls. Might be easier to instrument copy_to_user() instead if you're 
worried about a syscall receiving result data that way to a variable on 
the stack.

But since we're touching on copy_to_user() here - the 'remove set_fs' 
patch set by Christoph Hellwig refactored the m68k inline helpers around 
July 2021. Can you test a kernel prior to those patches (5.15-rc2)?

>
>> That's a lot of work on a 030 Mac - have you tried to reproduce this on
>> any kind of emulator?
> I haven't seen the error in QEMU.
>
>> I suppose one difference between your 030 and 040 Macs might be the
>> amount of RAM available. I wonder if this bug results from a combination
>> of 030 MMU and memory pressure, or 030 MMU only.
> For some reason, the error seems to happen only with 68030 systems,
> regardless of processor speed or memory:
>
> PB 170      : 68030, 25 MHz, 8 MiB, external SCSI2SD
> Mac IIci    : 68030, 25 MHz, 80 MiB, internal SCSI2SD
> SE/30       : 68030, 16 MHz, 128 MiB, external SCSI2SD
> PB 550c     : 68040, 33 MHz, 36 MiB, external SCSI2SD
> Centris 650 : 68040, 25 MHz, 136 MiB, internal SCSI2SD

Exception handling in copy_to_user() and the related bits in 030 page 
fault handling might need another look in then...

Cheers,

     Michael



>
> -Stan
