From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] m68k/gpio: remove arch specific sysfs bus device
Date: Wed, 6 Apr 2016 08:57:58 +0200
Message-ID: <CACRpkda6SHJC-TfeakPa=ZcYtTyhNijN3H6y8FUDyziVNXCEEw@mail.gmail.com>
References: <1459909950-26077-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1459909950-26077-1-git-send-email-gerg@uclinux.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-m68k@vger.kernel.org

On Wed, Apr 6, 2016 at 4:32 AM, Greg Ungerer <gerg@uclinux.org> wrote:

> From: Greg Ungerer <gerg@gumby.(none)>
>
> The ColdFire architecture specific gpio support code registers a sysfs
> bus device named "gpio". This clashes with the new generic API device
> added in commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs").
>
> The old ColdFire sysfs gpio device was never used for anything specific,
> and no links or other nodes were created under it. The new API sysfs gpio
> device has all the same default sysfs links (device, drivers, etc) and
> they are properly populated.
>
> Remove the old ColdFire sysfs gpio registration.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
