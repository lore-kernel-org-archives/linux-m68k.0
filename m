Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA16C761A6
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Mar 2023 00:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjCUAKF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 20:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjCUAKF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 20:10:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932C0EB56
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 17:10:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5410FB8107D;
        Tue, 21 Mar 2023 00:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5D4C433EF;
        Tue, 21 Mar 2023 00:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679357401;
        bh=EJtjR7BOHMOTkea9e96bCqvYUnOPBRnLYJVtCK05GVQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=F4UeGaoOL8B0wGHYiiIYPUYr0BFjZsEXjh8pkkRJ12XDg/bDglH0WnxUz4D92yyy/
         kVdBg25H4pZgCLUfbbPP3MfsO7jGlu5CoK8LxnXjk7m/Oth0GUAQL8NHge383aQdPO
         /LKvhgJrtS87dmJ961VfOlbo6j3Sj8c2ushxe7OWXN6PZ+0OgcbMr6SVUhbz1X1vhG
         QC3D1d5l7AyAjGMlKSXd7G2n3GCeD8HMiO9pEoRMAoVgY78iJhn5NP2jNXrOWkWCRj
         F8gTW6+CVjidtD/S81dzRYE/wR7YNALnDVBxOB68MuLnFR/ix0H28/4n9pjXqY7fqP
         AYaxhOxcuMMZQ==
Message-ID: <cc53723d-e7ab-5e75-aaa1-33da75118d9d@kernel.org>
Date:   Tue, 21 Mar 2023 10:09:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] m68k: Kconfig.machine: remove obsolete configs ROMBASE
 and ROMSIZE
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230320135418.2055-1-lukas.bulwahn@gmail.com>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20230320135418.2055-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Lukas,

On 20/3/23 23:54, Lukas Bulwahn wrote:
> The configs ROMBASE and ROMSIZE were used in arch/m68k/68360/head-ram.S,
> which was removed with commit a3595962d824 ("m68knommu: remove obsolete
> 68360 support").
> 
> Remove the obsolete configs ROMBASE and ROMSIZE.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Looks good thanks.

I have pushed this into the m68knommu git tree, for next branch,
after adding Geerts Fixes and Reviewed-by tags.

Regards
Greg


> ---
>   arch/m68k/Kconfig.machine | 17 -----------------
>   1 file changed, 17 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index e2f961208f18..255d50574065 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -439,15 +439,6 @@ config ROM
>   	  that can be stored in flash, with possibly the text, and data
>   	  regions being copied out to RAM at startup.
>   
> -config ROMBASE
> -	hex "Address of the base of ROM device"
> -	default "0"
> -	depends on ROM
> -	help
> -	  Define the address that the ROM region starts at. Some platforms
> -	  use this to set their chip select region accordingly for the boot
> -	  device.
> -
>   config ROMVEC
>   	hex "Address of the base of the ROM vectors"
>   	default "0"
> @@ -465,14 +456,6 @@ config ROMSTART
>   	  Define the start address of the system image in ROM. Commonly this
>   	  is strait after the ROM vectors.
>   
> -config ROMSIZE
> -	hex "Size of the ROM device"
> -	default "0x100000"
> -	depends on ROM
> -	help
> -	  Size of the ROM device. On some platforms this is used to setup
> -	  the chip select that controls the boot ROM device.
> -
>   choice
>   	prompt "Kernel executes from"
>   	help
