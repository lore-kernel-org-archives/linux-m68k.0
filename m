Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83061C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Dec 2021 09:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235779AbhL0J2D (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Dec 2021 04:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbhL0J2C (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Dec 2021 04:28:02 -0500
X-Greylist: delayed 505 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Dec 2021 01:28:02 PST
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E61C06173E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 01:28:02 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4JMsYw4wRKz1sCwH;
        Mon, 27 Dec 2021 10:19:32 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4JMsYw4RJyz1qqkB;
        Mon, 27 Dec 2021 10:19:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id T45w46u3pAhI; Mon, 27 Dec 2021 10:19:31 +0100 (CET)
X-Auth-Info: majyy0NQwjSFk230xmI+suEEuXQ4Iu13a86kP1EJyPp/HFLQtBOYhldVgB8YzLnp
Received: from igel.home (ppp-46-244-168-165.dynamic.mnet-online.de [46.244.168.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 27 Dec 2021 10:19:31 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 32F112C37F3; Mon, 27 Dec 2021 10:19:31 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k/kernel: array out of bound access in
 process_uboot_commandline
References: <20211227090917.35838-1-hbh25y@gmail.com>
X-Yow:  What PROGRAM are they watching?
Date:   Mon, 27 Dec 2021 10:19:31 +0100
In-Reply-To: <20211227090917.35838-1-hbh25y@gmail.com> (Hangyu Hua's message
        of "Mon, 27 Dec 2021 17:09:17 +0800")
Message-ID: <87h7aus8v0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Dez 27 2021, Hangyu Hua wrote:

> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 928dbd33fc4a..05eca6f653b5 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -101,5 +101,8 @@ __init void process_uboot_commandline(char *commandp, int size)
>  	}
>  
>  	parse_uboot_commandline(commandp, len);
> -	commandp[len - 1] = 0;
> +	if (len > 0)
> +		commandp[len - 1] = 0;
> +	else
> +		commandp[0] = 0;

If len == 0 then even commandp[0] is OOB.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
