Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA346C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Dec 2022 12:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbiLSMb5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Dec 2022 07:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbiLSMbf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Dec 2022 07:31:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA90111A33
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 04:29:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4FB15B80DE4;
        Mon, 19 Dec 2022 12:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75158C433EF;
        Mon, 19 Dec 2022 12:29:52 +0000 (UTC)
Message-ID: <01873b14-43fc-d955-bbca-8b596b398f93@linux-m68k.org>
Date:   Mon, 19 Dec 2022 22:29:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] m68k: nommu: Fix misspellings of "uCdimm"
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
References: <c1509bb9df16934e2629e1e2b00644f6585c7114.1670919502.git.geert@linux-m68k.org>
Content-Language: en-US
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <c1509bb9df16934e2629e1e2b00644f6585c7114.1670919502.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 13/12/22 18:18, Geert Uytterhoeven wrote:
> Arcturus Networks produced the "uCsimm" and "uCdimm" modules.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Looks good. Do you want me to push this through the m68knommu tree?

Regards
Greg


> ---
>   arch/m68k/Kconfig.machine | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 53c45ccda5647b5d..b7a70297fbc1a5a6 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -192,11 +192,11 @@ config UCSIMM
>   	  Support for the Arcturus Networks uCsimm module.
>   
>   config UCDIMM
> -	bool "uDsimm module support"
> +	bool "uCdimm module support"
>   	depends on !MMU
>   	select M68VZ328
>   	help
> -	  Support for the Arcturus Networks uDsimm module.
> +	  Support for the Arcturus Networks uCdimm module.
>   
>   config DRAGEN2
>   	bool "DragenEngine II board support"
