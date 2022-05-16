Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FE3C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 16 May 2022 06:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbiEPGtn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 May 2022 02:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiEPGtm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 16 May 2022 02:49:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FFDDF6C
        for <linux-m68k@vger.kernel.org>; Sun, 15 May 2022 23:49:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE3CAB80B55
        for <linux-m68k@vger.kernel.org>; Mon, 16 May 2022 06:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FA8C385AA;
        Mon, 16 May 2022 06:49:37 +0000 (UTC)
Message-ID: <ffbdafc8-f123-9d25-9d48-a090a3c82e12@linux-m68k.org>
Date:   Mon, 16 May 2022 16:49:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] m68knommu: fix undefined reference to `_init_sp'
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
References: <20220513075216.4112333-1-gerg@linux-m68k.org>
 <CAMuHMdVMQbW_XbzzdUX9Ub7EcvBMn=BRRQ82X8q6N7UaMj-78w@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdVMQbW_XbzzdUX9Ub7EcvBMn=BRRQ82X8q6N7UaMj-78w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 16/5/22 16:27, Geert Uytterhoeven wrote:
> On Sat, May 14, 2022 at 4:33 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> When configuring a nommu classic m68k system enabling the uboot parameter
>> passing support (CONFIG_UBOOT) will produce the following compile error:
>>
>>     m68k-linux-ld: arch/m68k/kernel/uboot.o: in function `process_uboot_commandline':
>>     uboot.c:(.init.text+0x32): undefined reference to `_init_sp'
>>
>> The logic to support this option is only used on ColdFire based platforms
>> (in its head.S startup code). So make the selection of this option
>> depend on building for a ColdFire based platform.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert.
Applied, and now pushed to the public m68knommu git tree, for-next branch.

Regards
Greg



> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
