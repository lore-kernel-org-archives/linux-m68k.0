Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0170C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 21:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90C552225E
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 21:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394466AbhARVE0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jan 2021 16:04:26 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:45135 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389206AbhARVER (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jan 2021 16:04:17 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l1bgA-00274T-Gs; Mon, 18 Jan 2021 22:03:14 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l1bg9-001lLl-ND; Mon, 18 Jan 2021 22:03:14 +0100
Subject: Re: Booting Linux on Sun3 machines
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sam Creasey <sammy@sammy.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
 <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
 <20210116010503.GI1344617@anhedonia> <20210118200110.GA3232@alpha.franken.de>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <2142e199-33b3-0369-14bf-8fb03ae61303@physik.fu-berlin.de>
Date:   Mon, 18 Jan 2021 22:03:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118200110.GA3232@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Thomas!

On 1/18/21 9:01 PM, Thomas Bogendoerfer wrote:
> On Fri, Jan 15, 2021 at 08:05:03PM -0500, Sam Creasey wrote:
>> Honestly, it probably doesn't boot.  The last kernel I knew to boot
>> successfully was 2.6.16, and that required patches.
> 
> I just checked and my latest running kernel was 3.8.0-rc2 and the local
> changes don't look too scary. Bootlog on a 3/160 emulated by TME below.

OK, we'll see how it goes with real hardware. I will hopefully hurl one or
two Sun3 up from my basement and see how far I'll get.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

