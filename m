Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D7C0015E
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 03:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjHMDG4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 12 Aug 2023 23:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjHMDGz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 12 Aug 2023 23:06:55 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A40D10C0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Aug 2023 20:06:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso21333575ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Aug 2023 20:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691896017; x=1692500817;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vkk3mmbDCepgQGkVaGGlj62zp6UlOnGYISC5gQu/VA4=;
        b=YNA84lyFdzFFlSNJsiBeLoWcUOVvr56VHEIUqBPE7WkdqR9hKSXZz0gTw16DCmrChJ
         yp40R8qtcebduCAWwNKC9KaVeKK1qkeQsQc8BMZfVZ7xlzJiC2ua1aG+oIV3tK26LYtG
         QZydIwjkIJ0iSIjikpof71d0nfBjeAEGRohjrl/WtNr0q0kllWa55j6D5OzV/jQ08A+z
         8m79oGloEsuZB+0VwXHzRC6nftMFmV82NH/6YkrB0xM5t0ILXlciwbt8/AGGvayzV06F
         9qMuc+kBpBbaKS8gC3IsLVOjCiKK+XQUpNkU2pzLCSxP35mNFnoyzx1sKotZCAHnjWeW
         cKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691896017; x=1692500817;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vkk3mmbDCepgQGkVaGGlj62zp6UlOnGYISC5gQu/VA4=;
        b=AAk5juCixu8xQmwMgLK022u/epgcWFkZ1VNONPR1YtPeAnZZUmqQRAXCTrG8hx1ezm
         mCQFDU7iPqGlL286JIaSbgMWVKlQYEFlSLow/EpWPAkjo00T9O/+tkd+IMHmW1Ri2qFz
         +851YRGLxBKkIcl5GVl4jMsrjsRAksd4BiN8zqn622yro/saEnLoA8MgpdM5Va+Jsje3
         g28+mKJqdUUZd5XTECWJDt3pvxlVuFetjpEv6K6kkeMRprnWMw0p3RJcdcvHJF0fTAkg
         wWKDIxn8lTqaUcczQdKqXFmzL3FsiKp1Y9Gpf8Pt5+QIif5pSHkt+rkCjT+IhRZOBVWF
         wvUg==
X-Gm-Message-State: AOJu0YxVsWQ/+2sSzj4h39HKsK0+jiRjfXG38yf0+IKyBXQxPORjtLEZ
        8uFZIzSg9/GXXpQfjUD70w4=
X-Google-Smtp-Source: AGHT+IHJpaft9m62djowYN6ooGTgBXKP+/3/SeF+ZnpvpxoeVSDECg+z8wLM+98EnU3YiQpiy+/y5g==
X-Received: by 2002:a17:902:d4c6:b0:1b8:3590:358a with SMTP id o6-20020a170902d4c600b001b83590358amr6114170plg.19.1691896017343;
        Sat, 12 Aug 2023 20:06:57 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.googlemail.com with ESMTPSA id im22-20020a170902bb1600b001bdb9951b15sm4150229plb.175.2023.08.12.20.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 20:06:56 -0700 (PDT)
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
Date:   Sun, 13 Aug 2023 15:06:51 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 28.07.23 um 11:47 schrieb Finn Thain:
> On Thu, 27 Jul 2023, Michael Schmitz wrote:
>
>>>> And yes, I'm painfully aware the m68k low level IO code is becoming =
a=20
>>>> bit of a maintainance legacy, in no small part due to my hacks aroun=
d=20
>>>> Atari EtherNEC.
>>>>
>>> I guess you and I both can share the blame for 44b1fbc0f5f30e66...
>>>
>>> Anyway, you make a good point about on-going maintenance. Do you thin=
k=20
>>> that by supporting standard ISA drivers we might actually reduce the =

>>> ideosyncracies in m68k IO code?
>> You and DaveM ought to have a chat about that - abstracting the legacy=
=20
>> drivers from the ISA constraints was his preferred option when I last =

>> attempted to get the Gayle network driver patches merged. When I say=20
>> 'preferred', I'm probably understating a little.
>>
> A discussion with maintainers probably won't get far without working co=
de=20
> to look at. Perhaps William will send an RFC patch to illustrate his=20
> approach.

Haven't seen anything yet, so I've just sent a patch switching
pata_falcon.c to use the IO resources instead of the memory resources.
Survived compile and ARAnyM boot tests only so far. I've checked and
confirmed the entire 0xffxxxxx range is mapped transparent in head.S for
Q40 so I don't see what else might be missing.

Please have a look and test if possible. Haven't yet bothered
linux-block or linux-ide... the patch still needs a Fixes: and other
trimmings so isn't ready for submission anyway.

>> I had toyed with that using the EtherNEC driver as test case but never=
=20
>> got very far (this would have been splitting the driver into a core=20
>> lib8390 module and a platform-specific module that allows to hook a=20
>> variety of IO accessors as hooks, not static defines, and I wasn't too=
=20
>> certain about performance impacts of such a change, the performance of=
=20
>> the EtherNEC being so shitty it won't make any impact there),
>>
>> The only other option (that I can see) would be creating a bus driver =

>> for the ISA bus, with platforms allowed to register their particular I=
O=20
>> accessors for IO and memory accesses - again, performance impacts to=20
>> consider and getting test coverage on legacy ISA hardware a nightmare.=
=20
>> This would allow to use legacy driver code more or less unchanged.=20
>> Haven't given that much thought at all (the idea pretty much originate=
d=20
>> from this present mess, but that's all).
>>
>> There may be other approaches that can be considered, if none of this =
is=20
>> what you had in mind.
>>
> What I had in mind is probably unacceptable because drivers end up havi=
ng=20
> to do byteswapping as happens in pata_falcon (or falconide and q40ide).=
=20
> Perhaps your bus driver idea would probabably find more acceptance. OTO=
H=20
> if the aim of the exercise is to use standard drivers (like pata_legacy=
)=20
> there would probably be driver changes either way.

I discovered a problem with my bus driver idea - on Atari, ne.c and
pata_falcon.c must both use the same bus driver but with different
address translations and low level IO primitives. I'd need to switch
between either based on some quality specific to the driver use
(currently, that's the address range used - anything that looks like a
memory mapped IO range doesn't get address translation).

Unless that ugliness can somehow be avoided, I don't see the point of
replacing a kludge in io_mm.h by another equally ugly one in a bus
driver module.

Need to think about that some more.

Cheers,

=C2=A0=C2=A0=C2=A0 Michael


