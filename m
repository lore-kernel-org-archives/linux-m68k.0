Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B2AEB64DD
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 03:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjHODdw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 23:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbjHODb2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 23:31:28 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71131BC5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 20:30:51 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bdeb022738so8304145ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692070251; x=1692675051;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtM6npHjX4nOZ3RGGuieWXVHzoKq6I8x2EisCawDjTs=;
        b=NlRKRktDJ3/+yxdNZjOCntZhgvEscbODW9o1XKTe0JY7Ug13XsQEPNf52qKHPwIP5X
         DDiUU8kqRRuD70AZorUk2nHL5hxxRS3NCL0btiyZQ2Bqqkj0xeIl+karKmORVV5Fp0VU
         FyfbVbOjrpfPw7PmdCSYmzQXc1k7QntIXXljIt+TzKjNjqmaO4rjXpQ61Oq2TXPe0xlU
         baKjXRXtb5M5kSlLB4bW56FWQGLs1qc4G+cAiWWjhXA+aup0aJejBtF/irWV3jyjQnw8
         5oLV6NwJ2DGFm6eDfCcC6RlFl4IYRUVr34tbok+/Ys+OsoabPRzfnbsCQC2UI3LIm4JF
         rfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692070251; x=1692675051;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dtM6npHjX4nOZ3RGGuieWXVHzoKq6I8x2EisCawDjTs=;
        b=Ei6ENo7pMMHd6PxdB/OnKArrIVwZYOIoMMyTuBBsBHsJbnTfCeNNeO7Ap+j4kKraEB
         VpCcwibvWEFQq77RLkFHR3W/5sFJHH5yfnHvawzBdHKQkdL2YoRoYYXter/4cEEZHJii
         20wmStDNRhAequtbXtcWeOC+C1Y07jIRmcB2UPk0UomqvyrC3l170WWpJrDTtaksV9Th
         ZrFFuwaPsxIaNESKZBTAUBWsZ37g7FpoXPzEDRk0KewPk7iP4HEBONQFDbBkqIo6zyi8
         Me9oi8kLsUN48eLLZpti8E0SH4gIXQwxiOGDrOX8KpydyzybI5a4Tuj/LS+k3BTUZWNX
         4mEw==
X-Gm-Message-State: AOJu0Yyd7n61Y8+6/+YgxGji9N9jem9TCe2QehCO9VZ13Ii8Xu8yMj1/
        O20XL5f/G/8FQTpYDWhBbZO6Foi56Uw=
X-Google-Smtp-Source: AGHT+IF9vRtLADM4yrINFbufLgfk3VLMtJQEsav4fcuHzHhr5qqwv5UGJtz5PhuAfKOeAVILJ3xrfw==
X-Received: by 2002:a17:902:f542:b0:1b6:b703:36f8 with SMTP id h2-20020a170902f54200b001b6b70336f8mr1228401plf.25.1692070250779;
        Mon, 14 Aug 2023 20:30:50 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902b60e00b001bd41b70b65sm10221617pls.49.2023.08.14.20.30.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Aug 2023 20:30:50 -0700 (PDT)
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
 <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
 <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
 <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com>
Date:   Tue, 15 Aug 2023 15:30:43 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

Am 15.08.2023 um 15:05 schrieb Richard Z:
>
>
> On August 14, 2023 11:31:36 PM UTC, Finn Thain <fthain@linux-m68k.org> wrote:
>>
>> On Mon, 14 Aug 2023, Richard Z wrote:
>>
>>>
>>> Well ideally it would be a per-device option. This would help the ide SD
>>> cards greatly and people could byte swap their devices one at a time.
>>>
>>
>> Would a byte-swapping IDE cable help, e.g. if the same flash memory card
>> was moved from an IDE interface to a SCSI interface (on the same Q40)?
>
> The Q40 doesn't have SCSI. The only issue is exchanging devices with other computers.

You could plug one of the old ISA SCSI host adapters into an ISA slot 
(assuming there's more than one).

> Byteswapping cable would help the performance but will also swap the ide ident string so the kernel must take that into account.

That's what pata_falcon does already - 'swap' is true by default to make 
that happen, and gets set to false if data are transfered.

>
>>
>> Perhaps we should not worry too much about unusual use-cases during what
>> would be a temporary transition period...
>
>
> You are right, there are sure many other ways to solve the issue with SD cards.
>
>>> Think of it, if you want to boot an older kernel you don't want to
>>> byteswap your whole hard disk back and forth every time when testing an
>>> older or newer kernel.
>>
>> Probably not an issue for end-users, as they are more likely to boot an
>> old userland together with an old kernel. But potentially an issue for
>> kernel developers who need to mix new kernels with old userland. However,
>> kernel developers can use out-of-tree code to help with their testing, as
>> usual.
>
> Just don't think this transition is worth it if it will make everything more complicated and noticeably slower.

The problem here is that we'd already done the transition to libata / 
pata_falcon and the old IDE code has been removed. Q40 IDE was broken in 
the process.

We need to fix pata_falcon for Q40, and with data on William's disk in 
little endian order, but data on other users' disks in big endian order, 
we need to come up with a way to support both for now.

Cheers,

	Michael

>
> Richard
>
