Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16B9C48BE6
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 08:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B26A361370
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 08:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhFNIVK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbhFNIVJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Jun 2021 04:21:09 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A29C061787
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jun 2021 01:19:06 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id i34so8001474pgl.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jun 2021 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=t58XiPWs2cfgnBzrbA7PjVd+4FPATUZkL2yIWPsHhJ4=;
        b=A0/8WmpRugQKAuvoljVxOl2EDgcWq4SiU8Hz4Ewm8SaOAonkTJW0qxZpt180gwF6Yu
         jqcR7W6XOzmKSmstTMzLVW6z73TRIfm8XZb7UrgC4+RpTP4wX/ZVfNkfUViUstP2T4Cz
         TxVHwWNQPZPSJnatwpsLOCKUaaH9/KagkeF/P633+6AHDD90o7f1DBiE0wxc1Mr1RgyV
         BcixCFQYSwZatpRszV7+9O+3qLwDtIDMlQb9mwweEGnO2NJwqdHbWd8TgjD6/Sh/2D3S
         hHb3PBBi5eyvqfBbusdi/j4Ak1GfCPIGdq1RxTcHOpIyWq0PzZpc0yGcgKpgbu6XxQrl
         NCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=t58XiPWs2cfgnBzrbA7PjVd+4FPATUZkL2yIWPsHhJ4=;
        b=TxTd2z9p3OzBQu2hHZ+mA1ZoQigibNZ5FTfiulSvoLOyis5rM6B/2eqMU/J/P4yYG2
         AvzHBK1sTq7GbKmwg+Tyn1v4xFidS5qrOBIXDHDJ95Qcfd65j73bjH8raX0GgcRSicMj
         N27ukTAdolf2fLEk+X1y5fWkcV6DFngGspiimTZSp2/REb4siaTCBtWXb3YmDNoirmpt
         vcYc5ny2WdGYT7N4NRDFnO1tD7SB5yvkAG0TtvY+fBmU9GD83Jqa7bd3+o1A93Y4caSn
         w4Poh07FeMJp6y4LUcHbiID3DvPpiFkAiK/C3cBCg5wBh7UO9xizKwB7V+AF8cBIgFkJ
         SGRw==
X-Gm-Message-State: AOAM533xoBE4EYNMi16gB3ZdHBYVS6N43aB5666urDxVwvQH/ezoLUnA
        Uq4IpDo5br7TfKUDBYR2Yjk=
X-Google-Smtp-Source: ABdhPJwUb1RaOlcDyBk8nbk8iGz87J6sIR47Cjx7rn8EcuBV26G3r+pnXN+DhyY/qTLkmUVk8C4JRg==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr15929663pgl.234.1623658745832;
        Mon, 14 Jun 2021 01:19:05 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id g8sm12266053pgo.10.2021.06.14.01.19.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 01:19:05 -0700 (PDT)
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <87sg1p30a1.fsf@disp2133>
 <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
 <eab743c3-7deb-33c3-030b-6686ff1f5e94@gmail.com> <87a6nssxln.fsf@igel.home>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        Kars de Jong <jongk@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3852c4bc-8256-71e9-4720-85fafd276430@gmail.com>
Date:   Mon, 14 Jun 2021 20:19:00 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87a6nssxln.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 14.06.2021 um 19:40 schrieb Andreas Schwab:
> On Jun 14 2021, Michael Schmitz wrote:
>
>> do we need to add
>>
>> .globl __sys_exit, __sys_exit_group
>>
>> (and perhaps __sys_clone3) at the start of entry.S?
>
> ENTRY takes care of that.  You wouldn't be able to link without that
> anyway.

Thanks - I guessed being able to link (and run) the code should be good 
enough, but I don't try a lot of tool chains...

Cheers,

	Michael

>
>> We have that for __sys_fork, __sys_clone and __sys_vfork.
>
> Not really needed.
>
> Andreas.
>
