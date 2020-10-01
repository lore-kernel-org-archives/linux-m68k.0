Return-Path: <SRS0=dE0B=DI=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14678C4727C
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC4C62087D
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Oct 2020 12:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYBF2sQu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731926AbgJAM14 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Oct 2020 08:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732157AbgJAM1x (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Oct 2020 08:27:53 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFC6C0613D0
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Oct 2020 05:27:52 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f142so4961999qke.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Oct 2020 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wbmrPBv1LoBi6/lWOCSoatPQTaU64V4l+uBTYY4d0BQ=;
        b=cYBF2sQuppYhRrjpVSolE8Md607GBEJ1HGuFDxxS9FwvO+/+tMoanaKMvpsMOnr1NC
         N9e+Sno3OMUMJrXmvvmV+/WwtmWtO3aUnHNsu9xI70gcsOl8ABAPdZ9z5NM4vqESff4c
         gi6s7RmHnq1XAXInnBANfM1Vlp+z1+9NX08p0u61D4b5789PooFCTwtsaFHci7Y7XOCW
         AB63HeEB8Ci/isXCyd/8iZxns7ilyVSd1iMx9IBse5hEseeGF3FqTyyfzZYHgrMv8WDl
         vy9XLMxFvyJSiSjrYJtelK/AkFUfQpTz+vtOwe9BNi0HTR2aHs6k79SGsmEubyiJ4F1v
         +i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wbmrPBv1LoBi6/lWOCSoatPQTaU64V4l+uBTYY4d0BQ=;
        b=p+ChdbwLQy9wHJrH911to5sRW78LPq1WQmCtzdJggFTXpiLFwKiw4xdF8+2WwkiTpS
         FqXm2jQ56EkyIqEv5LzyXPvTv5UFN/KTVRBfBhMleH0aW0SHCZrzGNa364LEdKrQWKT8
         gk2cxFptMYqYiWDGylgzQvcNKPaeDu5v+zVusPnuOGf2hW12jLT1gNDSDzDSMSF3HTc2
         yxItN9BPdmfRsfUw8RofVoGA7qs8qwNiUMIOS8Wb7Tt59HNfThO/+eEIFH0PhowkcjBs
         279Hw3z0HwJ6bdw9RV77Lj28/mrlZYVVQ52BSoGl+X/8PcQaSI6NuHBCokfZVyyaSj0f
         LNSA==
X-Gm-Message-State: AOAM532Ek3pR7FlN+j46WVSqdTSj5TC+CuLpjXFU8D6/03TcX5piUsJP
        DmDyEPP9QvqfJRragFPrX/U=
X-Google-Smtp-Source: ABdhPJwWSiKVTHC9zRHWgXqRIuUeW0l+VSM0bAQBnmOgzgZ6yWZpCLGMIrLVqhovn2PZGe/Cfn2zLA==
X-Received: by 2002:a05:620a:546:: with SMTP id o6mr7604821qko.296.1601555271752;
        Thu, 01 Oct 2020 05:27:51 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:1102:2109:54ca:fda0:3fff? ([2620:10d:c091:480::1:dd24])
        by smtp.googlemail.com with ESMTPSA id s125sm3828072qkd.18.2020.10.01.05.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 05:27:50 -0700 (PDT)
Sender: Nathan Sidwell <nathanmsidwell@gmail.com>
Subject: Re: Fwd: Re: Registers used for exception handling on Linux/m68k?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "gcc@gcc.gnu.org" <gcc@gcc.gnu.org>
References: <f9732b0d-9b7d-ba90-7897-1353d6912e24@acm.org>
 <c8c4ef5a-e4bc-f9e5-7a76-74f32f084bd6@acm.org>
 <d17cc651-6b81-5e79-8fb4-243d8d4e9033@physik.fu-berlin.de>
From:   Nathan Sidwell <nathan@acm.org>
Message-ID: <e4191f44-74ff-c4bc-6824-f2425ff403ef@acm.org>
Date:   Thu, 1 Oct 2020 08:27:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d17cc651-6b81-5e79-8fb4-243d8d4e9033@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/1/20 5:49 AM, John Paul Adrian Glaubitz wrote:
> Hi Nathan!
> 
> On 9/29/20 7:58 PM, Nathan Sidwell wrote:
>> On 9/29/20 11:22 AM, John Paul Adrian Glaubitz wrote:
>>>
>>> I'm looking for an information regarding exception handling on Linux/m68k, in particular
>>> I need to know what registers are used by the ABI in order to implement the functions
>>> "getExceptionPointerRegister" and "getExceptionSelectorRegister" in the M680x0 backend
>>> in LLVM [1], [2].
>>
>> I don;t know what those functions are, but from their names they seem to be related to figuring out the exception object and type?
> 
> I think so. I'm not a compiler expert hence my questions :-).
> 
>> Do you understand the itanium ABI's unwinding mechanism --
>> 1) follow stack to get to landing pad.
>> 2) invoke landing pad to see if it wants to catch
>> 3) if not, continue following stack
>> 4) once we've found one to catch it, we need to unwind properly, which involves invoking cleanups. and eventually getting to the catcher
>>
>> invoking the landing pad means passing (a) an integer telling it what's happening, and (b) a pointer to data.
> 
> This seems to be the data that I need. I just need to understand how that works.

I realized I'd got some details confused (it's been quite a while since 
I've dealt with this code).

When locating a landing pad to catch the exception the unwinder uses a 
personality routine, and passes it some data from the unwind table. 
That's a regular call in the context of the unwinder.  (It's called a 
personality routine, because it's keyed to the language trying to catch 
the exception.)  The landing pads are not called in this case.

The landing pad executes in the context of the function it's a landing 
pad for.  So the SP must be the expected one, all the (callee-save) 
registers must be as they were at the point of calling the function that 
threw, and everything below the SP is dead.  Of course the unwinder's 
frame is somewhere down the stack, and now dead.  eh_return is the thing 
that (a) adjusts the SP and (b) indirect jumps to the landing pad.  That 
is what the EH_Return macro is.  That code is in the unwinder, and is 
compiler-specific.


> 
>>> I looked into the GCC source code to find the corresponding parts but I could only find
>>> the macros prefixed with "EH_" [4] which I didn't fully understand.
>>
>> Those are the bits you want.  one of those is the selector (0?) and the other is the data pointer (1?).
> 
> OK. But aren't they passed through particular registers on m68k? Or is this something specific
> to LLVM?

Sorry, I think I confused the issue by conflating the eh_return 
(compiler-specific) with the passing of eh objects to the landing pad 
(ABI-specified).

do you know what those 2 functions you mention provide on say x86?  Then 
it might be easier to map onto 68k.

nathan

-- 
Nathan Sidwell
