Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6F3C6FD18
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 19:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbjDYTWI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 15:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjDYTWG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 15:22:06 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418051618B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Apr 2023 12:22:05 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1prOEl-0023db-Kt; Tue, 25 Apr 2023 21:22:03 +0200
Received: from p5b13a35e.dip0.t-ipconnect.de ([91.19.163.94] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1prOEl-0040Vp-Dr; Tue, 25 Apr 2023 21:22:03 +0200
Message-ID: <daf231511ce43a9d8ff84949e6d021365c95471f.camel@physik.fu-berlin.de>
Subject: m68k support in libseccomp finally merged upstream
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Tue, 25 Apr 2023 21:22:02 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.163.94
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

My patch for adding m68k support to libseccomp has finally been merged:

> https://github.com/seccomp/libseccomp/commit/dd5c9c24e8ba11c9c3ee6b60c93cef64a9ad5c86

We're will be able to use the seccomp functionality on m68k on machines running
kernel 6.3 once the new upstream version of libseccomp has been released.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
