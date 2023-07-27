Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4DAC0015E
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jul 2023 03:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbjG0DSF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jul 2023 23:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjG0DSA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jul 2023 23:18:00 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E171E94
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 20:17:58 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686be3cbea0so1103346b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 20:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690427878; x=1691032678;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+XWNNoTh3QSc7zkxoNFSFxDCrhxwrrFqkyYTjKfZQA=;
        b=jZsf6//XmPZPr9QLzB2Z/dr5WcR1rXEgsRsH4OatPOPneruNPfgv08Nb/hn/BgYd9N
         424QPAZvJxBTz63ttpRKbtz+2YgcLXLoI1mMJRRJ8qKSrebgiQeaJlugO8kcl9cD6TAJ
         3j+pX2PMQz30+dCR/obeKNuLlV5mZNddH1R34UKvHHgNWaPJZf7nRPYZ374Ynxvp7Q9z
         wZLi+ewi53b+exuFnq86mI8ozvj1RT0Gdz9H6o63y1IjUDgnfqiH+jX5PIMcRzOQWEu+
         bb+f5idJqRoZEjqT0fi09832nLwd7RBFnj8BYaJFTkn5dIXmGP92bYakCLhY+OfiS6cP
         Z3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690427878; x=1691032678;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/+XWNNoTh3QSc7zkxoNFSFxDCrhxwrrFqkyYTjKfZQA=;
        b=V8x3ZTZ0eSbpPQbmYJQScoiVhmd3vzPKhSngS987tad131gBYV5Txh5ZIaj/6hNqQh
         YLHqoqdkkkQM/A3PSLnaWec1jONlNjzkcTMTi0XGkH3M48v/Z0TLRAKrgBIt49KDLW06
         /zVB+/DuN0w3gRhqVMY88hySFqhYbM/Q0KhDtcWfmLOsplG0WHei5pw6mV/j+qRDxnET
         V6XIvVEmCAo8Iooje3aRNrLS3jgirJoTuvreZ3oRPgcEwgu4OFiDVBq9ISVJjUxFGrsz
         u6QIAQc668pzJH9pB0jDoj/GA11inTXn35VeUUi0l/sbac/wL1LjUYSdXMFeeyUPZR7/
         fuBA==
X-Gm-Message-State: ABy/qLYybiUX6cZjxwutsb280ltGjBaDIP86C0MsXfHX/aDkAQ4Zzhgh
        6ePRIxjO3S6tr/wfN4OJWr+XZx+s7Lk=
X-Google-Smtp-Source: APBJJlFxJJxJrAnSgVS0K1FRSMHc5JA2mnv96WztD2rQau2svfm/o8nVrJizpKhFBIYysxq2+ASz9g==
X-Received: by 2002:a17:902:ea09:b0:1b6:9954:2030 with SMTP id s9-20020a170902ea0900b001b699542030mr1723549plg.8.1690427877641;
        Wed, 26 Jul 2023 20:17:57 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b001b3bf8001a9sm318416pld.48.2023.07.26.20.17.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jul 2023 20:17:57 -0700 (PDT)
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Finn Thain <fthain@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
Date:   Thu, 27 Jul 2023 15:17:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 27.07.2023 um 13:16 schrieb Finn Thain:
>> A correct fix would keep the current IO translation intact, and instead
>> use the platform mem resource to register the driver IO range, and the
>> platform IO resource as base offset to populate the port ioaddr struct
>> (minus the register scaling and byte offset, mind you).
>>
>> I'll give this some more thought ASAP.
>>
>
> I wonder whether Will's suggestion (CONFIG_HAS_IOPORT_MAP) is feasible in
> light of the needs of Gayle and EtherNEC drivers.

I'll have to see how that works - both Gayle and EtherNEC don't just 
need address translation but their respective quirky IO access functions.

>
>> And yes, I'm painfully aware the m68k low level IO code is becoming a
>> bit of a maintainance legacy, in no small part due to my hacks around
>> Atari EtherNEC.
>>
>
> I guess you and I both can share the blame for 44b1fbc0f5f30e66...
>
> Anyway, you make a good point about on-going maintenance. Do you think
> that by supporting standard ISA drivers we might actually reduce the
> ideosyncracies in m68k IO code?

You and DaveM ought to have a chat about that - abstracting the legacy 
drivers from the ISA constraints was his preferred option when I last 
attempted to get the Gayle network driver patches merged. When I say 
'preferred', I'm probably understating a little.

I had toyed with that using the EtherNEC driver as test case but never 
got very far (this would have been splitting the driver into a core 
lib8390 module and a platform-specific module that allows to hook a 
variety of IO accessors as hooks, not static defines, and I wasn't too 
certain about performance impacts of such a change, the performance of 
the EtherNEC being so shitty it won't make any impact there),

The only other option (that I can see) would be creating a bus driver 
for the ISA bus, with platforms allowed to register their particular IO 
accessors for IO and memory accesses - again, performance impacts to 
consider and getting test coverage on legacy ISA hardware a nightmare. 
This would allow to use legacy driver code more or less unchanged. 
Haven't given that much thought at all (the idea pretty much originated 
from this present mess, but that's all).

There may be other approaches that can be considered, if none of this is 
what you had in mind.

Cheers,

	Michael
