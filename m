Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C1FC433E9
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Mar 2021 21:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94D0665267
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Mar 2021 21:38:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhCHVh7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Mar 2021 16:37:59 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:49441 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229446AbhCHVhp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 Mar 2021 16:37:45 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1lJNZO-003gQk-0O; Mon, 08 Mar 2021 22:37:42 +0100
Received: from p57bd9fdc.dip0.t-ipconnect.de ([87.189.159.220] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1lJNZN-003NeX-QH; Mon, 08 Mar 2021 22:37:41 +0100
To:     Debian m68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: M68k backend has landed in LLVM
Message-ID: <2d5be765-cf44-ee47-bc18-f3678d78052c@physik.fu-berlin.de>
Date:   Mon, 8 Mar 2021 22:37:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.159.220
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

For anyone interested, there is now an experimental backend for M68k
in LLVM that was just added today [1].

Please report any issues to the LLVM bug tracker, and, if necessary link
the issue to this umbrella bug [2].

Adrian

> [1] https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/M68k
> [2] https://bugs.llvm.org/show_bug.cgi?id=48791

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
