Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560A4C05027
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Jan 2023 10:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjATKvd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Jan 2023 05:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjATKvd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Jan 2023 05:51:33 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072DE8F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Jan 2023 02:51:32 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pIozZ-003cTK-U0; Fri, 20 Jan 2023 11:51:29 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pIozZ-001AwQ-No; Fri, 20 Jan 2023 11:51:29 +0100
Message-ID: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
Date:   Fri, 20 Jan 2023 11:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Min-Yih Hsu <minyihh@uci.edu>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: LLVM buildbot for m68k backend has been moved to production
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

For a number of weeks, the LLVM buildbot which cross-compiles the M68K backend
has been "green", i.e. builds and testsuite have passed without problems [1].

As a consequence, I have asked the admin of the LLVM buildbot master server to
move our buildbot from staging to production. After receiving approval yesterday,
I moved the buildbot to production now [2].

Another step forward in maturing the M68K backend in LLVM. More news on the backend
coming soon, I'm preparing a longer report.

Thanks,
Adrian

> [1] https://lab.llvm.org/staging/#/builders/180
> [2] https://lab.llvm.org/buildbot/#/builders/192

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
