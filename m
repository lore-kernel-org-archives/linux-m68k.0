Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E981CC64E8A
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Nov 2020 02:43:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B246820809
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Nov 2020 02:43:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTnnsWFL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgK3CnQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 29 Nov 2020 21:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgK3CnP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 29 Nov 2020 21:43:15 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDADC0613D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Nov 2020 18:42:35 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id j13so427480pjz.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Nov 2020 18:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Jpj5jSTmJl8vpk7ENOR+YA6/u74aMuNtUP1eN9VuxG4=;
        b=sTnnsWFLsSxngibuRt5q3iA8pKAxFmj4mLxEoXG4pIF7uX6bMIgeDHqPCyLIvZ4k5g
         2gUio7roq3+gVL9ixwDWjIl/R4pr/I9DmaM2jwBRqvKBoMuO5xu90+8nWNvqOBMpbqmE
         Aa5G/zwLz65EhSWu3tgFVRv77bSQv/nKmzCwKADD7gf+vI2PZPIEAdQ1a8AiNWMm3DTn
         sauSRRmI6uHDoiWqCSNQyXN4KtUxq24SuKffT+OK8l8c/gVFpb8rPAvhdljrSM9158xh
         Mx7kLeU6oiI4/BspXPOnnICoT3CuQC9bivsxN4HQYp2rF1cq0zT2t7OY02xu5LdKSkB2
         D68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Jpj5jSTmJl8vpk7ENOR+YA6/u74aMuNtUP1eN9VuxG4=;
        b=Lul1exfNL/yWZbAwo9+YHIkzF4EGOdaH8dpEvDiH9p7Ro6bCyjNihrRnTErCIfc3kH
         Nub0GtsYPxewtu60z0o6yNrOpJQdRC6nhnqDWsoRVLi4NMcd81NoFRkw0iQ3bNx5x/Wt
         Aum3Fr7b1pNLDUBA4Dx92yToPf1MMvQzbOHD8PdbXGnrl7p/12xTHwelGSLC8BZZSXcK
         Zu6a9oi2jKP4nDwfJhpIgFigwad78m/0Wr+Tpj6qxj4udFURlDy+Ovz+g5jGRTe7vODX
         sE6t7euV130kht2A4vXDiFwdWjN7KJFn+R6CndRnj2Jbm7KJz0pv/ipta0jnH8bL4U9b
         6qJA==
X-Gm-Message-State: AOAM533s55v0QBmh9FLeodt+pMuyZ5rXScb2lLg0wV2SyV2k+uFofKnR
        OuUihr0+UON5JhAqZG6COrA=
X-Google-Smtp-Source: ABdhPJyXrz2UZ13v2z21kEeE/d5cl19jWjLV5ISCZnRxpjc5jURV9nePioDbu9l/0Lj8CA9QwLqTQg==
X-Received: by 2002:a17:90b:3505:: with SMTP id ls5mr23864384pjb.55.1606704155066;
        Sun, 29 Nov 2020 18:42:35 -0800 (PST)
Received: from [192.168.1.101] (122-58-181-142-adsl.sparkbb.co.nz. [122.58.181.142])
        by smtp.gmail.com with ESMTPSA id c66sm5187839pfa.0.2020.11.29.18.42.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Nov 2020 18:42:34 -0800 (PST)
Subject: Re: [PATCH 12/14] scsi: NCR5380: Remove in_interrupt().
To:     Finn Thain <fthain@telegraphics.com.au>
References: <20201126132952.2287996-1-bigeasy@linutronix.de>
 <20201126132952.2287996-13-bigeasy@linutronix.de>
 <alpine.LNX.2.23.453.2011271524140.15@nippy.intranet>
 <alpine.LNX.2.23.453.2011280802170.6@nippy.intranet>
 <alpine.LNX.2.23.453.2011280827270.14@nippy.intranet>
 <3bf3baef-ea46-a9c3-10e9-7705650d07a6@gmail.com>
 <alpine.LNX.2.23.453.2011301115360.6@nippy.intranet>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-scsi@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
        Hannes Reinecke <hare@kernel.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        John Garry <john.garry@huawei.com>,
        linux-m68k@lists.linux-m68k.org,
        Manish Rangankar <mrangankar@marvell.com>,
        MPT-FusionLinux.pdl@broadcom.com,
        Nilesh Javali <njavali@marvell.com>,
        Sathya Prakash <sathya.prakash@broadcom.com>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        Vikram Auradkar <auradkar@google.com>,
        Xiang Chen <chenxiang66@hisilicon.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ahmed S . Darwish" <a.darwish@linutronix.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <81f7776f-2faa-da8b-9941-6490fe606370@gmail.com>
Date:   Mon, 30 Nov 2020 15:42:07 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.23.453.2011301115360.6@nippy.intranet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 30.11.2020 um 13:15 schrieb Finn Thain:
> On Sun, 29 Nov 2020, Michael Schmitz wrote:
>
>> Am 28.11.20 um 10:48 schrieb Finn Thain:
>>> On Sat, 28 Nov 2020, Finn Thain wrote:
>>>
>>>> diff --git a/drivers/scsi/NCR5380.c b/drivers/scsi/NCR5380.c
>>>> index d654a6cc4162..739def70cffb 100644
>>>> --- a/drivers/scsi/NCR5380.c
>>>> +++ b/drivers/scsi/NCR5380.c
>>>> @@ -223,7 +223,10 @@ static int NCR5380_poll_politely2(struct NCR5380_hostdata *hostdata,
>>>>  		cpu_relax();
>>>>  	} while (n--);
>>>>
>>>> -	if (irqs_disabled() || in_interrupt())
>>>> +	/* We can't sleep when local irqs are disabled and callers ensure
>>>> +	 * that local irqs are disabled whenever we can't sleep.
>>>> +	 */
>>>> +	if (irqs_disabled())
>>>>  		return -ETIMEDOUT;
>>>>
>>>>  	/* Repeatedly sleep for 1 ms until deadline */
>>>>
>>> Michael, Andreas, would you please confirm that this is workable on
>>> Atari? The driver could sleep when IPL == 2 because
>>> arch_irqs_disabled_flags() would return false (on Atari). I'm
>>> wondering whether that would deadlock.
>>
>> Pretty sure this would deadlock when in interrupt context here.
>
> When in interrupt context, irqs_disabled() is true due to
> spinlock_irqsave/restore() in NCR5380_intr().

OK.

> My question was really about what would happen if we sleep with IPL == 2.

All relevant system interrupts are at higher priority (5 or 6). Both 
timer and SCSI / DMA completion interrupt in particular are at IPL 6 and 
won't be blocked when sleeping with IPL == 2. That's what I meant by 
'IPL 2 is perfectly OK' below.

>> Otherwise, IPL 2 is perfectly OK (which is why
>> arch_irqs_disabled_flags() returns false in that case).
>>
>> If you want to be 100% certain, I can give this one a spin.
>>
>
> Please only test it if you think it will work.

With your explanation above, I'm now quite certain your patch will work. 
I've not seen deadlocks in softirq context since you rewrote the driver 
so it will no more sleep waiting for the ST-DMA lock.

Cheers,

	Michael
