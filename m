Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC59C636D4
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Feb 2023 22:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjBAWR3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Feb 2023 17:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjBAWR3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Feb 2023 17:17:29 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175436224F
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Feb 2023 14:17:27 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pNLPy-001duD-Ce; Wed, 01 Feb 2023 23:17:26 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pNLPy-000fDo-5k; Wed, 01 Feb 2023 23:17:26 +0100
Message-ID: <45aa9faee34d73515abcc073812ae1d32f821e3d.camel@physik.fu-berlin.de>
Subject: m68k assembly question: jsr vs. bsr
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Wed, 01 Feb 2023 23:17:25 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

Can anyone answer this question regarding the difference between "bsr" and "jsr":

> https://github.com/llvm/llvm-project/issues/60354#issuecomment-1412018845

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
