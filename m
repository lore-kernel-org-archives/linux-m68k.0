Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3CFC433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Nov 2022 14:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiKJOTI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Nov 2022 09:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKJOTH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Nov 2022 09:19:07 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D58CDFB9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Nov 2022 06:19:05 -0800 (PST)
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1668089943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CLHBQggQls4mWIgeZbw7Mj4Foog8Zgpi+AZP3I0LDjo=;
        b=TeyzoeMBsyYpwQEcZ7EWDcxKdM1GA5YG3rA9Rd/s6Mj/hMRJt/CpMZqEY2AONXSU5QtyvO
        PXdvYEzwGP3Ulb+OiWg35ZaYuNuAI3CHWUqqEPfBQLNfvmOQ/ZXjJImfXkGx7uy0XfTQWA
        vmtCMPHTIqnf8FO54hbFouDBVPzGZ69l2EBCngFRZNG9G1I2tpXDMAO1QHwU968mx4yzod
        HXi5s97LggtkkmtA56Lwre1sjoZRcHFgJVMPKk8B1dzPVlGI31nSoS8gV3GOhutszYS7WC
        tFXYCVanN6ah4JTrlmFUNPzD2QkKPYd2rL2q+btcRzXBjjzUkvooQ2dN6jXKPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1668089943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CLHBQggQls4mWIgeZbw7Mj4Foog8Zgpi+AZP3I0LDjo=;
        b=XVCMkXBronBmd1KX+rOaAL7HrZZrturZw18aI93S+jm3mmMSItyqIEZXc2Qx33a+nZGgqy
        nib2Diw68mRskRAg==
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH printk v3 24/40] tty: nfcon: use console_is_registered()
In-Reply-To: <Y20DoLPsrfgm528O@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-25-john.ogness@linutronix.de>
 <Y20DoLPsrfgm528O@alley>
Date:   Thu, 10 Nov 2022 15:25:02 +0106
Message-ID: <87cz9u6gfd.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 2022-11-10, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
>> index 557d60867f98..292669fa480f 100644
>> --- a/arch/m68k/emu/nfcon.c
>> +++ b/arch/m68k/emu/nfcon.c
>> @@ -49,14 +49,14 @@ static void nfcon_write(struct console *con, const char *str,
>>  static struct tty_driver *nfcon_device(struct console *con, int *index)
>>  {
>>  	*index = 0;
>> -	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
>> +	return console_is_registered(con) ? nfcon_tty_driver : NULL;
>>  }
>>  
>>  static struct console nf_console = {
>>  	.name	= "nfcon",
>>  	.write	= nfcon_write,
>>  	.device	= nfcon_device,
>> -	.flags	= CON_PRINTBUFFER,
>> +	.flags	= CON_PRINTBUFFER | CON_ENABLED,
>
> This causes that register_console() will always put the console into
> console_list. It causes regression, see below.

Agreed. Nice catch. I will remove initializing with CON_ENABLED.

>>  	.index	= -1,
>>  };
>>  
>> @@ -106,10 +106,8 @@ static int __init nf_debug_setup(char *arg)
>>  		return 0;
>>  
>>  	stderr_id = nf_get_id("NF_STDERR");
>> -	if (stderr_id) {
>> -		nf_console.flags |= CON_ENABLED;
>> +	if (stderr_id)
>>  		register_console(&nf_console);
>
> My understanding is that this should enable the console
> when debug=nfcon kernel parameter is used.
>
> It is a non-standard way. This is why CON_ENABLED flag
> has to be explicitly set.

Understood. I will add a comment explaining why CON_ENABLED is set here.

>> -	}
>>  
>>  	return 0;
>>  }
>> @@ -151,7 +149,7 @@ static int __init nfcon_init(void)
>>  
>>  	nfcon_tty_driver = driver;
>>  
>> -	if (!(nf_console.flags & CON_ENABLED))
>> +	if (!console_is_registered(&nf_console))
>>  		register_console(&nf_console);
>
> This calls register_console() when it was not already
> registered by the debug=nfcon early parameter.
>
> It is the standard way. It should enable the console only
> when console=nfcon is defined on the commandline. Or when
> there is no preferred console and no console enabled by default yet.
>
> We should not pre-set CON_ENABLED in this case.

Agreed. The hunk itself is OK.

John
