Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554D3C7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 20:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjDVUHB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 16:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjDVUHA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 16:07:00 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B461BD5
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 13:06:59 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so2847704b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682194019; x=1684786019;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmsx9NlCxasw++2UQCm9OXZGjpLWzpHYQGOZWuyqJNM=;
        b=b/HU3aQME+6ir6uV1wJN59tafFRVq+KuGmOqQvb9rE1icUzg6H0REDI3dKMVnlNIPb
         7M8oswuK8ZwIobVCwMFHUmK3kPDTjAmEs6W08bzLdwQpkydFwmQ/3BQBFf8+DeRO5uhU
         g0HsHw23VtFSJJ9NhzpxBnot4hY2BEW3FSr1LPiTJnVx2OhkDj9M9rFU0QC1H1U81/FD
         CyEZlX2TVHI2v5AzXu3wv5OHUO03amuo82IwThy7q+Iq7VDgTLrNOWApdjh7EdvJfa8Z
         A38UiNQgoYvjaRxM7nccHUN0xZ8tl65HC+7vmRTu+oibziPxwOzkGRaqQzVjxumx2vFi
         Np2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682194019; x=1684786019;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cmsx9NlCxasw++2UQCm9OXZGjpLWzpHYQGOZWuyqJNM=;
        b=CIAqNXrUfQu8xOqwtEhloDz0jsVDjhZpcNv2whlCOuSr1Xg+XtvbH5KV8B2Kvp4UHm
         ldGvAl09PhjNU+HHgl5VQMhaZQZ+G63CmrH5qEuYx/+Wfye6NbEyHJc4YMFkda2OsDfS
         hKmgDOtoafzGf1qG0h8f/xpSEYfRvpWp8/BeEnIUx2aeZLjL7Wa8UhD2pP/LrWO12oQq
         Trc9VhVRnPxqZN2NlLRTrAjN6h3NUiWrAboHB3lImgy2Pem4N1qltPB0/azRTpeL2pYd
         SgyfhbjyNBIkB419jzpsscZEEYYZ6X7P2APdlV54vRyr0/XF3qxDBXpIVYw4auSf6BRu
         QSYQ==
X-Gm-Message-State: AAQBX9c4a/f5V4lB1BiVu+rvwHbgEnmwNFQqj6+/iyU603sgAiCgzn4s
        vKDdXfqVTy1BlILLY+G2FSvNysCAQos=
X-Google-Smtp-Source: AKy350YGfZJwG2RTOC3geC4NfYeAUZhRKxhpzMLNpMyxpPeMJPffWu181/PV9q+x7kNLBsz97mdKFA==
X-Received: by 2002:a05:6a00:15c9:b0:63b:854e:8459 with SMTP id o9-20020a056a0015c900b0063b854e8459mr13510391pfu.31.1682194018904;
        Sat, 22 Apr 2023 13:06:58 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id v2-20020a62c302000000b0063b54ccc123sm3377825pfg.196.2023.04.22.13.06.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 13:06:58 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com>
Date:   Sun, 23 Apr 2023 08:06:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87o7nfyd7e.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 23.04.2023 um 06:38 schrieb Andreas Schwab:
> On Apr 23 2023, Michael Schmitz wrote:
>
>> Now I wonder who adds sigmask ... and whether that's also ending up on the
>> user stack.
>
> The kernel only writes the first 64 bits of the signal mask, as it does
> for all signal mask related syscalls.  The kernel version of the context
> ends after that; since the user-space version is larger it actually
> extends into the next stack frame.

Yep, seen that now, but only with rt signals this gets copied at the 
very end of the signal context.

I'll have to double check my calculations to see where this will 
actually end up on the stack in either case.

I'll see whether the signal context is available on the stack even if 
the handler isn't passed that parameter.

Cheers,

	Michael

