From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: m68k build regression
Date: Fri, 5 Apr 2013 16:49:58 +0200
Message-ID: <CACRpkdatu5e0eJ0W_LG5AqzK5g01+BCr2EMeaEsU14WyMO9rzA@mail.gmail.com>
References: <1365158496.626.28.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1365158496.626.28.camel@sauron.fi.intel.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Grant Likely <grant.likely@secretlab.ca>

On Fri, Apr 5, 2013 at 12:39 PM, Bityutskiy, Artem
<artem.bityutskiy@intel.com> wrote:

> starting from 3.9-rc1 one of my m68k configurations does not build,
> which is a regression. The configuration is attached. I build with
> W=1. I did not look at the details, just shooting a bug report.
>
> drivers/gpio/devres.c: In function 'devm_gpio_request_one':
> drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[3]: *** [drivers/gpio/devres.o] Error 1

Somehow GPIO_DEVRES get selected,
m68k is using GENERIC_GPIO but not GPIOLIB, so
devres.c include <linux/gpio.h> which includes <asm/gpio.h>
as the arch has CONFIG_ARCH_HAVE_CUSTOM_GPIO_H.

So to use the devres facility arch/m68k/include/asm/gpio.h
needs to provide gpio_request_one().

Which it doesn't and thus fails.

Did some driver you're using start to use
devm_gpio_request_one() recently?

I vaguely remember Alexandre looking into things like this
so adding him...

Yours,
Linus Walleij
