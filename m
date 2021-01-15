Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8113C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 19:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4FCD221E2
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 19:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730515AbhAOTHt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Jan 2021 14:07:49 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55791 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729560AbhAOTHt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Jan 2021 14:07:49 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l0UR9-000njT-KG; Fri, 15 Jan 2021 20:07:07 +0100
Received: from pd9f74830.dip0.t-ipconnect.de ([217.247.72.48] helo=[192.168.178.23])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l0UR8-001ixU-W5; Fri, 15 Jan 2021 20:07:07 +0100
Subject: Re: BigRAMPlus seems to be detected now
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>
References: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
Message-ID: <db240bc7-b552-b3ec-e934-cb06414c174f@physik.fu-berlin.de>
Date:   Fri, 15 Jan 2021 20:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 217.247.72.48
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

On 3/7/20 10:00 PM, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> There is one user in the #debian-68k IRC channel who has tried installing Debian
> on his A4000 with a A3660 and a BigRAMPlus installed and while the user is currently
> running into problems with the kernel being stuck, to my surprise, the kernel seems
> to be able to use and detect the extra memory from the BigRAMPlus (see below).
> 
> The kernel is reporting an address conflict though:
> 
> [    6.140000] Zorro: Probing AutoConfig expansion devices: 3 devices
> [    6.150000]  zorro: Address space collision on device Zorro device 12128600 (Individual Computers) [??? 0x50000000-]
> 
> The question whether the lock up is caused by the BRP. But since this Amiga has only
> 16 MB FAST RAM, the user hasn't tested to boot without the BRP yet.
> 
> I will dig out my BRP tomorrow and see if it's actually detected in my A4000
> as well with current kernel versions.

So, it turned out that with "tomorrow" I meant "almost one year later". I found
my BigRAMPlus now and my Amiga 4000 is up and running at home now - except I'm
not home at the moment.

Depending on how the Covid-19 situation develops the next days, I will be back
home and install the BigRAMPlus and verify whether it can be used as RAM these
days now.

Would be great to have 384 MB RAM in my Amiga 4000 ;).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

