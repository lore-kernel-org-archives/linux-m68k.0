Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C829C41513
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 19:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354654AbjHQTHx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Aug 2023 15:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354667AbjHQTHt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Aug 2023 15:07:49 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC0A2D5A
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:07:47 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68842ebdcf7so78846b3a.0
        for <linux-m68k@vger.kernel.org>; Thu, 17 Aug 2023 12:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692299266; x=1692904066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMu12uY6gJkjDImtxtXIvQYeY9JKWACT5srHRfVOHgM=;
        b=RNEYOPiI3FU255/vUs7Dc56Jqw+r6ZJL8mOz1I9/Ibey5+DdM4VXoCU8WDGkUi6/Dr
         /efmiC79pzUhpGUp6A/SSpNUwdiQt5OTHvBjM+yh35Qxf4KhoKiujvHjJhq0/aWA/Ifq
         lqth4T+uv5gOxAsJoousHA0FaO85huJwz5tm+BJNo6sgB5t2fe5bVyEhxblAz5V9O5ka
         BwXiX3aPPUlj2QiZFad8vqObyNOet2PYb/JKxO2O8E3CiW4BDAXHT6tzAqVAtqT0Md6J
         EOHPcwCCyD+ktt2OHVMWYQCrZ1JPyqVYmyMqzh9fIOXwLnzZYKRom6G5szv70yXxpNIQ
         wFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692299266; x=1692904066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMu12uY6gJkjDImtxtXIvQYeY9JKWACT5srHRfVOHgM=;
        b=c4wU9Lz1d02B8ydq7O1z7Bk7P6GP/2wugpIaiz7l725dG6n1OGIA2RM3ep9f7dJPFr
         uDeo6lhwBH5s3soWwzZcpDeLJpVhTm6LQ6NZzp4o0yJs1MqScwI6/QrmMqGj7URnqMhG
         rWPZtbF+N2JeX8sIjeNXGemNcjYmyDTi4n0jqv5TcmGVBXpJpCmtttbhztPxcQyHMULp
         WQmjq0KIduSdMlhBPLwT9xqlwlhhLqh1fhEayOjY7C/n5dEm5F4+jjB08NhkWYTbyoqE
         W0RNM/L79VOIKxPKPpmWyNhMOi69AEOHJZtGPwcG+zsNUJM3yGag89YxwWgYMNvTRzbq
         1LUA==
X-Gm-Message-State: AOJu0YxbTL5KSHNMQtPtD4vujbTFc7dTpKPUJgm0IV3F8Yhw1qgJO5DZ
        lyXNDv2jtptxmjPt6FQWWPVRDKYeT9M=
X-Google-Smtp-Source: AGHT+IEVmkXYuO03DV+0uC23DSL9ehlGkQfYWv9Lcd3UY8cL3uQjAYy/b8tqjZHmcaC5jKLzK0uoew==
X-Received: by 2002:a05:6a00:f87:b0:688:4abb:f16f with SMTP id ct7-20020a056a000f8700b006884abbf16fmr525127pfb.6.1692299266325;
        Thu, 17 Aug 2023 12:07:46 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e51d:7e20:1b6c:6331? ([2001:df0:0:200c:e51d:7e20:1b6c:6331])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b0068709861cb6sm102588pfa.137.2023.08.17.12.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 12:07:45 -0700 (PDT)
Message-ID: <e332b0d4-0d4e-095d-1fee-1962223798bd@gmail.com>
Date:   Fri, 18 Aug 2023 07:07:39 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
Content-Language: en-US
To:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
 <F32F62FE-2A74-4648-8BF1-0D1A1E76309B@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <F32F62FE-2A74-4648-8BF1-0D1A1E76309B@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

On 17/08/23 22:27, Richard Z wrote:
> Nitpicking now, there is nothing classic about little endian as all 
> older computers were either big or mid endian.

Right, but IDE was introduced on little endian hardware.

Maybe 'IDE default byte order' would be more exact here.

> It is rather some rare ide host adapters like the Q40 one reversed the 
> byte order of 16bit words which was cheap and convenient in the 
> 1980-9ies but not interoperable with the large majority of other host 
> adapters resulting in a reversed byte/16bit order on disk.

True - installing an IDE disk from e.g. Atari on a Mac, Amiga or PC 
wasn't something you'd have antcipated at that time. Floppy disks were 
for data interchange.

Cheers,

     Michael

>
> Richard
