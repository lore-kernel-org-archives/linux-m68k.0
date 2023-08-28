Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A838C71153
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 12:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjH1Mot (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 08:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjH1Mo3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 08:44:29 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A700102
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:44:26 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1c4dd644cf8so2244881fac.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693226665; x=1693831465;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CxRziManSP3f+oGGB0LWLZ08msYpIcKkzX7IfShUspE=;
        b=c/miQczB/W1HTs9GlH2Cd6BkcKye5jdU0cpvFFZzEILVHnFgaesVjEIFr0pDchi7pi
         JDzaPSFiwB9y7dzGLNh0zJoIE0Qxj2xgRE742fblATRjv9ddMxiTmlFWfDna4QruFPK0
         qWetcc1h5NRqpR+pKNQ54guOXeWOrOOt9PB3PE7HVFbIIZNF5MM4OI4dIsyz/ko1hr7w
         z5ll0058eNwkS0y1O81tepuyVd0kmZ1/R0PbEq7ipTmlYUIhwYk544DD2xE/3ImyBk8V
         5NOTwsDjMICClJEFVLGFFfKZlEmwux1DKZt+/5jh7inZb9TDkgc4Y/dQETvbrWLS955l
         F2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693226665; x=1693831465;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxRziManSP3f+oGGB0LWLZ08msYpIcKkzX7IfShUspE=;
        b=I0enUiGpR9xs1HaeccIgRkChbvtxUnkmEdzjPZPL3p+W7z0ANyUk3D01Et0eW+CLLK
         vBVVXWxiWFhYxFoi/Ggb6WnJ/65nDrcUcdYi1ZDKv0SNc+4Bue1NfRvEg313zLYdcGC9
         cXE8fHsVkHvdpLWiBvubYE0N7C4grVfna+I32tu1gDNwq9o8w11Fz9Xc4dlKdskWY+4Q
         lqyG6jJHNAMTyZJz0t1aoieHSK8e4D7yC+dqXWGF7vlKAJqRbP6qlt7GpCFf2pbYN1D1
         TPB7iHu/Ru5GCuLsS94ge/knM/gxKo0bU/q/nxu4zEhKfhUixsMaudxY/RYpaZT4XWlZ
         oTLg==
X-Gm-Message-State: AOJu0YzyXqMMmWem65oSLmKNerY2qDUwdaP8+fXOH7poYRB0fWxS00U5
        IuAW2/97AXYH2ibcHYu6NfqOc3hjFgwFxZ8xFJUocw==
X-Google-Smtp-Source: AGHT+IHlrT0SGsS+a9INH25dLxfFWLyzGEbd6A8elT9/0uNbNG3k0Ys+yK8L4yiZG4t2gzEe8p9IXQ==
X-Received: by 2002:a05:6871:206:b0:1be:dbd9:dd2b with SMTP id t6-20020a056871020600b001bedbd9dd2bmr13095722oad.54.1693226665227;
        Mon, 28 Aug 2023 05:44:25 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c3:578c:9c3a:f97c:ae6e:d589? ([2804:1b3:a7c3:578c:9c3a:f97c:ae6e:d589])
        by smtp.gmail.com with ESMTPSA id n5-20020a056870a44500b001cc6b64d5f3sm4170288oal.44.2023.08.28.05.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:44:24 -0700 (PDT)
Message-ID: <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
Date:   Mon, 28 Aug 2023 09:44:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: Tuple and changes for m68k with -malign-int
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
 <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
From:   Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 28/08/23 08:10, John Paul Adrian Glaubitz wrote:
> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
>>> Not only mold but also most notably the following projects:
>>>
>>> - LLVM
>>> - Firebird Database
>>> - OpenJDK
>>> - Various Qt packages
>>>
>>
>> And potentially more in the future, which may be anticipated on the basis 
>> that "those users don't need a stable ABI any more, so let's just ignore 
>> the portability issues in our code and leave the problem to the distros 
>> and toolchain developers".
> 
> It's reasonable to assume that a 32-bit architecture uses 32-bit alignment and
> I understand every single upstream project that doesn't want to care about obscure
> design the decisions of some ABI designers of the past.
> 
>> That is the precedent you would set.
> 
> No, I wouldn't set such precedent. I would fix something that has been broken
> for years and has caused endless headaches for people maintaining the m68k port
> in Linux distributions.
> 
> And since we have to break the ABI anyway to be able to use 64-bit time_t, I don't
> see any valid reason to stick to the problematic 16-bit alignment used by the current
> ABI.
> 
>> Moreover, why is it that only a few developers have a problem with making 
>> explicit their decisions regarding alignment of shorts? What actual pain 
>> does it cause them to accept a patch to make their struct layouts plain?
> 
> The problem aren't upstream projects but the lack of manpower to work on all these
> issues. Talk is cheap when there is hardly anyone doing this work.
> 
> I have invested a ton of work to get the m68k port into better shape and with the
> help of the community, we even managed to land m68k support in LLVM. It was a HUGE
> disappointment to me when the 16-bit alignment again caused trouble for a relevant
> upstream project on m68k meaning that LLVM can currently not be used natively on
> m68k.
> 
>>>> It goes against the traditional ABIs, but practically no m68k Linux 
>>>> binaries are published outside of distributions, so this not a 
>>>> concern.
>>
>> It is of concern to some users (though not all, apparently).
> 
> If these users really cared, they would actually help address these issues. I haven't
> seen any contributions trying to address these issues outside my efforts and the efforts
> of the Gentoo developers.
> 
>>>> We need to break the ABI anyway with time_t going 64-bit, so it makes 
>>>> sense to do these two things at the same time.
>>>
>>> Fully agreed.
>>>
>>
>> If the kernel breaks the ABI, that's a bug, not an excuse. Either you're 
>> okay with proliferation of incompatible binaries and tools or there are 
>> some criteria (yet to be identified AFAIK) which permit this bug.
>>
>> It's not difficult to foresee fragmentation because it follows from the 
>> manpower shortage. There will always be sufficient manpower to produce a 
>> break that pleases a few. There may never be enough manpower to produce a 
>> stable ABI that pleases everyone for the foreseeable future.
> 
> Again, talk is cheap. Show me the code.
> 
>>> I think -gnu32 sounds very reasonable.
>>
>> You do? I think 32 is misleading in the absence of 16-bit or 64-bit 
>> variants, and -gnu is misleading if other tooling like LLVM already 
>> supports malign-int. Moreover, it's impossible to align to a bit count in 
>> general. Not that you'd want to -- it's actually the natural alignment of 
>> shorts that is at issue, AIUI.
> 
> Yes, I do and that's just my personal opinion. But as I said, I am open to
> other naming suggestions.
> 
>> So, for naming purposes, the proposal might be described as either the ABI 
>> du jour (leading to -abi23 for 2023) or the new ABI for ever (leading to 
>> -abin as in -gnuabin32 on MIPS).
> 
> That's why I suggested we can look how the ARM developers will name their
> triplet when switching to 64-bit time_t on 32-bit ARM systems.
> 
>> If it's the former, perhaps you should not push it upstream. If it's the 
>> latter, perhaps this redesign should seek to address real shortcomings 
>> with the existing ABI, including problems which (for all I know) may have 
>> entirely prevented some people from using it thus far. That is, it should 
>> consider silicon beyond 680x0.
> 
> It's a historic architecture. We don't have to redesign everything. It's enough
> to address the most pressing issues and these are 16-bit alignment and 32-bit
> time_t.

If the idea is really to endeavor on a new ABI for m68k, it means a different
loader and the question: will it be interoperable with current m68k ABI in the 
sense that i686 is interoperable with x86_64? It would allow to keep old binaries
running, similar to what old ABI did for 32 to 64 bits transition.

It would require take care that some possible shared data structures (such as 
pthread_mutex_t and alike) have the same layout and alignment, add some support
to ldconfig to differentiated between DSO with different ABIs (either through 
e_flags as ARM, PT_GNU_PROPERTY used by aarch64 or x86_64, or something else),
bump the required minimum kernel (for 64 bit time_t support), and check current
status of the port.

I am bringing the later because I fixed some recent m68k build issues [1], that
seems to be from gcc changes over the years (as hinted by Andreas Schwab) where
compiler changed some internal defined flags and it was not reflected on glibc
(for a short, it seems that -mcpu=680X0 does not already define __mc68020__).
The build fix is straightforward, but it raised question whether something
else is not broken and has not been caught yet.

Waldemar Brodkorb has posted his results on running glibc 2.38 on qemu and
it shows a lot of regression:

    949 FAIL
   3344 PASS
     99 UNSUPPORTED
     16 XFAIL
      2 XPASS

I guess the math failures are from the extra rounding and exception testing, which 
requires a fully compliant IEEE 754 fp unit (which I guess m68k does not provide).
The last m68k testsuite report where from 2.26 release [1] running under ARAnyM,
which shows the port is a better shape.

I also noted that gcc on mc68060 changed the __DEC_EVAL_METHOD__ to 2, which makes 
glibc tests to fail to build (since it assumes __DEC_EVAL_METHOD__ equal 0). This
again raised questions on how the math library would behave depending of the target
chip.

All of this issues and potentially work required for a new ABI makes me wonder
if is really worth to keep *2* distinct ABIs for m68k.  Yes, m68k can follow the
MIPS mess and have 28 different ABIs that fails to be fully interoperable; but
I think that if you really want to on this 'gnu32' journey, I think it will be
better to just deprecate the m68k current ABI, remove it from glibc; and move
everything to new ABI.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=30740
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=30740#c16
[3] https://sourceware.org/glibc/wiki/Release/2.26#M68K
