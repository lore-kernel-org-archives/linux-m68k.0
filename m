Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9D4C433E6
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D41F64DD8
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbhA1IDM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhA1IB1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 28 Jan 2021 03:01:27 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D667C061573
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Jan 2021 00:00:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h12so6379456lfp.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Jan 2021 00:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gnZ/GDloV555+OnWhNxGUyFa3V1UNr+TUyX9DCKmvmo=;
        b=BvV+OmW8dWjmNJDvcrvjzcva8OWBy7a8Wldf3TYz+i6X3QYbdYVdx8XtO5leAkHTrU
         w3YMC/VHtwxm1x/Ic4nsp2y26eWjsO1yakRgVNAsk/+vPQ3tFI4ORflBdiqudTUbNQ15
         4udiNHAeivKX5c5MMjdj7/0f+Ywbb21vVg6oz3mMUyOwECoUO5sTQ+F7gyKkdUAVhOze
         vsQP8Kn/mYUO89v8SJNtfvxDDv5uZaZ+sphCBYtGqh9qpfbAr39PdAciszAdWiMDq33U
         CM0tCQ9qP6AgV+zPptT62EH2DQH0UbsDLxpsVPp63My+wTEFFdBYjDtMPkofAyv61LZq
         z8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gnZ/GDloV555+OnWhNxGUyFa3V1UNr+TUyX9DCKmvmo=;
        b=RlqP99wGtaiZVAFWYFATwQ1bNeaCTz1LRpmTKdmvBYN6blEzQs23/tswJnaOoelZI1
         4egrOpwe7/ZL7zr+rgA1QCGdibUihus2nbksRYR58C2xvallghXNvdTq6V/BSfdhKJ9r
         pOE/AS5en4Qwh615UHzjoahGY+5e/6U5Q337cxnu/7jOUJdqkeYnxJ86YlJL927zt82M
         oPnHhWZtLbfYtKKi8T7jr57a65UU2cZWHl0D3YXYgR6IpKv8yIVywbpkxZgoFZByw19u
         tPNKW37JB8ZzeENt+ORyR7eFpDwd5yYvJGcp4tqIcYi3Wd702F1KUcymZpALYDjLkji4
         xm+A==
X-Gm-Message-State: AOAM530jZ7Osm6dlqZRV371zwcxzRz+/KKCZZc8ZcPR/D0ONP8o5Rdwn
        Ao6dUarIZU0DSiC5aBOQXMo=
X-Google-Smtp-Source: ABdhPJx0NmJx1f9alnrCE9Umt15J9iBGC/sPqz1LULvUs4CMEHAB23hGApY2DMjRufppP/iSttVSHw==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr4218547lfi.213.1611820841569;
        Thu, 28 Jan 2021 00:00:41 -0800 (PST)
Received: from [192.168.1.100] ([178.176.79.159])
        by smtp.gmail.com with ESMTPSA id b18sm1359053lfj.140.2021.01.28.00.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 00:00:41 -0800 (PST)
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>, linux-arch@vger.kernel.org,
        x86@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-3-masahiroy@kernel.org>
 <dd37a7f2-55e1-2e96-0c93-4a40980b8ef2@gmail.com>
Organization: Brain-dead Software
Message-ID: <605cea27-bd69-5b21-f285-2d3d0f6abd23@gmail.com>
Date:   Thu, 28 Jan 2021 11:00:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <dd37a7f2-55e1-2e96-0c93-4a40980b8ef2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 28.01.2021 10:59, Sergei Shtylyov wrote:

[...]
>> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes
> 
>     Emits?
> 
>> warnings.
>>
>> $ make W=1 kernel/sys_ni.o
>>    [ snip ]
>>    CC      kernel/sys_ni.o
>> In file included from kernel/sys_ni.c:10:
>> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous 
>> prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>>        |              ^~
>> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro 
>> '__COND_SYSCALL'
>>    100 |  __COND_SYSCALL(x64, sys_##name)
>>        |  ^~~~~~~~~~~~~~
>> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro 
>> '__X64_COND_SYSCALL'
>>    256 |  __X64_COND_SYSCALL(name)     \
>>        |  ^~~~~~~~~~~~~~~~~~
>> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>>     39 | COND_SYSCALL(io_setup);
>>        | ^~~~~~~~~~~~
>> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous 
>> prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>>        |              ^~
>> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro 
>> '__COND_SYSCALL'
>>    120 |  __COND_SYSCALL(ia32, sys_##name)
>>        |  ^~~~~~~~~~~~~~
>> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro 
>> '__IA32_COND_SYSCALL'
>>    257 |  __IA32_COND_SYSCALL(name)
>>        |  ^~~~~~~~~~~~~~~~~~~
>> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>>     39 | COND_SYSCALL(io_setup);
>>        | ^~~~~~~~~~~~
>>    ...
>>
>> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
>> declarations. Let's do likewise for __COND_SYSCALL() to fix the
>> warnings.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>>
>>   arch/x86/include/asm/syscall_wrapper.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/x86/include/asm/syscall_wrapper.h 
>> b/arch/x86/include/asm/syscall_wrapper.h
>> index a84333adeef2..80c08c7d5e72 100644
>> --- a/arch/x86/include/asm/syscall_wrapper.h
>> +++ b/arch/x86/include/asm/syscall_wrapper.h
>> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs 
>> *regs);
>>       }
>>   #define __COND_SYSCALL(abi, name)                    \
>> +    __weak long __##abi##_##name(const struct pt_regs *__unused);    \
>>       __weak long __##abi##_##name(const struct pt_regs *__unused)    \
> 
>     Aren't these two lines identical?

     Ah, got it! :-)

[...]

MBR, Sergei
