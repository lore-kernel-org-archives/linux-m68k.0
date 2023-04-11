Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BB6C7619A
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjDKI0H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjDKIZu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 04:25:50 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632734C19
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:24:31 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-633fc0484d4so568384b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681201470;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuhQpZp89yi+GOw4ldpcyZzuSNJwAOJ2VZuniMyhHLk=;
        b=VIs9m3Bwvb3BWIy3cy0bPiD2hPUuNGIFhsx9clx7a6H9/vbPOX2VJKe9c4BV277nHN
         j5Yp50NtWYNsW2RRvxbR4Mj0bV7keLLG5TCLGatcg6wVQU0EjqnYrj3gIWxF4qk2gnA/
         a2DgYhvbk8NI0pCrrpc3iQ6shZ5D81ie5UR/6ZVqcVFoLzEsfzB6RDXjcG0H66luFcRd
         oiT40mIEdFGPUd82hsCaqWxR0smbixvyjjxdEQixVfsC5NRobxTsFjrM3eFHq/S95Dgf
         GpDbf2YffvYYqqbRPEuhkmbZJ3uMuUfGZirkNeghs5Ihd+tmnXEiqkGeAlKbbtAgvOu0
         fFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201470;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RuhQpZp89yi+GOw4ldpcyZzuSNJwAOJ2VZuniMyhHLk=;
        b=zWu6e6EDmE9Ke6ntfjYav7S2vY+56sVL05IWWTq9wLKdPODwe1zB/wH2pW2AaGYvTV
         c3oM/zW8D/rjWdM3pSC3lyPEbS6+dgyvHQOTBNGc+zEp26iBHLf+UI/tTJl8PU3Zcg52
         nOPIr5ArQ8iA70k7x3tRJZ9xfhewaHyMsBRIXUhdN/1AkUMzbnVtgvwHeIOXTRUpEwYb
         7KHjqxoyFOZu9RuDaF5di4xid88E8VKggsO2trLlq++nxPyFSnijsw6ZiIkfH3dyX3ou
         eUErHQErG3y0d8pQJjvDFFCfLyiNxLy48MxGIiCC/HgnhjwPmMGLcik90VccJg3EuXsc
         2VSw==
X-Gm-Message-State: AAQBX9cD3mPSvha1WmGMduxMbef/KPvXA7f0qcGj0AruL3bNVT23xYz9
        /h70DOy+5ia5a5v3u4VP3pwqlYJy5TU=
X-Google-Smtp-Source: AKy350bui1PXT/ZqLoE//qdS7Uimg+mLOOcltlExep0Sz242UZBLChe6cO+MwO9t9amGEuFy3r17Ew==
X-Received: by 2002:a62:4e44:0:b0:633:c311:c70d with SMTP id c65-20020a624e44000000b00633c311c70dmr10654959pfb.14.1681201470339;
        Tue, 11 Apr 2023 01:24:30 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id e20-20020aa78c54000000b0059085684b54sm9504011pfd.140.2023.04.11.01.24.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:24:29 -0700 (PDT)
Subject: Re: instrumentation, was Re: core dump analysis
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
 <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
 <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
 <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <13a69c91-ca2b-42d8-dbd5-0b81e76044c6@gmail.com>
Date:   Tue, 11 Apr 2023 20:24:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 11.04.2023 um 19:19 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Tue, Apr 11, 2023 at 6:56 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 11.04.2023 um 12:20 schrieb Finn Thain:
>>> On Sun, 9 Apr 2023, Michael Schmitz wrote:
>>>> Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
>>>>> On Fri, Apr 7, 2023 at 3:58 AM Michael Schmitz <wrote:
>>>>>> The easiest way to do that is to log all wait and signal syscalls, as
>>>>>> well as process exit. That might alter timing if these log messages
>>>>>> go to the serial console though. Is that what you have in mind?
>>>>>
>>>>> Store to RAM, retrieve through a new /proc file?
>>>>
>>>> Yes, that could be done, though I'd rather avoid duplicating a lot of
>>>> the generic message formatting code (printk and friends).
>>>>
>>>> I'll have a look around ...
>>>>
>>>
>>> A better solution might be be to port the existing instrumentation like
>>> ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder
>>> how portable that stuff is.

Looking at a few arch implementations, I'm utterly confused. Wouldn't 
know where to start.

>>>
>>> If you use printk, you could probably avoid most of the delays by enabling
>>> the dummy console. Then the kernel messages would be collected with dmesg,
>>> given a sufficiently large CONFIG_LOG_BUF_SHIFT. But it would be
>>> inconvenient to have no serial console available for the usual purposes.
>>
>> Can we disable the serial console after boot, by registering the dummy
>> console? Or will that just log messages to both?
>
> You can increase loglevel.

Yes, we could do that. I thought /proc has to be mounted for the 
loglevel to be changed, but I might be wrong.

OTOH, if we log wait and signal actions at level debug, and set loglevel 
to info or notice through the command line, we won't miss much of the 
usual boot messages on the serial console ...

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
