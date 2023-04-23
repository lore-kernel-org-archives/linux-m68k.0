Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DFBC77B76
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 01:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjDWBlV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 21:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDWBlT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 21:41:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A311703
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 18:41:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63d4595d60fso21232883b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 18:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682214078; x=1684806078;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2Wm0dw6NKZD+OO07rBlUflSxPOCW2HMZtl0cGPaiPU=;
        b=dxc97womXKrw/C4VCY2vwiJNANQXn7I0KqsWZWiP1ig6hdSkmPluPumSPat2qWr/mw
         RsDLb8zJq37S9kOi0WHPkMh1KlwYXU0eJgXgu6lBvQc1zLAjEzfVA9XnjmBvbfKH4qeK
         5gw0LHYl2xLJ9YtXxjMQ8xaGRFofjbo0+uftl5v4ZnKK1txd+SQc2i2GniOB+DO4W4fF
         vXSKgAyJosvOcYQ4hnfxM8SRgs+Ap1MggtKqXv93hq8YfFW5Ljg79nYfbOslXT4B02Jq
         rwriPo2s6KamdXxOveKOe4TnhNqd4lwx8yKyAFi5cCgaG5y29G88xW5uw8bta6tDq6M0
         DpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682214078; x=1684806078;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2Wm0dw6NKZD+OO07rBlUflSxPOCW2HMZtl0cGPaiPU=;
        b=bkzBWKTROL4ZObs2Iei3caFf/6NCf0Q5K5kj2pF5hEni9jca/hcMeh6Fm2mSI9MdBd
         22VZ+AXXzbkusiHrTE/Y2s1vv/KbzGl+TZeIq92HdAQ0zU9M09tBVzd047iHYFVXkXEY
         ptBN/DOCnnf0heEgDzjrQQYzYs9sTX6tU7Do/5Lfskb+E6mL3QKZfUGcy4fikSEQObzV
         VWUXMZ740RjUS+brH2tn6rsmh1YvWBbgcfCsfCnPlUcUKoIeGOHtW9KcQ8RdGWXqqEBS
         aadg7YLXxkkkE86dVTls/fJenwbLIRPKKO5N18q1SKPEuaT5k2gXJUCYZQYPJKnPFh+x
         FZuQ==
X-Gm-Message-State: AAQBX9fWgAcYxc2mkJve1D3UHramZihIY6VThVidzCQP82cudzkbQhbI
        LIjgWaFcIYRJLhwIukcb/9WzNPeTrzk=
X-Google-Smtp-Source: AKy350YmVG55jvcKdH6uJwyFHySi7ozpMW5BlfjDt31aKQiVMLPd8e3FtYhZ9CD8ClghGFicUsCIxw==
X-Received: by 2002:a05:6a00:2450:b0:634:c34f:e214 with SMTP id d16-20020a056a00245000b00634c34fe214mr15393626pfj.10.1682214078206;
        Sat, 22 Apr 2023 18:41:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id e21-20020a656895000000b004facdf070d6sm4480633pgt.39.2023.04.22.18.41.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 18:41:17 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
Date:   Sun, 23 Apr 2023 13:41:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87jzy3y79y.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 23.04.2023 um 08:46 schrieb Andreas Schwab:
> On Apr 23 2023, Michael Schmitz wrote:
>
>> I'll see whether the signal context is available on the stack even if the
>> handler isn't passed that parameter.
>
> The signal context is always on the stack, and used by the
> (rt_)sigreturn syscall.

True, but at the time the signal handler (sa_handler type) runs, all I 
have is the user stack pointer upon entry to the handler. I'll have to 
calculate back from that address, if that is possible.

Cheers,

	Michael

