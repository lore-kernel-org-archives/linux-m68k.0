Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57742C77B7C
	for <linux-m68k@archiver.kernel.org>; Sun,  7 May 2023 09:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjEGJCt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 May 2023 05:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEGJCs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 May 2023 05:02:48 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7805255A9
        for <linux-m68k@lists.linux-m68k.org>; Sun,  7 May 2023 02:02:47 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pvaI2-001QTD-1C; Sun, 07 May 2023 11:02:46 +0200
Received: from p57bd9c27.dip0.t-ipconnect.de ([87.189.156.39] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pvaI1-003MVA-QW; Sun, 07 May 2023 11:02:45 +0200
Message-ID: <5a46ed40ce55b04b7a53591b10cfcc925b468501.camel@physik.fu-berlin.de>
Subject: The tale of -mrtd in GCC and Clang
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Sun, 07 May 2023 11:02:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.156.39
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Good Morning!

While working on the RTD issue in the M68k backend in LLVM, Min dug a bit into
the hisstory of the "-mrtd" flag in GCC and Clang and turns out it's actually
much more interesting than we first thought.

See: https://m680x0.github.io/blog/2023/05/the-tale-of-mrtd.html

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
