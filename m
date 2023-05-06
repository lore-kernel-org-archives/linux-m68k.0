Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB64C77B7D
	for <linux-m68k@archiver.kernel.org>; Sat,  6 May 2023 02:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjEFCbC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 May 2023 22:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjEFCbB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 May 2023 22:31:01 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8C7212F
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 May 2023 19:31:00 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115e652eeso23642935b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 May 2023 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683340260; x=1685932260;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUVro5kRGZiWRZpGl4sfAIdb+oxRTXd/Q5UpjbC4dm8=;
        b=p/Zxx5NRdLS/3l3BzBHSJqHwlMLFgrkdpBRsyUm4HKMufQj/7elrvimgjPXEINWQBF
         XwFf6JZdOmb30TSv0vK5aWHzPVbcNR1hy44KxCFozdAK37zRSc6cgSMsSPF+Yjy/AmDO
         vLVvtVGjwBe8WudxFDUKcbeH3wk/CQ0ED/Rw1w8u+BDTDGqnovDzO2XTSOthJLNcD1jd
         8pArUZZ0vtxC9zTqlgI0RBA4H0hf/oIXgO9kQk7QYRqhL4M6IgdwEW2LBw/k1mcLL7/N
         7lCnVXQc7xun4KL5l4hxlA37GKRwMAnssWvsQbB9zFvU4TsC0vMeT3N+BMR90n4ovaoa
         fvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683340260; x=1685932260;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bUVro5kRGZiWRZpGl4sfAIdb+oxRTXd/Q5UpjbC4dm8=;
        b=QQIXFUyHTe9rPqfS5V1q7AYIQGy5MXSAgac9w4Kp6OHlphS5unlqi/8ldofkRxAaTt
         pOpULb9N1/iVf/kHs3dDuHO4nF0P4FwfYCjckh8l9Po3AGblRebYmVPVkIYNHaRUcZh6
         I5N+4/X+mdK/Rvt+TxArSb2JNZs5VoLllgow72WArGCeG7U6LzdvyCxiPrfB/qP5EZu4
         ItcuTNodx/IBoFK5rUQ5ma68PQQXX2okDAU55Q20vNvVC4FEYo/lcLBD1vwa70K1ZXQr
         y/Rf5WN2zUPKR0m1MHHk6n6PbU0nhviK8yac9bHpHKQSNCjK64kY2nJvvXlZkRgbSrO8
         v8+Q==
X-Gm-Message-State: AC+VfDwQsvfXrl2ApTz2uM72Sw/CoEtsEMk1vcncksVmdhUAhDwQnHZf
        5Hs98ITiYHmgg/NFf5bwNliw1L+T+L0=
X-Google-Smtp-Source: ACHHUZ6ReDT+Q8qO5M9oSlfte6sSLBTohgz0fGvpAUz6pntXAcrgMqCS99XhamNlC1ZwETY/4Jyw5A==
X-Received: by 2002:a05:6a20:3953:b0:dc:925f:62f1 with SMTP id r19-20020a056a20395300b000dc925f62f1mr4396454pzg.6.1683340259803;
        Fri, 05 May 2023 19:30:59 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b0063b7331a4easm2165664pfn.154.2023.05.05.19.30.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 May 2023 19:30:59 -0700 (PDT)
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
 <e381cbf7-ac16-6ba8-cc47-90504ccbdaf3@linux-m68k.org>
 <77d5c271-77d7-0959-93f5-6731dbea7bae@gmail.com>
 <314a2206-6880-e8cb-5add-9f03284fd0ad@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <54176463-0326-20c6-64c7-a5de17105815@gmail.com>
Date:   Sat, 6 May 2023 14:30:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <314a2206-6880-e8cb-5add-9f03284fd0ad@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 06.05.2023 um 14:11 schrieb Finn Thain:
> On Sat, 6 May 2023, Michael Schmitz wrote:
>
>>
>> Yes, I'd seen the OOM killer kick in before at least once (no soft lockup).
>
> I wonder whether your .config has the same settings as mine...
>
> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=y
> CONFIG_PANIC_ON_OOPS_VALUE=1
> CONFIG_PANIC_TIMEOUT=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=60
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs

No, it doesn't:

# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_TEST_LOCKUP is not set

I can add your debug settings if it doesn't add too much bloat.

Cheers,

	Michael

