Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5722C636D7
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 14:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbjBUOvC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 09:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234546AbjBUOu6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 09:50:58 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8084527D74
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 06:50:54 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pUTym-0002gM-UZ; Tue, 21 Feb 2023 15:50:52 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pUTym-003wtg-Nl; Tue, 21 Feb 2023 15:50:52 +0100
Message-ID: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
Subject: Kernel versions 6.x don't boot on Amiga 4000
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     linux-m68k@lists.linux-m68k.org
Cc:     debian-68k@lists.debian.org
Date:   Tue, 21 Feb 2023 15:50:52 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

I tested Debian's most recent m68k kernels from the 6.0.x and 6.1.x series and
neither of these boot on my Amiga 4000/060. Both get stuck at the ABCDGHIJK
message.

Will try earlier kernels until I found the one where the breakage was introduced.
Currently known latest kernel to work is 5.10.5.

FWIW, I noticed that the kernel image itself is already over 7 MB, not sure
whether this is a problem.

Anyone else tried a recent kernel on their Amigas?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
