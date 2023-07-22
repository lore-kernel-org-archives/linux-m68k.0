Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64D6EB64DA
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 15:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbjGVP0Q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 11:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjGVP0P (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 11:26:15 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE884270F
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 08:26:11 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4R7Vcw44Brz1r5rm;
        Sat, 22 Jul 2023 17:26:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4R7Vcw3k2vz1qqlW;
        Sat, 22 Jul 2023 17:26:08 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id jylz2rE7Kdnh; Sat, 22 Jul 2023 17:26:07 +0200 (CEST)
X-Auth-Info: xWjMGcPxIbgSB2F0sNA88zSVzBIJbyp90bKRPXYAbXyqGoUO9q/k93305SNXHKZ1
Received: from igel.home (aftr-62-216-205-254.dynamic.mnet-online.de [62.216.205.254])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 22 Jul 2023 17:26:07 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 84CBA2C1357; Sat, 22 Jul 2023 17:26:07 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
In-Reply-To: <ZLvrd+tk6HiqB2Qk@casper.infradead.org> (Matthew Wilcox's message
        of "Sat, 22 Jul 2023 15:45:11 +0100")
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
        <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
        <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
        <ZLngEXDdrAKSw+90@casper.infradead.org>
        <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
        <87edl0lazh.fsf@linux-m68k.org>
        <ZLvrd+tk6HiqB2Qk@casper.infradead.org>
X-Yow:  Mr and Mrs PED, can I borrow 26.7% of the RAYON TEXTILE production
 of the INDONESIAN archipelago?
Date:   Sat, 22 Jul 2023 17:26:07 +0200
Message-ID: <87tttwezn4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 22 2023, Matthew Wilcox wrote:

> On Sat, Jul 22, 2023 at 08:24:34AM +0200, Andreas Schwab wrote:
>> On Jul 21 2023, Michael Schmitz wrote:
>> 
>> > static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>> >                 volatile unsigned long *p)
>> > {
>> >         unsigned char *cp = (unsigned char *) p;
>> >         char result;
>> >         char mask = 1 << nr;    /* nr guaranteed to be < 7 */
>> >
>> >         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
>> >                 : "=d" (result)
>> >                 : "i" (mask), "o" (*(cp+3))
>> 
>> That should use "id" as constraint, so that the compiler can share the
>> constant with other insns.  Also, the third operand is modified, so it
>> needs to be marked as in/out.
>
> The "o" constraint is shared with bfset_mem_set_bit,
> bfclr_mem_test_and_clear_bit and a few other functions.  Should they
> all be changed?

They use a memory clobber, because the "o" constraint cannot accurately
describe the situation there.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
