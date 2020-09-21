Return-Path: <SRS0=iw/Y=C6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79140C43463
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 12:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FF1B216C4
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 12:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIUMWX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:22:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgIUMWW (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 21 Sep 2020 08:22:22 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77A8620EDD;
        Mon, 21 Sep 2020 12:22:21 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: include SDHC support only when hardware has it
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
References: <20200921030858.3899744-1-gerg@linux-m68k.org>
 <CAMuHMdWnkh+WpRbQ-SELxHsyZfeaCBH5Ly8-KJFrNzSdMYCd_w@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <f93c2ba0-837b-ce9f-f882-ce3a3f54689f@linux-m68k.org>
Date:   Mon, 21 Sep 2020 22:22:18 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWnkh+WpRbQ-SELxHsyZfeaCBH5Ly8-KJFrNzSdMYCd_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 21/9/20 5:23 pm, Geert Uytterhoeven wrote:
> On Mon, Sep 21, 2020 at 5:09 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> The mere fact that the kernel has the MMC subsystem enabled (CONFIG_MMC
>> enabled) does not mean that the underlying hardware platform has the
>> SDHC hardware present. Within the ColdFire hardware defines that is
>> signified by MCFSDHC_BASE being defined with an address.
>>
>> The platform data for the ColdFire parts is including the SDHC hardware
>> if CONFIG_MMC is enabled, instead of MCFSDHC_BASE. This means that if
>> you are compiling for a ColdFire target that does not support SDHC but
>> enable CONFIG_MMC you will fail to compile with errors like this:
>>
>>      arch/m68k/coldfire/device.c:565:12: error: ‘MCFSDHC_BASE’ undeclared here (not in a function)
>>         .start = MCFSDHC_BASE,
>>              ^
>>      arch/m68k/coldfire/device.c:566:25: error: ‘MCFSDHC_SIZE’ undeclared here (not in a function)
>>         .end = MCFSDHC_BASE + MCFSDHC_SIZE - 1,
>>                           ^
>>      arch/m68k/coldfire/device.c:569:12: error: ‘MCF_IRQ_SDHC’ undeclared here (not in a function)
>>         .start = MCF_IRQ_SDHC,
>>              ^
>>
>> Make the SDHC platform support depend on MCFSDHC_BASE, that is only
>> include it if the specific ColdFire SoC has that hardware module.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Fixes: 991f5c4dd2422881 ("m68k: mcf5441x: add support for esdhc mmc controller")
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Yep, will add, thanks Geert.

Regards
Greg


> Gr{oetje,eeting}s,
> 
>                          Geert
> 
