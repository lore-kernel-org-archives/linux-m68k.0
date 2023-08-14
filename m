Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70474EB64DD
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 21:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjHNVWn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 17:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbjHNVW2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 17:22:28 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC5910E5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 14:22:26 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bdbf10333bso26770675ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692048146; x=1692652946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jor98kgDY+1gRooiLLoTFaeFZiwLcyPHinFBx8cZvEM=;
        b=Fiu84AYT3FSVBt955jwj8oDBwE5KOUS4Y0hBV4KKPBpNNKf6+uNEjHAWhQcXh7+mOw
         Gg9n0Qgl/9zMjHRIkwtwRUVKPZpCTnq3BX16VCzQ7XhejTH0c2+sFROX5wsQUIixGiD3
         6aKTfd6AoGoiumxedAD8Slm47bbVm30KBlB60x/SeNt+W6SrG0Z5qLiZIO8/SGk+KuE9
         NPSG57fRRDz6eDdmUX75vyvDyNLI/I02nISbb68ypAUZ0XFG7h21geGI885TprWVvTyt
         GhigXGHEaS3p8nvyVn8oxB0J/66B8kb5SfNLp6z/jF7C7N5aNvPoOMBEi4xoJbh6f4Ha
         GWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692048146; x=1692652946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jor98kgDY+1gRooiLLoTFaeFZiwLcyPHinFBx8cZvEM=;
        b=KzEeaxscCenV8g8123aWSBNmS58Sa79fMgG6cABjyGZfoIQfkps5vzZiFD5pzOK2Rf
         bNb6awGstlyiTD/oGN2M41TesN2Z7Q5P7v1KZHDfZZTaWqdxACbW3eENqn1jwbTfGnQj
         EK95vs7DFy9yZabMc/rij8f6b+WN4+aEii2fQAZLfv7vEftFGtOtB2GcXOTFzyrb8swX
         V0GSl6+rSPEh4Qex2ORq1E7VC1J+2SFFq8gqOKkipGaUmfsQwCKe/1fTbSd+irLkkg5Y
         YXyZ6Y3zr5Qgwu0jL60yO0iK9MgXUeLDvKVLsr/Vlxv9JFQvX5By6brIhtb+QdJhKEYT
         XiMw==
X-Gm-Message-State: AOJu0YwtRQR1CAi4TW6a6R48py/+PRTXzed2UppS3rGb8frcdmRqKTb+
        PYw715T4UPUascJBD27Urfg=
X-Google-Smtp-Source: AGHT+IHg1mcDtLTJFtatkVN6wAJUYf/nEkaX5j/Bt50x8ELGtBs6Bm767PcrkzMAcpKDS9/t+zhdXQ==
X-Received: by 2002:a17:902:c103:b0:1bb:dbec:40ba with SMTP id 3-20020a170902c10300b001bbdbec40bamr11105290pli.16.1692048146065;
        Mon, 14 Aug 2023 14:22:26 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:958a:19ee:81a6:dbc7? ([2001:df0:0:200c:958a:19ee:81a6:dbc7])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902ce8300b001b896d0eb3dsm9916710plg.8.2023.08.14.14.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 14:22:25 -0700 (PDT)
Message-ID: <dd9a6276-e2bd-d7cb-9ea4-45a40fe4fdf4@gmail.com>
Date:   Tue, 15 Aug 2023 09:22:21 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     Richard Z <rz@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
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
 <2B76FA74-7F6E-4790-A9BF-5308B682A3ED@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <2B76FA74-7F6E-4790-A9BF-5308B682A3ED@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

thanks for chiming in!

On 15/08/23 08:19, Richard Z wrote:
>
>>>> Now the question is how data on legacy Q40 IDE disks have been stored. If
>>>> it's byte-swapped, we'd better keep that byte order in the current driver
>>>> (meaning your changes to pata_falcon_data_xfer() won't be needed, but you
>>>> would have to swap back data on your disk). If it's always been in PC
>>>> compatible byte order, all data (not just the identify data) must be swapped.
>>>>
>>>> I'd like to have Richard's opinion on this (or hear from any other former Q40
>>>> user).
>>> I have learned that the "standard" firmware for the Q40, SMSQ/E, does not
>>> byte-swap data (it also uses an obscure partition scheme and filesystem).
> It doesn't use any obscure partition scheme, just the Atari partition table. It used to require some special magic word but the kernel code and all Linux tools would work just like if it was a normal Atari partition table. I have only modified atari-fdisik to add that magic number if it wasn't there yet to make original firmware happy.
Ah, thanks for pointing that out. Should have remembered it used Atari 
format partitioning.
>>> Personally, I am strongly in favour of Linux on the Q40 using standard
>>> byte-order disks that are compatible with other machines. This feels like the
>>> right thing to do and it is what I think most users would expect.
>>>
>>> Users (if there are any!) with legacy byte-swapped disks can always use the
>>> standard tools to byte swap them into the correct, compatible format.
> Most users that I know have a dual boot system so this won't work until the other available OSes are modified to support byte swapping. This would be doable but the problem is for quite some time the kernel would have to understand both variants. Think of it, if you want to boot an older kernel you don't want to byteswap your whole hard disk back and forth every time when testing an older or newer kernel. Also, I would like to see data on the speed impact of the byte swapping, making the old hardware even 5% slower isn't something I would be enthusiastic about and my guess is it would more than that.
Well, the inner loop of raw_insw() uses one movew whereas 
raw_insw_swapw() uses two movew and one rolw instruction. Reading or 
writing huge files that are contiguous on disk will show an impact. 
Random access of small files does have higher overhead both in waiting 
for disk latency and buffer cache/filesystem overhead. I'm sure it can 
be measured at least for the first case.
> Other than that it would be nice to use the "normal" byte order because exchangeable devices became much more common, I do even have an SD card reader on the IDE port.

I need to get one of those for tests - I have a CF adapter (which is 
basically IDE passed through to the card) but those cards are harder to 
get.

I'll think about your suggestion to make the byteswap option a 
per-device choice. It does make perfect sense for data exchange but this 
could be handled at block device level, not driver level and I fear Jens 
or whoever has to sign off on this patch will see it that way.

Cheers,

     Michael


>
> Richard
