Return-Path: <SRS0=OM19=BC=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FD2C433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Jul 2020 22:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 093282071A
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Jul 2020 22:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYOG+IL3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgGWW5B (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Jul 2020 18:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgGWW5B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Jul 2020 18:57:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DF5C0619D3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jul 2020 15:57:01 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a23so3900573pfk.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jul 2020 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gkz8NBqOtOtJe/5JTvdkqsdDu5+UOKM+u1Uz4f+zIJM=;
        b=UYOG+IL3z2oDMXVHAmqsDC+PqS5DzGvlHgoEMbj+hCrQEtX7EFnX8doPgV1uJuejbi
         fLgNZmL1nCAX+LycRGUyMuwIPW3gx51Z5MkkAvxPM8D5+YkiYJejy6ZyeJtUpr7qrDYS
         kO1bDKO7kQrExZZYo+WE5pjO41cjbt9lk10Uq5SdZ0ONfXoyKnGLImZLVtam+Hu1FvDU
         1/PSWDA+jVc5zCqFUt4fjkWSJhtoBxG4dS7jahsp6IZDVvGW2ktJd7WPjH2hz1MXOowj
         TubT813qy4xaEZrCJPfqJJhUYVXwCv6AeCvq/cnbSNbVC7kuOu1vaLM0KKJLz7g+iGDb
         hO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gkz8NBqOtOtJe/5JTvdkqsdDu5+UOKM+u1Uz4f+zIJM=;
        b=gh5ItCQDaTrDs0DnInzzRHAf/DqJOkcgW+ME4UxTTWaV/LQhuGAzkFhPZgcLR58ehD
         QY8uP1BMTH1klEmOmMbdq6xutqnS2/bq42YpD+B0lC+gMKq1Ab0INl8M1U0MqU8vUT0t
         XYwdMCvuLoJnJUgWXRcJKp36EC2T+Ay+hO3loYV0Tj6HB2fgOApPLGuV+tVgnf4EiRUH
         JIEBsoP6Mom1RytW64N1PJwqjbRGClElz5PbprLcU3dVVnIba7Fx9xg6tYBtW50Rg3j0
         AaZ86lGHkfbr5M2+r/u7hBlZysmql9pMf4dJYvGH67vFEnCEJa1fHI7gsi3Nf382KD8c
         A4FA==
X-Gm-Message-State: AOAM533uI6u31PF7NuCiY/OHM1juuJcEVn6zwZlkor3prQGuuR/O1s1u
        Y4wr8p9HPiL2OcMnlc4eFkw=
X-Google-Smtp-Source: ABdhPJyeu9RKGBdQVgm9BqkcLOdJZWCKgXQmIUw2PI4yVL0sC3tTfgqu+Sgkqgw7DpwadTrkjxI7dQ==
X-Received: by 2002:aa7:8d8b:: with SMTP id i11mr6273790pfr.263.1595545019676;
        Thu, 23 Jul 2020 15:56:59 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:395e:93cc:e7e6:f685? ([2001:df0:0:200c:395e:93cc:e7e6:f685])
        by smtp.gmail.com with ESMTPSA id u8sm3758697pjn.24.2020.07.23.15.56.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2020 15:56:59 -0700 (PDT)
Subject: Re: syscall_trace_enter and syscall_trace_leave for m68k w/MMU
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fe8a7e2f-cecc-1235-3649-aab0033da02b@gmail.com>
Date:   Fri, 24 Jul 2020 10:56:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Adrian,

m68k/mm only has syscall_trace() (in kernel/ptrace.c) which is called 
from the system call entry in kernel/entry.S (look for do_trace_* there).

syscall_trace() is called before and after syscall execution (if the 
syscall trace flag is set). Looking at the sparc 32 and 64 bit trace 
code for comparison, you might try replacing these calls by 
syscall_trace_enter() and syscall_trace_leave(). The current code in 
syscall_trace replicates the code in ptrace_report_syscall which will be 
called from syscall_trace_enter() and syscall_trace_leave(), so things 
ought to continue to function as normal.

syscall_trace() is also called from the ret_from_signal entry - no idea 
what should happen to that one. My guess is to treat this as syscall 
trace exit.

CC to Andreas - maybe there are subtleties with strace or gdb that I'm 
missing.

Cheers,

     Michael


On 23/07/20 10:03 PM, John Paul Adrian Glaubitz wrote:
> Hello!
>
> Michael and I have been working on SECCOMP in SuperH and successfully added
> the missing pieces yesterday [1].
>
> We're now looking into what needs to be done for m68k and I have noticed that
> syscall_trace_enter and syscall_trace_leave - which needs to be touched for
> SECCOMP support - are available on ColdFire and non-MMU targets for m68k.
>
> Is there a particular reason for that? Looking at 68000/entry.S, I can see
> that both functions are invoked [2] so I'm not sure why they are built
> for CONFIG_COLDFIRE and !CONFIG_MMM only.
>
> Any ideas?
>
> Adrian
>
>> [1] https://marc.info/?l=linux-sh&m=159546012829989&w=2
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/m68k/68000/entry.S
