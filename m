Return-Path: <SRS0=QPqG=BG=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFDBC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 20:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6E6620786
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 20:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vU6N0GKa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgG0Uso (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jul 2020 16:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgG0Uso (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Jul 2020 16:48:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D8CC061794
        for <linux-m68k@vger.kernel.org>; Mon, 27 Jul 2020 13:48:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f185so4819191pfg.10
        for <linux-m68k@vger.kernel.org>; Mon, 27 Jul 2020 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kPHLjNZ3Lsws9sPJaB7Gs5uB5IJdYwnwdofKAjijY3s=;
        b=vU6N0GKaUodO3HoNDzNazvDFnPB9SZRHYYoMLG54p9O8itAL3Z6/bQOOZC0ZNshhJk
         4IP/T+6Cg707dqet+IjlKIHSAvzU3rF2DxTw26oHBbjTe3EIXwhA1tg6w9nX9SDB6glK
         XbUTmXJIPop0pbbL8LlcTwTIuxGVckME1DG9sQZxuEdnCuUoTCxA6LmWVzo4RkaqoIRe
         AzxuY/yJUB4oogo4Dbqm1m2JI3O14aUiQ15DrcoqpeLFhz0gqHx+EQkKL0dywLoDfb9u
         DiicHH2aFNiEuJtNSfeEeVJuSEPrOGhJD/AcJVr1Uk/5/T7stCoJa7TPACwA9SrZf8fi
         /meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kPHLjNZ3Lsws9sPJaB7Gs5uB5IJdYwnwdofKAjijY3s=;
        b=PjBqgX2TAPskLjNhP35UyPDryNMmjFSQk3LLlspFQvgdbJOfQeeiPTMgFgE3GxgZGB
         R4yE/fdriE1YBh/f9yvX+6TmVSJmWLD05ldsol8y+wHs4cKGhbTXk68Blg+3IO066UCN
         JJBVZGmCiPoIDmLpp9Exsg65RrbdVo83AM6MzNgxEvZ1hKY6aJFL0KTwLc8x6jjbWJhT
         +2rIYoXxXhDoLQQwj4oKNU5Ql4fNm1qdXEztnpsonsylSUujQk5PEtKrW5qF9zQnV27r
         jeWUfZgQuzRm+Us0HXfl9IqOJGNS2TYQ0jI2uEEQAs4gm8pFgC06FY8fcfIU9/rhSfCW
         QvCQ==
X-Gm-Message-State: AOAM533jRRp86HHxmhyXArWBklqm+/M/tKyw+sqHCg1rxGmcoD3R4Bdc
        3WWSWU+11SeAEFsM22BzflqLlAKF
X-Google-Smtp-Source: ABdhPJwn70R2txuz3E1nxj8R0zs+dVTHgoV/zhIufMWS4CNX33/UdSdDPCvSnk/OxSuwVrDS6zeUIw==
X-Received: by 2002:a63:125f:: with SMTP id 31mr22240309pgs.239.1595882923443;
        Mon, 27 Jul 2020 13:48:43 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:b9ed:59af:cc50:daed? ([2001:df0:0:200c:b9ed:59af:cc50:daed])
        by smtp.gmail.com with ESMTPSA id 186sm15721235pfe.1.2020.07.27.13.48.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 13:48:42 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        geert@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, schwab@linux-m68k.org,
        Greg Ungerer <gerg@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <13c91e87-7e26-1bc6-8ac0-68a790ee99cd@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5d98d276-c867-7f9b-f5b5-048e5e70ee3c@gmail.com>
Date:   Tue, 28 Jul 2020 08:48:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <13c91e87-7e26-1bc6-8ac0-68a790ee99cd@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 27/07/20 10:03 PM, John Paul Adrian Glaubitz wrote:
> Hi Michael!
>
> On 7/27/20 6:19 AM, Michael Schmitz wrote:
>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>> and trace exit. Seccomp support requires separate entry points for
>> trace entry and exit which are already provided for Coldfire.
>>
>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>> in preparation for seccomp support. Check return code of
>> syscall_trace_enter(), and skip syscall if nonzero. Return code
>> will be left at what had been set by by ptrace or seccomp.
> Correct me if I'm wrong, but shouldn't the skip happen when the return
> code is -1? At least that's what we're doing on SuperH and that seems
> to be what other architectures are doing as well.

What other non-zero return codes do you expect syscall_trace_enter() to 
set, and what should the action in entry.S be?

(Note that according to my reading, your SH patch does not actually do 
what your description says. If syscall_trace_enter() returns a positive 
non-zero value, that value is _not_ used as changed syscall number. SH 
uses r3 for the syscall number, not r0).

As far as I can see, any non-zero return code should abort the syscall, 
so I just test for that (for simplicity). Our use of the 
tracehook_report_syscall_entry() return code (directly passed back from 
syscall_trace_enter()) doesn't leave much choice there, see comment in 
include/linux/tracehook.h.

If later on seccomp needs any specific action, it should be easy enough 
to change the syscall number (offset PT_OFF_ORIG_D0 on the stack) or 
syscall return code (offset PT_OFF_D0). There's code in kernel/ptrace.c 
to do that AFAICS.

Changing the behaviour of syscall_trace_enter() to match what other 
architectures do (return changed syscall number, not error code) is 
beyond the scope of this patch. I suspect the capability to change 
syscall numbers from ptrace code does predate the seccomp filter 
approach, and as m68k has never used it in the past, I don't see a point 
to add this now.

> Also, shouldn't that part of the change not be part of the patch that
> adds support for SECCOMP filter like in [1]? I don't think it makes
> sense to add the return code check unless the rest of SECCOMP filter
> has been implemented.

After replacing syscall_trace() by syscall_trace_enter() and 
syscall_trace_leave(), there is a return code provided by 
syscall_trace_enter() which we must check, hence I added the check at 
the same time as replacing syscall_trace() for non-Coldfire m68k.

(I note that the same check should probably be added to coldfire/entry.S.)

I can't test any of the later seccomp related stuff, so I'd rather leave 
that bit to someone else who can.

Cheers,

     Michael

>
> Adrian
>
>> [1] https://github.com/glaubitz/linux/commit/2fa1e7b9ba5150bc12adaddc017d5a6b79f363e7
