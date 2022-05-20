Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280FAC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 20 May 2022 14:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350484AbiETOwl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 May 2022 10:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350465AbiETOwl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 May 2022 10:52:41 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9DC16D48B
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 07:52:40 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-f189b07f57so10601133fac.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 May 2022 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=F9NhlZ1BJrBJt+HtsXVIjBK2G+mZ/27MPaPylnb4RNE=;
        b=Jt6eAQ/B+zcTSyiZXDjHSNcrBTdKeQdAqLLh0JQZzLX3EgYQZg+X7VFmHLZOYPNq1T
         Rpf8lY7QAZZK9DcjFQvEqc2njXqcBRvQIdZyp+CCdQ2csSRvEAsNNsFjWbAnysBFcsit
         25kicyco7anuiRhakdy0AYeUoRgUO4Nm1QeYZzI/q79iRDdKuFS8hmNMF96BRckv0DRs
         J+DYumIHAcnTwfVFwUHLBs2P16wV/0UwheKPLkQhe03eSMDGhD/fHIhcBVTV/tyynZPi
         EGhwfZrKKWmcLspVmIjS/J4df89yHXsGMMGZayw9/gMxTLfgwE8MHufHDInCwgo3gnyJ
         VfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=F9NhlZ1BJrBJt+HtsXVIjBK2G+mZ/27MPaPylnb4RNE=;
        b=RtXbDEMPjG3m7zZbBpAXmfWnOBMlhvL+8z7trPmVrsSVfcmXmLDlMQ9fd46CrEs1eK
         Lzd7jYVoGSk2eh7Mz/TbZ5D8RG0WdCTDYp8vYAtM/8ftXRtXWiDgZYxZ7oYsr4NbHD1f
         PD+zNxM0WzXeUBRWzzV36wMKB8i8fVmdljx4EJkuPM/okK7eTyQyoAvHL2iObdUbsd2g
         nYfLHR4RWpiWcD8JUc/dAIXQlC6fCUc0hygSkEIV+rWksaX6Bb+d/def3qVgAsfVxMoL
         Ku+7hLr4ctF9hki04/dVcbP/SRxIsPDl04JsdxQOkjyWsfE89FMbndSi9FVhJ1MXMdoK
         Yv6g==
X-Gm-Message-State: AOAM530q4Xcifyac6xZrgR0yCX5sjy5MXwekIeJdGpAr46XXWfLAa2qL
        mV3jolK0mU9oflqIDDcNQZw=
X-Google-Smtp-Source: ABdhPJy7mVltaRXWRtvkPoQ4iTECp435azi4gtzOhBHMxEPqui8gPmieKENEafO2uJLBx4fV61MHvA==
X-Received: by 2002:a05:6870:248a:b0:e5:9e62:58e0 with SMTP id s10-20020a056870248a00b000e59e6258e0mr6174361oaq.21.1653058359435;
        Fri, 20 May 2022 07:52:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p7-20020a05683019c700b00606ad72bdcbsm974276otp.38.2022.05.20.07.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:52:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <286a1eef-e857-a31f-839b-00a4c835dfa9@roeck-us.net>
Date:   Fri, 20 May 2022 07:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <c15bedc83d90a14fffcd5b1b6bfb32b8a80282c5.1653057096.git.geert@linux-m68k.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] m68k: atari: Make Atari ROM port I/O write macros return
 void
In-Reply-To: <c15bedc83d90a14fffcd5b1b6bfb32b8a80282c5.1653057096.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 5/20/22 07:32, Geert Uytterhoeven wrote:
> The macros implementing Atari ROM port I/O writes do not cast away their
> output, unlike similar implementations for other I/O buses.
> When they are combined using conditional expressions in the definitions of
> outb() and friends, this triggers sparse warnings like:
> 
>      drivers/net/appletalk/cops.c:382:17: error: incompatible types in conditional expression (different base types):
>      drivers/net/appletalk/cops.c:382:17:    unsigned char
>      drivers/net/appletalk/cops.c:382:17:    void
> 
> Fix this by adding casts to "void".
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Survived m68k/allmodconfig.
> To be queued in the m68k tree for v5.19.
> 
> Removing the casts instead causes issues with functions propagating void
> return values (return expression in void function), which BTW sparse
> complains about, too.

We live and learn. I didn't even know that this was valid syntax.
I thought it might be easier to just fix that code, but coccinelle
reports that there are hundreds of places in the kernel where this
is done. Outch.

Guenter
