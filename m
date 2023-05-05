Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C444C77B7D
	for <linux-m68k@archiver.kernel.org>; Fri,  5 May 2023 21:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbjEEVgD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 17:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233551AbjEEVgC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 17:36:02 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8581F4
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 14:36:00 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1aaebed5bd6so16091405ad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 May 2023 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683322560; x=1685914560;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwHWjV6rT9iDNMNcohmzLvsGJudm3+EsAQOTCNyrwu4=;
        b=Lk+jBtAl0ZZes2ImT2NJTWE1SsEsjFMAi4jCB25RVbh1MvS8LwhfTwRUj2+beEkPCX
         kFi0B0SHzgP715N3LbQdxx0pYUR2C90mvuLVyMgcmgt/Uk/6oYxbocdciakSYQrdeKJq
         OWN1BY1gO52XeKfyqusz9VCUYzyVzzwnbTXkqmMn99u3lPhXpi4pev2Lu2ZpmCoVZj8n
         D+IMb8KA/YpxOwJZPwoLKtEV25qXzz+oATZKvbhvMIZ/MXfb0+5B4O3sYmV90C9yOhoW
         RGVyQ6LdYHnkv1xBVH+tfL9V7bXiRji67f5+Y1Bk7ir1BMvESKs60c8uSpHzkOW1IPXC
         eqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683322560; x=1685914560;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EwHWjV6rT9iDNMNcohmzLvsGJudm3+EsAQOTCNyrwu4=;
        b=b8TEl9tETMsPG4Vz4+e8p4OGoswJtYV/zGnztvbG8SI540d/Be5Dwq0Y2W+XEwUWEs
         Q1iFeW7qb3GhAScno9Mtd3JXE7VgEyKuzdg/ZvZjzACWbd9MqeKBUG52EXFWY0U9V0uE
         Tw2WMFBPdqkgO+6J5U++khV9cx8lr8k/hhMre6Xaa1ptqLjwFTxmo5omLStrduz1vg5m
         gUs0DYsqnAwE1DefZR7b9LKUnaloZxZk2YZiWCrD0u529Z7Dbtf8KQWtsJdSjN3uOJn2
         e436K1rT5Za/wZehI3MORBhs/s9lD6cUc163wPT541e1kJmJU1ScwlQ9K7sM5aHKq6sw
         EBdQ==
X-Gm-Message-State: AC+VfDzLwL0md2RJdbNx7dwbPRsuqUTOyCK7sg4I11ECUsp7lmhtMRqE
        2LekY5AqYZv2j1GZMGjOIV9KoFC5SJE=
X-Google-Smtp-Source: ACHHUZ5nU+tzps/IAhzZ68Ci9dK697CoVmqCHFi1LSEVWBc+fjpIJIaXFUoRXqDnnr4Go3L7ylLkQg==
X-Received: by 2002:a17:902:c947:b0:1ab:2659:b533 with SMTP id i7-20020a170902c94700b001ab2659b533mr3442746pla.3.1683322560083;
        Fri, 05 May 2023 14:36:00 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id x14-20020a1709027c0e00b001a24e2eec75sm2191823pll.193.2023.05.05.14.35.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 May 2023 14:35:59 -0700 (PDT)
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
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f393d20f-3067-885e-8f26-6d3b13bd9811@gmail.com>
Date:   Sat, 6 May 2023 09:35:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <4e20d336-1215-bf66-14b1-a142a2960d70@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 05.05.2023 um 17:05 schrieb Michael Schmitz:
> Hi Finn,
>
> Am 05.05.2023 um 15:14 schrieb Finn Thain:
>> On Fri, 5 May 2023, Michael Schmitz wrote:
>>
>>>
>>> In terms of fixing the bus error bug, I think we'll need to fix this
>>> regression first (only first patch of yours applied):
>>>
>>
>> That patch came from Andreas, maybe he can comment.
>>
>>> I'll try with your second patch applied as well.
>>
>> I think patch 2/2 should be tested alone since 1/2 was nak'd.
>
> I'm trying to find out whether patch 2 mitigates the effect of patch 1.

It didn't - hung without printing an Oops message, on the first stress 
iteration using the --stack 2 --stack-fill stressor.

Cheers,

	Michael
