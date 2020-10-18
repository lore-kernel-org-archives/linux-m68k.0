Return-Path: <SRS0=enim=DZ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23967C433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 18 Oct 2020 23:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D504C22280
	for <linux-m68k@archiver.kernel.org>; Sun, 18 Oct 2020 23:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbgJRXpA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 18 Oct 2020 19:45:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729370AbgJRXpA (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 18 Oct 2020 19:45:00 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31E6422266;
        Sun, 18 Oct 2020 23:44:57 +0000 (UTC)
Subject: Re: [PATCH 2/2] m68k: m68328: remove duplicate code
To:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20201015123258.2644027-1-arnd@arndb.de>
 <20201015123258.2644027-2-arnd@arndb.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <ab3a33d0-7a3a-f12b-244d-24195c06f3fc@linux-m68k.org>
Date:   Mon, 19 Oct 2020 09:44:53 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015123258.2644027-2-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

Overall looks good.


On 15/10/20 10:32 pm, Arnd Bergmann wrote:
[snip]
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 694c4fca9f5d..a65ce7618232 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -35,7 +35,7 @@ endchoice
>   if M68KCLASSIC
>   
>   config M68000
> -	bool "MC68000"
> +	bool
>   	depends on !MMU
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
> @@ -102,21 +102,21 @@ config M68060
>   	  processor, say Y. Otherwise, say N.
>   
>   config M68328
> -	bool "MC68328"
> +	bool
>   	depends on !MMU
>   	select M68000
>   	help
>   	  Motorola 68328 processor support.
>   
>   config M68EZ328
> -	bool "MC68EZ328"
> +	bool
>   	depends on !MMU
>   	select M68000
>   	help
>   	  Motorola 68EX328 processor support.
>   
>   config M68VZ328
> -	bool "MC68VZ328"
> +	bool
>   	depends on !MMU
>   	select M68000
>   	help
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 17e8c3a292d7..1851c66e8667 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -136,14 +136,13 @@ config SUN3
>   
>   	  If you don't want to compile a kernel exclusively for a Sun 3, say N.
>   
> -endif # M68KCLASSIC
> -
>   config PILOT
>   	bool
>   
>   config PILOT3
>   	bool "Pilot 1000/5000, PalmPilot Personal/Pro, or PalmIII support"
> -	depends on M68328
> +	depends on !MMU
> +	select M68328

Given that M68328 depends on !MMU do you also need or want that here?

Regards
Greg



