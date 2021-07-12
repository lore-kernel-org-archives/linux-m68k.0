Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B32C07E99
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 19:04:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C35466121E
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 19:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbhGLTHh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jul 2021 15:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbhGLTHh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jul 2021 15:07:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F1BC0613E8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jul 2021 12:04:48 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y4so17287805pfi.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jul 2021 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PWv80kvGr7CiEAMwVGDs6p3SLdtegrwaiapyjLd0rDE=;
        b=Dwt8z8RJCl7N07bp7vj9TaPmCqoTcdfPbEkIJ0BTeJgTcGbJxzaj/N8iKZm9AFcQ1L
         OxEZOfMn246gUVeooNL5mhpBeyVsIIwz2BdPeufZjG5ToZz1+sctCa7MK5TcFY9i7GLF
         o0kBsBQLTAr49BBjLYHp6R8mr92aFOYzPmni4Q7UP+hGE44nj5lku+alCDu8OSdra0aA
         rjhWFsGqHqjY242gE7q9GjYlkQpr4qlvvIC82T4VuMwC6gZAb7TptCVldwzV54WkPw1T
         f04SpajnE129IROXo2hlU1ZB5vNYbBRfO+n6MSsOBIBcslLYi1QQDWoypY1YI108us7G
         /ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PWv80kvGr7CiEAMwVGDs6p3SLdtegrwaiapyjLd0rDE=;
        b=FCT24Tst/jbXd2P05foMidg5eRrUsMAzZTGEm8ZvpUAsX0icT8biqxpRr6PABrhbXq
         8waNOadAPJqc+zPtRHyd9+A558jJG3kVSzG+r2DbH0pVPUhzVFHEL3l5QOssS0Bw+ScI
         mWsqFPlDGkKdTcs53JN0fXC2/3+G82OuZ77c8B2wZUz5H7HU4LLwpkeppVNifjUup+Gv
         iNlzTBJJrEjRlAllSZ9agBTj7Xq37bg3O2WgTjRyskpk29bkEIQYAZM7s5ema1nE9Io6
         bb++wrTIkbwCb3+0fT/EAnAbNsOgMZZh7TRNMzgw18uKAExB88Mxui1SCbjMvB9p8j/c
         wSSw==
X-Gm-Message-State: AOAM533IBP6U/MR/uWp5HgFKmlvgjW2KTmXRCv35nIMHQLiyUa9zrpmw
        I0+/fnUrIp6R+rc+lxrl8Bz5TrGrjE4=
X-Google-Smtp-Source: ABdhPJwJp8xA2q9VzEmVzAXNaNCUKLBCSEwEYnAjVJS+pGaO4Gp/P2m5bqmrBPHpyh8J+s/DTAXYJg==
X-Received: by 2002:a65:5648:: with SMTP id m8mr552852pgs.93.1626116686984;
        Mon, 12 Jul 2021 12:04:46 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c0e7:435e:1bae:e7d? ([2001:df0:0:200c:c0e7:435e:1bae:e7d])
        by smtp.gmail.com with ESMTPSA id j6sm14436519pji.23.2021.07.12.12.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 12:04:45 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
Message-ID: <f77ca077-cd36-5963-1930-4002e604415f@gmail.com>
Date:   Tue, 13 Jul 2021 07:04:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 11/07/21 7:20 pm, Michael Schmitz wrote:

> Hi Christoph,
>
> Am 09.07.2021 um 19:01 schrieb Christoph Hellwig:
>> Hi all,
>>
>> this series converts m68k to the new world where set_fs is gone to make
>> the uaccess routines work on kernel pointers.  Note that it is compile
>> tested only and thus needs to be handled with care.
>
> Testing your series, I've got this in the console log:
>
> [16534.130000] *** FORMAT ERROR ***   FORMAT=0
> [16534.150000] Current process id is 1347
> [16534.160000] BAD KERNEL TRAP: 00000000
> [16534.180000] Modules linked in: atari_scsi ne 8390p
> [16534.210000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> [16534.230000] SR: 2200  SP: d1b6e0e8  a2: 00000000
> [16534.240000] d0: 0000001e    d1: 00000003    d2: 00000578    d3: 
> 00000000
> [16534.270000] d4: ffffffff    d5: 00000001    a0: 00000578    a1: 
> 00000080
> [16534.300000] Process savelog (pid: 1347, task=e3955528)
> [16534.310000] Frame format=0
> [16534.330000] Stack from 005e9fa4:
> [16534.330000]         02108005 0d06b008 1eeeb649 007e0001 00aea040 
> 003ec318 005e9e68 000279a2
> [16534.330000]         000b0000 00000000 00000000 030dfffb 0044fffa 
> 0e000000 fffa1a00 fffa1c00
> [16534.330000]         fffa1e00 fffb0e40 fffb0e80 00049e02 00000040 
> 0085a800 00000001
> [16534.430000] Call Trace: [<000279a2>] warn_slowpath_fmt+0x0/0x62
> [16534.460000]  [<000b0000>] vm_map_ram+0x144/0x5ae
> [16534.490000]  [<00049e02>] __handle_irq_event_percpu+0x38/0xce
> [16534.520000]
> [16534.540000] Code: 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 <9f38> 
> 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 
> 9f38
>
> Never seen the like of it before...
>
Now the good news is, the IO test I ran at that time continued OK and 
completed normally (aside from the OOM killer hitting another process). 
I'm using IO to three 24 MB files each on five partitions concurrently 
with 14 MB of RAM (9,7 MB total RAM remaining once the kernel has 
loaded) so memory may be a little tight.

Any reason to assume the warn_slowpath_fmt() here is related to the 
warning you stuck in set_segment()?

Cheers,

     Michael


