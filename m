Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D13C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 21:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiBNVge (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:36:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbiBNVg0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 16:36:26 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CB513CDA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 13:36:18 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id l9so9947557plg.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=KsSnXJrW9HJ8IjY5gxzBvOw+14u1fcDhKpwWi/hz4wQ=;
        b=Uq54cevmmZrUotsnuYv1XiHRoW0wrmWB8dwgg2GTIsqqHhSmwl5lDwgbvmlgOKkTYQ
         5lyhkWt1SCt9xfcD1jWeNy3yHCY/stdscEyBpCwoJZ2I1y6IcN7qr9dv4gZzVUD0rjVg
         HIgV/TVJt2i/pmEWQwazrP2oU8pf8e7rKwGxAmpHtaZUWtBkXx3zazZ6StCxQjyZ+LxB
         xWqw25OiDIM3d3VFJsAPS7zIiUdiBbT30ScytbYsfR1UbywrEKScvL4eOsboHHAOOzwZ
         dJhlH/JTRvdRMuRfA/eWGBpuVn481ZePM71942snL1jdbvfBPIWv3nyuB1kyJjbJ2tKh
         Tdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=KsSnXJrW9HJ8IjY5gxzBvOw+14u1fcDhKpwWi/hz4wQ=;
        b=aECIzfFk9jU/0F8lhUsid5tbrGBE7J7alBP2y8bVfcMSgZoaQUWsozZA5rkk2MwEZg
         5zPy+qYuxlb1b8radfZ3a99GoikZT8tnEGXdDrzYXqnNPVPNFraqHrulG6G82TuZIzGI
         gApGxBaCyKNvYlixCBBR8/wCPgnXE4YNk0nAIK4+BsIsIO8+X8KPE3DvwQlEQOHsGUdc
         mQHbOzz8GJE+m1pCGE5E7gCPm2uD4nhO+H9bBI3HS3JSpqt0bem8/60MwtsG7zAs9L6M
         XzUc4veZ7mdV9mdbaxexdVYYPg80VK4L8FZDc5iYN+mgWW1lKl7pwHnLq2lxN/oiz10w
         cXJQ==
X-Gm-Message-State: AOAM531S7kmZkad9/GDFWrwMSmkZke+Sg57aPqsOXJGKC74oxso+5U4n
        KfLCY4QGO9IK9nekc9nl+mE=
X-Google-Smtp-Source: ABdhPJyYxQX3ad+waw/w0xOdrfoFZ+tiN950Q0BBb5eT95s/IcLwWbw85VeRsODo47V9j6mQgBgL/Q==
X-Received: by 2002:a17:90b:4a02:b0:1b8:d3c7:7a2b with SMTP id kk2-20020a17090b4a0200b001b8d3c77a2bmr743992pjb.194.1644874577924;
        Mon, 14 Feb 2022 13:36:17 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f5e5:b852:89ee:52d? ([2001:df0:0:200c:f5e5:b852:89ee:52d])
        by smtp.gmail.com with ESMTPSA id v20sm14830407pju.9.2022.02.14.13.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:36:17 -0800 (PST)
Message-ID: <b23c83d4-487e-5273-a750-e08c1e9fd899@gmail.com>
Date:   Tue, 15 Feb 2022 10:36:12 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Wrong colors on ARAnyM
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
 <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
In-Reply-To: <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 15/02/22 09:50, Michael Schmitz wrote:
>
> Either way, I think we've got operator precedence wrong here. Shift 
> takes precedence over bitwise and / or? With that precedence, what we 
> have in summary is
>
>                 shifter_tt.color_reg[regno] =
>                         (((red & 0xe000) >> 13) | ((red & 0x1000) >> 
> 4)) |
>                         (((green & 0xe000) >> 13) | ((green & 0x1000) 
> >> 8)) |
>                         ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 
> 12);
>
> Only the blue bits ever entirely seem to end up where they ought to. 
> Testing this hypothesis on ARAnyM (without getting it to boot all the 
> way, for some odd reason likely to do with my current .config) shows 
> that the current code results in the shifter_tt.color_reg entries 
> either 5 or 0x17, 0x113 or 0x117. Adding the missing parentheses 
> results in what I'd expect to see.
>
I can confirm that the bug is gone with additional parentheses to apply 
the shifts (<<8 for red, <<4 for green) to the result of the bit-wise 
or, not just the right-hand portion of it.

Do you want me to prepare a patch, or would you prefer to do it yourself?

Cheers,

     Michael


