Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8663C77B75
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 08:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjEFIZA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 6 May 2023 04:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEFIY7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 6 May 2023 04:24:59 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918295B8B
        for <linux-m68k@lists.linux-m68k.org>; Sat,  6 May 2023 01:24:54 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so1078561b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 06 May 2023 01:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683361494; x=1685953494;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu4qq8ChYw5RP0gDo6XHAOXIUAu8obgdRMCmmK8viVo=;
        b=qLZNP38tUiLvKIqTdY+1ZfdY4XIKQ583Yi++o9jYSsR61CtTx8xKhnX6bk6tAMdE88
         uNcXaHZmLAsHNR8fnm/b6G8FawAyXKy58sYu2lZ743BrVKxhnWeMp+WFiMYQa3F/SWWC
         cbZTiWM2bIH/C7ofq+5wyTCu8iRitjOJMQ2VDZPKn/Pl42Yuq0dq9shi138gIqxtjPhK
         2ZZZ6RnkOx+cu/df48oMVbj6G/q9pohBounV2YOlWRwQLuyelJtrOkVfnHrQ265bd+Hn
         b2fdxhOwIB5uVgUXAuZQfHzHTp7n+eCxukKp6vWfSKGhJSxszlAml8LgL71nxHZY8kfc
         Yl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683361494; x=1685953494;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xu4qq8ChYw5RP0gDo6XHAOXIUAu8obgdRMCmmK8viVo=;
        b=OVa8qX+1Rkwjxz3N8Z36aKBKiqACywcHMjL/7fwa8MdArTtCZE8ZfskK3600PH3uOL
         rIwSKY8GcqXhFa2qfG4GaOxoaGCdxta77U+8+vG65hqqumtniMLVVHqIvshGxgC98GXr
         ZDd9UhsTZcFb4LFbo+ZUEopUr48Xi/wVFJ7foWGN8RBrWyFJCS17t4T6Et2gpk1uhm7G
         8GKRbdIujs6QEi+5O1caunKMKbinGzH57Os5JeCA33ArLHd3T40+y8OQ0D5BYBRj94sw
         /JE+0PfXyDnmeViJCwRX07LxRkfCXESy0AreIYkk4aUEGOgn2GsowexGRS1JRH1W9RoO
         UQ1A==
X-Gm-Message-State: AC+VfDxxnQyCA5QtigdN06nVSxiTqLWd4sPEWAZkEnIpm8EW+79iNIGN
        hmApmynBd00mUmZeK26LQ4g=
X-Google-Smtp-Source: ACHHUZ6JyOwtkhdFPIf5NBByRegQG6krCfJGwKiuYAIbrEpT1RczU9sq+NE+x5iffQKLZath4tMV+A==
X-Received: by 2002:a05:6a00:1251:b0:63d:3aed:44fc with SMTP id u17-20020a056a00125100b0063d3aed44fcmr5181089pfi.26.1683361493944;
        Sat, 06 May 2023 01:24:53 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7820e000000b0063d670ad850sm2794814pfi.92.2023.05.06.01.24.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 May 2023 01:24:53 -0700 (PDT)
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery
 following an address error
To:     Finn Thain <fthain@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
 <f4280683-9044-3858-3262-16080e584c96@gmail.com>
 <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
 <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
 <79fa24d5-ab04-0750-5dd4-eae6db212a71@linux-m68k.org>
 <c4ed63f4-6aea-2a1c-56b4-80fd64274cef@gmail.com>
 <b57967eb-8021-a4c3-9171-973252529194@linux-m68k.org>
 <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
 <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
 <1a5a6aea-4d58-0f59-f283-694c51bb162d@linux-m68k.org>
 <55ad6c92-4d84-a8dd-de2f-8342cff5e21f@gmail.com>
 <c3c4f790-d878-c635-e326-756c3f082873@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6d8837b3-959d-1da6-68f6-a151766b408e@gmail.com>
Date:   Sat, 6 May 2023 20:24:48 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <c3c4f790-d878-c635-e326-756c3f082873@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 06.05.2023 um 14:46 schrieb Finn Thain:
> On Sat, 6 May 2023, Michael Schmitz wrote:
>
>>>
>>> In my mind, at the time I sent them, patch 1 was expected to mitigate
>>> the impact of patch 2. It would have been surprising if the reverse
>>> had somehow happened.
>>
>> I did wonder if delaying signal delivery would cause fewer signals to be
>> delivered in total, and whether the remaining bus faults that do cause
>> signal delivery (format a) still cause any trouble because of eventual
>> unreliable USP.
>>
>> Adding your patch 2 then might have mitigated these problems while not
>> placing too much of a burden on the stack.
>>
>
> If fewer signals get delivered in total, that's not a bug, right? It just
> amounts to is slightly more signal latency on what is already a slow CPU.

I'm not saying it's a bug, and I had expected more latency. I haven't 
seen any significant difference in either number of signals, and signal 
latency is hard to gauge without instrumenting the signal code to add a 
timestamp when the signal is raised. No significant impact on execution 
time of the tests at any rate.

> Format 0xA bus errors happen between instructions according to the User
> Manual. There's no possibility of hitting the stack corruption bug AFAICS:
>
> 	"For efficiency, the MC68030 uses two different bus error stack
> 	frame formats. When the bus error exception is taken at an
> 	instruction boundary, less information is required to recover from
> 	the error, and the processor builds the short bus fault stack
> 	frame as shown in Table 8-7."

Right - I was thinking an exception raised by another instruction than 
the one currently executing could cause USP to become unreliable but all 
that does is make the fault address differ from USP (for an instruction 
executing that uses USP). Your current patches don't use the fault 
address at all.

>>> Anyway, I'm still in the dark as to why patch 1 is interesting. Was
>>> that because you wanted to delay signal delivery to try to put more
>>> pressure on stack memory by delivering multiple signals? You and I did
>>> come up with an
>>
>> No - it just eliminates temporary stack growth due to the format b bus
>> faults as entry into signal delivery.
>>
>>> alternative patch for bypassing signal delivery after certain
>>> exceptions. Maybe that would work better.
>>
>> Meaning skipping signal delivery on any bus fault? I haven't tried that
>> one yet.
>
> Don't try that patch if you are hoping to see signal delivery after a
> format 0xA exception -- you'd only ever get signal delivery after traps,
> interrupts, FP exceptions and a few other obscure cases.
>
> As with patch 1/2, I don't know why you'd want to use it.

As it turns out, I had already tested that one, and it caused signals to 
be delivered on interrupts mostly instead of bus error exceptions. Never 
ran stress tests on that one at the time.

Cheers,

	Michael
