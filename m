Return-Path: <SRS0=imOp=BE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D018C433E1
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 09:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E9E6206D7
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 09:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN/H2GAf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGYJ3s (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jul 2020 05:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgGYJ3r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Jul 2020 05:29:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71587C0619D3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 02:29:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w17so5782230ply.11
        for <linux-m68k@lists.linux-m68k.org>; Sat, 25 Jul 2020 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=FISSinx3hP8hrKbqHvZQW10VZZip5SP/kf+MInRU8mU=;
        b=DN/H2GAffnLZceKL+Ye+GsDGdD3uc9XnMyVaHppNLvdFCN1oATP/GnaKuyNhnrDamY
         EC/8UGXzvhpzeqhFJtjjWRXxXjsg/KNsYuCZHBEU9qru+dPdVVqcv4R9hU3mVsV0byMJ
         TwGGUWjtwR/ceS/sXSGG9YCTm7WOZmEVp2gogT/5Odyca6FfzLkZn22RuZ5KMRnPAyir
         uGcBEgie87ZFaKB99UMY/75ix1dx2xElmqsCUIRy0FN5b+xtnCSCzdoc7vdQRUb65wgB
         PgVPjtwBSKj2Klc3eA5RyzXBbqd/nxVyivCjS4yo06qp2TAf2MbrkMPrthtJBoleXr9S
         ydrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=FISSinx3hP8hrKbqHvZQW10VZZip5SP/kf+MInRU8mU=;
        b=Jck1VzVlyR554MsBYrzLk+p/2TRqbBB5oq7wIkw1CW3MFVIch+I67SyxlzH74Z4iyL
         twgwo+fzW3Z7DnGD9BhBxR/j44YVb3zU/qrvjtiqvW9NkYtjlhK/J/qY8JZpZ2fI7Ihs
         gduG7vD/LPv1AIWGXgxk+uhJ0vvFI4j3rX6i4+Gbbf31Lqlv7Od58DPUST8khBcErDXb
         OeQP8XMme1iNxMzLklVuwJZ8MRX7aSQyEU7hf5fM4ZyQWIvsU1ZDkDKIFl7vw0BLkwca
         FEW/qskH/DxF1xY59G63XbYabuO2qimdFBvUOlFOiUVepQTR2Qkn4/pFvF7+3hIDa0ej
         iTFQ==
X-Gm-Message-State: AOAM531QgD5HRyuJHU7kMXLxjbTCF0Z0FaHA3FbU/rG6uhj1ga9QJmwn
        TtnNOvHDMiBAo7nAa03zVpY=
X-Google-Smtp-Source: ABdhPJwf7QyWIho0jXCeTCGe2W2XSLll1GLywk+W8cV6YxXxtDvZCTjdAQgqhomGIdPAttdVI7X27g==
X-Received: by 2002:a17:902:e9d2:: with SMTP id 18mr11642555plk.40.1595669386467;
        Sat, 25 Jul 2020 02:29:46 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id f72sm8987809pfa.66.2020.07.25.02.29.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Jul 2020 02:29:45 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
Date:   Sat, 25 Jul 2020 21:29:33 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

Am 22.07.2020 um 03:13 schrieb John Paul Adrian Glaubitz:
> Hello!
>
> On 3/20/20 9:46 AM, John Paul Adrian Glaubitz wrote:
>> Would it be possible to add seccomp support for m68k in the kernel?
>>
>> There are some packages like kscreensaver in Debian that require
>> libseccomp-dev and it would therefore be desirable if we could
>> that library on Linux/m68k as well.
>>
>> >From what I have learned from Helge Deller who added seccomp for
>> hppa, it doesn't seem much that is necessary to get seccomp working
>> on an architecture.
>>
>> So, if anyone could work on the kernel part, I could do the work on
>> libseccomp.
> I just had another look at the topic and it seems with just need a minimal
> patch to add SECCOMP and SECCOMP_FILTER support when looking at the changes
> for riscv64 [1].
>
> The most complex change seem to be the changes in entry.S to add some additional
> checks for syscall numbers. I think we could just do this for m68k (and SH) as
> well.

Looking at your SH patch, I see no changes to check for syscall numbers, 
just a check of the syscall_trace_enter() return code added? Is that all 
that's needed for m68k as well?

What return code would we need to set on returning from an aborted 
syscall? (Without setting a specific one, -ENOSYS will be used by default.)

> The userland land part is trivial as well, I actually added SuperH support to
> libseccomp today which was rather easy but my pull request was rejected for the
> time being due to SuperH not supporting SECCOMP_FILTER yet (only basic SECCOMP).
>
> So, if someone could do the kernel pieces for m68k, I would work on the userspace
> changes in libsseccomp.

My earlier patch switching m68k to use syscall_trace_enter() is 
incomplete, please add the return call check

--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -167,6 +167,8 @@ do_trace_entry:
         jbsr    syscall_trace_enter
         RESTORE_SWITCH_STACK
         addql   #4,%sp
+       tstb    %d0
+       jne     ret_from_syscall
         movel   %sp@(PT_OFF_ORIG_D0),%d0
         cmpl    #NR_syscalls,%d0
         jcs     syscall

and add the same seccomp check you used in the SH syscall_trace_enter() 
patch, if returning -ENOSYS on filtered syscalls is appropriate.

Cheers,

	Michael


>
> Adrian
>
>> [1] https://github.com/torvalds/linux/commit/5340627e3fe08030988bdda46dd86cd5d5fb7517
>> [2] https://github.com/seccomp/libseccomp/pull/271
>
