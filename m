Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B1AC0015E
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jun 2023 21:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjFYVY1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jun 2023 17:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjFYVY0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jun 2023 17:24:26 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD5F18D
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jun 2023 14:24:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa99742af9so209705e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jun 2023 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728263; x=1690320263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJ2LafRfz7os09FITqhIzXchpbb/yMPyJ2Us3fSNtf0=;
        b=iTWoODUdaYt63IT2LCFFmF27v13vBU9cMCV96V34jkX9XShSfvrMiace/hecHAvK+0
         4vn4p2/zz9GSXEnpBM20uJ/iZlwZ+9WVjEKijGCZJ8AvTE3qb5MSmfjbZgIaw6YJfLe9
         WDUh34UW//HY8Dc/ItqAQsBhZwNr/XIhdjADfnlp3WlhxWJdOClYv2zcDffRZheFOUWB
         tYpErS6IaBm6ybKKh+47GuC1BShx0GrlNSnOsONy1IQsLm0YoEayGjCe60gnHaNIwXpH
         EKwUt7pNCwC/7GGfUEuYnQO2kJyx2Q9x/jv1O3BK/shZ6VwAZHMPhdVVMUlsTIghuGP9
         nDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728263; x=1690320263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ2LafRfz7os09FITqhIzXchpbb/yMPyJ2Us3fSNtf0=;
        b=KOP1M+Oo+gIzxVHOJLAUPutbbEvmDu8o6ygZQhKc2lCiDZaSA0S8IeQiwOnqXakmgK
         W9PGsorr8kjl0FtkPsPVHGBuYG1dqS5barTaevDMLb5Ebf/nXkJ70ODGt+zW2XSO3tiG
         S9Y8EOVghhTdDM8Yu3/RbI5XDMWiFirp4MSWi+QPHI05dnaondSM3/6jMLdY3kL5WzX1
         qw/0LZh1o0Po3VDuBl+dKnzj6twB3L+Br77K7NOxZf5egxKdYaT/J4/vjbLWr59pjr6y
         RtGitG/x/BpYQXzqSw+xrDLyxEnWW8BDdob8Xf6vK2k6iOhLHlrjSYyQobu/K9Tl4t22
         7Rkw==
X-Gm-Message-State: AC+VfDyF07BuPQd0UjQXcLUZFD/YsSbtXyybt7ObL7XsP+7DsVEK5MeL
        N8Rki0ZYZp9qs5//o9enEFT9Hg==
X-Google-Smtp-Source: ACHHUZ7owkSsDH94uGEOz/gQMPWu+sjhTMek700bGa8JgoZcFLJS995GaovHAQT/FzjooRzNe5f+tQ==
X-Received: by 2002:a1c:e914:0:b0:3f8:facf:7626 with SMTP id q20-20020a1ce914000000b003f8facf7626mr18367949wmc.20.1687728263150;
        Sun, 25 Jun 2023 14:24:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c228400b003f7e4d143cfsm5665000wmf.15.2023.06.25.14.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:24:22 -0700 (PDT)
Message-ID: <b751e028-598e-14fd-1f2b-34d1b9eed599@linaro.org>
Date:   Sun, 25 Jun 2023 23:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [patch 04/17] ia64/cpu: Switch to arch_cpu_finalize_init()
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-ia64@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.137045745@linutronix.de>
Content-Language: en-US
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230613224545.137045745@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 14/6/23 01:39, Thomas Gleixner wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-ia64@vger.kernel.org
> ---
>   arch/ia64/Kconfig            |    1 +
>   arch/ia64/include/asm/bugs.h |   20 --------------------
>   arch/ia64/kernel/setup.c     |    3 +--
>   3 files changed, 2 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

