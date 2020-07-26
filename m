Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB84C433E0
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 20:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25E652065F
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 20:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3sKHu6F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGZUql (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 16:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgGZUql (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 16:46:41 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEA8C0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 13:46:41 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a23so7943665pfk.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GbAgd64scv9tZgTMM2eVC+CgT2sjVkyaYoH5vMCfD/s=;
        b=A3sKHu6FWGa62BoL1ZP3CARUlQEI4f6oxLIIqJGS7ifLPn3fiKWZ5txW/1+sZORSAU
         7llMgslrKYmlmfpSERkKHtClpSCrncaONl3bWcD9YkVPfNOpd8jc2oASja0trSAalZG+
         kffgua0S6zrKuSWM4Jl/V9MgjkJnW/sT5B1YEzzZ6THSR6ioWEf555Lby6zKWvyT8Z/D
         gjgeNPAcu9lw4XKP9WfKoMnal9cMPCTlnbRguS4RTEnN+RALLYDruIltDXxQbLbvXdXv
         fg9MsmYoo9Z31L3E0aSvlboHDcZ/FzdSX9wLqTMunhTwk7/jjN6QKfcKk0hcRCY74oWw
         4cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GbAgd64scv9tZgTMM2eVC+CgT2sjVkyaYoH5vMCfD/s=;
        b=nNmcX4yXm27Ly02G5+C5TpbojMYFCSXjv7ldsnlIMqB4//9fReeJI3VMNSsX7BoLs5
         31+dCauM5cT1dpHvlJ2yuCOAWJ8z4cTAxhp3M4gVLVknuxLt03vGsQ8rO7/8Q9twF4n9
         uXy531Xtr6FlZPWhvdfT8UqsoDHiL8rgjrTpDaKDfh7QNN2y1Q9Nm8mpEcQ6J1PAgK5Q
         2kxrgujNg0LFrMZBVwth5pZOCSKR8unC92MNIjieP8eE6j4Ks/l1kB0DUkaFS1FixOZO
         4S0uBJLjcs+GhSr6LJKR87f8KQ4x+AoNSxadxqOC6lYtXdRUoXTgd1MDf7eAF7XtmQKH
         deiQ==
X-Gm-Message-State: AOAM533jN07IZCkhTnXGccdG9hCW8Gun8TwJt7aqZm/9VePRMWXM8A8I
        dGvTsdXQKK/X5kCe2DP8iBI=
X-Google-Smtp-Source: ABdhPJwYWjZ1zExo5Puuli8/tMdC+7fILcWy8tke9mOXd3MwmBDehdP0hE6a6L3CVZkuRzQ7x9nLCw==
X-Received: by 2002:aa7:8ec8:: with SMTP id b8mr7204051pfr.172.1595796400668;
        Sun, 26 Jul 2020 13:46:40 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:ec2f:8388:f010:f71a? ([2001:df0:0:200c:ec2f:8388:f010:f71a])
        by smtp.gmail.com with ESMTPSA id y7sm12808840pfq.69.2020.07.26.13.46.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 13:46:40 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
 <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
 <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com> <87sgde5yf7.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <419f407f-b758-9dfe-699e-be9229444cc1@gmail.com>
Date:   Mon, 27 Jul 2020 08:46:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgde5yf7.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 26/07/20 11:05 PM, Andreas Schwab wrote:
> On Jul 26 2020, Michael Schmitz wrote:
>
>> OK, that's -EPERM. Reading the comment in asm/errno.h, -ENOSYS is not a
>> legitimate return code for syscalls to use.
> ENOSYS is the correct error number for unimplemented syscalls.

Yes, but that wasn't my point. -ENOSYS is returned by the syscall 
dispatcher in entry.S for unimplemented syscalls, but should never be 
returned by syscalls that are implemented to avoid messing up syscall 
detection by user code.

What I attempt to do is support syscall filtering. Returning -ENOSYS in 
that case would run the risk of masking existing syscalls to user probe 
code just because the user process happens to have insufficient privileges.

Please correct me if that is actually the expected behaviour here.

Cheers,

     Michael


>
> Andreas.
>
