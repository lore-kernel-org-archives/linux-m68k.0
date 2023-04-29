Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23296C77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 20:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjD2UIl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 16:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjD2UIk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 16:08:40 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4630B1
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 13:08:39 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b733fd00bso912551b3a.0
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682798919; x=1685390919;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s++x5oz/S+2XWYTYDS+k7Rn66Ct8gCd/zURVvuYVs1I=;
        b=NjhL5z3NSthXi6o02ntHuz72UCNKDjs3GcOZtZY4ZT3l7DfcjkRalYhx/NL0jPrGcJ
         QLhCtPxNjyghuifhAzhzG/e2K3vTQElOwx7zdmPXfAjM7zxLb+i4xlR4G92SxLH0BxyU
         +dLj8xEx7jtEdT4zQSqGEZlJ7AH38iGpYd5/xUMg0aWK2H2aQEv673/j+UZVq7BymMSV
         uYEV78mERvIYyiZ9K2AEde0VjQznfrhsrSTRJMqGgN57PqM29JuufUcG+7lYMUjsZeP7
         JXXUVX1laO9HaZXqsR8DriQgOMiLdHna6dpJzSXe+ybNwq6lSRI9fc4uTedGq96F52AZ
         FVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682798919; x=1685390919;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s++x5oz/S+2XWYTYDS+k7Rn66Ct8gCd/zURVvuYVs1I=;
        b=XVMhBFg/F8FuUqJxKn0O1rzxgikZF2lECYNLrMXCU6VmbU7M8tv39iAfOohNss+MZo
         OfwnfJp4SObYLBtG6JxARsVniRe1sAVWauzREZ9Gi64ZQaEz6VSw5nOobcHrvgbW38v8
         WQy/Qlx+20IIx5BicK396cy2NVONOKshxyf7m+LfXTBm/oBN9UN/1ezPP68Pq0bMH3vC
         ucBMbP1bEk9IbOGLm6qZnU/XKRWtdiBwgibKPN5Xxza2RGHzl3KASkfPdBl8FqlNbUmC
         qA6GevYKWbnMziDPgORKnxHuGefok7CFqLWTrdi0e8MUOqnAoveT52Iyeicpz1XRF+cN
         qyCw==
X-Gm-Message-State: AC+VfDxYMszZoE+vS20WY4lgTsjIc3BbeYYdCMbuhhKFOiycVYD91zZ1
        3SdBVJamvYEZDU1ydFcoEGIxvCe76iM=
X-Google-Smtp-Source: ACHHUZ4W9W+li++gqvibOwJwODZ6wZiZt+qpdHwLyJU1BxUnVHqlCjO3r5K11Mmal/m+cyOCEqG2UA==
X-Received: by 2002:a05:6a20:2451:b0:f6:28de:89e1 with SMTP id t17-20020a056a20245100b000f628de89e1mr11973094pzc.33.1682798919119;
        Sat, 29 Apr 2023 13:08:39 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id w68-20020a636247000000b00520f4ecd71esm14949211pgb.93.2023.04.29.13.08.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Apr 2023 13:08:38 -0700 (PDT)
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
To:     Finn Thain <fthain@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com>
 <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <10ace434-8b76-bd38-5570-9befc9eb7b98@gmail.com>
Date:   Sun, 30 Apr 2023 08:08:32 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

thanks for your feedback!

Am 29.04.2023 um 21:49 schrieb Finn Thain:
>> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
>> index dfc7590abce8..75f4c4943231 100644
>> --- a/arch/m68k/kernel/signal.c
>> +++ b/arch/m68k/kernel/signal.c
>> @@ -858,11 +858,23 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
>>  }
>>
>>  static inline void __user *
>> -get_sigframe(struct ksignal *ksig, size_t frame_size)
>> +get_sigframe(struct ksignal *ksig, struct pt_regs *regs, size_t frame_size)
>>  {
>> -	unsigned long usp = sigsp(rdusp(), ksig);
>> +	struct pt_regs *tregs = rte_regs(regs);
>> +	unsigned long usp = rdusp();
>> +	unsigned long ssp = sigsp(usp, ksig);
>> +
>> +	if (CPU_IS_020_OR_030 && ssp == usp && tregs->format == 0xb) {
>> +		struct frame *fmtbframe = (struct frame *) regs;
>> +		unsigned long fltp = (unsigned long) fmtbframe->un.fmtb.daddr;
>> +
>> +		if (fltp < ssp &&
>> +		   (fltp >> PAGE_SHIFT) == (ssp >> PAGE_SHIFT)-1 &&
>> +		 (((fltp - frame_size) & -8UL) >> PAGE_SHIFT) == (fltp >> PAGE_SHIFT))
>> +			ssp = fltp;
>> +	}
>>
>> -	return (void __user *)((usp - frame_size) & -8UL);
>> +	return (void __user *)((ssp - frame_size) & -8UL);
>>  }
>>
>>  static int setup_frame(struct ksignal *ksig, sigset_t *set,
>
> That seems over-complicated to me... I must be missing something.
>
> What I had in mind was something like this (untested):
>
> 	unsigned long usp;
>
>         if (CPU_IS_020_OR_030 && tregs->format == 0xb)
> 		/* USP is unreliable so use the worst-case value. */
> 		usp = sigsp(rdusp() - 256, ksig);
> 	else
> 		usp = sigsp(rdusp(), ksig);
>
>         return (void __user *)((usp - frame_size) & -8UL);

sigsp() may return an address from the alternate signal stack. In that 
case, no adjustment to the signal stack address is advised.

The fault address may be on a different page than the normal signal 
stack address (should have tested that perhaps, instead of the second 
condition above). In that case we should not adjust the signal stack, 
either.

As to the rest, it's a matter of how detrimental indiscriminate use of 
the worst case gap size might be. Finding the 'best' adjustment may be 
more hassle than it's worth.

I'll run some stress testing on both versions

Cheers,

	Michael
