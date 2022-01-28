Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8393FC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Jan 2022 06:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242336AbiA1Gvs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Jan 2022 01:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbiA1Gvr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 28 Jan 2022 01:51:47 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7999C061714
        for <linux-m68k@vger.kernel.org>; Thu, 27 Jan 2022 22:51:47 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d18so5069247plg.2
        for <linux-m68k@vger.kernel.org>; Thu, 27 Jan 2022 22:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=ZcHabeRUHoY+Z7oIH3QO3XarxiZlX+FBNvYhgYFczYg=;
        b=L/qT5jk2P9TIyICqZwPVGAbVHFJLrOyOy2stzhqdM5lYwIkS53YNj85XmKxcEzX6j0
         fvyVXwsgu9VOKFYUC1KOSD+wYZSn2fU5/SoD+askPH1UFPFev7ZsUUPILcm9qX79gwkv
         ybEgLzCNnuzasKE2EXT8225ggQpHT2jY1URzduDCiVkb0w7DioWWuDycOp6gGnQTO2wG
         z95/Shh23U8dytR7VThyY1oJdPn9v/WCMOQbtPTiiIbeWb+nHzBWTY7HpNltjNdAcHO0
         NIvX3WVrxkwdmplxZwy2noSDAZRNQ0MWfiYCVCR3XyTRkmjuXe+ipiO+FESMH5k3FZ2x
         tSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ZcHabeRUHoY+Z7oIH3QO3XarxiZlX+FBNvYhgYFczYg=;
        b=Qq/G9MrcKck7Dnz5JggJ1cG11zzpYNciBlxnVNJWqWMjba8mTIE9U04Ev5YiSO28HJ
         nOACToOeF0kAZblFy1tjGLJZGawQgpYj9/VfAIXv5tzjfLFqOspLjldiCgRKrw/OTXTy
         GC6dqD1rxH+OrC8v/KrjcCwU/X8IXjwelZ90dNjDgEsM2ctYpS57MWNOgIQM6TysmSeF
         Ju/q50/SWmIX0/s8DoL4qtGdooCcI2lH4/XgQsxwGFmD2J4sfyLSpEpIqOLPNSCld41d
         wlblZ5Ok/hjQzwwUxUAfu10METJ7T9XDTGfoCS+4NPA79DbBlebXfdEHokOIrViFb0FB
         uryg==
X-Gm-Message-State: AOAM5304XzaVES0T2rtdnb5BNoXLMRvvx3vd+OnchZY01S3noaMPQEQh
        zveqx4rxIXrNq0ZQK4rHopjsTm7OmhE=
X-Google-Smtp-Source: ABdhPJzy0pRm497G7CVoTV6DU64YLvR2HXYlkmP8bTXOU+eWi9YnI4TsimN7LhKx5ZN6fj/bXw4wrQ==
X-Received: by 2002:a17:902:e546:: with SMTP id n6mr7433135plf.38.1643352707086;
        Thu, 27 Jan 2022 22:51:47 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id d9sm7680724pfj.79.2022.01.27.22.51.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jan 2022 22:51:46 -0800 (PST)
Subject: Re: [PATCH v10 0/3] Add kernel seccomp support for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <20220127074158.25888-1-schmitzmic@gmail.com>
 <8dffd9fd-37a5-edfe-4e51-00e8bc19379b@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <34a669f6-acc7-7de9-5734-03fcf1c24fc5@gmail.com>
Date:   Fri, 28 Jan 2022 19:51:41 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <8dffd9fd-37a5-edfe-4e51-00e8bc19379b@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

not to worry - there is no rush on this. I may have to debug this a 
little more at the kernel level anyway (things like syscall redirection 
does not work yet, and neither does setting a particular errno when 
skipping a syscall). Plain syscall filtering does appear to work 
however, and AFAIR that would be enough for your purpose.

None of my test systems are recent enough to allow compiling current 
user space code, unfortunately.

Outdated user space might conntribute to some of the selftests failing, 
so I could use a little help with that perhaps. I know Geert tried the 
selftests independently some time ago, so I'll post my changes to the 
selftest code and we'll see whether that improves the score.

Cheers,

	Michael

Am 27.01.2022 um 22:09 schrieb John Paul Adrian Glaubitz:
> Hi Michael!
>
> On 1/27/22 08:41, Michael Schmitz wrote:
>> Patch 3 adds the test for TIF_SECCOMP thread info flag to call
>> into syscall_trace_enter() when seccomp syscall filtering
>> is active, which was missing from earlier versions (classic
>> MMU m68k only - need some help with the test for 68000 and
>> coldfire).
>>
>> The previous version required the TIF_SYSCALL_TRACE
>> flag to be set for syscall filtering to work
>>
>> The rest of the series remains unchanged from v9.
>>
>> Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
>> (33 with the old version).
>>
>> I hope you didn't waste too much effort on testing v8/v9, Adrian.
>> Should have a suitably large brown paper bag somewhere yet :-(
>
> Sorry, I haven't found the time for the tests yet, I'm really busy at the
> moment. If you want to test libsecomp, you can check it out from my Github,
> then build it and run the testsuite.
>
> See: https://github.com/glaubitz/libseccomp/tree/m68k
>
> Adrian
>
