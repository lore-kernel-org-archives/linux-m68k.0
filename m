Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE3CC04A94
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 20:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjHNUQa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjHNUQD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 16:16:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC8F10CE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:16:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-56401f1da3dso2723857a12.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044161; x=1692648961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csn9P+q7Y1tjOykzGGDOeya/RrOXqZOo/sd2FKxadZs=;
        b=VoJjPlMuiaydPeC1es1xg4QznHkUhtFvv9t82XoLP9EREA1jOGymfU8h4TC8wbVnkd
         CgP+b3Nah8QGnvkAwRlvjdmT6bG9kVijlq2UbmKXsJ/9a/tNqmMrDlDyV85+S4X+2L6w
         Tyn+2I2pMrIUNFlbKRy0NeGTAvbWDu9vauQv/vjX2zgtvtUbkmSSMhnDwqWmcfIKBFUS
         4yWYLs18guoFWXWrd/AyAluDi99u323MIYmnFtn1gjmtQCTleZao5Yg4qeXc3oXAaGjq
         LuK2FsmiF515QBbkawgbDM+wLfKJSiqORRfznJl4F/NT7Z+rV1VKzoEeBwk1MMzD2eFE
         QAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044161; x=1692648961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csn9P+q7Y1tjOykzGGDOeya/RrOXqZOo/sd2FKxadZs=;
        b=cq9iZUX48ZnGHlBVmDkBedGGpX6cqMsIFudGVFGZv6VHcT44R9jP9GeAfMsAsUpfgG
         qdKFlvnIYyt43LysVGDPoYBevYed8nl9Pgszz/mMjgg3/Cf5l3PFTGZJ37iKQm9ME8V6
         oQQwPGxqhgfL57jPwLd/5fJDjpYFMwR9Yv8Qrzy+KPe9sBd6iKoP0vcBTYAIwS6lRn5t
         dUzJh3mCC95/1OhBxbgMzJ4+0buARrFeZGfXKVF1p04J4xw5UcxKZeROTWv/UPdDbrl9
         t3OO7CoKU38i4HJDsWeY3/7xOPLxP2AOeepx1VTJF9hiYLk7BhR+Ln5sNBu1kdE9NXiG
         7Lcg==
X-Gm-Message-State: AOJu0Yx1ngPkcEkdUzxse65X40qL5rgvBqzPMUlp2WLo+T12dFqkNsr7
        XEQNX2ozA1c277HZHgxw/v8=
X-Google-Smtp-Source: AGHT+IEK8uQK1C1uLVEnT3/Fy0SQ06V213Q8/cZ2aMSn4sTMap+zLf8iuD4f+zw5fxp5DtOJbqyCkQ==
X-Received: by 2002:a17:90a:7481:b0:268:fc26:73a9 with SMTP id p1-20020a17090a748100b00268fc2673a9mr7262778pjk.40.1692044160678;
        Mon, 14 Aug 2023 13:16:00 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:958a:19ee:81a6:dbc7? ([2001:df0:0:200c:958a:19ee:81a6:dbc7])
        by smtp.gmail.com with ESMTPSA id d22-20020a17090ad3d600b00263f40cf83esm10260700pjw.47.2023.08.14.13.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 13:16:00 -0700 (PDT)
Message-ID: <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
Date:   Tue, 15 Aug 2023 08:15:53 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
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
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZNoNlC5fhztMFBAk@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi William,

On 14/08/23 23:18, William R Sowerbutts wrote:
> On Mon, Aug 14, 2023 at 10:54:54AM +1200, Michael Schmitz wrote:
>> On 14/08/23 10:24, William R Sowerbutts wrote:
>>> * 6.4.10 + Michael's RFC patch -- IDE fails (no crash, but "Bad IO
>>> access")
>> That might be fixed by my second RFC patch, just gone out today.
> 6.4.10 + your "RFC v2" patch boots without the "Bad IO access" errors!
>
> Your patch looks correct to me.
Thanks - I'll look into whether we can use CONFIG_HAS_IOPORT_MAP without 
any ill effects now (or wheher our own ioport_map() must be modified to 
add the IO token on Q40).
>
>> This one still byte-swaps the data from disk though. I understood that was
>> always the case for Q40, but I may have been mistaken there.
> It is indeed returning byte-swapped data.  This is easily fixed, I'm using
> the attached patch.
>
>>> For my 6.4 patch I enabled byte swapping in the pata_falcon_data_xfer()
>>> function -- this allows me to use an IDE drive with everything in the
>>> normal/compatible byte ordering, which makes life much easier. I assume this
>>> is the intended behaviour.
>> That would be the sane behaviour, but the designers of both the Falcon and
>> apparently the TiVo decided otherwise, wired up the IDE data bus byte-swapped
>> and saved the byteswap operations in the driver. I'm unsure how this was
>> intended to work on Q40.
> The Q40 does NOT have hardware to reverse the byte-swapping.  The CPU has to
> byte-swap data if you want to use disks with standard/compatible data.
I understand that - the issue was (and is) whether byte swapping by CPU 
is required in order to support legacy disks, or not.
>
>> Now the question is how data on legacy Q40 IDE disks have been stored. If
>> it's byte-swapped, we'd better keep that byte order in the current driver
>> (meaning your changes to pata_falcon_data_xfer() won't be needed, but you
>> would have to swap back data on your disk). If it's always been in PC
>> compatible byte order, all data (not just the identify data) must be swapped.
>>
>> I'd like to have Richard's opinion on this (or hear from any other former Q40
>> user).
> I have learned that the "standard" firmware for the Q40, SMSQ/E, does not
> byte-swap data (it also uses an obscure partition scheme and filesystem).
Thanks, that's what I was worried about.
> Personally, I am strongly in favour of Linux on the Q40 using standard
> byte-order disks that are compatible with other machines. This feels like the
> right thing to do and it is what I think most users would expect.
Yes, but ...
>
> Users (if there are any!) with legacy byte-swapped disks can always use the
> standard tools to byte swap them into the correct, compatible format.

That would make these disks impossible to use by the default firmware 
though.

As ugly as it may be, I think we'll need a module parameter (or Q40 boot 
option) to switch the driver to legacy disk mode here. That could be 
always set for Falcon, and set on demand for Q40 so we save the 
MACH_IS_Q40 test on each data transfer.

Cheers,

     Michael

>
> Thanks
>
> Will
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
