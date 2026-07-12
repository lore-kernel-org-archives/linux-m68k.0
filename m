Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16500370D5E
	for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Jul 2026 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859252; cv=none; b=sjiuVA70oE4M4rw6tWl6sBgox/aG6qZB2ozrLx9cIGx7+3wv/Ca48cqeKaL9HIPnjfp0NywnYZYcEciSsKrC+ITQLuEXbQD6fqfUvFh2fMs9g++nFSee7UWIpCwiFCx3Lu2H0ZC2wNQbpKgSatpudUGY2BRlhXfhwqyY0FC2u2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859252; c=relaxed/simple;
	bh=L/n4SezSWQATpwU6IRgOEvEHHHUBkOmPMdj879cIAIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VReQfKDoDwIkTKUCLNGRDn1RkmWS1coAEdujIsyIT0Ha3af0V8l2bourpDCwpZrRl9nmapvmosrxsd5RuRGMfS6RLZtHaZVoGZFiLkBNSmPeb7wnca9IzDeGNd0W7Fwp2UFHQCdZEh832Rlx9/eS30m+LfJX5EjWccprXi4GKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB096004E;
	Sun, 12 Jul 2026 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37F81F000E9;
	Sun, 12 Jul 2026 12:27:21 +0000 (UTC)
Message-ID: <ec9e62c8-3c1d-4493-a876-82432575b381@linux-m68k.org>
Date: Sun, 12 Jul 2026 22:27:19 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] m68k/coldfire: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-3-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260710211954.1373336-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 11/7/26 07:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for coldfire.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I have applied this one to the for-next branch of the m68knommu git tree.

Thanks
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

