Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ECBECAAD4
	for <linux-m68k@archiver.kernel.org>; Sat,  3 Sep 2022 07:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiICH2Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 3 Sep 2022 03:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiICH2X (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 3 Sep 2022 03:28:23 -0400
X-Greylist: delayed 186 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Sep 2022 00:28:22 PDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE4FE726F
        for <linux-m68k@lists.linux-m68k.org>; Sat,  3 Sep 2022 00:28:22 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1oUNWj-000cYP-MP; Sat, 03 Sep 2022 09:25:13 +0200
Received: from dynamic-077-011-101-180.77.11.pool.telefonica.de ([77.11.101.180] helo=[192.168.1.9])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1oUNWj-002GoI-GK; Sat, 03 Sep 2022 09:25:13 +0200
Message-ID: <b4887030-35b9-56fd-072a-316f69ec5676@physik.fu-berlin.de>
Date:   Sat, 3 Sep 2022 09:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: Booting Kernel on Amiga 3000
Content-Language: en-US
To:     debian-68k@lists.debian.org
References: <20220903102453.296ce496@vk3heg>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20220903102453.296ce496@vk3heg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.101.180
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stephen!

Might be a wise idea to cross-post this to the Linux/m68k kernel mailing list.

Also, kernel 5.19.6 is currently being built and should be available soonish.

Adrian

On 9/3/22 02:24, Stephen Walsh wrote:
> I have "Debian GNU/Linux bookworm/sid" installed on both Qemu-user and
> real hardware.
> 
> Amiga 3000
> Warpengine 68040@40Mhz
> 128Mb ram on warpengine
> 8Mb Fast ram on MB
> 2Mb Chip ram
> X-surf Network card (Original)
> Kickstart 3.2
> 
> Qemu is working with no issues.
> 
> Real hardware issue:
> 
> Booting kernel/inintrid 5.15.0-2 works and the machine boots all the
> way.
> 
> Trying to boot with kernel/initrid 5.18.0-1 through to 5.18.0-4 results
> in a grey screen and the machine doing nothing after amiboot loads in
> the kernel. I have  left it for 20 minutes with no change. Booting
> 5.15.0-2 starts showing the boot process after a couple of minutes.
> 
> 
> amiboot -k vmlinux-5.15.0-2-m68k -r initrd.img-5.15.0-2-m68k
> root=/dev/sda2 fb=false
> 
> When trying the newer kernel's, all I'm doing is replacing the
> kernel/initrid with the newer versions.
> 
> 
> 
> 

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
