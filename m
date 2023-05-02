Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D765AC19F20
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 21:07:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjEBVHX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 17:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEBVG6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 17:06:58 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AAA1FEE
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 14:06:50 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso3316167b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 May 2023 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683061610; x=1685653610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzmpFRLAXJj0kAi+b/EbcR6w7Z/Q9pYemcuHP/z4vDI=;
        b=E2BdLoxmMAdTKgsRMqVdsACQGcKs2iVN60ay9onTCNvAyOn4NLVF4q1cBwsr3JkWwC
         PrObAgbmKcmcXLRjy918auKCsCMDzwXxRRl0/a8uYU7pQ96itgVV5QLtlOUsHfMeAwfK
         3jtLTPdUFQKSuOTPt0jK8/XSmh/vFzQFzZrUk3QKi5pzE4lMkOBOZt+BMmKoWMYJR8Tu
         y5icMnoRnFm6glMBiz20uJBlPb1uR8aIcLLQgAdW3az4V9x1Q9K0rDra0E7O1su11zmG
         es/Oev8GG07v++V0s6QTsBZMAD3ZJy4PGPqlu3U6dJGvy5CV/zAeLZclXDcgl+wn/Kla
         8b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683061610; x=1685653610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzmpFRLAXJj0kAi+b/EbcR6w7Z/Q9pYemcuHP/z4vDI=;
        b=FZRsSgPWr3YNBgZfPgVC2DFZk9Hy8Zxs1bfaOEiLgX46N1ny/tfRbpQbN7C/YXBWdc
         Z2Xfaw7lFOn/8bzYGUP4Ar4QRU1YVJDHTmQvKTR2I1gpK6B87+0TblMYIeOo3Om8BqTj
         8zDOeh9Dt5cQQsn8n7S7alGT/pQhMmhPRikou4SOCGlbx0fKuOc5dna33DZBgYg8Dmyc
         yxttM6JCrxIV1OCXKSUkTDH53VYG9aSrx0v7BfC8tEKLT1oDFbp+oZafOQL0n7XVum6f
         8RYVJuZPi2xEwfIHP7JCS2CiPJD7gMTrs1KfP2iQ3TuIS+1Zmy5RIx3HcVABvihJUib2
         wFpw==
X-Gm-Message-State: AC+VfDyS9ZdoU7JMOnzBVl++WEBuGiRr/pxPDMrB2RZCzZMsRZxCTLsB
        T4e6oLVBcGfY3GM9s/sJJ9lriNn55uc=
X-Google-Smtp-Source: ACHHUZ7ijPyLrcXm1dlqTpSEUD0IV7TrsfoxPdBWVBC621wPLLS7tqtwK41ajA3P9VGehgFgX7WrIA==
X-Received: by 2002:a05:6a20:1608:b0:f5:b7c9:57b8 with SMTP id l8-20020a056a20160800b000f5b7c957b8mr26907608pzj.42.1683061609874;
        Tue, 02 May 2023 14:06:49 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7c1b:932f:132a:65fa? ([2001:df0:0:200c:7c1b:932f:132a:65fa])
        by smtp.gmail.com with ESMTPSA id x12-20020a63484c000000b0052858b41008sm13392724pgk.87.2023.05.02.14.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 14:06:49 -0700 (PDT)
Message-ID: <f4280683-9044-3858-3262-16080e584c96@gmail.com>
Date:   Wed, 3 May 2023 09:06:44 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery
 following an address error
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 2/05/23 18:50, Finn Thain wrote:
> The 68030 Users Manual says that address errors occur immediately they
> are detected during instruction prefetch. The instruction pipeline allows
> prefetch to overlap with other instructions which means an address error
> can be taken during execution of a different instruction.
>
> Both a bus error and an address error may produce a format 0xB exception
> frame. Regarding those frames, the UM says the PC contained therein has
> the "address of instruction in execution when fault occurred -- may not be
> the instruction which generated the faulted bus cycle".

The UM  also states that:

"An address error exception occurs when the processor attempts to 
prefetch an instruction
from an odd address. This exception is similar to a bus error exception, 
but is internally
initiated. A bus cycle is not executed, and the processor begins 
exception processing
immediately." (8.1.3)

> In the bus error case, the USP in that frame is not reliable (like the
> PC). We should not rely on it in the address error case. The address error

The instruction causing the fault can't have modified USP yet. So the 
case that you are concerned about here is where the instruction in 
execution is e.g. a moveml using USP as one of the data addresses 
(making USP unreliable) and the instruction faulting is one of the next 
ones being decoded. Address properly aligned for the first instruction, 
then no longer aligned for the next ones?

(You mentioned cpBcc or cpDBcc instructions in another mail - where did 
you find that? It's not mentioned in my copy of the 030 UM...)

I'm not trying to say this all isn't necessary for address errors. I'm 
just trying to understand why it is.

> case always produces a SIGBUS. That signal may be caught and the
> exception fixed up. If a debugger or emulator were to do so, this patch
> would theoretically prevent user stack corruption.
>
> Cc: Michael Schmitz <schmitzmic@gmail.com>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Link: https://lore.kernel.org/linux-m68k/20230429080410.8993-1-schmitzmic@gmail.com/
> Co-developed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Michael, as co-developer, this will need your signed-off-by.

I believe this patch is currently our best option to prevent user stack 
corruption by signal frames in the bus error case (after Andreas pointed 
out a problem with your patch 1).

I've also been unable to reproduce the out-of-memory condition with a 
stack gap size of 256 in my recent tests, so I can no longer see a 
drawback compared to my (immensely more complex) similar patch.

So even though I'm still a bit thick on the address error case:

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

> ---
>   arch/m68k/kernel/signal.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index b9f6908a31bc..8aeafbb083f7 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -858,11 +858,16 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
>   }
>   
>   static inline void __user *
> -get_sigframe(struct ksignal *ksig, size_t frame_size)
> +get_sigframe(struct ksignal *ksig, struct pt_regs *tregs, size_t frame_size)
>   {
>   	unsigned long usp = sigsp(rdusp(), ksig);
> +	unsigned long gap = 0;
>   
> -	return (void __user *)((usp - frame_size) & -8UL);
> +	if (CPU_IS_020_OR_030 && tregs->format == 0xb)
> +		/* USP is unreliable so use worst-case value */
> +		gap = 256;
> +
> +	return (void __user *)((usp - gap - frame_size) & -8UL);
>   }
>   
>   static int setup_frame(struct ksignal *ksig, sigset_t *set,
> @@ -880,7 +885,7 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
>   		return -EFAULT;
>   	}
>   
> -	frame = get_sigframe(ksig, sizeof(*frame) + fsize);
> +	frame = get_sigframe(ksig, tregs, sizeof(*frame) + fsize);
>   
>   	if (fsize)
>   		err |= copy_to_user (frame + 1, regs + 1, fsize);
> @@ -952,7 +957,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>   		return -EFAULT;
>   	}
>   
> -	frame = get_sigframe(ksig, sizeof(*frame));
> +	frame = get_sigframe(ksig, tregs, sizeof(*frame));
>   
>   	if (fsize)
>   		err |= copy_to_user (&frame->uc.uc_extra, regs + 1, fsize);
