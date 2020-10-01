Return-Path: <SRS0=dE0B=DI=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB1AC4727C
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Oct 2020 12:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8CFD20B1F
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Oct 2020 12:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx09qmH6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731993AbgJAMqN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Oct 2020 08:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731891AbgJAMqN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Oct 2020 08:46:13 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D2CC0613D0
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Oct 2020 05:46:13 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id db4so2822169qvb.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Oct 2020 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HSzWqQHbxoPJqnRVKBEBkFrdpI/gwtrdZRCq+18wU4Y=;
        b=Dx09qmH6vw2x1MVIBaV1eCywd8aUp9CCe0OADIsxu3V95JVKGshp1v67Ic7c4tGpWY
         vkJzHCILovukUsTGZD0FxTqstgDjfDGcC5qiWnyASIDRu/UtRXZs3eD2lNZKwSGzzvVe
         DYUoKGiI/QBzHSzbwHkqw2aDlCRqQUPo0q7R0EiHp0YsuaTxJQ91mpoonoZE6lrprsb3
         ayNk5S6vE2FjZQSwoOG4qqPbmkjOt1zO1sVkSe6Uy0YLaWtxzNPrOnpoT18UslLdDiEB
         DZI1gI/bQNMK8DZ1aUjc9qvCBO3m1HCh/2p9skMS5AqFur9bZySooUquvp+2Ix+kapux
         aW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HSzWqQHbxoPJqnRVKBEBkFrdpI/gwtrdZRCq+18wU4Y=;
        b=s1aGW+DD/+qLY0YoQWTw1JZiYaJw6WeixVEn5nAadbnY6kiCUdhxCX0MVNc8q9ZBht
         7Fri+QT57WffsBhn6lh9uw2d0+yHAtAe3IXGd/+tCu8GQtl7ufqq6+jiOZjxmY2IyQhq
         bGcEoQ5T+qb/ffKrP1aUbJm944a2Aq+MBoiwK/jKITUCwx1XMfwQom8FeohDpEAi9hPG
         UHU7RkXZtT+Z0KoWh3YnHcHGJ9EU7BX9Lu1Ok+GiDkuhDC44FFMuCWBsbyLum+zj5zsu
         YmZSlWK5YGjjU1p/zrtPRUZI3jOnOVCQwr5tPP765Z4E5OtawpyMwil93s2mwzB9IsnR
         duFg==
X-Gm-Message-State: AOAM532Gi6FbhYBgvoqfzpgrknWocZmLsciFUToz2ASNtohb0oc84o97
        BgL8tf1lb1zw3oDSCDrotPE=
X-Google-Smtp-Source: ABdhPJy3YEtOysJE9tv+zAe4wpkvOVuvB45Kh2tR9mZbLfYFt8+0qjKOi8xRFSViBjGYg99/ynJS1Q==
X-Received: by 2002:a0c:b651:: with SMTP id q17mr6913667qvf.33.1601556372376;
        Thu, 01 Oct 2020 05:46:12 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:1102:c54d:f6a0:d608:f6d3? ([2620:10d:c091:480::1:c0a2])
        by smtp.googlemail.com with ESMTPSA id f12sm6437357qti.70.2020.10.01.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 05:46:11 -0700 (PDT)
Sender: Nathan Sidwell <nathanmsidwell@gmail.com>
Subject: Re: Fwd: Re: Registers used for exception handling on Linux/m68k?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "gcc@gcc.gnu.org" <gcc@gcc.gnu.org>
References: <f9732b0d-9b7d-ba90-7897-1353d6912e24@acm.org>
 <c8c4ef5a-e4bc-f9e5-7a76-74f32f084bd6@acm.org>
 <d17cc651-6b81-5e79-8fb4-243d8d4e9033@physik.fu-berlin.de>
 <e4191f44-74ff-c4bc-6824-f2425ff403ef@acm.org>
 <15fe02f1-6bd4-b4c1-dd73-77a93c23c539@physik.fu-berlin.de>
From:   Nathan Sidwell <nathan@acm.org>
Message-ID: <23e12ab6-a1fd-16f3-9e09-123a5e770cac@acm.org>
Date:   Thu, 1 Oct 2020 08:46:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <15fe02f1-6bd4-b4c1-dd73-77a93c23c539@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/1/20 8:32 AM, John Paul Adrian Glaubitz wrote:
> Hi Nathan!
> 
> Thanks for the explanations!
> 
> On 10/1/20 2:27 PM, Nathan Sidwell wrote:
>> do you know what those 2 functions you mention provide on say x86?  Then it might be easier to map onto 68k.
> 
>  From [1]:
> 
> Register X86TargetLowering::getExceptionPointerRegister(
>      const Constant *PersonalityFn) const {
>    if (classifyEHPersonality(PersonalityFn) == EHPersonality::CoreCLR)
>      return Subtarget.isTarget64BitLP64() ? X86::RDX : X86::EDX;
> 
>    return Subtarget.isTarget64BitLP64() ? X86::RAX : X86::EAX;
> }
> 
> Register X86TargetLowering::getExceptionSelectorRegister(
>      const Constant *PersonalityFn) const {
>    // Funclet personalities don't use selectors (the runtime does the selection).
>    assert(!isFuncletEHPersonality(classifyEHPersonality(PersonalityFn)));
>    return Subtarget.isTarget64BitLP64() ? X86::RDX : X86::EDX;
> }

Aha!  it is EH_RETURN :) and it appears stack adjustment is something 
different.

for x86, gcc has:
#define EH_RETURN_DATA_REGNO(N)	((N) <= DX_REG ? (N) : INVALID_REGNUM)

thus N can either be AX_REG or DX_REG. (which is eax/rax and edx/rdx 
depending on compilation mode)

for m68k gcc has:
#define EH_RETURN_DATA_REGNO(N) \
   ((N) < 2 ? (N) : INVALID_REGNUM)

so that's registers d0 and d1

I'm guessing EHPersonality:CoreCLR is a different ABI that you're not 
concerned with.  Thus I think you want:

getExceptionPointerRegister to return d0 and 
getExceptionSelectorRegister to return d1.

give that a go, and see if you can throw/catch exceptions between code 
compiled by your llvm port and a gcc

hope that helps.

> 
> Adrian
> 
>> [1] https://raw.githubusercontent.com/llvm/llvm-project/master/llvm/lib/Target/X86/X86ISelLowering.cpp
> 


-- 
Nathan Sidwell
