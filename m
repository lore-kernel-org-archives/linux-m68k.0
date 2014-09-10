From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari - update Kconfig.bus help text
Date: Wed, 10 Sep 2014 18:14:02 +0200
Message-ID: <87y4trqwqd.fsf@igel.home>
References: <1410337581-9246-1-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59166 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752335AbaIJQOG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Sep 2014 12:14:06 -0400
In-Reply-To: <1410337581-9246-1-git-send-email-schmitzmic@gmail.com> (Michael
	Schmitz's message of "Wed, 10 Sep 2014 20:26:21 +1200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, debian-68k@lists.debian.org

Michael Schmitz <schmitzmic@gmail.com> writes:

> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
> index b473f40..fea83ca 100644
> --- a/arch/m68k/Kconfig.bus
> +++ b/arch/m68k/Kconfig.bus
> @@ -52,8 +52,10 @@ config ATARI_ROM_ISA
>  	  This option enables support for the ROM port ISA adapter used to
>  	  operate ISA cards on Atari. Only 8  bit cards are supported, and
>  	  no interrupt lines are connected.
> -	  The only driver currently using this adapter is the EtherNEC
> -	  driver for RTL8019AS based NE2000 compatible network cards.
> +	  The only drivers currently using this adapter are the NE2000 ISA
> +	  driver for EtherNEC (RTL8019AS based NE2000 compatible network
> +          cards), and drivers for the NetUSBee (RTL8019AS / ISP1160 ethernet/
> +          USB combo card).

Please use consistent spacing.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
