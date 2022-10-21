Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FF7C4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Oct 2022 09:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiJUJzz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Oct 2022 05:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJUJzy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Oct 2022 05:55:54 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6F5134DDC
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Oct 2022 02:55:52 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 27EC722675;
        Fri, 21 Oct 2022 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1666346151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HxqbreIej8kQ5drCoi6hOXxUOBVelHaLyCniqxau/pE=;
        b=XTn7Zk88JVUqzZqWlAYi6RwUsuSWbj28BQunDujCN8w8AGpynTSyNgSeGKrKRGNVURbLqv
        KDFc2JydB5JfVoDLjNtrH5YgZhsLfye7rPnVHBYLBcRCF6/WLR+3X7XxmHCCCMa+gxMVus
        avc/wDefBSKTw/M/5/YfpJn4cYK2xpw=
Received: from suse.cz (unknown [10.100.208.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id E29AB2C15D;
        Fri, 21 Oct 2022 09:55:50 +0000 (UTC)
Date:   Fri, 21 Oct 2022 11:55:50 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH printk v2 06/38] tty: nfcon: use console_is_enabled()
Message-ID: <Y1Jspm1n3t0bgIym@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-7-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019145600.1282823-7-john.ogness@linutronix.de>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed 2022-10-19 17:01:28, John Ogness wrote:
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  arch/m68k/emu/nfcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
> index 557d60867f98..c542fc2b121f 100644
> --- a/arch/m68k/emu/nfcon.c
> +++ b/arch/m68k/emu/nfcon.c
> @@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
>  static struct tty_driver *nfcon_device(struct console *con, int *index)
>  {
>  	*index = 0;
> -	return (con->flags & CON_ENABLED) ? nfcon_tty_driver : NULL;
> +	return console_is_enabled(con) ? nfcon_tty_driver : NULL;
>  }
>  
>  static struct console nf_console = {
> @@ -151,7 +151,7 @@ static int __init nfcon_init(void)
>  
>  	nfcon_tty_driver = driver;
>  
> -	if (!(nf_console.flags & CON_ENABLED))
> +	if (!console_is_enabled(&nf_console))

Heh, the check of CON_ENABLED does not make much sense. IMHO, the important
thing is whether the console is in console_list or not.

I would personally add a check at the beginning of register_console()
whether the console is already registered and enabled() and do
nothing when already done.

I would be nice to fix this. But it might be done later.

The replacement is straightforward. Both checks are or might be racy.
Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

>  		register_console(&nf_console);
>  
>  	return 0;

