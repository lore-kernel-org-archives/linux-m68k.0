Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603D6C3DA78
	for <linux-m68k@archiver.kernel.org>; Sat, 14 Jan 2023 00:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjANABA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 13 Jan 2023 19:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjANAA7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Jan 2023 19:00:59 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213904D716
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jan 2023 16:00:58 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b17so17484342pld.7
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jan 2023 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:subject:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3M13IxbAxDiwMHRx0TKEtf/SZxFluuSqH8OoE3mO64=;
        b=ieTdI9mmctQ8vFsCfESEu+X6ow1wGFzMEE/fDw26/nj5ddmOP77K83VhNgILYsyf9Z
         u05c6Zphi+06q7azPcpblGDS5NFr1wJcN3bkxlFygE2nFsHKLBDcRqy2rjWkwgMezUNm
         g60MDnmxSyLP8/fogZgxx8ioIW+Lpz8wR/CdqFI/4lDqzsugDDHheXf+2E5NDByRG6ug
         NqoGpUnuo0JGUrNxFLXPeXt3mI6g9BYKAemQc66ywJyNd4zjl/ms+8fvz1LguL5w6+m5
         I4wSiJ99f86yvFf5jh2MHjFHyeTyQiqrX19wBgKTP9I65+sT2CC0FFO406bS0cils7DV
         4vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:subject:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3M13IxbAxDiwMHRx0TKEtf/SZxFluuSqH8OoE3mO64=;
        b=8GPJYjvUDmYeQvLsdYyMqkISjZMJGv/AKmrlVyYhCRYwwL2AoyqUsmvHdzpyLQv2Ix
         JX3tA9Bd1/8Kb6gDjwAfnPXkqvwfzNlTer+xMVGEjFUfVIJjd4TSsyFjuKlQF5Ifkpz0
         ey3ByBOx8dh+2q0KX2OMNi6if+0/DZEgvHAWBuDJHH37mvwRv/5v0XRceriAYHnxFSc2
         unM4M3zb9Ak2Li4d4IE+XRElm836wN2V+AtMkjoejvCJvCd90GMsicQJk+DU1uWgtolO
         LTyk537SNP2u5i+xh/wjI/l3vB5NxOV1OMI1sakExBL41Faw+UIdXIAzxdXn1CsfiO9o
         ywSA==
X-Gm-Message-State: AFqh2krJNJgKN9KveXUQ8SeOeGMKNHqdsPuHSY/+5dYUpoVAuN/pUFAD
        pqghcCed7B5miGzdPgKyub8=
X-Google-Smtp-Source: AMrXdXvIua1DizXv4xiA0clD6Av86faQaW5B7k3mJrZT/Fj7QFXF0HC/kZx8YishR8G0t6LJN5h9vQ==
X-Received: by 2002:a17:90a:7f86:b0:227:cdd:89bd with SMTP id m6-20020a17090a7f8600b002270cdd89bdmr21627609pjl.10.1673654457551;
        Fri, 13 Jan 2023 16:00:57 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id gd23-20020a17090b0fd700b00226c2d90c04sm13106496pjb.38.2023.01.13.16.00.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jan 2023 16:00:56 -0800 (PST)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Message-ID: <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
Date:   Sat, 14 Jan 2023 13:00:42 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,


Am 14.01.2023 um 06:29 schrieb John Paul Adrian Glaubitz:
> Hi!
>
> On 1/12/23 04:55, Michael Schmitz wrote:
>> Previous version of patch 1 did overwrite a syscall return
>> value that was changed by ptrace or seccomp (in regs->d0)
>> by -ENOSYS when skipping a syscall. Branch directly to
>> ret_from_syscall instead of falling through to badsys (which
>> must set -ENOSYS). I'm sure this can be done more elegantly.
>>
>> Patch 3 used the wrong struct definition for ARCH_REGS - the
>> kernel ptrace code copies 19 registers (from syscall stack
>> and switch_stack, pt_regs only contains the 14 from the
>> syscall stack). Stack overflow ensues.
>>
>> With these changes, 79 of 94 seccomp_bpf tests now succeed.
>
> I have also opened a PR now to add m68k support to libseccomp [1].
>
> Unfortunately, libseccomp fails to build after I updated the
> syscalls.csv file
> after adding m68k support. It seems that the problem are a number of
> syscalls
> that exist on m68k only:
>
>   CC       libseccomp_la-syscalls.perf.lo
> syscalls.perf:152:70: error: '__PNR_getpagesize' undeclared here (not in
> a function)
>   152 |
> getpagesize,119,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,166,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF

That one also exists on alpha and sparc. The other two are indeed unique 
to m68k.

There must have been other cases of novel syscalls added to libseccomp 
before?

Cheers,

	Michael

>
> |
> ^~~~~~~~~~~~~~~~~~~~
> make[3]: *** [Makefile:903: libseccomp_la-syscalls.perf.lo] Error 1
> make[2]: *** [Makefile:922: all-recursive] Error 1
> make[1]: *** [Makefile:524: all-recursive] Error 1
> make: *** [Makefile:433: all] Error 2
>
> Adrian
>
>> [1] https://github.com/seccomp/libseccomp/pull/397
>
