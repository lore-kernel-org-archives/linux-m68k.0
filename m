Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E299C77B7A
	for <linux-m68k@archiver.kernel.org>; Tue, 30 May 2023 13:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjE3N1u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 May 2023 09:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbjE3N1t (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 30 May 2023 09:27:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA36F0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 May 2023 06:27:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C09363019;
        Tue, 30 May 2023 13:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C565C433A4;
        Tue, 30 May 2023 13:27:44 +0000 (UTC)
Message-ID: <84ff14e8-b864-f669-447e-392ece094005@linux-m68k.org>
Date:   Tue, 30 May 2023 23:27:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [linux-stable-rc:queue/5.15 17/69] m68k-linux-ld: section .rodata
 VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, oe-kbuild-all@lists.linux.dev,
        Sasha Levin <sashal@kernel.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <202305301407.z33zOjcG-lkp@intel.com>
 <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdVM1UoJ=s0TvPVcwzvDe1dHxJehL90WacE8ieirNPNwYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 30/5/23 19:02, Geert Uytterhoeven wrote:
> Hi Robot,
> 
> Thanks for your report!
> 
> On Tue, May 30, 2023 at 8:09 AM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
>> head:   45d082d2c0daa97f3ea394c47e705afdd1c621e0
>> commit: 43f232d748d57057e2e9dd041907c55177c50cf2 [17/69] m68k: Move signal frame following exception on 68020/030
>> config: m68k-randconfig-r035-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301407.z33zOjcG-lkp@intel.com/config)
> 
> FTR, this is a CONFIG_M68000/CONFIG_M68EZ328 config.
> 
>> compiler: m68k-linux-gcc (GCC) 12.3.0
>> reproduce (this is a W=1 build):
>>          mkdir -p ~/bin
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=43f232d748d57057e2e9dd041907c55177c50cf2
>>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>          git fetch --no-tags linux-stable-rc queue/5.15
>>          git checkout 43f232d748d57057e2e9dd041907c55177c50cf2
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202305301407.z33zOjcG-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> m68k-linux-ld: section .rodata VMA [00001000,0024925f] overlaps section .text VMA [00000400,00439aff]
> 
> This is not a regression introduced by the aforementioned commit.
> The same issue is present in 5.1.113, 5.1, and v6.4-rc4.

Indeed, that is an interesting one. Essentially the default values for
RAM and ROM regions causes this. Would be easy to fix for this specific case,
patch below, but it general would need region overlap checking to be totally
foolproof I think.

These defaults based on some old configs I had lying around. These addresses
seem to to be the values used on most uCsim, uCdimm and Xcopilot configs, so
probably makes sense to use them as the actual Kconfig default.

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 1f3574aef638..d06b1c5d9b0c 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -441,7 +441,7 @@ config ROM
  
  config ROMVEC
         hex "Address of the base of the ROM vectors"
-       default "0"
+       default "0x10c10000"
         depends on ROM
         help
           This is almost always the same as the base of the ROM. Since on all
@@ -450,7 +450,7 @@ config ROMVEC
  
  config ROMSTART
         hex "Address of the base of system image in ROM"
-       default "0x400"
+       default "0x10c10400"
         depends on ROM
         help
           Define the start address of the system image in ROM. Commonly this


Regards
Greg

