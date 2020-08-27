Return-Path: <SRS0=O3TF=CF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A576C433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 00:08:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D931920791
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 00:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c//xA7zy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgH0AIN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 20:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgH0AIM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 20:08:12 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCDCC061574
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 17:08:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k18so2059275pfp.7
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 17:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uK4+QCf31daOqZW2WnkBmsyvatsFsofzQL4PJ0khEGw=;
        b=c//xA7zyjZlUoVPjaSy6w2qkrBQhrFHXg4+kMfX/gZwgCw2TISNx+yZ408ZZgJnunB
         fM4nOuSmwTuRl8MhKS8GQYK03+adVyLsHCq+Ztco1qjWzktleMEp9al7vXu/cmsiGY3g
         CVVmPtDdLRJ/pjVtsxAVy3TclkTZqYFSxs20CiZpCDnioZcO7+YG6VJDmeqe7IrApPhe
         8j0bQSrxlhpz+HWt563Z2ZyfgzScfuE7lox5RyiNkjDeYMFvGOuWmiLwsOhYpM6dI6eh
         vt5YUMRP9sh9hs+xEYmEXLdHinAbn3U+Nl+lPO2OjNjUnfsnQC/8ZeNL/WsACwVDL8GM
         88cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uK4+QCf31daOqZW2WnkBmsyvatsFsofzQL4PJ0khEGw=;
        b=uOLTE0KKsGGrEUGZV0FyHJsb8AUnRPE+LZSHMcsxdj8GUp/ZDYp3Ot4wxVJc1FeDSw
         xxVOVMYYJsmR7YsmDY6lxUfKvfKOSX/K7Nid6b68/IIyT4762WOePlbW6Q2qXlp5NJpd
         jMaEBJ/Kp7/fgwBTjFTRty06Abb8Ig8/7M1ZZAU3xxF8yTTDd5Kze1WPJoKHItaLYvkl
         fRIbznjq+j/rNfSTtGX8+N1EWFlyn+H7uWkZvLGd1+VCM+IoeMx4I+FNJ643TctDEC1V
         x4A/eeYglBEEzix8JlK7DAEOLx96c7bI4lKkWVER3YMR/fjbfnCld19uTgVVOcNb7NpP
         kvzw==
X-Gm-Message-State: AOAM532l/92AN77UELw+AkD1cFvKpkiBLTs1uWbJ6PaMPnTiVWJjrwY7
        JwcBVbne1stGt8QqNYDemDczKs3p0o8=
X-Google-Smtp-Source: ABdhPJxa5iVCbSmAXphqzGohHGVPYTJLpAAtotdVZVWHaLk0jIogMuW/qpGLkAy3T9Ez2ngdZ8X78w==
X-Received: by 2002:a17:902:8bc1:: with SMTP id r1mr14159348plo.328.1598486890902;
        Wed, 26 Aug 2020 17:08:10 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:dd49:18b7:7a1f:8116? ([2001:df0:0:200c:dd49:18b7:7a1f:8116])
        by smtp.gmail.com with ESMTPSA id y189sm342083pfb.135.2020.08.26.17.08.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 17:08:10 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
Date:   Thu, 27 Aug 2020 12:08:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 26/08/20 11:23 PM, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Mon, Jul 27, 2020 at 6:19 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>> and trace exit. Seccomp support requires separate entry points for
>> trace entry and exit which are already provided for Coldfire.
>>
>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>> in preparation for seccomp support. Check return code of
>> syscall_trace_enter(), and skip syscall if nonzero. Return code
>> will be left at what had been set by by ptrace or seccomp.
>>
>> No regression seen in testing with strace on ARAnyM.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Thanks for your patch!
Thanks for looking into it!
>
>> Changes from RFC v1:
>>
>> - add return code check in do_trace_entry branch to enable syscall
>>    filtering (will return -EPERM)
>> - change to use testl for return code check (suggested by Andreas Schwab)
>>
>> Changes from RFC v2:
>>
>> - don't set return code of filtered syscall - seccomp may want to set
>>    that for use by calling process.
> As your email subject didn't contain "v3", b4[*] insists on picking up
> RFC v2, and refuses to pick up the latest version, even when forced

Argh - I thought that since the first two were tagged 'RFC', I could 
just restart with v1.

Never heard of b4, sorry.

> (msgid not present)...
>
> The patch itself looks good to me. Does it make sense to apply it before
> we have real seccomp support?

As far as I understand Adrian, it's needed as a prerequisite (though I 
admit there needs to be another patch adding the actual seccomp bits as 
well).

With my rather limited test setup, this was all I could test. I've done 
enough damage with 'I think this is how it should work' patches to add 
untested stuff.

In my not-at-all-humble opinion, the whole issue of whether to trigger a 
syscall abort on any non-zero return code, or just -1, is quite academic 
so I'd rather keep the broader non-zero test (unless someone points to a 
clear-cut reason why this is a Bad Thing).

Cheers,

     Michael


>
> [*] https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
