Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84FBC38A02
	for <linux-m68k@archiver.kernel.org>; Sun, 30 Oct 2022 08:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiJ3Iji (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 30 Oct 2022 04:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiJ3Ijh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 30 Oct 2022 04:39:37 -0400
X-Greylist: delayed 227 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 30 Oct 2022 01:39:33 PDT
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09085306
        for <linux-m68k@lists.linux-m68k.org>; Sun, 30 Oct 2022 01:39:32 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1op3nC-0020cA-U2; Sun, 30 Oct 2022 09:35:42 +0100
Received: from dynamic-089-012-000-229.89.12.pool.telefonica.de ([89.12.0.229] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1op3nC-002p3S-Nx; Sun, 30 Oct 2022 09:35:42 +0100
Message-ID: <33ac34c9-6b74-8eb7-1a62-a2a110188336@physik.fu-berlin.de>
Date:   Sun, 30 Oct 2022 09:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Debian m68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: m68k support now available in the Mold linker
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.0.229
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

After a small crowd-funding campaign, the Mold linker [1] gained support for
the m68k architecture [2].

I haven't had any time to test the changes yet, but if anyone else is interested,
please give it a try and report back any issues you may find.

Adrian

> [1] https://www.phoronix.com/news/Mold-1.6-Linker
> [2] https://github.com/rui314/mold/commit/5fe60e3b6d75b72ab43f8571bf16b09959ad1a95

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
