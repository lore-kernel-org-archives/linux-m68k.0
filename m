Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA19C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Nov 2022 13:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiKJN7B (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Nov 2022 08:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiKJN7A (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Nov 2022 08:59:00 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AC41D0D2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Nov 2022 05:58:58 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 8AF001FCD6;
        Thu, 10 Nov 2022 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1668088737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8+BR4g4FYShDqBfZbOAElSZtj5E+C1NfPswxdJoJeCM=;
        b=PR2axcRFy2cLXU3lQMCGZInPKcc7R/mhN9Ym13PoeMjIPr5OrcwO0lrQ8TaFPHPUcnPpa9
        UKLbf0NrHvlJLewX71/DZGRo0B9Q6UwaTActSK02Y3kDpB+bI3q5CaMj6bnRdwznIBHtSf
        rg6KN08uWZuU3lw6I5E7JtNbgeuPo+0=
Received: from suse.cz (unknown [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 360112C141;
        Thu, 10 Nov 2022 13:58:57 +0000 (UTC)
Date:   Thu, 10 Nov 2022 14:58:56 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH printk v3 24/40] tty: nfcon: use console_is_registered()
Message-ID: <Y20DoLPsrfgm528O@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-25-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-25-john.ogness@linutronix.de>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon 2022-11-07 15:22:22, John Ogness wrote:
> Currently CON_ENABLED is being (mis)used to identify if the console
> has been registered. This is not reliable because it can be set even
> though registration failed or it can be unset, even though the console
> is registered.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/m68k/emu/nfcon.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
> index 557d60867f98..292669fa480f 100644
> --- a/arch/m68k/emu/nfcon.c
> +++ b/arch/m68k/emu/nfcon.c
> @@ -49,14 +49,14 @@ static void nfcon_write(struct console *con, const char *str,
>  static struct tty_driver *nfcon_device(struct console *con, int *index)
>  {
>  	*index = 0;
> -	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
> +	return console_is_registered(con) ? nfcon_tty_driver : NULL;
>  }
>  
>  static struct console nf_console = {
>  	.name	= "nfcon",
>  	.write	= nfcon_write,
>  	.device	= nfcon_device,
> -	.flags	= CON_PRINTBUFFER,
> +	.flags	= CON_PRINTBUFFER | CON_ENABLED,

This causes that register_console() will always put the console into
console_list. It causes regression, see below.


>  	.index	= -1,
>  };
>  
> @@ -106,10 +106,8 @@ static int __init nf_debug_setup(char *arg)
>  		return 0;
>  
>  	stderr_id = nf_get_id("NF_STDERR");
> -	if (stderr_id) {
> -		nf_console.flags |= CON_ENABLED;
> +	if (stderr_id)
>  		register_console(&nf_console);

My understanding is that this should enable the console
when debug=nfcon kernel parameter is used.

It is a non-standard way. This is why CON_ENABLED flag
has to be explicitly set.

> -	}
>  
>  	return 0;
>  }
> @@ -151,7 +149,7 @@ static int __init nfcon_init(void)
>  
>  	nfcon_tty_driver = driver;
>  
> -	if (!(nf_console.flags & CON_ENABLED))
> +	if (!console_is_registered(&nf_console))
>  		register_console(&nf_console);

This calls register_console() when it was not already
registered by the debug=nfcon early parameter.

It is the standard way. It should enable the console only
when console=nfcon is defined on the commandline. Or when
there is no preferred console and no console enabled by default yet.

We should not pre-set CON_ENABLED in this case.

Best Regards,
Petr
