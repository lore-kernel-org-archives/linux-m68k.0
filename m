Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FB4C001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 11:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjGXLnO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 07:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjGXLnO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 07:43:14 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06CACF
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VRFGvsd2W9bVpPij7+OPil/g/ywidwS5norFY+pdc9g=; b=iZsWT8K0sNoDfcjBd0lmkLe2vE
        NMM/ccjYqoryU+qlWHMapCwdkIcMTy2X958KCmQ5pbzaEqG+U+ZK1EK8z7FqLn9UMO7PWmCHcD2ma
        lkbRd5kEsQjHl1ObRK9wJEFppHrLtUyIcnLtVjna3xvkc28t0tODu2Ju2Hvk+JjqMjojyzeXVrh6G
        aRZxFpx5ezExl/cYaJJUfJgWwyHZqMMQz4EnGph/JDob1n8nbaQKZ9aBrnKkyXzRFcrWIqH6wcdax
        ah/PkIy2JeGHhxPLU8Wybo1gr1AiTgpwkFlSEmR3sULkC4IP1BFAAjhK4O3dzjzPa/puDtJYAz+Ud
        9Pf/D92w==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qNtxq-002roq-23;
        Mon, 24 Jul 2023 12:42:58 +0100
Date:   Mon, 24 Jul 2023 12:42:58 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZL5jwoXAU5t8S+E6@sowerbutts.com>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>I was left with the impression that the Q40 does not actually have the IDE
>controller on the ISA bus.

This is mistaken.

IDE is definitely accessed over the ISA bus.

There is some documentation on the Q40/Q60 hardware here:
http://www.q40.de/download/harddoc.pdf

The motherboard integrates the CPU, DRAM, video DRAM and display controller, 
audio DACs, RTC, interrupt controller, keyboard controller, and an LED 
output.

There are two ISA slots where all other I/O devices are connected. These are 
described (concisely!) on page 7 of the linked manual:

8-bit ISA I/O cycles are performed for CPU byte accesses to 0xFF400001 + 4 * ISA address

16-bit ISA I/O cycles are performed for CPU word accesses to 0xFF400000 + 4 * ISA address

8-bit ISA memory cycles are performed for CPU byte accesses to 0xFF800001 + 4 * ISA address

16-bit ISA memory cycles are performed for CPU word accesses to 0xFF800000 + 4 * ISA address

I understand that the machines originally shipped with a 16-bit ISA card 
based on the W83787IF "PC super I/O" chip, integrating a floppy controller, 
IDE interface, game port, parallel port, and two 16550A UARTs.

My Q40 came without this card, so I am using a card based on the similar 
W83757 chip (the serial ports are 16450 instead of 16550A, it doesn't support 
the fancy EPP/ECP parallel port modes).

>> > It might be a good idea to verify that IDE works in v5.13
>> Yes, please do.

It did.

>And please also verify it's broken after 44b1fbc0f5f30e66 was applied.

I will try to do that!

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

