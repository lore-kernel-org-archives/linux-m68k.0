Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B45C001DE
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 02:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjHNCtI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 22:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjHNCsp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 22:48:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D03E65
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 19:48:43 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-26934bc3059so3354211a91.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691981323; x=1692586123;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDW3CO4zJMZP+iJwechL6E2GQsWCN3KsgFjRmrW04DU=;
        b=UFAbE3Md8//lVfOPS1ay6Lm0QA7gyphyWkFXNkR+03A4Ew4I+riK2QPwSZndy35R8j
         cxGE2ocfOMFgAg9g0iZbWzwEefpVLZTlw7XYQs9oebDnnjJ0xqIBcwiWumt8dt25E/CS
         iMNcOdPDj7/zLX2zMJ7m6MRuZhk1d9ubron3K4QGjrPgXwTEUHci9FxG6lVeQq6hDs0j
         8yx5gugtWjfI+gOSU8WhBhK9DrA3a3zAXEbDm8izgI/7RuVtwR5DpU+6944cSoEdbIt1
         5jtdXhYaoFKmNW4bPItm7SCeQDfibzHOG+UfnGZK0R8c/KHriVQUZKb+Eb4LegH8GC/W
         V+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691981323; x=1692586123;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDW3CO4zJMZP+iJwechL6E2GQsWCN3KsgFjRmrW04DU=;
        b=Sgx1RF+BSUumvK9++55DqWWiYGMHNAQAIk1wa+dQQgogBStVt9K7Y8ICdUzPru9uBx
         UH0gVz7QP1jZLCF1hl7VKULoPQdBfs6b7/RSvv3ylBaFi9SSEUaSsdx9Tv9LIgw3r0UB
         w5g6tB4uIN1rTM81NMu5nUo9JwoxUZ53rgsFX1WaHeRNzquHmgRKLp4VGBV2VUVw/4E5
         bP4+VAUJ0ngJIdjzBXPwurmEbL3TdHaCA7jvaShXf742F9ffeH1fWSECLIYnpVj8T536
         maqO0RGDeCTsSxki6pqJi6t5bthuqrMbY8QgDf3nviWqxrBTbMWkAjW1wCsXMVz51Yf5
         agbA==
X-Gm-Message-State: AOJu0Yws7y1/4bfthiBULJv9NHwKmQpbqLBpL7HkwUuclyJlpL4VooOw
        cL+IeIXV9+tzyfJN2M/xjiY=
X-Google-Smtp-Source: AGHT+IFr3iOAF2cOtZ7rFXmpVhH1c5+9j61y5MDYrRk9gQlpYvdWHgePrm56GRQj5ZmzrElDOldNBA==
X-Received: by 2002:a17:90a:6fa1:b0:269:4fe8:687 with SMTP id e30-20020a17090a6fa100b002694fe80687mr10782439pjk.19.1691981322524;
        Sun, 13 Aug 2023 19:48:42 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8929411pjb.0.2023.08.13.19.48.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Aug 2023 19:48:42 -0700 (PDT)
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Finn Thain <fthain@linux-m68k.org>
References: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <a1ffc79b-eb37-5ed6-6984-a0a3674662b1@linux-m68k.org>
 <1403a5b1-7d89-9ae7-e47b-168feb148454@gmail.com>
 <70169097-fb78-a55e-92a4-d5d777e27149@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <98d863cc-6e58-2107-33ec-c977485c2f6d@gmail.com>
Date:   Mon, 14 Aug 2023 14:48:36 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <70169097-fb78-a55e-92a4-d5d777e27149@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 14.08.2023 um 13:15 schrieb Finn Thain:
>
> On Mon, 14 Aug 2023, Michael Schmitz wrote:
>
>>
>> Most other Falcon users might use SCSI (and SCSI-SD adapters) to
>> transport data between systems. Not an option for Q40.
>>
>
> Well, it could be of some help inasmuchas we still support a number of ISA
> SCSI host adapters. I wonder whether the Q40 ROM, bootloader or vendor
> software etc. has any support for SCSI cards (with no byteswapping)...

The issue of byte swapping does not arise for SCSI AFAIR (most host 
adapters used on these systems are narrow so disk byte order is 
preserved, and byte swapping happens at the filesystem level if need be. 
Byte order for wide adapters may be possible to set by the host).

SCSI support came as third party drivers for Atari, I suspect it's been 
the same for Q40.

Cheers,

	Michael

