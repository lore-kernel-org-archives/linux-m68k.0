Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5CEC54EBC
	for <linux-m68k@archiver.kernel.org>; Sun,  8 Jan 2023 05:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjAHFGD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 8 Jan 2023 00:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAHFGC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 8 Jan 2023 00:06:02 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2348E271B1
        for <linux-m68k@lists.linux-m68k.org>; Sat,  7 Jan 2023 21:05:59 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pENsb-001gbp-2Q; Sun, 08 Jan 2023 06:05:57 +0100
Received: from p57bd9ee4.dip0.t-ipconnect.de ([87.189.158.228] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pENsa-001WLv-SS; Sun, 08 Jan 2023 06:05:57 +0100
Message-ID: <52c4d532-9aff-f76d-6e62-f9cfb7c76ce7@physik.fu-berlin.de>
Date:   Sun, 8 Jan 2023 06:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Debian m68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: LLVM developer is looking for advise on TLS support in m68k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.158.228
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

There is a bug in M68K LLVM backend which, according to the upstream maintainer,
might be related to an issue with TLS on m68k, see [1].

Could anyone with some insight on the TLS code in glibc chime in?

Thanks,
Adrian

> [1] https://github.com/llvm/llvm-project/issues/59161#issuecomment-1374701127

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
