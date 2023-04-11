Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF57C76196
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 04:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjDKE3p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 00:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjDKE3o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 00:29:44 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741012721
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 21:29:20 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id la3so6513713plb.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 21:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681187354;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mrg1OLQ4I76oFOPKkHQhR0ZjeqU1MVtQD5BerTTwRGs=;
        b=KjLf6O1At6ZGSHp7PZjvE5d/4RVwr663EPT0KPlvYdO6FPs25vNudk8FTlUzbKaWJy
         u4PyyJQmpJS9TMgpV0rnYidXXnydaSmN18ScukNIfcNME4LxOMVl6RXSXlCQMp1PqLIN
         1QVGb79XRhOp1wUameCMD/Lb+4AnJI7KfUibNLkkM4J7lNUpBOy343FL7zhWYtwhO4Om
         6h3wn0v9F6Dvcd8k9RomodqnYNVu1wi89wA42ekYj+FpU9xP24h0qT+ZcWDGsw8DkW/I
         9vEuZ9em/Yc3rYlnXDsqvBtjBosfzibV6lp67QvE/fsGDVf033xrmbvKkNvArMTeuGJB
         XqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681187354;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mrg1OLQ4I76oFOPKkHQhR0ZjeqU1MVtQD5BerTTwRGs=;
        b=ZC7RJfGW45fSulBB86Lzxr45Rz/jBXoFiGl6BOUMmGiZ8ksnCXrQWoRCiqc++WwS0b
         2V5YPmXTDQHUOWX2okctdfDwfXJrRKMiPCw9vqozb4JWlkJU8YFnPMtbTJ4+nfiBKZ0h
         Bdf80ACZ27E2GlAykIds/zkqXKdWBrQXI3Be7kOt3Z/jp2K3Pisoj6SmUqI2dtOdFSpW
         e5Eky3VA4WDBzfs59s0kCKQgjAUrxfcjiCtNnoY5KethUxOyxNA7JGrx8gdotSRnPfyJ
         qMPsebS7DaBKx30mt1CY4gZpHk8vD0I9yTOoNBB5HsoAOKqftVz6trdZ9A9407AMkSDP
         9hsw==
X-Gm-Message-State: AAQBX9dHw8LaHaDtjsZi6xzu+2hxwiY8IaW6o5Ku6xc5CAGRw88A0BAP
        gXwMIgK5Cj0skdW69vt++Fnp2pVSB+Y=
X-Google-Smtp-Source: AKy350ZwAkVFMkaj53lmPVxm1F6r0dolJw/ktvQmYE/0pqOnGhJjoo4JVQWM1hSMLZ87NkvoOCRH+A==
X-Received: by 2002:a05:6a20:a89c:b0:be:da1c:df65 with SMTP id ca28-20020a056a20a89c00b000beda1cdf65mr11820474pzb.28.1681187354052;
        Mon, 10 Apr 2023 21:29:14 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id c21-20020aa781d5000000b0062ddaa823bfsm8679108pfn.185.2023.04.10.21.29.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Apr 2023 21:29:13 -0700 (PDT)
Subject: Re: kernel behaviour, was Re: dash behaviour
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
 <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
 <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org>
 <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
 <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org>
 <b0657a37-4297-1951-96d2-cec8cc6f0355@gmail.com>
 <6f2c6c5b-7e9d-94f2-98ba-9a1306f131bb@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <df1f56d3-ff3a-a4bf-290f-7f43f60ba45b@gmail.com>
Date:   Tue, 11 Apr 2023 16:29:08 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <6f2c6c5b-7e9d-94f2-98ba-9a1306f131bb@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 10.04.2023 um 21:39 schrieb Finn Thain:
> On Mon, 10 Apr 2023, Michael Schmitz wrote:
>
>>>
>>> So I guess this bug has more to do with timing and little to do with
>>> state, contrary to my guesswork above. And no doubt I will have to
>>
>> What may still vary is physical mapping - I remember you had used some
>> tool before to parse proc/<pid>/pagemap to determine the physical
>> addresses for task stack areas? Or am I misremembering that from some
>> other bug?
>>
>
> You're right, back in September 2021 when I was chasing a different bug we
> did discuss tools to look at physical mappings. I don't think that would
> help here though. We know the failure is not bad RAM because multiple Macs
> fail in the same way. Also, there's no DMA taking place on these
> particular machines.
>
>>> contradict myself again if/when it turns out that uninitialized memory
>>> is a factor :-/
>>
>> I haven't found a config option to initialize memory returned by the
>> kernel page allocators, so not sure how to test that ...
>>
>
> I was able to find some command line options (init_on_alloc, init_on_free)
> and the related Kconfig symbols (CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
> CONFIG_INIT_ON_FREE_DEFAULT_ON).

Right - not sure how I managed to miss those.

init_on_free might delay the boot process a while! But I would guesss 
init_on_alloc should be OK in the first instance.

>
> Given the compiler supports -fzero-call-used-regs=used-gpr there's also
> CONFIG_ZERO_CALL_USED_REGS. Also CONFIG_INIT_STACK_ALL_ZERO
> (-ftrivial-auto-var-init=zero).
>
> The problem with these options is that they may produce a large effect on
> the timing of events but they should still have no effect on the behaviour
> of a correct userspace program.
>
> Since we are dealing with a suspect userspace program, what could we learn
> from such a test? E.g. if the crashing stopped one could simply attribute

We don't know for definite that we deal with a suspect user space 
program - it might just be a change in a previously fine program that 
now exposes a subtle kernel bug (undetected for quite a long time, but 
we've seen a few of those now...)?

> that to the timing change. I suppose, if the crashing became more
> frequent, perhaps that would help debug the userspace program. So maybe
> it's worth a try...

We'd then have to try and minimize the impact on timing, by instead 
initializing a 'shadow' page reserved for that purpose. Though I suspect 
the loop over the pages might be optimized away in that case. See 
include/linux/highmem.h:clear_highpage_kasan_tagged() and 
mm/page_alloc.c:kernel_init_pages() ...

Cheers,

	Michael


