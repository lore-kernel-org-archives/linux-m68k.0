Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9161DEDEC50
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjIMNGK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236618AbjIMNGK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:06:10 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5FC19B9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:06:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 608D0CE21B9;
        Wed, 13 Sep 2023 13:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80D8C433C7;
        Wed, 13 Sep 2023 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694610361;
        bh=PTcovfF8qFvk5uRecmbbRoLkW5vFnvN6KUH9DwMenCY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZOymRGP0EULuMHij0Dvewso2cCPvGFDsK4azd8OvGo2ti+EXqTJl16b/WBWPjz6pg
         rsOp4CU+/q1QuGpXLOKytw2bAbVz5zck+DlgzLC1Tacn5lKYRt+CkYql4MDQ0zOHqI
         xRmcIOHWrJvUJXMuFjd/x/Gnw4J1u/mYf0OxRllWuIVNyx1J88G6ZY+rDee8Mm1uAW
         zc9+0SZMYdYAiL7GDDhVdYmnu6OaJzmj/fAD9EF0tahPIMPhUgGIgPY+wClCGDgFHD
         JD9VWVm6JGOutrAJzV/ElhIS4hXAW1MmfU/3aTe2xLT4KgwLe1Ad1kxZJQOb5nMvq7
         eAgU2F69xNN6g==
Message-ID: <e5ce60b3-f666-30ab-dc42-a7ebd330dfd0@kernel.org>
Date:   Wed, 13 Sep 2023 23:05:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] m68knommu: improve config ROM setting defaults
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
References: <20230913125159.2128567-1-gerg@kernel.org>
 <CAMuHMdUhpXWfvu+sF+ARaXbeMrkxNA=e-tDNE2+nZberqqyCYQ@mail.gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CAMuHMdUhpXWfvu+sF+ARaXbeMrkxNA=e-tDNE2+nZberqqyCYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 13/9/23 23:00, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> Thanks for your patch!
> 
> On Wed, Sep 13, 2023 at 2:52 PM Greg Ungerer <gerg@kernel.org> wrote:
>> From: Greg Ungerer <gerg@linux-m68k.org>
>>
>> The ROM region configuration settings used on some nommu m68k systems
>> (historically mostly 68328 (Dragonball) CPUs) default to an address
>> of 0. That can easily clash with default RAM address settings which
>> also default to 0. Of course that is invalid and those ranges overlap,
>> but if you make no value selection that is what you end up with. Those
>> default values produce a valid configuration but will fail compilation
>> like this:
>>
>>      m68k-linux-ld: section .rodata VMA [0000000000001000,0000000000262227] overlaps section .text VMA [0000000000000400,0000000000455e7f]
>>
>> Looking at the platforms that use the ROM region configuration settings
>> it is clear that we can choose much better defaults than 0. By far the
>> most comman ROM region settings are these:
> 
> common
> 
>>      CONFIG_ROMVEC=0x10c10000
>>      CONFIG_ROMSTART=0x10c10400
>>
>> So lets make these the default values.
>>
>> It is still possible to configure overlapping ROM and RAM regions, but
>> at least the defult selections are now valid.
> 
> default

And I thought I spell checked them before sending :-(
I'll fix those up, thanks!

Regards
Greg


>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
