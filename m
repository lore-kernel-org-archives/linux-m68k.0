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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7971AC433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E0E164DDC
	for <linux-m68k@archiver.kernel.org>; Thu, 28 Jan 2021 08:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhA1IAl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhA1IAI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 28 Jan 2021 03:00:08 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66209C061573
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Jan 2021 23:59:21 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s18so5208065ljg.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Jan 2021 23:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZhLAAud3HvOatZc8bWa160+GGDrtwAXLfmrfPeaVYS8=;
        b=iipPbsfxZVCoeVKuars96HlwaPhNMoxff6kXibVhpITK1M6liR5Y9O7+S15Bs18l09
         qlUtM1wTfg9Ou6I6g23AZm7cVsi8afl9ywua8K9yMdO5bZr9nt5kjWGTXEGzGKuOa9/g
         1XUmU2pb08XIkn2+EUpygz+rpS2BWuStq+kp1Z0L+RWjtUcubBnlDUTz5WKp9v7710os
         SLNWgHiJ3JIV+8IAHjWh/nhAgSk/YRdA5r5xJzX10KabfIVPeT0lFPft9QR1HE2XX97r
         YL6s2qMMPrVFtgVS0PASinY6oq3v5br43OEKFxy7K4ebWVUxXV6rGDy0rY0fMsVaCwye
         p0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZhLAAud3HvOatZc8bWa160+GGDrtwAXLfmrfPeaVYS8=;
        b=WedHpJ5q9u8jrFnquShqJX04PX9cW5wbLTrcOwZUG+n9QknwTs2/u5jaKYhrkpIULz
         iaBkCN337pC07egnoLOXzvcMjwVOjt3bFpqq8R0mGea+xMHwYvwzADp61TSQNSC1ciNA
         RUN0blfqtVM1m2EHDF1j7RDuy5YufuV0u3toJQQ1PVVcyDRU+GEN3g2Nc9u3RwIopXPE
         VQLQzPl1bow/d/wdwsK3DGaBbOQm23zZC45f+S9/KEfpI2I8p2YswtBhcqWcTMXgNprv
         xz4tVnO0F2ZYd+CZheUM3o7EJO8u2BaRuWHuyZ4dqPg9jOxVFtMeBM03qKJ4DLpiMeY5
         NtAg==
X-Gm-Message-State: AOAM533kAm7/AQ1TVbhp7JxijmeJx7gf4wkuZp8AGYdkW1Y4YDxArz0a
        rZS+EjJzR83bjCSjRBpOMu8=
X-Google-Smtp-Source: ABdhPJyNhfosDqTVmWD8kXJOJ9HDxIw2bv3pFQwo469kI3mpp/ZSh90Ay+X1biZCj8UPTr2AxhJ8ug==
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr7769208ljo.401.1611820759903;
        Wed, 27 Jan 2021 23:59:19 -0800 (PST)
Received: from [192.168.1.100] ([178.176.79.159])
        by smtp.gmail.com with ESMTPSA id z23sm1635056ljj.25.2021.01.27.23.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 23:59:19 -0800 (PST)
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
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
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <dd37a7f2-55e1-2e96-0c93-4a40980b8ef2@gmail.com>
Date:   Thu, 28 Jan 2021 10:59:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128005110.2613902-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

On 28.01.2021 3:50, Masahiro Yamada wrote:

> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes

    Emits?

> warnings.
> 
> $ make W=1 kernel/sys_ni.o
>    [ snip ]
>    CC      kernel/sys_ni.o
> In file included from kernel/sys_ni.c:10:
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
>    100 |  __COND_SYSCALL(x64, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
>    256 |  __X64_COND_SYSCALL(name)     \
>        |  ^~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
>    120 |  __COND_SYSCALL(ia32, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
>    257 |  __IA32_COND_SYSCALL(name)
>        |  ^~~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
>    ...
> 
> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
> declarations. Let's do likewise for __COND_SYSCALL() to fix the
> warnings.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/x86/include/asm/syscall_wrapper.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
> index a84333adeef2..80c08c7d5e72 100644
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>   	}
>   
>   #define __COND_SYSCALL(abi, name)					\
> +	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
>   	__weak long __##abi##_##name(const struct pt_regs *__unused)	\

    Aren't these two lines identical?

[...]

MBR, Sergei
