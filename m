Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8EAC47086
	for <linux-m68k@archiver.kernel.org>; Tue, 25 May 2021 21:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17709613AD
	for <linux-m68k@archiver.kernel.org>; Tue, 25 May 2021 21:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhEYVbL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 May 2021 17:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhEYVbL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 May 2021 17:31:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34E0C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 May 2021 14:29:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w33so40287166lfu.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 May 2021 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yn3fl1fZB0VOpwc1b4wth7TBINMg9VY7zs7B0HHCpNE=;
        b=Jr5XAZqP7SiSwza7IIsoYX/ZNbF3/7pLq+iT9XGpywM350Tooz+97LFyTDYZyrVxeW
         1jouhV3u7LOyQxPDg/C3ufISP5D350ZyxfTOdmR+1FCrq+s4QhJs0to/xosjEiOCGHXP
         tq4Ffi3dktnrbiA3M8DmJxdnQjigeZpYhDotuJLK0a6CiMF7jwhJy55icNy4sqraUxeX
         K73kL+XWPWn4++6qjdsflr0pmcu8obWS8TEK2QaJYElV/vyj+buNgD3YSkrB7FiG0NL7
         g7BOpaZ+Yo63i+6VeA6qMNRnLRQpXS6YA6xc8pbf8yR3sE33sqOViQoyUXdZHC3zeu0t
         9eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yn3fl1fZB0VOpwc1b4wth7TBINMg9VY7zs7B0HHCpNE=;
        b=jbS5Lxlg1VBR8GwIINu+1JRS3FXwpL8roohTIUUW9RlHAb2VAErcbAqJk2FBGGwn63
         2+h2jYshMoufB64kmEUAES1JM8halrnr7ZZ1YK2UDwb6/QF0LpZBIQQbxvOZ9Pz8kRlP
         zdmtacDKHgsa1svYSbat59O4q0DPnDcQfG+6VSIWcZvjaBt9klbOPS09Fga/IChBn4eH
         Z7oX42FTxTVTxNUaMI4A1kLWor2QgYvtJTMmlW+7kYo2g671wWTjMa1tAcRSh3EQtS+o
         SUnAs8dQGqqKWWYZfdd8lEvF+Sih4Owl/opzJUbdULuUI2UZxY+TIft3LfJb/b+wvxIk
         TiRQ==
X-Gm-Message-State: AOAM532H95ximpv0X7VEbowhsL0049BX2WqXTytZuREE046MPrJIhMH3
        eNjlE1iVFPp3Z5fonxlOL/4=
X-Google-Smtp-Source: ABdhPJyz9+7HTvrltQyjbzWHNILgCza4grBtexvZEuKDFSl3fCl0S1elsmUVsZdsNhR9dOu/iicCOQ==
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr14819793lfz.340.1621978179080;
        Tue, 25 May 2021 14:29:39 -0700 (PDT)
Received: from [192.168.2.145] (46-138-180-236.dynamic.spd-mgts.ru. [46.138.180.236])
        by smtp.googlemail.com with ESMTPSA id x12sm2221450ljc.70.2021.05.25.14.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 14:29:38 -0700 (PDT)
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK
 enabled
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
References: <20210523232556.15017-1-digetx@gmail.com>
 <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
 <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
 <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com>
Date:   Wed, 26 May 2021 00:29:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

25.05.2021 15:19, Geert Uytterhoeven пишет:
...
>>> There 3 possible solutions:
>>>
>>> 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
>>> 2. Build stubs universally, maybe using weak functions.
>>
>> I vote for this one - global stubs.
> 
> Yep.
> 
>> Or for a new one:
>> 4. Disable COMPILE_TEST for specific platforms (mentioned in commit
>> msg). Eventually could be like:
>> config RALINK
>>         depends !COMPILE_TEST || (COMPILE_TEST && COMMON_CLK)
> 
> That's a neat idea!
> 
> Of course there's a fifth option:
> 
> 5. Convert legacy platforms to COMMON_CLK.
> 
> Which is already happening for ARM EP93XX.

I'll try to take a closer look at alternative options, thank you for
yours input.
