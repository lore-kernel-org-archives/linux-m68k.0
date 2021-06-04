Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7023CC47096
	for <linux-m68k@archiver.kernel.org>; Fri,  4 Jun 2021 00:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4682A611CA
	for <linux-m68k@archiver.kernel.org>; Fri,  4 Jun 2021 00:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhFDAYZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 3 Jun 2021 20:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFDAYY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Jun 2021 20:24:24 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC454C06174A
        for <linux-m68k@vger.kernel.org>; Thu,  3 Jun 2021 17:22:30 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id 69so3755848plc.5
        for <linux-m68k@vger.kernel.org>; Thu, 03 Jun 2021 17:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HE7n1N/ZLvbq3wFi7GOHpvVJsp5C4gHp8FFZqf7V/6Y=;
        b=DnZ/Debt1T04NQNc4rbWk1hfbdZuWCfKjKnjFgq7RUDhfxS3te8ByhmglAZOkW/e8g
         lYkxthRBeg3v8n2aLiJoEXOrJ1mddLU92Wy1C3iMz6vAXW4y516rO5364ibjeXODzHt7
         bnxcx5ELpD1Ir339WjVk9TrpxzWEdFD6hx+Ey1eKuONRQRVsZYCdtgz1BcBbLWho29Sq
         3AaHYVx2oMBxVRgJDtAI4CB2uwHPwmMu7Udg9vmMrriWZxPezbJmRzLgYVG3VdtYYSvv
         aBZTnygSsn65PQoAjv/ZMUlHTYIw+8ABuqU6gvi+cs95ChGnsofFfS8JZGidLN/8U/W3
         HhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HE7n1N/ZLvbq3wFi7GOHpvVJsp5C4gHp8FFZqf7V/6Y=;
        b=U3NM5mBOZd9zYIBdGZK1yD/QmMMwMqvr1dutm+Qs1pgW+3m+lNlh3cbtqMgCcujpvO
         S32sr1UregajP+nRxhIqyRTWFhTqardqebtMOTC4GZL2Ue8J04e1WVeMuZyHeLuhB6sm
         hiUwlHSjZtxvdhX+2oXMc4nf0/WQr2srUCBFYv6LMiH1IlclNAg6y7WRvsP8B/4iQi4S
         9DYwMdPLcJZzzqI+FlotarbIWB5FZvQQUyplkzy4iUPsy27JzJFBIvhtXKyFhIngAkGB
         dlLH261zw19sA4xRnLDl0kSSzoDGW65YxCjyhdIpJTFw/sajuDt/+0mNKTS5efzOiIOj
         INng==
X-Gm-Message-State: AOAM533S5b/U/0QOkASv3mhhriCXmme8mo4t/CbUX7GxCrm8UDr323Q+
        e/UEfDh8DBFmjFRqWZL9W0wurxXxen4=
X-Google-Smtp-Source: ABdhPJyjyG1l/TK+64NClOQiHYOjmXl6K4GW3PJi++kW3Am7+gw/fVg+KsLOx6JSKsdlz6Vzr6jGpA==
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id p4-20020a1709026b84b02900eef9661911mr1583808plk.69.1622766150310;
        Thu, 03 Jun 2021 17:22:30 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a568:11f5:f38b:e899? ([2001:df0:0:200c:a568:11f5:f38b:e899])
        by smtp.gmail.com with ESMTPSA id l3sm202995pgb.77.2021.06.03.17.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 17:22:29 -0700 (PDT)
Subject: Re: [PATCH RFC 0/2] Fix m68k multiplatform ISA support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, fthain@linux-m68k.org
References: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
 <1622611267-15825-1-git-send-email-schmitzmic@gmail.com>
 <4f52cce1-e894-c224-a42b-18cce4f61056@gmail.com>
 <CAMuHMdVqpBs2ZCZord_KYyQG0uVd7TkA532YvFkpbSi07odwLA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ec2e17c4-fad4-3e14-4547-a72f392c3cce@gmail.com>
Date:   Fri, 4 Jun 2021 12:22:25 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVqpBs2ZCZord_KYyQG0uVd7TkA532YvFkpbSi07odwLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 3/06/21 7:09 pm, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Thu, Jun 3, 2021 at 5:44 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Point of detail: don't forget to run 'make clean' after applying this
>> series. Modules are not automatically rebuilt after changes to our
>> io_mm.h (should they?)
> Yes they should.  If not, that's a bug in the build system.

Thanks - tried again and it's OK now. I appear to have lost the NE2000 
config option when switching EtherNEC and ROM port support on and off 
repeatedly while testing config combinations, and picked up stale 
modules from an earlier build.

Sorry about the noise ...

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
