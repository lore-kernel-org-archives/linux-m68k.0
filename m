Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B56BC27C76
	for <linux-m68k@archiver.kernel.org>; Sat, 28 Jan 2023 20:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjA1Ud5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 28 Jan 2023 15:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjA1Ud5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 28 Jan 2023 15:33:57 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49A523870
        for <linux-m68k@lists.linux-m68k.org>; Sat, 28 Jan 2023 12:33:55 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pLrtZ-001BPK-P2; Sat, 28 Jan 2023 21:33:53 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pLrtZ-000Yqq-Io; Sat, 28 Jan 2023 21:33:53 +0100
Message-ID: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
Date:   Sat, 28 Jan 2023 21:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>, port-m68k@netbsd.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Work on adding TLS support to LLVM on m68k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

The maintainers of the m68k backend in LLVM have started initial planning for adding
TLS support. An issue for that has been opened in the LLVM Github tracker [1].

If anyone can help shed more light on how TLS works on m68k, please add your comments
to this Github issue. Any information on the topic is highly appreciated.

Thanks,
Adrian

> [1] https://github.com/llvm/llvm-project/issues/60354

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
