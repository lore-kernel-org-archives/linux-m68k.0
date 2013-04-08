From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: m68k build regression
Date: Mon, 08 Apr 2013 17:40:02 +1000
Message-ID: <51627452.1000908@westnet.com.au>
References: <1365158496.626.28.camel@sauron.fi.intel.com> <CACRpkdatu5e0eJ0W_LG5AqzK5g01+BCr2EMeaEsU14WyMO9rzA@mail.gmail.com> <515F07D5.5020905@nvidia.com> <51624859.4030502@westnet.com.au> <CACRpkdapsvstebGqO3H9TkA155xPRb0sb=UEUmf9EJfg5mrpkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CACRpkdapsvstebGqO3H9TkA155xPRb0sb=UEUmf9EJfg5mrpkw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Courbot <acourbot@nvidia.com>, "Bityutskiy, Artem" <artem.bityutskiy@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Grant Likely <grant.likely@secretlab.ca>, Jonas Bonn <jonas@southpole.se>

Hi Linus,

On 08/04/13 17:20, Linus Walleij wrote:
> On Mon, Apr 8, 2013 at 6:32 AM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
> 
>> Or we could fix like this, keeping the existing local functions
>> intact for this one last kernel version.
>>
>> Regards
>> Greg
>>
>>
>> [PATCH] m68k: define a local gpio_request_one() function
>>
>> Compiling for linux-3.9-rc1 and later fails with:
>>
>> drivers/gpio/devres.c: In function 'devm_gpio_request_one':
>> drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
>>
>> So provide a local gpio_request_one() function. Code largely borrowed from
>> blackfin's local gpio_request_one() function.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Greg, are you pushing this patch then?

I am happy to push to Linus if everyone is happy with that.

Regards
Greg
