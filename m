Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A582949F3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Apr 2025 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718069; cv=none; b=o0heLYJ5awdoEKkPveGRVlEyh0TcliKRiq4yebiWg/l/xiOc7apmowr3/cFJUvwnjT+fop/HSjeTGiCHiSvhht33YOReVzGTpXEcRwvQ61reRM2g/xZNTsNg42ywEJ9XilIXNnIImXhS6Cs4KYVDxSfvKT0CHEimlcbb6VpEk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718069; c=relaxed/simple;
	bh=OTc+9NY3S3zs1DGknl92cbvEABzMnDVf8FyPoEQYkUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQKSwZHsnfZ7gMizAzttN1/rxakW1IVpsgOiLlzBL0ojatP8+gy8rNPkSc4/ejSEueQIYJRFeTeQiM3H+fnkEkJ66ZwaEY1992wYtP3gTZvWvC3GEDCPNmWtRrxCLg14OIuDggDGQUlcOkxWRvkh6miL3CNd982JdGu+VbWwv5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B8226115F;
	Tue, 15 Apr 2025 11:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10907C4CEDD;
	Tue, 15 Apr 2025 11:54:23 +0000 (UTC)
Message-ID: <86fe5e61-a8e6-43cd-87b6-f9c611358fcb@linux-m68k.org>
Date: Tue, 15 Apr 2025 21:54:21 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 7/4/25 17:20, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks. Applied to m68knommu git tree for-next branch, with
Linus Walleij's reviewed by.

Regards
Greg


> ---
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all m68k board-file level controllers.
> ---
>   arch/m68k/coldfire/gpio.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
> index ca26de257871..30e5a4ed799d 100644
> --- a/arch/m68k/coldfire/gpio.c
> +++ b/arch/m68k/coldfire/gpio.c
> @@ -123,10 +123,12 @@ static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
>   	return __mcfgpio_direction_output(offset, value);
>   }
>   
> -static void mcfgpio_set_value(struct gpio_chip *chip, unsigned offset,
> -			      int value)
> +static int mcfgpio_set_value(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
>   {
>   	__mcfgpio_set_value(offset, value);
> +
> +	return 0;
>   }
>   
>   static int mcfgpio_request(struct gpio_chip *chip, unsigned offset)
> @@ -158,7 +160,7 @@ static struct gpio_chip mcfgpio_chip = {
>   	.direction_input	= mcfgpio_direction_input,
>   	.direction_output	= mcfgpio_direction_output,
>   	.get			= mcfgpio_get_value,
> -	.set			= mcfgpio_set_value,
> +	.set_rv			= mcfgpio_set_value,
>   	.to_irq			= mcfgpio_to_irq,
>   	.base			= 0,
>   	.ngpio			= MCFGPIO_PIN_MAX,
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250326-gpiochip-set-rv-m68k-789f77283f78
> 
> Best regards,

