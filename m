Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8514FC77B75
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 01:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjEFBrG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 21:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjEFBrF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 21:47:05 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E313C14
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 18:47:04 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-52867360efcso1647954a12.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 May 2023 18:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683337624; x=1685929624;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3b6uLts6XqDls/BBwbEEi1YlBl5X+0k4VkSHMFA9WQ=;
        b=TmzC3p8+D7Oix/oxYT6zBxj2JIH9XhwXZXBq1Iwu/BsH3UEXdCsr5kssldTFhJ8atT
         KZdZyGBSDm5E9p0lG6wjykqRD/RfnOf4aUtSxB3lCjW1JRpTALgK67drkJ58eQbf+nbM
         Em8AoAm7pORhh4p96HpP1RZjsgiggqletNVgJBhRbXNRWjrHN+HZuMTfXD5MM6AXgYQ5
         pDko/mSCIX1WynhKYmzKoUeNYcUO3ih3l/BJAXDigHKd85R4X4K7HQe6WtWJVcba7gQ8
         7rT0kzYuLFHsr/7zs88rdfgTLzj6FME9V4jcwiIz1LNTQBud2PNlD+994pueu9dm3C1r
         RfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683337624; x=1685929624;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y3b6uLts6XqDls/BBwbEEi1YlBl5X+0k4VkSHMFA9WQ=;
        b=E0AIE/7WuIVJU3nCSYSD5NjuZTdU6glu8SxGJFCOMeNcHxLgMuTEXpWgBLCGeC/Ikh
         484pi0rH9P8n5fi7BXCgxc2l4EFcoueoFY1W99RVKukvnAX8674lTjjLYHAfynUIeajQ
         iFpvVoCEFykuMIzzHCP5kPhJkTsGV2xdGqt46XCUg3sAmE+G1W9XdhsG0hre/XVrup8J
         5//SDVWUVsJ3xBs2j1wtlLbbNpT8CERpvFMAmz7OpqXhLYWE43b9BcCHSjw5jNSKUXB0
         OljxYMLGoLcxtYeeSvB3nfQUke0K3fV7u8Edw1ZznWT8yJ2hcTyZ6WH13DqvQxr5paqT
         osRA==
X-Gm-Message-State: AC+VfDysBoahHqbJOxo3gILXGwkvOoBhvwn/+pQSKT+4iJbTDvyJSqND
        ccDun6KQqdB9vPEDIYu4vkKWg4/tiaM=
X-Google-Smtp-Source: ACHHUZ5mO78pnDH0WpQov5SmYwsS4jTiXZp8pTmj6In4vV/gFU4CrqTZ4DBfgHoHnqk/UzQ9JwxSjA==
X-Received: by 2002:a05:6a21:3702:b0:fc:d037:1972 with SMTP id yl2-20020a056a21370200b000fcd0371972mr3399535pzb.39.1683337623973;
        Fri, 05 May 2023 18:47:03 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id g26-20020a63565a000000b0051b4a163ccdsm2181532pgm.11.2023.05.05.18.47.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 May 2023 18:47:03 -0700 (PDT)
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
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <55ad6c92-4d84-a8dd-de2f-8342cff5e21f@gmail.com>
Date:   Sat, 6 May 2023 13:46:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1a5a6aea-4d58-0f59-f283-694c51bb162d@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 06.05.2023 um 12:36 schrieb Finn Thain:
> On Sat, 6 May 2023, Michael Schmitz wrote:
>
>> Am 05.05.2023 um 17:05 schrieb Michael Schmitz:
>>> Am 05.05.2023 um 15:14 schrieb Finn Thain:
>>>> On Fri, 5 May 2023, Michael Schmitz wrote:
>>>>
>>>>> In terms of fixing the bus error bug, I think we'll need to fix this
>>>>> regression first (only first patch of yours applied):
>>>>>
>>>>
>>>> That patch came from Andreas, maybe he can comment.
>>>>
>>>>> I'll try with your second patch applied as well.
>>>>
>>>> I think patch 2/2 should be tested alone since 1/2 was nak'd.
>>>
>>> I'm trying to find out whether patch 2 mitigates the effect of patch
>>> 1.
>>
>> It didn't - hung without printing an Oops message, on the first stress
>> iteration using the --stack 2 --stack-fill stressor.
>>
>
> In my mind, at the time I sent them, patch 1 was expected to mitigate the
> impact of patch 2. It would have been surprising if the reverse had
> somehow happened.

I did wonder if delaying signal delivery would cause fewer signals to be 
delivered in total, and whether the remaining bus faults that do cause 
signal delivery (format a) still cause any trouble because of eventual 
unreliable USP.

Adding your patch 2 then might have mitigated these problems while not 
placing too much of a burden on the stack.

> Anyway, I'm still in the dark as to why patch 1 is interesting. Was that
> because you wanted to delay signal delivery to try to put more pressure on
> stack memory by delivering multiple signals? You and I did come up with an

No - it just eliminates temporary stack growth due to the format b bus 
faults as entry into signal delivery.

> alternative patch for bypassing signal delivery after certain exceptions.
> Maybe that would work better.

Meaning skipping signal delivery on any bus fault? I haven't tried that 
one yet. But I suspect the same problem exists with that as with your 
patch 1 - if the bus fault wasn't handled, and the signal to be 
delivered to the process is SIGKILL or SIGSEGV, completing the execption 
without signal delivery will just cause the same bus fault again, ad 
infinitum.

Cheers,

	Michael
