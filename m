Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE0C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 21:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjDTV6U (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 17:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjDTV6U (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 17:58:20 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125E81FE9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 14:58:19 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-517bb01bac9so1099589a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682027898; x=1684619898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJos2UGRxxpnZvut0fK4eSXyQpLfQkw0orOQR0H0Quo=;
        b=iqtsyp/b6Qmj0jREqDnf0itusiQwlUjExH3SIH5WDioHKdUBoBT/+p2wZAubEYCTx1
         zdUUVTqCfpbJQk6sNjNXg2QtQpcnTAW0RVPy2tYeXKserxwG9w5nOVwlTYazs1RrZO/u
         OWwqAvG7Wy056LaFNyT+y8pZOF6QYxU1xbZBXYJnFaTszJigEjDJnnBj5nv90dbGk0o0
         BdqWMuDyJ2FiSmigxbW0W/aggZCk5p0fCQkWPQCNl2OwzGJfR71ObrlEf46UKF7FyMCD
         NV3sA/Awa7zLcmK/YWgwHmO2XVBt6csKNCa0p409ZsxpatlMBpaPcnH2z+o5DNhyxplh
         ur7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682027898; x=1684619898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJos2UGRxxpnZvut0fK4eSXyQpLfQkw0orOQR0H0Quo=;
        b=Fyc1vQ8FUJ3cHfVwOoZZx/08WjyP0+6ARNF0UJuYGaCxg30MLv4C4Ob8hjQ6veKrBz
         IWbpS9IzaDOCmzMW6YFnwtq2DvMNcEgzeSvIv97XbpHS67+xofTZ1xz2qika2wQIlLt6
         ikrR+Fw6Yz1v9jZEz3vQuj4lw/eyvmoDZVj6NjHNzn+/HwkVlyC9fQphYFtkZJUxgA2q
         j6aStGi2s2yJAcJpWBL1ovZylsPwRnUwhXepDIEeL/Bi4rJY24Hu5+7xM7rhuKyW2anL
         EeCUaUQSa71acY8O1W+VgmRq3qE2vyCsgwHCUsiEyvSSaxyKShOZujqfpXQmIwpxWxA1
         X77g==
X-Gm-Message-State: AAQBX9f6eqAMtqT3Wc5MrAJzIm8Vg7wmblzu1h2DNTzp00zyxr6LBcvm
        qxYZARo1pAQSRxlOBgNXR38=
X-Google-Smtp-Source: AKy350aWTi6m4KmTrKhaCAHtDWJ34i17rsNmZNPkiCVB7LK468QsMPJDOvNmS59acSNeGU1SxzqUPA==
X-Received: by 2002:a17:90b:3147:b0:246:818c:d8e4 with SMTP id ip7-20020a17090b314700b00246818cd8e4mr3452296pjb.11.1682027898159;
        Thu, 20 Apr 2023 14:58:18 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:852f:30a1:4dd:b24b? ([2001:df0:0:200c:852f:30a1:4dd:b24b])
        by smtp.gmail.com with ESMTPSA id gw13-20020a17090b0a4d00b002470b9503desm3410451pjb.55.2023.04.20.14.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 14:58:17 -0700 (PDT)
Message-ID: <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
Date:   Fri, 21 Apr 2023 09:58:13 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 20/04/23 20:55, Finn Thain wrote:
>
>> But in any case, it looks like we can eliminate the bus error code. Same
>> fault on both 030 and 040 with very different bus error handlers is
>> highly unlikely.
>>
> There's no failure on '040. QEMU and Motorola '040 gave the same result.

Sorry, my fault - I interpreted your mail as saying 030 and 040 gave the 
same result.

Back to the drawing board ... I've got kernel images back to 2.4.30 and 
2.6.37 to try and test. I'm also trying with rt signals and alternate 
signal stack (rt signals show the same behaviour).

Cheers,

     Michael




