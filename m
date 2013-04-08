From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: m68k build regression
Date: Mon, 8 Apr 2013 09:20:34 +0200
Message-ID: <CACRpkdapsvstebGqO3H9TkA155xPRb0sb=UEUmf9EJfg5mrpkw@mail.gmail.com>
References: <1365158496.626.28.camel@sauron.fi.intel.com>
	<CACRpkdatu5e0eJ0W_LG5AqzK5g01+BCr2EMeaEsU14WyMO9rzA@mail.gmail.com>
	<515F07D5.5020905@nvidia.com>
	<51624859.4030502@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51624859.4030502@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: Alex Courbot <acourbot@nvidia.com>, "Bityutskiy, Artem" <artem.bityutskiy@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Grant Likely <grant.likely@secretlab.ca>, Jonas Bonn <jonas@southpole.se>

On Mon, Apr 8, 2013 at 6:32 AM, Greg Ungerer <gregungerer@westnet.com.au> wrote:

> Or we could fix like this, keeping the existing local functions
> intact for this one last kernel version.
>
> Regards
> Greg
>
>
> [PATCH] m68k: define a local gpio_request_one() function
>
> Compiling for linux-3.9-rc1 and later fails with:
>
> drivers/gpio/devres.c: In function 'devm_gpio_request_one':
> drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
>
> So provide a local gpio_request_one() function. Code largely borrowed from
> blackfin's local gpio_request_one() function.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Greg, are you pushing this patch then?

Yours,
Linus Walleij
