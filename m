From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] [RFC] clocksource: improve GENERIC_CLOCKEVENTS dependency
Date: Tue, 19 Sep 2017 00:02:55 +0200
Message-ID: <a12789f5-002f-51b1-7051-8802ec81d8e0__37889.4278932877$1505772193$gmane$org@linaro.org>
References: <20170905150504.1720954-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170905150504.1720954-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-ia64@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ding Tianhong <dingtianhong@huawei.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org

On 05/09/2017 17:04, Arnd Bergmann wrote:
> We regularly run into build errors when a clocksource driver selects
> CONFIG_TIMER_OF while CONFIG_GENERIC_CLOCKEVENTS is disabled:
> 
>  In file included from drivers/clocksource/timer-of.c:25:0:
> drivers/clocksource/timer-of.h:35:28: error: field 'clkevt' has incomplete type
> 
> At the moment, three drivers can show this behavior: ARMV7M_SYSTICK,
> CLKSRC_ST_LPC and CLKSRC_NPS. We could add further dependencies as we did
> many times, but I have looked a little bit more at what architectures
> are left that don't use GENERIC_CLOCKEVENTS, and this shows that there
> is a better solution.
> 
> On arch/frv and arch/ia64, we never select CONFIG_GENERIC_CLOCKEVENTS
> and we also don't use ARCH_USES_GETTIMEOFFSET, which would
> block the clocksource Kconfig menu. On m68k, some platforms use
> CONFIG_GENERIC_CLOCKEVENTS, some use ARCH_USES_GETTIMEOFFSET, and some
> use neither of them. The good news is that there is no configuration that
> does not set CONFIG_GENERIC_CLOCKEVENTS but that wants to enable any of
> the Kconfig symbols in the menu, so we can simply replace the dependency
> with the stricter one. While in theory one could have a clocksource
> driver without the clockevent infrastructure, this seems unlikely
> to be relevant in the future any more.
> 
> We can probably drop some of the other dependencies as well now,
> e.g. there should generally be no reason to depend on CONFIG_ARM
> unless the driver uses architecture specific assembly.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Makes sense. Agree with this change.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
