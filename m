Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD06FEE4996
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Aug 2023 20:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjHUUg2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Aug 2023 16:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjHUUg1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2023 16:36:27 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C85C7
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 13:36:25 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf092a16c9so29544775ad.0
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692650185; x=1693254985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dynbDHvO7VMeJnUcFHz61Qku0VzvWVVCNa+4R9dUoG8=;
        b=cVu3TZ3pW4alUhjAOKCyV3fCXd/oi4OI1sOuHlY+DbYw6IPw/4sUpk6fu45LV1B9cc
         YlUYdHapwlSKaH5AqQreK7UcRMnDlTwq9OwAurZ4vZkR4t9rljndvOxqNBXk5+wCKJc+
         FXvVD1EfZiJjoYY+BgDtg/T0mVWYcW9YHWMZNxSdCFHpoZKDRWpBt8fAaX2/kqNbWq7X
         5D6wQK7nzUEWX55nr+LMGjW5KhJu5SgVBcKrSvWCHGaIeK35W0poCf/WLYUSIbJdXmBw
         RVqw2dKGYjHnzJS9kXek2YoslLj+FMSIt5n5fssmaVtwflsq941yPqAZUXB7+69+MlEK
         bkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692650185; x=1693254985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dynbDHvO7VMeJnUcFHz61Qku0VzvWVVCNa+4R9dUoG8=;
        b=W176mo0gRuMUVsVZDkzLvHpObI6MeCaY5utzboAhfOLXiwmk3msmaR9cYMmwnCjF17
         OcMW4RsITQ8CC/TPL77HEvzb2MJvtFU84/jO0SLeTcmOD8WufNUI7hhVhPBeRz1ALoL5
         kdnMrBW1XcC2YLsKfhcd++qhXM2eZvehFczoBgfy0hEFqyWNVzC2PhlwXopY7vuohSOj
         eAo/1Jk77Gdg/JPRuppbNX4OKSnwOC/yIcHqPRezT/KzI4nRcnQCm49tlH+77YoWMmVm
         LFrCLW7/+x+MFtKsJ9g9X1Tt9NT0g+g1lvUDo6LNKJvqw1uQzSREg9OqfRbVTBC8btki
         6HHg==
X-Gm-Message-State: AOJu0Yw0Vm7Wwi+rBDPNrFGL8Aandbb/JZy3ZsBZx1JAEXztxpVmTlI/
        OSwmp6NdVv7GLpy6+EuPHa8hEWOCTDg=
X-Google-Smtp-Source: AGHT+IGe/o5MW+RcoQSPVIT+ta2FLxLHvtck2StjsGO51Z1KQsoQCNVfYO6vZsFJ1/a73uoqUIY1aQ==
X-Received: by 2002:a17:903:2305:b0:1bf:cdc:f402 with SMTP id d5-20020a170903230500b001bf0cdcf402mr9931693plh.48.1692650185032;
        Mon, 21 Aug 2023 13:36:25 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7453:afaf:134e:1bdb? ([2001:df0:0:200c:7453:afaf:134e:1bdb])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709029a4400b001a98f844e60sm7468062plv.263.2023.08.21.13.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 13:36:24 -0700 (PDT)
Message-ID: <7fc5e704-d4ba-67d2-88cd-38d8dd2b1dfb@gmail.com>
Date:   Tue, 22 Aug 2023 08:36:19 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230817035001.8400-1-schmitzmic@gmail.com>
 <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org>
 <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
 <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
 <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com>
 <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com>
 <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org>
 <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
 <c193a0b9-efff-d0d5-c462-5853e104cf7f@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <c193a0b9-efff-d0d5-c462-5853e104cf7f@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC Adrian for comment...

Does anything in the Debian installer rely on a specific device name 
suffix in /sys/bus/platform/devices/ ?

On Atari, atari-falcon-ide does not have a suffix, but on Q40, it would 
get suffix .0 or .1 depending on what IO base the ISA IDE adapter uses.

Seeing as Q40 support in the atari-falcon-ide has been broken since it 
was introduced, this is rather about future installer support than about 
inadvertently breaking current code.

Cheers,

     Michael

On 21/08/23 23:08, Finn Thain wrote:
> On Mon, 21 Aug 2023, Geert Uytterhoeven wrote:
>
>> On Sat, Aug 19, 2023 at 1:53 AM Finn Thain <fthain@linux-m68k.org> wrote:
>>> On Fri, 18 Aug 2023, Geert Uytterhoeven wrote:
>>>> Of course 0 also works, but causes ".0" to be appended to the platform
>>>> device's name, visible in e.g. /sys/bus/platform/devices/.
>>> That seems desirable to me.
>> Why would it be desirable?
>> IMHO this is an unneeded change which is visible in userspace.
>>
> Only so what's visible in userspace would be consistent across atari and
> q40 (and anything else that happens to instantiate the device in future).
>
> Basically, I don't really understand why id -1 is better than id 0. I've
> searched Documentation/device-tree and I still don't understand why a
> singleton would need a special bus id.
