Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D651C41513
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 08:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242699AbjHPIHQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 04:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238566AbjHPIGo (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 04:06:44 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83325109
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 01:06:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso40135815ad.0
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692173203; x=1692778003;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOjbmf6d8nUMkbcgueABWZ84lDN/0uSqABjmJ+LLedM=;
        b=mRpcjqHc9b/5NRuBqqG9oRGymosLZ69naor5Vm6d1qntxi84CBvr5c6zOwTvlLFnDQ
         lqlVRFER6bebpjpS3iYCiv447kHm37n644Z7h6gILRNHvlbbIt3AxKxfLeaPFQqCesSO
         dN+55XZh8kpyTJ/aBWYL2XOpmblbB6wUDyDEcR/bvnzeui3OpFm7UI6jBniZW9B2/JHd
         9FRu7q6AhD4mzWBm8TEFVIdmXD4+sdsEUPKpa9gJxf7gMzym+c++UQ2LT+U6lG0ytPtB
         ikk/+5ZXh+i1GiRSICfhL48NoZY3DI1EcKl98t42C11teipIdt1Fnmh2ZbhHanhwvzPn
         F5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692173203; x=1692778003;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOjbmf6d8nUMkbcgueABWZ84lDN/0uSqABjmJ+LLedM=;
        b=Hua2NCghsTXAVExoTcmvrs2Zsr8uJ1xsnGtLgc0ktwexAfyYVnVAro8Kpi9YT8Vmd8
         VIO+EbmbJV11N0ZPgdb4xYIpyd7rhFLIgpp6l2TMftR2ZNPpiAVLf734Rfs+klxGrFuG
         DGjP7X2QP5GmWRgKaJsCkY8QUpFHqxyp2p5bUaCQqgNDHXigHMEnGLko/Tx4T7khmhiA
         5fdXBkqrfM6B2E2Ydb5Z8XqSVI5tVizit3X4u2WzXlw4wqZor0+MioylJ8pEm6itQXl6
         Oj+w+QK9Rprp07PB/OGmC/kucn6SSUItVZNU563vXeknN3Q7IreAWMkjbbUovhx8BEo8
         MVqQ==
X-Gm-Message-State: AOJu0YxdKo2dsiHbrfyJ1EmqNI/xjuFzuy5ad81tBAHhZSDxv4o+DDtZ
        N5L/hnFvUoh5vRM0M4qye809qyGVQpg=
X-Google-Smtp-Source: AGHT+IF+PsMNfTWUiNvZFSfEtmdghDZT0B2AAHJfkuirnpEA8X2E/AeluMP1NzmNvYaxIoT0zGNwCw==
X-Received: by 2002:a17:903:41c2:b0:1bc:6861:d746 with SMTP id u2-20020a17090341c200b001bc6861d746mr1318100ple.58.1692173202832;
        Wed, 16 Aug 2023 01:06:42 -0700 (PDT)
Received: from [10.1.1.24] (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001b567bbe82dsm12496968plb.150.2023.08.16.01.06.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 01:06:42 -0700 (PDT)
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
To:     Finn Thain <fthain@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com>
 <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org>
 <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com>
 <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
 <44bc64de-8463-5e43-7335-8ea1ffc07cee@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <653c4cef-d147-c66b-391a-7527e68df947@gmail.com>
Date:   Wed, 16 Aug 2023 20:06:37 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <44bc64de-8463-5e43-7335-8ea1ffc07cee@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 16.08.2023 um 19:37 schrieb Finn Thain:
> On Wed, 16 Aug 2023, Finn Thain wrote:
>
>> Given it's a platform device that's only ever instantiated once, you
>> could just use the module-scope variable rather than device-scope.
>>
>
> I see that atari instantiates one platform device but q40 actually
> instantiates two ata ports, and each port has two drives. So it appears
> the module parameter would need to have 4 bits.

That's what I thought.

>
> You could set ap->private_data to pdev. Then pata_falcon_data_xfer() can
> use pdev->id and sdev_target->id to find the relevant bit in the module
> parameter.

Instead of doing that for each call to pata_falcon_data_xfer(), I'd 
rather find the relevant bits from the module parameter at device probe 
time, and set the device-scope bit mask accordingly.

Cheers,

	Michael


