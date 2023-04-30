Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751A7C77B73
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Apr 2023 07:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjD3H4R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 30 Apr 2023 03:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjD3H4P (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Apr 2023 03:56:15 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2730213E
        for <linux-m68k@vger.kernel.org>; Sun, 30 Apr 2023 00:56:14 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b51fd2972so1015186b3a.3
        for <linux-m68k@vger.kernel.org>; Sun, 30 Apr 2023 00:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682841374; x=1685433374;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfwykyYHn51I9rGT8dAfJlf2NBWkCQnmEO34hjHZVnM=;
        b=OkjhUvLUCp1VuQI17BqqB8pmwcqtwulvRNLJGF6KMXjD2VAOAXdPesl29PvvELGBL5
         2HRWh4xFUuqlFOtNx+wo9SDzgGdXesID8cklMRTKfnpXRuYxvRCPMvUHDqKhcmj+UZKQ
         /f1/UywaSssr1vHHZ3ehPZzOnAKpiR+tLrO1BCZMYddvMZSCVA92yFdhp5/V2yvOiH8u
         Go9dxiMUaBEAILytf8OtaF3eLiX2liRta4+lEViwakq7UeIBMgJU8XdI3fZQem5fhedF
         SpNo4pT3Nzjl9AOzo4OIdci/Jgh4YuF2Cw6o7ySPVP2tS58C6OgHBG8WAgKGx3YDehUH
         FPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682841374; x=1685433374;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfwykyYHn51I9rGT8dAfJlf2NBWkCQnmEO34hjHZVnM=;
        b=ZwJN3hiWE1zxKmHwgf9NGSL7xCaDtAu10P+5MWb4PTXw7DUco0UOUwlY6nYZsnLkCj
         bNZYwpPsVz82DRk65K2cVXnZW2OcECzId/vLn/NR9TzkxMUASoCI9ZFOgQTFILbAgjZl
         rMCQq1YRDk0wievUynhKD6gYBhcAWBkaSySJrm5MCgrI8sZWmqUNawMo0w5zpXVm+aZW
         WZ5cRpRxr+Ot8gsa51aDjsFkU9fTuLcfqx1iBxRgazClH2ebLPKLLM1zkTdyg+JHi+Qw
         y79mj9unwPboHk//LtAoSkzM3frI1utAdO5Zw+4EPpDTw23rnOjBhCeVYsP/JK/It8YP
         fCSA==
X-Gm-Message-State: AC+VfDyxvPVgN2qWEwE4Va2Pz56TIv8EgvfXcbUMqkE4G8m8V5E5DhO8
        Fe5UnvpF7/L/XLOlxssSRlJ2nAWW9HA=
X-Google-Smtp-Source: ACHHUZ6jQ6Np2+q2vlN1sexWq0mfZ2odhSAOgpj7+cE3sT+HdqEPYBgBtecExiZfMCCihIhb9l3gVw==
X-Received: by 2002:aa7:888a:0:b0:63b:8423:9e31 with SMTP id z10-20020aa7888a000000b0063b84239e31mr15914085pfe.11.1682841374250;
        Sun, 30 Apr 2023 00:56:14 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id n12-20020a056a00212c00b0063f172b1c47sm16306541pfj.35.2023.04.30.00.56.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Apr 2023 00:56:13 -0700 (PDT)
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
To:     Finn Thain <fthain@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com>
 <ad929524-52c8-143c-5249-02fd1722383d@linux-m68k.org>
 <10ace434-8b76-bd38-5570-9befc9eb7b98@gmail.com>
 <0827b987-134d-b463-c3c9-e21905f94e09@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2458d3f7-4ad9-d4eb-4bf2-034ce8e3a94c@gmail.com>
Date:   Sun, 30 Apr 2023 19:56:07 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <0827b987-134d-b463-c3c9-e21905f94e09@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 30.04.2023 um 12:24 schrieb Finn Thain:
>
> On Sun, 30 Apr 2023, Michael Schmitz wrote:
>
>> Am 29.04.2023 um 21:49 schrieb Finn Thain:
>>
>>>
>>> That seems over-complicated to me... I must be missing something.
>>>
>
> If signals don't nest, a page fault on the signal stack should never
> produce a new signal frame there, so this bug should never show up there.

I'm sure it doesn't. I'd just seen problems in an earlier version where 
none of these checks were in place. Using a signal stack location based 
on the fault address without making sure the fault actually happened on 
the user stack (i.e. below USP but not too far below) means we may place 
the signal stack in the text segment or static data or the heap area ...

> I think that was the point I'd missed, because it means the signal stack
> may be exempted here. But is the extra complexity worth it?

Any area that a bus fault happened on, except that right below USP 
should be exempted.

But your point about complexity is well taken. I must be missing another 
case where signal stack placement based on fault address is incorrect 
(kernel fault in __clear_user called from padzero when loading an ELF 
binary - odd ...)

Back to the drawing board.

>>> What I had in mind was something like this (untested):
>>>
>>> unsigned long usp;
>>>
>>> if (CPU_IS_020_OR_030 && tregs->format == 0xb)
>>>     /* USP is unreliable so use the worst-case value. */
>>>     usp = sigsp(rdusp() - 256, ksig);
>>> else
>>>     usp = sigsp(rdusp(), ksig);
>>>
>>> return (void __user *)((usp - frame_size) & -8UL);
>>
>> sigsp() may return an address from the alternate signal stack. In that
>> case, no adjustment to the signal stack address is advised.
>> ...
>
> It'd be ill advised as it would reduce data locality when it expanded the
> signal stack across a cache line or page boundary, and there may be a

You can't expand the alternate signal stack. It's obtained by malloc(), 
and we can't just hope that extending it down another page 'just works' 
in the same way as when we use the user stack (even there, it will only 
work up to the processes' stack limit).

> performance penalty for that. However, the signal stack seems to be prone
> to poor data locality anyway, compared to the normal user stack. So I
> wonder if this penalty could be measured. It seems like a premature
> optimization to me. Unfortunately, I don't think we get to measure cache
> misses on m68k.

Yep, the whole scheme does look overly complex with a little more 
thought (and testing).

A fixed offset, or skipping signal delivery entirely is much the easiest 
solution for now.

Cheers,

	Michael
