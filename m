Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F75C001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 20:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbjHNUZf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjHNUZW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 16:25:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC48E5B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:25:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so70183191fa.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044719; x=1692649519;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ/R2+vrbhzoj4war6gAw/uxig4UyKLAPMEG3lGcDP4=;
        b=rDvYXl4tGLU4Xuy4+EuV5nPwe/8JOJGh+7tQ1+TU7IU29TFG4RJYodjEYx8AYDWt/k
         ai7S7rI/CLvic5BANWu7rO89UJiu25FslwAJUKc2vL0fatRWdN8eGncz8glHDxMxaFuq
         YuQRvGw8X6hPuMUeec+pi12P4vfAHr1HFAR+Mbgj6ri7ob/jtcoJN3iw9fiIM0lunfMV
         JLxTiM/VENwSW/RdZeR9O276emwnEDV7jEghX7oeCIfyXLun0nw1FxvZtYoDtIf0Lftj
         ZxVVnx/QqafH2ua6sKshrxBGMnRsDkXzgxHuLQZcSZt93HrfMB/H4L0OTjZEfrHrs5ip
         1zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044719; x=1692649519;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQ/R2+vrbhzoj4war6gAw/uxig4UyKLAPMEG3lGcDP4=;
        b=NlAajKq8EUBU8sTYeJFr4vvLEulnERgEX1+uRcEdBlT1eObclIXYCIvprgW7imfYu6
         I2Y5Ul7gV5QDJE8X40ph6RyXFjwdE02j0JEJxMDmf1gzcuXSIXB81gPnUhEBOfK5ULrq
         052vsqGsQfObH5LK+EjA1TODzguCc07ehnnnjw+LE4V7iltRS7/X7XfzQvy8HzGHDlp3
         0e6JinAs1exc9UcLBaS5h+IQ29KSb1WsHuYmuvoROBJgbSl+BWlW3PqcKBcg2ucPen/5
         8r4kXSTQdmCoZhhBMcNn2SMKBLL4rehJmZByUcLtIY1vyg850Bb6hopTrLG3IEOlLitH
         4ViA==
X-Gm-Message-State: AOJu0YwVs6xegk2OXx2Na3XovDu6LmW0hLJZUUL426hDc2cdJ+Fy4C2/
        EkbOGfrmvATNjJbY9CbyhFw=
X-Google-Smtp-Source: AGHT+IGUa6Fyxyhl8IML9FPT5W4BdVwwxq+uIFxXM4CEnv//DS3jiWF+rLcfsjNsSJScwZgxm6PT3g==
X-Received: by 2002:a2e:99d2:0:b0:2b6:a5df:c7fb with SMTP id l18-20020a2e99d2000000b002b6a5dfc7fbmr7237291ljj.26.1692044719281;
        Mon, 14 Aug 2023 13:25:19 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:3038:205:fb74:4651:e573:5ba9:fd3])
        by smtp.gmail.com with ESMTPSA id mf18-20020a170906cb9200b0099d9dee8108sm2599512ejb.149.2023.08.14.13.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 13:25:19 -0700 (PDT)
Sender: "Richard Z." <richard.zz.ba@gmail.com>
Date:   Mon, 14 Aug 2023 20:19:03 +0000
From:   Richard Z <rz@linux-m68k.org>
To:     William R Sowerbutts <will@sowerbutts.com>,
        Michael Schmitz <schmitzmic@gmail.com>
CC:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
In-Reply-To: <ZNoNlC5fhztMFBAk@sowerbutts.com>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com> <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <ZNoNlC5fhztMFBAk@sowerbutts.com>
Message-ID: <2B76FA74-7F6E-4790-A9BF-5308B682A3ED@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 14, 2023 7:52:18 PM UTC, Richard Z <rz@linux-m68k=2Eorg> wrote:
>
>
>On August 14, 2023 11:18:44 AM UTC, William R Sowerbutts <will@sowerbutts=
=2Ecom> wrote:
>>On Mon, Aug 14, 2023 at 10:54:54AM +1200, Michael Schmitz wrote:
>>>On 14/08/23 10:24, William R Sowerbutts wrote:
>>>> * 6=2E4=2E10 + Michael's RFC patch -- IDE fails (no crash, but "Bad I=
O=20
>>>> access")
>>>
>>>That might be fixed by my second RFC patch, just gone out today=2E
>>
>>6=2E4=2E10 + your "RFC v2" patch boots without the "Bad IO access" error=
s!
>>
>>Your patch looks correct to me=2E
>>
>>>This one still byte-swaps the data from disk though=2E I understood tha=
t was
>>>always the case for Q40, but I may have been mistaken there=2E
>>
>>It is indeed returning byte-swapped data=2E  This is easily fixed, I'm u=
sing
>>the attached patch=2E
>>
>>>> For my 6=2E4 patch I enabled byte swapping in the pata_falcon_data_xf=
er()
>>>> function -- this allows me to use an IDE drive with everything in the
>>>> normal/compatible byte ordering, which makes life much easier=2E I as=
sume this
>>>> is the intended behaviour=2E
>>>That would be the sane behaviour, but the designers of both the Falcon =
and
>>>apparently the TiVo decided otherwise, wired up the IDE data bus byte-s=
wapped
>>>and saved the byteswap operations in the driver=2E I'm unsure how this =
was
>>>intended to work on Q40=2E
>>
>>The Q40 does NOT have hardware to reverse the byte-swapping=2E  The CPU =
has to=20
>>byte-swap data if you want to use disks with standard/compatible data=2E
>>
>>>Now the question is how data on legacy Q40 IDE disks have been stored=
=2E If
>>>it's byte-swapped, we'd better keep that byte order in the current driv=
er
>>>(meaning your changes to pata_falcon_data_xfer() won't be needed, but y=
ou
>>>would have to swap back data on your disk)=2E If it's always been in PC
>>>compatible byte order, all data (not just the identify data) must be sw=
apped=2E
>>>
>>>I'd like to have Richard's opinion on this (or hear from any other form=
er Q40
>>>user)=2E
>>
>>I have learned that the "standard" firmware for the Q40, SMSQ/E, does no=
t=20
>>byte-swap data (it also uses an obscure partition scheme and filesystem)=
=2E

It doesn't use any obscure partition scheme, just the Atari partition tabl=
e=2E It used to require some special magic word but the kernel code and all=
 Linux tools would work just like if it was a normal Atari partition table=
=2E I have only modified atari-fdisik to add that magic number if it wasn't=
 there yet to make original firmware happy=2E


>>
>>Personally, I am strongly in favour of Linux on the Q40 using standard=
=20
>>byte-order disks that are compatible with other machines=2E This feels l=
ike the=20
>>right thing to do and it is what I think most users would expect=2E
>>
>>Users (if there are any!) with legacy byte-swapped disks can always use =
the=20
>>standard tools to byte swap them into the correct, compatible format=2E

Most users that I know have a dual boot system so this won't work until th=
e other available OSes are modified to support byte swapping=2E This would =
be doable but the problem is for quite some time the kernel would have to u=
nderstand both variants=2E Think of it, if you want to boot an older kernel=
 you don't want to byteswap your whole hard disk back and forth every time =
when testing an older or newer kernel=2E Also, I would like to see data on =
the speed impact of the byte swapping, making the old hardware even 5% slow=
er isn't something I would be enthusiastic about and my guess is it would m=
ore than that=2E

Other than that it would be nice to use the "normal" byte order because ex=
changeable devices became much more common, I do even have an SD card reade=
r on the IDE port=2E


Richard=20
