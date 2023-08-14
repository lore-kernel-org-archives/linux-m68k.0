Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11DFC41513
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 20:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjHNUZe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbjHNUZM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 16:25:12 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB8C1722
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:25:10 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so74298461fa.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044708; x=1692649508;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfI6GJclk09k7XX5U4EmWRoL/ptrOeBMiZQnYR4iIxo=;
        b=LjBh0ZAiwkAhWyl/qt9scCqFWhhAmEnSNVqd3tISN84WL/z3epndcg3x2h4r2qpSp7
         h3JMODJW7zepnVfLikD5XIq3cFlGS9bOON37S56wxIH1m3n+QFPq55oQc+oazebCJ2c+
         C1z4PvLLTHicgRJgn7QiFpFBqpyuF9AYBbmRgk/Kzvob+eQVZBq8jxGOC7xhdRcH3rKl
         u7RF/Cdn1WK9E3RxGZ/Ygezifdjo8rBhZ8s2TfiwaKgdEmD1njjd3V3AziE3ii0r87Il
         ou4QifRlDmcIWqQsJSOHmi5ZppjiEgtSJ94sexhdwSBi8cr/WuO09nvfaJCHFXFwgs+A
         ojLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044708; x=1692649508;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UfI6GJclk09k7XX5U4EmWRoL/ptrOeBMiZQnYR4iIxo=;
        b=HgJ1wIATdAvef0pA1nNp9bL9gaGJ4V2Acg3scHHV+qyo4vmpZKsTOc0hlGL8MFrNUV
         ohp8aPZjuPJkxjvGvwXrpJyHxFOwMqGQWMXStBJEKidHy0dDfhhR5YeddLqjFIATPBPH
         P51obB53CIFvIbIHOy3mWWpXH07/Z5KvwXbcumJIkh7iFsTrZj5x+M0HrOeAwSn+T4IT
         ATfb01twIUio5Nl7abbQdZqGWRKHHGAxW0F7iB9pZ57M/fKq0vTZ8FtmAg7zH4SNDs1z
         QlN/MG//5GKzxK7zRhCY2g6HO9x+KBdFZpAyO/76NcynWlIT2b0JHQrOeOXGg2YKuZJ/
         TuWw==
X-Gm-Message-State: AOJu0Yyd+l0G+lNJDqMCoc9yBN1lRyXaq1hM8JBnqCdh8myUqK2nnnqK
        e5PTk0nwOgczisasjr49dRY=
X-Google-Smtp-Source: AGHT+IGN8L2UASkXNaZTUV8sH/wV84/GaNQ5e5ouq5btsNIcjhaWbH37pWrjrPAZlNa5m0r6pTpQDg==
X-Received: by 2002:a2e:8009:0:b0:2b9:ead7:4534 with SMTP id j9-20020a2e8009000000b002b9ead74534mr7995253ljg.47.1692044708081;
        Mon, 14 Aug 2023 13:25:08 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:3038:205:fb74:4651:e573:5ba9:fd3])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906b20900b00992afee724bsm6003489ejz.76.2023.08.14.13.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 13:25:07 -0700 (PDT)
Sender: "Richard Z." <richard.zz.ba@gmail.com>
Date:   Mon, 14 Aug 2023 20:24:36 +0000
From:   Richard Z <rz@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>,
        William R Sowerbutts <will@sowerbutts.com>
CC:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
In-Reply-To: <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com> <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <ZNoNlC5fhztMFBAk@sowerbutts.com> <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
Message-ID: <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 14, 2023 8:15:53 PM UTC, Michael Schmitz <schmitzmic@gmail=2Ecom=
> wrote:
>Hi William,
>
>On 14/08/23 23:18, William R Sowerbutts wrote:
>> On Mon, Aug 14, 2023 at 10:54:54AM +1200, Michael Schmitz wrote:
>>> On 14/08/23 10:24, William R Sowerbutts wrote:
>>>> * 6=2E4=2E10 + Michael's RFC patch -- IDE fails (no crash, but "Bad I=
O
>>>> access")
>>> That might be fixed by my second RFC patch, just gone out today=2E
>> 6=2E4=2E10 + your "RFC v2" patch boots without the "Bad IO access" erro=
rs!
>>=20
>> Your patch looks correct to me=2E
>Thanks - I'll look into whether we can use CONFIG_HAS_IOPORT_MAP without =
any ill effects now (or wheher our own ioport_map() must be modified to add=
 the IO token on Q40)=2E
>>=20
>>> This one still byte-swaps the data from disk though=2E I understood th=
at was
>>> always the case for Q40, but I may have been mistaken there=2E
>> It is indeed returning byte-swapped data=2E  This is easily fixed, I'm =
using
>> the attached patch=2E
>>=20
>>>> For my 6=2E4 patch I enabled byte swapping in the pata_falcon_data_xf=
er()
>>>> function -- this allows me to use an IDE drive with everything in the
>>>> normal/compatible byte ordering, which makes life much easier=2E I as=
sume this
>>>> is the intended behaviour=2E
>>> That would be the sane behaviour, but the designers of both the Falcon=
 and
>>> apparently the TiVo decided otherwise, wired up the IDE data bus byte-=
swapped
>>> and saved the byteswap operations in the driver=2E I'm unsure how this=
 was
>>> intended to work on Q40=2E
>> The Q40 does NOT have hardware to reverse the byte-swapping=2E  The CPU=
 has to
>> byte-swap data if you want to use disks with standard/compatible data=
=2E
>I understand that - the issue was (and is) whether byte swapping by CPU i=
s required in order to support legacy disks, or not=2E
>>=20
>>> Now the question is how data on legacy Q40 IDE disks have been stored=
=2E If
>>> it's byte-swapped, we'd better keep that byte order in the current dri=
ver
>>> (meaning your changes to pata_falcon_data_xfer() won't be needed, but =
you
>>> would have to swap back data on your disk)=2E If it's always been in P=
C
>>> compatible byte order, all data (not just the identify data) must be s=
wapped=2E
>>>=20
>>> I'd like to have Richard's opinion on this (or hear from any other for=
mer Q40
>>> user)=2E
>> I have learned that the "standard" firmware for the Q40, SMSQ/E, does n=
ot
>> byte-swap data (it also uses an obscure partition scheme and filesystem=
)=2E
>Thanks, that's what I was worried about=2E
>> Personally, I am strongly in favour of Linux on the Q40 using standard
>> byte-order disks that are compatible with other machines=2E This feels =
like the
>> right thing to do and it is what I think most users would expect=2E
>Yes, but =2E=2E=2E
>>=20
>> Users (if there are any!) with legacy byte-swapped disks can always use=
 the
>> standard tools to byte swap them into the correct, compatible format=2E
>
>That would make these disks impossible to use by the default firmware tho=
ugh=2E
>
>As ugly as it may be, I think we'll need a module parameter (or Q40 boot =
option) to switch the driver to legacy disk mode here=2E That could be alwa=
ys set for Falcon, and set on demand for Q40 so we save the MACH_IS_Q40 tes=
t on each data transfer=2E

Well ideally it would be a per-device option=2E This would help the ide SD=
 cards greatly and people could byte swap their devices one at a time=2E

Richard=20
