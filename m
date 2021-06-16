Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DFDC48BE5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 23:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A70A061159
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 23:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbhFPXjn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Jun 2021 19:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234692AbhFPXjn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Jun 2021 19:39:43 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0550CC061760
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 16:37:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k7so2693950pjf.5
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 16:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KRub7j5LWOvAV40eZj1ABXZWAph9v5atzqkad5e3Bxg=;
        b=ciTfYE8rcSorVu+gd5wy191g4qLv6vK6YbAIbSZC+SS3RVc+iKCoc+QvG8XAAOyFR+
         hSKQsIdTR5qLR+bzFabWiXNM6UmJMb713OdrViQMlOYj2FdPJxVkpLfeSIymQeFiVBjz
         0loUDEsDUDyrPKHHSLe40PBz4DitvCciOQxN4nGL4cFLRYv6sgAna0ihcVZ8ZdyJU84R
         OLV3L5oCQTl26HIKHN0C6evLckvCFMzV+3ug2rB/dTXafuBIE6hJbTcPQ+RmdneweLhZ
         OUTrExkPW9gkDZenp3FsG5bP2jiI/6N2NKhgeUeN5FWyC4Vg/Sl2tBDIkJhKeveyIDic
         kQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KRub7j5LWOvAV40eZj1ABXZWAph9v5atzqkad5e3Bxg=;
        b=Brb6Z9hNoLnKgDIMUb6E1mqo1eNcJVbZ8syVXK+3fw0myTl1G3mDdvYEBjKHVarzfL
         OG2I4PggFl+9m3Q6/s9m1Quxm/+GoIeUtuW1KyW7CdjkHEgSxxBXynSF4AnZniXojcZD
         jjolvc9IvreI1tXzqyKZ+6t53nr8BgmCkZvxRHVau//JzjFT11t3KiVJdsSAb9JeJ0Kc
         /+3zk/uxv9nedVlSiCYwa1a5ycrQOdUhvmP7x5jnFF+bD7DCJdhDTeKFKYHhq8+OPZfl
         jGFi3BE3uY7/2NCoiUecsbSFGmIFPxgVq5fVHLK+vZrTELQBgen2UubrKbNDBMVI6O77
         q+zA==
X-Gm-Message-State: AOAM532Cuvn2B8q/QiFxx+lYnkWCQShqqyvUrYYOehW8wTsyynozPyUc
        IjcmXSV/RZokuAI1h4dY/x4ytw7HuucRgA==
X-Google-Smtp-Source: ABdhPJx7bGO3ZRIQ5f/xSAi3R2O8WQIBDwRLuyiRecXUSlO599/yxzG3BKqnHTycIOLXivna/ESbVA==
X-Received: by 2002:a17:902:a98c:b029:119:926d:f99a with SMTP id bh12-20020a170902a98cb0290119926df99amr1856224plb.5.1623886655462;
        Wed, 16 Jun 2021 16:37:35 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:9d12:c2c8:273e:6ffd? ([2001:df0:0:200c:9d12:c2c8:273e:6ffd])
        by smtp.gmail.com with ESMTPSA id n72sm3070216pfd.8.2021.06.16.16.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 16:37:34 -0700 (PDT)
Subject: Re: [PATCH v4] m68k/kernel - wire up syscall_trace_enter/leave for
 m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de
References: <1623804565-25473-1-git-send-email-schmitzmic@gmail.com>
 <87v96es1z8.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2e7a90e3-fd6c-714b-10e7-e12c83afe862@gmail.com>
Date:   Thu, 17 Jun 2021 11:37:30 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v96es1z8.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 16/06/21 7:27 pm, Andreas Schwab wrote:
> On Jun 16 2021, Michael Schmitz wrote:
>
>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>> and trace exit. Seccomp support requires separate entry points for
>> trace entry and exit which are already provided for Coldfire.
>>
>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>> in preparation for seccomp support. Check return code of
>> syscall_trace_enter(), and skip syscall if -1. Return code will be
>> left at what had been set by by ptrace or seccomp (in regs->d0).
> s/by by/by/
Ouch ...
>
>> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
>> index 9dd76fb..e949b66 100644
>> --- a/arch/m68k/kernel/entry.S
>> +++ b/arch/m68k/kernel/entry.S
>> @@ -164,9 +164,11 @@ do_trace_entry:
>>   	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
>>   	subql	#4,%sp
>>   	SAVE_SWITCH_STACK
>> -	jbsr	syscall_trace
>> +	jbsr	syscall_trace_enter
>>   	RESTORE_SWITCH_STACK
>>   	addql	#4,%sp
>> +	cmpil	#-1,%d0
> That can be optimized as addql #1,%d0.

Thanks, that wasn't obvious at first glance!

Will fix in v5 ...

Cheers,

     Michael

>
>> +	jeq	ret_from_syscall
> Andreas.
>
