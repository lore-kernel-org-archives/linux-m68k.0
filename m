From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: add a userspace chardev ABI for GPIOs
Date: Thu, 31 Mar 2016 14:59:55 +0900
Message-ID: <CAAVeFu+o9izwAyjORBisLg+G=PChzFvzF4SjmB1G=S+Tt--Qag__27453.4201169901$1459404029$gmane$org@mail.gmail.com>
References: <56FB30A3.40405@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <56FB30A3.40405@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>

On Wed, Mar 30, 2016 at 10:49 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> Hi Linus,
>
> Commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs")
> breaks booting on all my m68k/ColdFire platforms (with MMU and
> without). They all hang during the boot up, the last console
> trace is:
>
>   ...
>   NR_IRQS:256
>    clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1467848399018 ns
>    Calibrating delay loop... 1042.02 BogoMIPS (lpj=5210112)
>    pid_max: default: 32768 minimum: 301
>    Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
>    Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
>
> I traced this back to gpiochip_add_data() when it does the
> device_add() call. On my platforms this is being called
> before gpiolib_dev_init(), and this seems to be the issue.
> So gpio_bus_type has not been registered as a bus yet.
>
> The lowest level ColdFire gpio code (arch/m68k/coldfire/gpio.c)
> calls its setup from core_initcall() - and this will call
> gpiochip_add_data(). This is being called first, before
> the core_initcall() for gpiolib_dev_init().

We got a similar report with an alternative workaround:

https://lkml.org/lkml/2016/3/29/714

> I can fix by changing the core_initcall() in coldfire/gpio.c
> to something like postcore_initcall() and that fixes the boot
> problem.
>
> What do you think?
> Would you expect that all callers of gpiochip_add_data()
> should be after core_initcall()?

As you can see on the discussion thread above, there are several
candidate fixes - I have been away from GPIO for too long to make a
good decision, but I'm sure Linus can make the call.
