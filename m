From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] microblaze: Remove architecture heart beat code
Date: Mon, 11 Jun 2018 10:46:59 +0200
Message-ID: <CACRpkdb=Vfs6R+576+Wjh1cOh8ti-8jkGhj7Pw8zXdOxvHKOCg@mail.gmail.com>
References: <84075652e978661247d71f84de46efd827869948.1528697370.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84075652e978661247d71f84de46efd827869948.1528697370.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, linux-m68k@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Neil Armstrong <narmstrong@baylibre.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Jun 11, 2018 at 8:09 AM, Michal Simek <michal.simek@xilinx.com> wrote:

> There is no reason to keep this gpio based code in architecture. Use
> ledtrig-heartbeat.c instead which is much more flexible then this
> ancient code.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Maybe the arch maintainers will complain that the corresponding
new heartbeat code is not put in place in the same patch, but I
think the change is so much overdue that I don't see why they
can't do that themselves if they have interest in it.

BTW: m68k has the same kind of luggage, in the middle of it
timekeeping code:
arch/m68k/kernel/time.c

Yours,
Linus Walleij
