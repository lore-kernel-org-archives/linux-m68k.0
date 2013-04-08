From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: m68k build regression
Date: Mon, 08 Apr 2013 14:32:25 +1000
Message-ID: <51624859.4030502@westnet.com.au>
References: <1365158496.626.28.camel@sauron.fi.intel.com> <CACRpkdatu5e0eJ0W_LG5AqzK5g01+BCr2EMeaEsU14WyMO9rzA@mail.gmail.com> <515F07D5.5020905@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <515F07D5.5020905@nvidia.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Bityutskiy, Artem" <artem.bityutskiy@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Grant Likely <grant.likely@secretlab.ca>, Jonas Bonn <jonas@southpole.se>

On 06/04/13 03:20, Alex Courbot wrote:
> On 04/05/2013 07:49 AM, Linus Walleij wrote:
>> On Fri, Apr 5, 2013 at 12:39 PM, Bityutskiy, Artem
>> <artem.bityutskiy@intel.com> wrote:
>>
>>> starting from 3.9-rc1 one of my m68k configurations does not build,
>>> which is a regression. The configuration is attached. I build with
>>> W=1. I did not look at the details, just shooting a bug report.
>>>
>>> drivers/gpio/devres.c: In function 'devm_gpio_request_one':
>>> drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
>>> cc1: some warnings being treated as errors
>>> make[3]: *** [drivers/gpio/devres.o] Error 1
>>
>> Somehow GPIO_DEVRES get selected,
>> m68k is using GENERIC_GPIO but not GPIOLIB, so
>> devres.c include <linux/gpio.h> which includes <asm/gpio.h>
>> as the arch has CONFIG_ARCH_HAVE_CUSTOM_GPIO_H.
>>
>> So to use the devres facility arch/m68k/include/asm/gpio.h
>> needs to provide gpio_request_one().
>>
>> Which it doesn't and thus fails.
>>
>> Did some driver you're using start to use
>> devm_gpio_request_one() recently?
>>
>> I vaguely remember Alexandre looking into things like this
>> so adding him...
> 
> I know OpenRisc had an issue with devres.c (CC Jonas), please look at commit d4cb776f for the fix. I don't think my changes for 3.9 are responsible for this, they only deal with gpiolib's internals and not with header files, so they should be noop for platforms only using GENERIC_GPIO.
> 
> I'd recommend doing the same as OpenRisc (turning GENERIC_GPIO and ARCH_WANT_OPTIONAL_GPIOLIB into ARCH_REQUIRE_GPIOLIB), anyway GENERIC_GPIO is being removed for 3.10, so you better get used to using gpiolib from now on. :)

Or we could fix like this, keeping the existing local functions
intact for this one last kernel version.

Regards
Greg



[PATCH] m68k: define a local gpio_request_one() function

Compiling for linux-3.9-rc1 and later fails with:

drivers/gpio/devres.c: In function 'devm_gpio_request_one':
drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]

So provide a local gpio_request_one() function. Code largely borrowed from
blackfin's local gpio_request_one() function.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/gpio.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
index 4395ffc..8cc8343 100644
--- a/arch/m68k/include/asm/gpio.h
+++ b/arch/m68k/include/asm/gpio.h
@@ -86,4 +86,24 @@ static inline int gpio_cansleep(unsigned gpio)
 	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
 }
 
+static inline int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
+{
+	int err;
+
+	err = gpio_request(gpio, label);
+	if (err)
+		return err;
+
+	if (flags & GPIOF_DIR_IN)
+		err = gpio_direction_input(gpio);
+	else
+		err = gpio_direction_output(gpio,
+			(flags & GPIOF_INIT_HIGH) ? 1 : 0);
+
+	if (err)
+		gpio_free(gpio);
+
+	return err;
+}
+
 #endif
