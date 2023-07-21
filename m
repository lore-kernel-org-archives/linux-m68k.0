Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52654EB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 09:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjGUJSr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 05:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjGUJSp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 05:18:45 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895362D7F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 02:18:41 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4R6kWJ5f2vz1sCln;
        Fri, 21 Jul 2023 11:18:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
        by mail.m-online.net (Postfix) with ESMTP id 4R6kWJ4Wnfz1qqlY;
        Fri, 21 Jul 2023 11:18:36 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id QkHZwIE1IdQ0; Fri, 21 Jul 2023 11:18:35 +0200 (CEST)
X-Auth-Info: MV7j8UdYbb3qTpimROpGrV+T4gj2G0naUNnk5e9o8D00aq3UccPeUksdYTd8HR1S
Received: from igel.home (aftr-62-216-205-254.dynamic.mnet-online.de [62.216.205.254])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 21 Jul 2023 11:18:35 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id A54C32C135A; Fri, 21 Jul 2023 11:18:35 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Brad Boyer <flar@allandria.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
In-Reply-To: <20230721085711.GA6785@allandria.com> (Brad Boyer's message of
        "Fri, 21 Jul 2023 01:57:11 -0700")
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
        <87jzut6acw.fsf@linux-m68k.org> <20230721085711.GA6785@allandria.com>
X-Yow:  What I want to find out is -- do parrots know much about Astro-Turf?
Date:   Fri, 21 Jul 2023 11:18:35 +0200
Message-ID: <87bkg5bp1w.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 21 2023, Brad Boyer wrote:

> On Fri, Jul 21, 2023 at 08:34:55AM +0200, Andreas Schwab wrote:
>> On Jul 20 2023, Matthew Wilcox wrote:
>> 
>> > +static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>> > +               volatile unsigned long *p)
>> > +{
>> > +       char result;
>> > +       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
>> > +
>> > +       __asm__ __volatile__ ("eori %1, %2; smi %0"
>> 
>> Why are you using XOR if you want to clear a bit?  If it operates on a
>> byte, why does it receive a pointer to long?
>
> I presume the thing with byte is to try to save an extension word.

Why is this hardcoded in the function name?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
