Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A779AC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 19:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86BA261211
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Nov 2021 19:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhKRT3P (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Nov 2021 14:29:15 -0500
Received: from smtprelay0192.hostedemail.com ([216.40.44.192]:33868 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230193AbhKRT3P (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 18 Nov 2021 14:29:15 -0500
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Nov 2021 14:29:15 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id E28D518195907
        for <linux-m68k@vger.kernel.org>; Thu, 18 Nov 2021 19:18:48 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9DED318224D66;
        Thu, 18 Nov 2021 19:18:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 95985E0000B1;
        Thu, 18 Nov 2021 19:18:41 +0000 (UTC)
Message-ID: <2c686a4d3980e2362199162f5baf9d4f4dd5892d.camel@perches.com>
Subject: Re: [PATCH net v11 3/3] net/8390: apne.c - add 100 Mbit support to
 apne.c driver
From:   Joe Perches <joe@perches.com>
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
Cc:     alex@kazik.de, netdev@vger.kernel.org
Date:   Thu, 18 Nov 2021 11:18:44 -0800
In-Reply-To: <20211114234005.335-4-schmitzmic@gmail.com>
References: <20211114234005.335-1-schmitzmic@gmail.com>
         <20211114234005.335-4-schmitzmic@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 95985E0000B1
X-Stat-Signature: jk1whqntjqy7fefta9fqm77kxisyaabo
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+e7+m+EyBG8HL71CBxUDxbIcurGZfp81s=
X-HE-Tag: 1637263121-80960
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 2021-11-15 at 12:40 +1300, Michael Schmitz wrote:
> Add module parameter, IO mode autoprobe and PCMCIA reset code
> required to support 100 Mbit PCMCIA ethernet cards on Amiga.
[]
> diff --git a/drivers/net/ethernet/8390/apne.c b/drivers/net/ethernet/8390/apne.c
[]
> @@ -119,6 +119,48 @@ static u32 apne_msg_enable;
[]
> +	cftuple_len = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256);
> +	if (cftuple_len < 3)
> +		return 0;
> +#ifdef DEBUG
> +	else
> +		print_hex_dump(KERN_WARNING, "cftable: ", DUMP_PREFIX_NONE, 8,
> +			       sizeof(char), cftuple, cftuple_len, false);
> +#endif

Why KERN_WARNING and why not use print_hex_dump_debug without the #ifdef

[]
> +#ifdef DEBUG
> +	pr_info("IO flags: %x\n", cftable_entry.io.flags);

pr_debug ?


