Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBC6C77B73
	for <linux-m68k@archiver.kernel.org>; Tue,  2 May 2023 20:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjEBUQJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 May 2023 16:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEBUQE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 2 May 2023 16:16:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4731B271D
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 13:15:51 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a9253d4551so32461795ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 May 2023 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683058551; x=1685650551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHCHlxy6rkjDjjRekSa3+2G7dwcFvjuFOVXQ2As/N0M=;
        b=Wrj3NI8EvnQ0XG0GE4geC+nRaGmbRL42kGMPJak7MfnwCK7MuUJ4g1zNWEqsPwvgYG
         i8HAOFjbeHxfdKZQz/0sZbV9mRvMd+XqXdkEORc7uRiVC8yvXO5qleNPRdVmLCmzZ4+e
         l33oAq59wfuiAj3DJdz5gwSp91Wehb7b/Lk5rzLehR+2xz3Qlx8aiOnqZQWTHLNBITo+
         0QkkbWQWKlag6FFaNeRXm5LS1mtR1iRv8UFo/96nnl6hSa/EefaZh04meL8GP4SK9PDw
         AaRrgCZ1/sKF2lxeYaTbF/ItRZB6lw3Sy9/k5xP9MUDg5D7T74lRf1gxbwHLr0HN3pgh
         t1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683058551; x=1685650551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHCHlxy6rkjDjjRekSa3+2G7dwcFvjuFOVXQ2As/N0M=;
        b=kdxKhOAKsimlPzU0K8QZgoMkCkndlLMmznoahyu4+fnmXpDowK+N3sQM6cNL6X6ziT
         tRzRz4LfFHW1DKxhINg2ZeiNQVxwBq0u8UCLHrV5+4pec4q+VhWS0s/Kou4QmyGIyIy7
         pli+soAeAehjtBnACTcjl2higA8UOBvDKhE6SmI6BMLmXVHRb1puP+kiOQtA7rh02Pzu
         o8xrWC/+wAL79NxtdvdxZAoZHM9fhWkOTE2JfK9jugM73zDVrZudrosn8vhlyGBvb/sc
         OwIGEjVTvBYj3A+QCOSW6Sby/EdKrDlwQFpRL5AdSgYYK1hCP4R8+KQC/5i8MnwoWkvA
         yT3A==
X-Gm-Message-State: AC+VfDz5c5coG4/yKB+DeI5oUmAqPVnMbksK54v5VIWBi/V/VEmpOKud
        S9VzVFOGBMANKC2SFcgIdP0=
X-Google-Smtp-Source: ACHHUZ5Ja5ZmDtntbYHZs1ReCdYuuT7XaFaCd/FXhGCSsKRjLbH9P8IJ8hbpt3JdkxbW0zI2j/eYVQ==
X-Received: by 2002:a17:902:e545:b0:1ab:fb6:1e72 with SMTP id n5-20020a170902e54500b001ab0fb61e72mr3060985plf.42.1683058550541;
        Tue, 02 May 2023 13:15:50 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:7c1b:932f:132a:65fa? ([2001:df0:0:200c:7c1b:932f:132a:65fa])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902bc4a00b001aaeeeebaf1sm4813171plz.201.2023.05.02.13.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:15:50 -0700 (PDT)
Message-ID: <b1ebac7b-a3e4-fa15-13f4-55aa53fe3130@gmail.com>
Date:   Wed, 3 May 2023 08:15:45 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 1/2] m68k: Don't deliver signals except at instruction
 boundary
Content-Language: en-US
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <8a32bd0afd8db890b60e48801fb4b24ddc398e96.1683010227.git.fthain@linux-m68k.org>
 <87v8havfq2.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <87v8havfq2.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas, Finn,

On 3/05/23 04:51, Andreas Schwab wrote:
> On Mai 02 2023, Finn Thain wrote:
>
>> From: Andreas Schwab <schwab@linux-m68k.org>
>>
>> Signal delivery should only happen at insn boundaries, but due to the
>> way the 030 handles return from bus error exceptions (the insn is resumed,
>> not restarted like on the 040/060) the kernel may do it in the middle of
>> the faulting insn.
> I don't think this will work properly when the address cannot be
> resolved.  The bus error exception will just be raised again
> immediately.

Seems certain, even though we haven't observed that in testing yet 
(haven't designed the test case for that specifically, mind you).

The (slighty hairy) sole solution to this (that I can see) would be to 
only skip signal delivery on the condition that bus_error030 was able to 
correct the bus fault.

In any other case bus_error030 will raise SIGKILL or SIGSEGV which must 
be delivered right away.

Can we infer that from the state of the fault frame after bus_error030, 
or do we have to modify bus_error030 to return success/error codes?

Cheers,

     Michael


