Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D612DC433DB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 22:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA4364E77
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Feb 2021 22:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhBRWMM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Feb 2021 17:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhBRWML (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Feb 2021 17:12:11 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B666FC061756
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Feb 2021 14:11:31 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id q20so2300605pfu.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Feb 2021 14:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2BNm2Sy2P6jkCZbThkkqBfZaxS28xMnq4sQPLlpKVSc=;
        b=oPxQ3zEatebLUJOzFuvXtpdBFNS1aXVvmULx3Vq1K7IH02cgp5JVRon+523RsysY4Q
         NL9J7g0zml/wR7e9fBS7psfKr4ArmYBon9T+bDMYbNqhpJYgrSpSkKosODNPPkDQPOGs
         wvHzGkgxOAD0cNO2WG5HTNhMPGRJKfRs66zqmc+9vYJqtewa44HvMOIvSAI5XHj96DFP
         b3W41c7fU72hO0md5JE3DaJf0oXfJT0xL4E5F8AdwUg6wOi1UBryWr7rQv5nWFMHXe3R
         5kqiD+FtAkgFcYepvCsIbm+E0j0rdwGm1ZnPuG6pN46/vdEZ5greAcqJkUL/27EBRFYW
         gBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2BNm2Sy2P6jkCZbThkkqBfZaxS28xMnq4sQPLlpKVSc=;
        b=E6k+6n4oydudGz5CizP0wCrwG+h5q/JGrDrPRDpzmxjzDPc3jc275dhfXQRuV/eBih
         UhcLlHAaG3g7PHdbSO1CR6nG1/LNqebBtvq9p3GcNMvMNmEvotiLahIlTuGmsSvEAiKb
         3gxhj2pE1mJUJu96jTDsyZ6kZ1+LS9s0H9F7xfyb7rMVdqBOoUxZX6a4ThjYBgCP2tW6
         PKeusVLOYKmE5HssMi0HgTSgFwBp+rvCNcK5QbZFVjmcmqOJqwdTd3Ue9Db2+nHX0F6b
         KTYK9D7ZxiWCBmfe9yKzT8FNZz679n9EiR7jYXiiiis/vDYIzuxoJwuPEremlLd1FPvh
         oKww==
X-Gm-Message-State: AOAM530emFzFvLQnmeIJISEl3OiGRgceA1ESbiUz6ZTJR8IzyDsFVWJT
        HjUoztjSuRXICm/1srWLYPo=
X-Google-Smtp-Source: ABdhPJxunsRgQ2CCJLlBTWsCnLsHP+9AYoritUi0UOKmRkBpaGRwAA8k6z+KtBvdBCqVxt4KqfftJw==
X-Received: by 2002:a62:154a:0:b029:1e6:ca6b:d5c6 with SMTP id 71-20020a62154a0000b02901e6ca6bd5c6mr6133870pfv.47.1613686291089;
        Thu, 18 Feb 2021 14:11:31 -0800 (PST)
Received: from ?IPv6:2001:df0:0:200c:184:e9f:a921:953a? ([2001:df0:0:200c:184:e9f:a921:953a])
        by smtp.gmail.com with ESMTPSA id w3sm6233935pjt.24.2021.02.18.14.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 14:11:30 -0800 (PST)
Subject: Re: [RFC] IRQ handlers run with some high-priority interrupts(not
 NMI) enabled on some platform
To:     Arnd Bergmann <arnd@kernel.org>,
        Finn Thain <fthain@telegraphics.com.au>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "funaho@jurai.org" <funaho@jurai.org>,
        "philb@gnu.org" <philb@gnu.org>, "corbet@lwn.net" <corbet@lwn.net>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c46ddb954cfe45d9849c911271d7ec23@hisilicon.com>
 <CAK8P3a2adJsz5hRT_eMzSoHnUBC+aK9HZ18=oAYCZ-gisEkd1w@mail.gmail.com>
 <24e0652b3afa48cdbf7c83287e43c087@hisilicon.com>
 <CAK8P3a0fwMe9LaXMfKjH46yvt6o-euZJZ4HXtVRPhYbKvAUPKg@mail.gmail.com>
 <0b766dba0b004ced94131e158cd8e67d@hisilicon.com>
 <CAK8P3a2ZnKeeZ-zEWO+vHogs0DdLuDrZet61cSmJe_UMYhtaWQ@mail.gmail.com>
 <5148eb2aaceb42d78087bc6d8ce15183@hisilicon.com>
 <5fcea94e-6fc9-c340-d7d2-4ae8b69890b8@telegraphics.com.au>
 <0c0ea8eca77c45ea89f2d4432580211c@hisilicon.com>
 <28d4b91d-1774-a8a-df97-7ac9b365c2@telegraphics.com.au>
 <CAK8P3a0VquJPxvS8B=2kLQ5y=h5BftJDR7WJYmj3hgQ8yQY5=Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a8595ec5-88db-072c-9cc3-7a3a301fe191@gmail.com>
Date:   Fri, 19 Feb 2021 11:11:20 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0VquJPxvS8B=2kLQ5y=h5BftJDR7WJYmj3hgQ8yQY5=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 19/02/21 12:19 am, Arnd Bergmann wrote:

> drivers/net/ethernet/8390/apne.c
> drivers/net/ethernet/8390/ax88796.c
> drivers/net/ethernet/8390/hydra.c
> drivers/net/ethernet/8390/mac8390.c
> drivers/net/ethernet/8390/ne.c
> drivers/net/ethernet/8390/zorro8390.c
[...]
> Most of these are normal short-lived interrupts that only transfer
> a few bytes or schedule deferred processing of some sort.
> Most of the scsi and network drivers process the data in
> a softirq, so those are generally fine here, but I do see that 8390
> (ne2000) ethernet and the drivers/ide drivers do transfer their
> data in hardirq context.
>
>          Arnd

8390 ethernet drivers are widely used on m68k platforms (Amiga and 
Atari). At least on Amiga, the corresponding interrupt is a hardirq so 
I'd advise caution. That said, the 8390 drivers might benefit from some 
refactoring (the way these drivers are compiled does prevent e.g. the 
APNE driver from being used with two different variants of PCMCIA 
interfaces. I had begun some work on making IO primitives runtime 
selected two years ago but that ended up looking too ugly ...).

Can't recall what IPL the 8390 interrupts operate at - Geert?

Regarding allowing preemption of hardirqs - at least in 2017, that was 
considered perfectly OK (see Linus' comment on 
https://lore.kernel.org/patchwork/patch/794954/). I concur with Finn on 
this one - we did look for potential issues with the way irqs_disabled() 
is defined on m68k (for me, in the context of the above bug that caused 
memory corruption on my system), and found none.

Cheers,

     Michael

