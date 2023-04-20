Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D060C77B73
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 08:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbjDTIX6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjDTIX4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 04:23:56 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBF04C31
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 01:23:33 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b73203e0aso5200828b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681979012; x=1684571012;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keIzP2s8exbHQqMK0zNkSUGUtutyvTfwC9cMr44POg8=;
        b=ctKNJEWjuu3lApTP63KdFeQfCndH2onovMc1AhhX71zoZWv4hXbSvO1PSMnGtohm07
         8TpQkvy+VvqekNb9Oe5FrvbUEm34/yGzcQ8PqZRngzaXd1F6DbweW604cd0djCHowX8p
         /fJTSv4mdcPyH7Yvg6bZNdgHESewaP2fytMae08GiIGH6zNmVvUWeJpYc7RKK6dLc9Jt
         WR51wwTiuHVeSxmotOWoV1+UYi13Asu1CnECT5h9nI8YNUCLDnbH6Q3Za4ez0q6fIjBl
         DqzZHUzL2woHuj0oq0HDxI9efyr99WbPMIq+GjBczy4CBt8OTh453SmjP/JH8bWx0E4d
         nV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681979012; x=1684571012;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=keIzP2s8exbHQqMK0zNkSUGUtutyvTfwC9cMr44POg8=;
        b=aHclsxgiOYi+v58fDVN5maGpcLLDKtEVIkFUG441RJaH5keCXdSwILt0N+bvUOcHjm
         z8Dk+ul249SPyU/ckJrTkcey+sF2EVgG05tzVlabVbHMUjHMA2+87JEFHzY/HxhqMSvr
         jil2MEGb3rvpjZeh5xmNB0pX21oQBqo1T3rGn/Dw8Eq5919EevQ2GyOwTK+PgAHPddZK
         t2m9eHlmQpUR3LVV8GoRlacvWs0iRIckjMfKQ9swoC0GjorTfHkbsLIsEkON2Htklagg
         2MHVlVXmXtJ5tFP2UJKGg6MYG4lmZtQRkMu5TvBSqZ5bsW8dkl4oWdrqEvytU2MGwafd
         DK7g==
X-Gm-Message-State: AAQBX9dpygDvoCsI3gBU3/rGAQAo3NX75BHUwHNrKk0fUTI1HG+0aEpv
        tS9sQMGkBijmGjtSbUp9vrKK8sYDQqI=
X-Google-Smtp-Source: AKy350a7q+BRpAIbw9R7fvRfBhmVbXRUoiUCDqVupUsVWZCAlSHjaY+GTQQWUG2e0cCWf/IwC9S4SA==
X-Received: by 2002:a17:902:ea07:b0:19b:64bb:d546 with SMTP id s7-20020a170902ea0700b0019b64bbd546mr679444plg.18.1681979012564;
        Thu, 20 Apr 2023 01:23:32 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001a810871797sm692542pll.38.2023.04.20.01.23.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 01:23:32 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
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
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
Date:   Thu, 20 Apr 2023 20:23:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 20.04.2023 um 19:47 schrieb Finn Thain:
>>> So all the stack pages would have been faulted in well before the
>>> failure shows up. It appears to be the signal that's the problem and
>>> not the page fault. That's not surprising considering the PC in the
>>> signal frame in the dash crash was a MOVEM saving registers onto the
>>> stack.
>>
>> Well. without locking the faulted in pages in memory we can't be sure
>> they were not swapped back out. Unless I misunderstand what's involved
>> in that ...
>>
>
> There was no swap enabled.
>
> 50000 frames * 36 bytes per frame == 1.8 MB

OK - swap is enabled in my case. That may explain the different fault 
rates.

But in any case, it looks like we can eliminate the bus error code. Same 
fault on both 030 and 040 with very different bus error handlers is 
highly unlikely.

Cheers.

	Michael


