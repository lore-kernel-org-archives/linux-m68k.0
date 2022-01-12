Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B34C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Jan 2022 00:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbiALAUk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Jan 2022 19:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiALAUk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Jan 2022 19:20:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE433C061748
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jan 2022 16:20:39 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id g5so1379271plo.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jan 2022 16:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=OLIwB5BHLC3yAD2ZzXqCsAZKNHH6hfK1FSSG8NbarnE=;
        b=VxpKJF/YSyWacV7Rg5PK/7SjOxS0/V85OJKrODkd1WxXxjGZJk0xznqcbmTVccQFka
         v9GgsYzJRZ9Ma146A+oCV7VgOhvu3TaJWQGdR+Q5CVZQg4u5ioDXUmHNjhnI0vnUJaVw
         LnOncS7ILpiX45fg3coj8QxdLh3CterH8ejY5besGQC4dpn6cAGTKmjfn+XO5cB7nii6
         OD1+trOyy2Z+85tgc5EC1fZjKmWWHxE/syuRJmHoGCAJpOuepDs13D7rY+kfsmKLVE6+
         WgKeI/21jJsSTXWVoTjs67NASWspnbKkXTBgdp+VZuORZxvx5cQLKn8oyoTP5JI731VN
         wmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=OLIwB5BHLC3yAD2ZzXqCsAZKNHH6hfK1FSSG8NbarnE=;
        b=NyaJeiCZsXA86e+DEPCq2jeymt9Rk+MyKeyjUTrJ2SGKHKy/ccHO7a9vUTkGnVha59
         4Q0iHS1ZRlVwc6JLAP7OYV5WmCklvpBCVZVaTFSf5C+SL18PCY6Ln6OgHyi9dPAFuX3J
         wdIZ9/IaosIxy871Mit72CES75vc6iwKa7nRb/7B0Y89gQQhym5vbdSYw/n20zF5usxF
         wtXRa0Mtdaoyd777PD/U45Om8BNs1irPPdp3YnPOjun3WSb1W1L8/M3XruIJ6AUhdaI0
         80Y4iJa5szaq2zt9Z9O2mCwFwD6cLfEMi3o72AsCDv0JrUmrVjBkeG27SYzcvstG+w4A
         Is6w==
X-Gm-Message-State: AOAM530RkGkG0vfwm9Q/9zWJ7JoydpOPZXu02qZStnZuGT8s77rogEM9
        WXvXOO91lJ7kbXr39BbcIip8UOuQ51s=
X-Google-Smtp-Source: ABdhPJwWIHZ5gvsxZEoBrIRUqAVZ7nbupSccTZkUnmCtOdQFIb0LoZWqT+fwN6FxcnxNZJSIRv2ofw==
X-Received: by 2002:a17:90b:3a89:: with SMTP id om9mr5906345pjb.120.1641946839187;
        Tue, 11 Jan 2022 16:20:39 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id p37sm12805225pfh.97.2022.01.11.16.20.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 16:20:38 -0800 (PST)
Subject: Re: [PATCH 08/17] ptrace/m68k: Stop open coding ptrace_report_syscall
To:     Finn Thain <fthain@linux-m68k.org>
References: <87r19opkx1.fsf_-_@email.froward.int.ebiederm.org>
 <20220103213312.9144-8-ebiederm@xmission.com>
 <CAMuHMdWsNBjOJh0QEx9sppA9x3WoL8H2icqukNqECFhOPremjw@mail.gmail.com>
 <YdxcszwEslyQJSuF@zeniv-ca.linux.org.uk>
 <CAMuHMdX9nhUQe_jeQCUtXeQgcQ5MBiHpPiRexh86EssoHNtJ3Q@mail.gmail.com>
 <acf7b627-2dec-c76c-2aa0-6b4c6addd793@gmail.com>
 <d660267-ce4f-e598-9b40-5cdbb4566c7@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6060f799-d0c5-e4c2-a81c-2bd872ce3d5a@gmail.com>
Date:   Wed, 12 Jan 2022 13:20:31 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <d660267-ce4f-e598-9b40-5cdbb4566c7@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 12.01.2022 um 11:42 schrieb Finn Thain:
> On Tue, 11 Jan 2022, Michael Schmitz wrote:
>>> In fact Michael did so in "[PATCH v7 1/2] m68k/kernel - wire up
>>> syscall_trace_enter/leave for m68k"[1], but that's still stuck...
>>>
>>> [1]
>>> https://lore.kernel.org/r/1624924520-17567-2-git-send-email-schmitzmic@gmail.com/
>>
>> That patch (for reasons I never found out) did interact badly with
>> Christoph Hellwig's 'remove set_fs' patches (and Al's signal fixes which
>> Christoph's patches are based upon). Caused format errors under memory
>> stress tests quite reliably, on my 030 hardware.
>>
>
> Those patches have since been merged, BTW.

Yes, that's why I advised caution with mine.

>
>> Probably needs a fresh look - the signal return path got changed by Al's
>> patches IIRC, and I might have relied on offsets to data on the stack
>> that are no longer correct with these patches. Or there's a race between
>> the syscall trap and signal handling when returning from interrupt
>> context ...
>>
>> Still school hols over here so I won't have much peace and quiet until
>> February.
>>
>
> So the patch works okay with Aranym 68040 but not Motorola 68030? Since

Correct - I seem to recall we also tested those on your 040 and there 
was no regression there, but I may be misremembering that.

> there is at least one known issue affecting both Motorola 68030 and Hatari
> 68030, perhaps this patch is not the problem. In anycase, Al's suggestion

I hadn't ever made that connection, but it might be another explanation, 
yes.

> to split the patch into two may help in that testing two smaller patches
> might narrow down the root cause.

That's certainly true.

What's the other reason these patches are still stuck, Geert? Did we 
ever settle the dispute about what return code ought to abort a syscall 
(in the seccomp context)?

Cheers,

	Michael


