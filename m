Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C059C77B72
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 07:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbjDTHeq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjDTHeo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 03:34:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095E2171D
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:34:44 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a69f686345so7243415ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681976083; x=1684568083;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTqsaDh+XnqEFasgIshVTNF971CWFSWQKf6kF3abckQ=;
        b=fLTLFg8jZtVnb9pb4RuXTteY6ao7mv/JgR/HgozNcJISXEc0LZtRGvlC47vLhbadJ4
         YnziEG968Gj5trWIytYVNHdTPsAiMl+lvkMdrUCpmysPteU+IANSbJGKUutz84a7KU/Q
         rhLuQMB5oSAYEbfpJJr6D159XVW1k6GD5lsq7bi4CJCQDm+MwkTUkMh5sw0Fcrbmy7eD
         YLbQYL8olhvu4Uel/Of3tOA1sVcRnEnnxiINcAp2oAM2YOF+5kqoc3Oef8mQA7Ram5Na
         YTPGLFG55jLyQCUMz5PydVyW6PA23Aj+Z3QqJU8zI++roU9lDdaddG3GNN1DJUEyBVRb
         jgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976083; x=1684568083;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTqsaDh+XnqEFasgIshVTNF971CWFSWQKf6kF3abckQ=;
        b=TBVqUzw3UOWmqsNGyT5rEdzF0qcbD/Zf5NQOCOCHDfMYOguptRc4R5yxSKfOqGEIay
         QJQJDQBbLNRc1agRDBaLi+sZKe3TvIYuKgh970r6lUxBD2ztoPx/YsEkdLkUqnEVq/4T
         dkcMZAm5PSvQrahX5DQMoo2dadNQ1+VLidre8vSA5YOcIlhBEDbhylVtahGyFGGouAjg
         Oymp6y4JdIMv9Qlcdv+F01nxTk7lXKWNvlR46HtoxGU+uTAaOoie8X9BpeWpzw5Zg1DJ
         HjikwEAtDcmrLEdOVzXRJ6UmvfzYAsceLBB2oo9lfiXbB3XrbJ9Rs+FQQJNWBwfMLfyt
         UY9g==
X-Gm-Message-State: AAQBX9eWPwvjR9D/3R4eZDQo0v/fStkK53JcIZgCaqxZnlexKR89gGv0
        NTHTy9L+ApE/CoFmtrUeTnuev6Hc7bI=
X-Google-Smtp-Source: AKy350bZRGPStY434RhzKCA03/YurqTkGhyKf7b4LaBP+95gXtHy148ulvGsfsCLqJqUqBZOk56GTw==
X-Received: by 2002:a17:902:eb89:b0:1a2:3108:5cc9 with SMTP id q9-20020a170902eb8900b001a231085cc9mr705913plg.40.1681976083006;
        Thu, 20 Apr 2023 00:34:43 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709027b9000b001a19bac463fsm597529pll.42.2023.04.20.00.34.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 00:34:42 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
Date:   Thu, 20 Apr 2023 19:34:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 20.04.2023 um 17:17 schrieb Finn Thain:
> On Thu, 20 Apr 2023, Michael Schmitz wrote:
>
>>>
>>> As with dash, the corruption lies the page boundary.
>>
>> Hence implies a page fault handled at the page boundary.
>>
>> Can you try and fault in as many of these stack pages as possible, ahead
>> of filling the stack? (Depending on how much RAM you have ...). Maybe we
>> would need to lock those pages into memory? Just to show that with no
>> page faults (but still signals) there is no corruption?
>>
>
> I modified the test program to execute rec() to full depth with no
> forking, then do it again with forking.
>
> root@(none):/root# while ./stack-test 5000 ; do : ; done
> starting recursion
> done.
> starting recursion with fork
> done.
> starting recursion
> done.
> starting recursion with fork
> Illegal instruction
> root@(none):/root#
>
> I can't get this to crash during the first descent. The second descent
> always crashes, given sufficient depth:
>
> root@(none):/root# while ./stack-test 50000 ; do : ; done
> starting recursion
> done.
> starting recursion with fork
> Illegal instruction
>
> So all the stack pages would have been faulted in well before the failure
> shows up. It appears to be the signal that's the problem and not the page
> fault. That's not surprising considering the PC in the signal frame in the
> dash crash was a MOVEM saving registers onto the stack.

Well. without locking the faulted in pages in memory we can't be sure 
they were not swapped back out. Unless I misunderstand what's involved 
in that ...

In my tests, increasing the depth does not cause a monotonous increase 
in fault probability. 16k depth only has four crashes, 8k had nine. I'll 
stick with 200000 for now.

Best try and narrow down how long this bug has been present - my kernel 
builds on the current system go back a little over ten years.

Cheers,

	Michael


>
> It's worth noting that the test program never crashes with a corrupted
> return address. Random corruption would have clobbered that address about
> 10% of the time, since the entire rec() stack frame is 9 long words. So it
> must be that a MOVEM went awry when a signal got delivered.
>
