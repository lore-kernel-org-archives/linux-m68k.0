Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034E9C48BE5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 00:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8E13611CE
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 00:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFPA3h (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 20:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhFPA3g (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Jun 2021 20:29:36 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EC8C061574
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 17:27:29 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id 69so217013plc.5
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zhWIGE1cXigQy2eDfo9c5H9KBGBEF5gW4ey9DXZCT1s=;
        b=Glo7CQld1T3OniBLhOSzQUIbe1G8vyxTSHyKDWSGoQ2W+olcIsaV52o6Ri35BtkkRp
         uqku7JuxmPmbbkftJFiwj4QbjpOoqT/wLmqB5eV73lQX/lj27g72+U6b4il6lyW5w9gI
         vTIjOA8VYzMRR1yObYIpNv8JeJozoQpRHwz5SxLcCWXwOR1/VyV+JBb7jvRoTaGXrfHe
         tnxHmMlYq/B9xUsOzVex+h9X3xeui00RM7cY17w2VLz2rS4W75zteOC3iuZB4OsjTyg2
         ZbHtYfaKBOq7z2VaKIVb67xF6L+t7ybEPHVUQqu7hTY6gbedPusJYmcV1DqLIniNXo/U
         UBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zhWIGE1cXigQy2eDfo9c5H9KBGBEF5gW4ey9DXZCT1s=;
        b=i5T/L1wSAH4d1vI3gbNCpWkbej2dZNleABz0MaZa0fgTeXhQ2AKYsamYOKfnHjMghE
         oBV70EuW3A2Skh1hQuiTY9KbIHE0Ew2n9EuCwdHWgb+Qpy4gmAaRVOEusIVJubfPFTfj
         Xl832hjJBtDNNxHsP0AL/Bu0lJM+uFyN7dkCmFo9EcXDE9JKN8TPQYcwbLYyutWz7AdO
         JXuQ+p07MhfG4X0x4R2qzeJTvx+57mB6tTqrg3QVOA/xHhctK7gi4uxuZQf2y8RNOA+e
         yyAi5GeIVI6WhKVC2Fx+RLLI9lqNfPNri8Axhz/Jj8zQf2+EXiJHiANQqjPUcs5nRVGp
         e0Og==
X-Gm-Message-State: AOAM533kKJNN1Wag//1ZYw6T9G3cjqtWNSoMgXAcPt1Td1oxcT3fEWY7
        ju9Dghlz9OlQG9/WV+X4cyoVWlO/3VmhMg==
X-Google-Smtp-Source: ABdhPJxWe8sOkxKreJa7bdTtDPjMH2A7itSI96w9FLXUdIrT8I2h+AmXdTAWvLKiQUSCF3nd6Dd+Cw==
X-Received: by 2002:a17:902:9b8a:b029:10e:a83d:7dcf with SMTP id y10-20020a1709029b8ab029010ea83d7dcfmr6351365plp.7.1623803249417;
        Tue, 15 Jun 2021 17:27:29 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a550:e6ef:8525:d5e0? ([2001:df0:0:200c:a550:e6ef:8525:d5e0])
        by smtp.gmail.com with ESMTPSA id i1sm241813pfc.206.2021.06.15.17.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 17:27:28 -0700 (PDT)
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
 <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
 <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
 <76e2f396-ec94-2615-4fea-0f33f6564f19@gmail.com>
 <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <53aba479-648d-955f-063f-d0fed0ed4b4f@gmail.com>
Date:   Wed, 16 Jun 2021 12:27:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

the deeper I dig into kernel support for seccomp, the nastier it gets. 
Skipping a syscall after checks in syscall_trace_enter was just the easy 
part.

I now have something that compiles and survives a boot test on ARAnyM, 
but it's been entirely untested otherwise.

Will send v4 of the entry.S patch, and send the remaining seccomp stuff 
as a separate patch.

Cheers,

     Michael




On 15/06/21 11:04 am, John Paul Adrian Glaubitz wrote:
> On 6/15/21 12:11 AM, Michael Schmitz wrote:
>> working on entry.S recently, I was reminded of this one. It's never been applied, and I can't find a trace of it in my tree.
>>
>> Not sure how far Adrian got with seccomp support testing, so I'm uncertain this is still of interest ...
> I still have a fork of libseccomp with m68k support and my SH support patch
> was merged upstream.
>
> So, if you guys can get the kernel bits in place, I can take care of libseccomp.
>
> Adrian
>
