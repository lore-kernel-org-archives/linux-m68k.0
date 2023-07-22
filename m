Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0BDEB64DA
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 06:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjGVGYn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 02:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjGVGYm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 02:24:42 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89DF359B
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 23:24:39 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4R7Gc35KvDz1s95D;
        Sat, 22 Jul 2023 08:24:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4R7Gc34rxyz1qqlS;
        Sat, 22 Jul 2023 08:24:35 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id bJGcMcUCB8fA; Sat, 22 Jul 2023 08:24:35 +0200 (CEST)
X-Auth-Info: K9/EVTAXgrK8iSFMiuGidiZfV0x8Ed5unVT8fc86nB6rw9JdauDWgANL93UMtQsA
Received: from tiger.home (aftr-62-216-205-254.dynamic.mnet-online.de [62.216.205.254])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 22 Jul 2023 08:24:34 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
        id 981901D2C84; Sat, 22 Jul 2023 08:24:34 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
In-Reply-To: <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com> (Michael
        Schmitz's message of "Fri, 21 Jul 2023 13:43:06 +1200")
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
        <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
        <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
        <ZLngEXDdrAKSw+90@casper.infradead.org>
        <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
X-Yow:  My mind is a potato field...
Date:   Sat, 22 Jul 2023 08:24:34 +0200
Message-ID: <87edl0lazh.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 21 2023, Michael Schmitz wrote:

> static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>                 volatile unsigned long *p)
> {
>         unsigned char *cp = (unsigned char *) p;
>         char result;
>         char mask = 1 << nr;    /* nr guaranteed to be < 7 */
>
>         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
>                 : "=d" (result)
>                 : "i" (mask), "o" (*(cp+3))

That should use "id" as constraint, so that the compiler can share the
constant with other insns.  Also, the third operand is modified, so it
needs to be marked as in/out.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
