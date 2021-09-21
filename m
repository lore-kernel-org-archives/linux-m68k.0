Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,T_DATE_IN_FUTURE_96_Q,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED13CC4338F
	for <linux-m68k@archiver.kernel.org>; Sat, 21 Aug 2021 21:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D444761262
	for <linux-m68k@archiver.kernel.org>; Sat, 21 Aug 2021 21:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhHUVPN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 21 Aug 2021 17:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhHUVPM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 21 Aug 2021 17:15:12 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DA5C061575
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Aug 2021 14:14:32 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q2so12752654pgt.6
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Aug 2021 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=UVJ9HtQ6uq1/AeWEwBkS287wJaT7LXUeIMe/Psiot+A=;
        b=bYfcVGQT9TRXiorlmo1QGnB9ARwcIcpmwfn8slt+Pm6tO2ksbhVUE8J9sb07LgLMGg
         56DzqZMtwc/4tfLlpmQTPsdEpuHZthdnsKRLDMnFvgGCiPidixY/5ZUzfhKgPeC4xlI/
         vI4CsX7xTwrZRgplzdan00qJKczM1N9VtUWo1mL52CxNcaM4RiTN671cb0ncDk3TztTU
         gsCv2m6n4KYGyFKMb92BXIeUHdjFt6v09YK1Gcb8FXN9TSLZyJGMSfrG4MmjxHKJ4lPp
         iBDZNrdff9z2vqI3MjQP8LPAjN+/5G+LAdCY3wSZeZ6kx82G32ATOYIiCDXuf8XWk8Fg
         WX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=UVJ9HtQ6uq1/AeWEwBkS287wJaT7LXUeIMe/Psiot+A=;
        b=gtOjDveVEUEmyUXMrj1n/LM5Lk7RZ0Vx99n0Kte5z/KU8m97tXYjqzpeNbgp3JF4a7
         LDCPpjJG/g5wynnCW/59Se5uhN6dVIw1Exn2QuDXU6Iv0W0OkZHMXdRVQlis0bE00UNx
         I3om/gOGStiw3yaqrZELi2DGmcj2xELsLfpTtVzFiIV+V5ud6EuM3m6n9yD+Xejsf7/j
         qyoy7GYgb7JEXrOCJXplP0BLYFTiyx7ARquXJF8dem/LBXAEJZGNs29cPFTMpSIc5rgp
         7fWyCR2EHvT/3JwZYNko4/t/iT6jyIdic+NIMB+T7Vp71bWhiB+msCcIvg2ofTbbb9Vq
         zoEw==
X-Gm-Message-State: AOAM532ZrrrJKRiEtmJU5K4GK+Tjis15i69LeVShdc4hEWnGtpXqBy4Q
        3AAEyZ4s64n+dsJr0iePS0c=
X-Google-Smtp-Source: ABdhPJwDCzM/J156k/ZCgN2HDDvHUF7eOqoj2f3KeykLVCTlftD6Zr2yj156TfoZ6/KlVVoIIYU7oA==
X-Received: by 2002:a63:111d:: with SMTP id g29mr25042209pgl.222.1629580472516;
        Sat, 21 Aug 2021 14:14:32 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id q3sm13698979pgf.18.2021.08.21.14.14.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Aug 2021 14:14:31 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schcmitz <schmitzmic@gmail.com>
Message-ID: <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
Date:   Wed, 22 Sep 2021 09:14:29 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20210816065851.GA26665@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

no errors seen after five days of testing. Adding in a VM stressor now ...

Cheers,

     Michael


On 16/08/21 18:58, Christoph Hellwig wrote:
> On Mon, Aug 16, 2021 at 07:17:15AM +1200, Michael Schmitz wrote:
>> Would it be acceptable to add this on top of the probe040/do_040writeback1
>> patch that I'm currently testing?
> Sure.

