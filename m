Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF2FFA3741
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Oct 2022 15:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbiJaP76 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Oct 2022 11:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiJaP75 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Oct 2022 11:59:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F14764D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Oct 2022 08:59:56 -0700 (PDT)
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1667231995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yeubx61jFuBO+3wr4/Lz2VpcaM+NzZvGi1ThDvT7wNs=;
        b=Mi0HlkhuLZh9nD3YLX1Ke8+/NEKgPUy6CZpztxtr4D03gISEpGHk8tbLyR2UwNPWNZ373u
        QoHmNuShXx+IC2InrU44W7LXgBAwNEOIO5K1cnqii+1fo7hAQkov2D4c+hM988d7uyvk1H
        6mFUtKcMc3JpCubu3gUSp+LJeRlSk7qgTkgRuur+rtFJFnGhBhgw/IsOJCytn2Z5Y39bfz
        UrnadmZXwnXNEPznrN0X+7drBfgnH9Pa75nyH/OEqoVF6fKxmloo0o0wVURIjDRMDSLSL2
        zSL+JQQvR/8huAHm35QlRfviDrhaZKoQsptSb95uLzf+mFgilrBBN2letFih1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1667231995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yeubx61jFuBO+3wr4/Lz2VpcaM+NzZvGi1ThDvT7wNs=;
        b=oUMs3mkUZsw41oJd4DXxp7CK57tKyNBmDqa6f1T4XK1RLcCtyXvumzpLHjhrpN8GBXIaHa
        jnD2RcCjleuBggCg==
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH printk v2 06/38] tty: nfcon: use console_is_enabled()
In-Reply-To: <Y1Jspm1n3t0bgIym@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-7-john.ogness@linutronix.de>
 <Y1Jspm1n3t0bgIym@alley>
Date:   Mon, 31 Oct 2022 17:05:54 +0106
Message-ID: <87fsf49e6d.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 2022-10-21, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
>> index 557d60867f98..c542fc2b121f 100644
>> --- a/arch/m68k/emu/nfcon.c
>> +++ b/arch/m68k/emu/nfcon.c
>> @@ -151,7 +151,7 @@ static int __init nfcon_init(void)
>>  
>>  	nfcon_tty_driver = driver;
>>  
>> -	if (!(nf_console.flags & CON_ENABLED))
>> +	if (!console_is_enabled(&nf_console))
>
> Heh, the check of CON_ENABLED does not make much sense. IMHO, the
> important thing is whether the console is in console_list or not.
>
> I would personally add a check at the beginning of register_console()
> whether the console is already registered and enabled() and do
> nothing when already done.

Actually, register_console() already has this check, but it does a
WARN(). If the debug setup is used for nfcon, this situation is
normal. So probably to avoid the WARN, the CON_ENABLED code was added.

> I would be nice to fix this. But it might be done later.

I could add a console_is_registered() function that checks if the
console is in the console list and use that instead. If we are going to
touch this code, we might as well touch it correctly, right?

John
