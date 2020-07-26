Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C7CC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4328A206E3
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKZtxbKc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgGZVCR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 17:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgGZVCR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 17:02:17 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750B2C0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 14:02:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m8so1114024pfh.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tTJgUoWcKsVpI9DdMRhbQczGRy4kf5uOISwnXUGI3B0=;
        b=RKZtxbKcej59mL+Hoo83qA2vu/2/lQE90PmyArJZK8qaY3TgMuVu4dU1eSX25HI34T
         /7XCNHkZ7wvMxuuoZq9ZdGBgecfe6nE6xdubiekyLL6ruJ3YUbSQXj6g5MZyEOm012Jr
         4K4UP7ElSSqtaug9Bjk6rXRJudj8NKq6X4k0Gz2lME+YS5tcZqObFLsU7vJlzwFCJBKT
         zqQq3TFAeGA3v/sLkk10XqucpIRFB5NI/spdPVOyLSjTCklkW7MLgz8FLEVFAFILbA/8
         6N9Ye5/MS9umSesnRlzXOhcPf7NZd548n4bXiFFiJ0a0JzBvjq8eJXGLKroxNpEewUr5
         r9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tTJgUoWcKsVpI9DdMRhbQczGRy4kf5uOISwnXUGI3B0=;
        b=Bcy58KCxS25TQfoDz6AHZEO9O3c7baxKdTGEpSjmWGZNuzkegIRmBsa19la4+/GSWn
         r+XANEPSMqEqBr7MqUs12l0LIm4sCOZJEHbjnfq495+I9Z6o2MILx8BaEjY+Q/8y9saJ
         sMr25U7APbj/vSH4uR1UpgTLo00aF9OiaN0Ixcyn6Ap9E9pDJRWuM6nWZ+sAlFh9CfQK
         kF+0pacR8qtYERF5tSWz6PGnEdgfDzpuKTMYMPxxKoKQfBmyPTnjSPQ7YaGwV25hkv53
         lxZPFU72kYvF9dkc52q2UA8lM7J8IJUxZR0LCd59RRnpnOgMUK3p6UngUoHZzkuUvzD5
         W9cw==
X-Gm-Message-State: AOAM531XJ8J2ZKGZsA5QlJ6LnCSW8uQf2UDMto9hByyAkS7mgja4SdnU
        I39w1nG1thKFHTIcRirnGYw=
X-Google-Smtp-Source: ABdhPJymH95sE4eSJhXGD3sRSYoNXvKbuDJEX+eld1t9r0daSfsu9GTuHGl17/DHRYf3UdlY1wfarg==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr17495741pfr.191.1595797336944;
        Sun, 26 Jul 2020 14:02:16 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:ec2f:8388:f010:f71a? ([2001:df0:0:200c:ec2f:8388:f010:f71a])
        by smtp.gmail.com with ESMTPSA id w18sm12085174pgj.31.2020.07.26.14.02.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 14:02:16 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com> <877durreph.fsf@igel.home>
 <80cef911-af86-c49f-5ac3-1cfe7037de80@gmail.com> <87wo2q5yhx.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <460261ab-8c10-d625-a4e4-a4e755413018@gmail.com>
Date:   Mon, 27 Jul 2020 09:02:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87wo2q5yhx.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 26/07/20 11:03 PM, Andreas Schwab wrote:
> On Jul 26 2020, Michael Schmitz wrote:
>
>> No particular reason - I had seen testb used in the syscall entry code and
> Where?  That may be bugs.

Here:

ENTRY(ret_from_signal)
         movel   %curptr@(TASK_STACK),%a1
         tstb    %a1@(TINFO_FLAGS+2)
         jge     1f
         jbsr    syscall_trace_leave
1:      RESTORE_SWITCH_STACK
         addql   #4,%sp
....

and here:

ENTRY(system_call)
         SAVE_ALL_SYS

         GET_CURRENT(%d1)
         movel   %d1,%a1

         | save top of frame
         movel   %sp,%curptr@(TASK_THREAD+THREAD_ESP0)

         | syscall trace?
         tstb    %a1@(TINFO_FLAGS+2)
         jmi     do_trace_entry
         cmpl    #NR_syscalls,%d0
         jcc     badsys

....

plus when saving the FPU context on resume (the comment there suggests 
FPUs keep 8 bits of status that must be tested, so that should be OK).

Cheers,

     Michael

>
> Andreas.
>
