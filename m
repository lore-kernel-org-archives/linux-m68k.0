Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0C353A64
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jul 2026 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336970; cv=none; b=ODyL5gjNT1kTv1OyvAsxGc/Ccn0rXoMJEd8BYlhmwEfVrw+oTE1KoiMsneaZbINi/V4SKCT+RhQDPsI3v2ID+LA1MgNRYZ/x+U1X9ofQnSuhrxRH1MShdbDIaGLUJnn4TMhOHBZdTE4mfJyzP2t1GA6jwyjnqH5sr/Qy1HDalGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336970; c=relaxed/simple;
	bh=3tTscb60GKkcPzjo6FgKQtHk7WdLrkm1CZCNBHbu3Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rizmnYLyb1U7bYTk0CuhwgcFF9QnPUtZQMJucWR9qh1VeFoOYINs8tnUvT1xe6zYK4YEDNqYQaZvgrkRJw9FJMbq1DHt1SvQ71Tsh05Qy3ccga0bQ3Vldi9Q5RXzkY/6v0G/qUPLjOWZZR4AmK7V1fmHONwGFo342TMvAfILNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F42A40C2E;
	Mon,  6 Jul 2026 11:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9140E1F000E9;
	Mon,  6 Jul 2026 11:22:40 +0000 (UTC)
Message-ID: <95b20f95-37c4-49a6-8952-e023597d9fd3@linux-m68k.org>
Date: Mon, 6 Jul 2026 21:22:35 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] m68k/coldfire: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linus Walleij <linusw@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-3-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260629132633.1300009-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 29/6/26 23:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for coldfire.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For the ColdFire changes, LGTM:

Reviewed-by: Greg Ungerer <gerg@linux-m68k.com>

Regards
Greg



> ---
>   arch/m68k/coldfire/device.c     | 2 +-
>   arch/m68k/include/asm/mcfgpio.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> index 1420bae0964f..9a0258acd998 100644
> --- a/arch/m68k/coldfire/device.c
> +++ b/arch/m68k/coldfire/device.c
> @@ -12,7 +12,7 @@
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/spi/spi.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/legacy.h>
>   #include <linux/fec.h>
>   #include <linux/dmaengine.h>
>   #include <asm/traps.h>
> diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
> index 7103cfa4edb6..29726aa40eb6 100644
> --- a/arch/m68k/include/asm/mcfgpio.h
> +++ b/arch/m68k/include/asm/mcfgpio.h
> @@ -16,7 +16,7 @@ int __mcfgpio_request(unsigned gpio);
>   void __mcfgpio_free(unsigned gpio);
>   
>   #ifdef CONFIG_GPIOLIB
> -#include <linux/gpio.h>
> +#include <linux/gpio/legacy.h>
>   #else
>   
>   /* our alternate 'gpiolib' functions */

