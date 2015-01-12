From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] net: smc91x: Remove unused definition of SMC_outw_be()
Date: Tue, 13 Jan 2015 08:10:58 +1300
Message-ID: <CAOmrzkJUQO=GL=DPXuwvngQf3__H8dLnyC_pncJYyww6GeDiWA@mail.gmail.com>
References: <1421015954-6743-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:58672 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbALTLA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 12 Jan 2015 14:11:00 -0500
Received: by mail-qg0-f50.google.com with SMTP id z60so19127491qgd.9
        for <linux-m68k@vger.kernel.org>; Mon, 12 Jan 2015 11:10:59 -0800 (PST)
In-Reply-To: <1421015954-6743-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Thanks Geert!

Cheers,

  Michael


On Mon, Jan 12, 2015 at 11:39 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> As of commit b7e10fc9c1205fc2 ("net: smc91x: Remove Atari special case
> handling for SMC_PUSH_DATA") SMC_outw_be() is unused. Remove it.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/net/ethernet/smsc/smc91x.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
> index 14c53252a73363c0..be67baf5f6778d08 100644
> --- a/drivers/net/ethernet/smsc/smc91x.h
> +++ b/drivers/net/ethernet/smsc/smc91x.h
> @@ -228,7 +228,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
>  #define SMC_inl(a, r)           readl((a) + (r))
>  #define SMC_outb(v, a, r)       writeb(v, (a) + (r))
>  #define SMC_outw(v, a, r)       writew(v, (a) + (r))
> -#define SMC_outw_be(v, a, r)    writew_be(v, (a) + (r))
>  #define SMC_outl(v, a, r)       writel(v, (a) + (r))
>  #define SMC_insw(a, r, p, l)    readsw((a) + (r), p, l)
>  #define SMC_outsw(a, r, p, l)   writesw((a) + (r), p, l)
> --
> 1.9.1
>
