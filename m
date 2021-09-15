Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79FDC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 22:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAE5660F13
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 22:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhIOWU4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Sep 2021 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhIOWU4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 15 Sep 2021 18:20:56 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E1EC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 15:19:36 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id j6so4056729pfa.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 15:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NM8i/UdoQZLwyBLW2erL7u2GZQeN1E2oMNEHemsAuX4=;
        b=FyuEZKOXvPe58EtcdQq58xV1eadbZcmFX9ED9Yw4+hjeUb5d9gVDG+0pshyFRcYNBg
         F5h+RU7/TORme7In6WWZsQWfsRW7oDlLqh2btmvtHnbwJ5Szb6OUxg5cTu3ykbMHR1tb
         IZn8VVlpmoTiAZJEr+/G1RRmxidolo+UenstSKH9xjXYG0BpmCmLhyvRw2PERUt8N+Ic
         VRgfkjaD2U8yGSGTWcEp2++VHbSOArXh5sL+aKWZYRzCTzmtwwAUdU6cCmXAbN1FT9Nc
         Un77475qDgUD/kiX5VnE+MD7Hx1JpQb+m8oy6GTSUJZeNyP2721q1EnDTOJpFMBhz1mh
         5tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NM8i/UdoQZLwyBLW2erL7u2GZQeN1E2oMNEHemsAuX4=;
        b=vQBTHfQ+Hfga2F8ef+0LO8ulbg5So0fOIrj2VcmKBGCGqHvOMw8dtnd3TxjVzk9nch
         Aln1k4dTKsrDM79va5qHAyNa203GusZ7K6wUwrZ/TnCUBLCUfBiKKiD5KzGFXSSwgklB
         4Ka9yTUZodHqQd9AGrKoEkDZCt6Nt8iDxW6/NIOBQaQhxAqE1QTxvfbgjJOHnEYbmNDG
         I+xzYKKdsNK07W7maX+On3RQ4z1WQ6lHTp63eWSicvXaGYJJp8JPx5GvuMqb+v46brlN
         ji1EY2mCSdoxa9WBYNPBEBNxuybV0duEPavM8ajL0LuceadUS3Lzck8Nf6QS6zwf2vEq
         aY3g==
X-Gm-Message-State: AOAM532rYgpLD1J/6L/UkHCBL+Ye49FqjOAHbqGD3EMHOA2Pl1eJArLJ
        EPcUHOUQqSge4Ks1HZTDFWM=
X-Google-Smtp-Source: ABdhPJyC6ZnCIxzN/BpQYg+AJh8tbXpVco/GdbwV2YdSbLpq2Agq1dKzrAkq9S5hCOby1GCJObM47Q==
X-Received: by 2002:aa7:8d58:0:b0:439:d68:b405 with SMTP id s24-20020aa78d58000000b004390d68b405mr1931114pfe.2.1631744376163;
        Wed, 15 Sep 2021 15:19:36 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:9b0:7226:558a:f377? ([2001:df0:0:200c:9b0:7226:558a:f377])
        by smtp.gmail.com with ESMTPSA id pc3sm5620593pjb.0.2021.09.15.15.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 15:19:35 -0700 (PDT)
Subject: Re: [PATCH 2/3] m68k: update ->thread.esp0 before calling
 syscall_trace() in ret_from_signal
To:     Al Viro <viro@zeniv.linux.org.uk>, linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
 <YP2dMWeV1LkHiOpr@zeniv-ca.linux.org.uk>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a0dad440-03bd-cac6-6eee-22a1fdd2f825@gmail.com>
Date:   Thu, 16 Sep 2021 10:19:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YP2dMWeV1LkHiOpr@zeniv-ca.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Al,

On 26/07/21 5:19 am, Al Viro wrote:
> We get there when sigreturn has performed obscene acts on kernel stack;
> in particular, the location of pt_regs has shifted.  We are about to call
> syscall_trace(), which might stop for tracer.  If that happens, we'd better
> have task_pt_regs() returning correct result...
>
> Fucked-up-by: Al Viro <viro@zeniv.linux.org.uk>
> Fixes: bd6f56a75bb2 ("m68k: Missing syscall_trace() on sigreturn")
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Looking good also, and should go to -stable.

Tested-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

> ---
>   arch/m68k/kernel/entry.S | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 9dd76fbb7c6b..ff9e842cec0f 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -186,6 +186,8 @@ ENTRY(ret_from_signal)
>   	movel	%curptr@(TASK_STACK),%a1
>   	tstb	%a1@(TINFO_FLAGS+2)
>   	jge	1f
> +	lea	%sp@(SWITCH_STACK_SIZE),%a1
> +	movel	%a1,%curptr@(TASK_THREAD+THREAD_ESP0)
>   	jbsr	syscall_trace
>   1:	RESTORE_SWITCH_STACK
>   	addql	#4,%sp
