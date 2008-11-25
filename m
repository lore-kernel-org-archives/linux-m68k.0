From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [PATCH] MVME16x: add support for EARLY_PRINTK
Date: Tue, 25 Nov 2008 02:26:53 +0100
Message-ID: <200811250226.54137.zippel@linux-m68k.org>
References: <1227186532.19809.3.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp-vbr10.xs4all.nl ([194.109.24.30]:1753 "EHLO
	smtp-vbr10.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102AbYKYBfB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 24 Nov 2008 20:35:01 -0500
In-Reply-To: <1227186532.19809.3.camel@kars.perseus.home>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k kernel mailing list <linux-m68k@vger.kernel.org>

Hi,

On Thursday 20. November 2008, Kars de Jong wrote:

> diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
> index f53b6d5..e0283a0 100644
> --- a/arch/m68k/Kconfig.debug
> +++ b/arch/m68k/Kconfig.debug
> @@ -2,4 +2,15 @@ menu "Kernel hacking"
>
>  source "lib/Kconfig.debug"
>
> +config EARLY_PRINTK
> +	bool "Early printk" if EMBEDDED
> +	depends on MVME16x
> +	default y
> +	help

This is really misnamed, the option is mvme specific but the name is rather 
generic. Depending on the code size you could include the code 
unconditionally (like we do on other ports).

bye, Roman
