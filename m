From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68k/coldfire/pit: set ->min_delta_ticks and
 ->max_delta_ticks
Date: Fri, 31 Mar 2017 11:10:46 +1000
Message-ID: <5b67c049-804b-403b-1799-60ba85483267__15522.2785113894$1490923212$gmane$org@linux-m68k.org>
References: <20170326134403.16226-1-nicstange@gmail.com>
 <20170330194431.6978-1-nicstange@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170330194431.6978-1-nicstange@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nicolai Stange <nicstange@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Hi Nicolai,

On 31/03/17 05:44, Nicolai Stange wrote:
> In preparation for making the clockevents core NTP correction aware,
> all clockevent device drivers must set ->min_delta_ticks and
> ->max_delta_ticks rather than ->min_delta_ns and ->max_delta_ns: a
> clockevent device's rate is going to change dynamically and thus, the
> ratio of ns to ticks ceases to stay invariant.
> 
> Make the m68k arch's coldfire clockevent driver initialize these fields
> properly.
> 
> This patch alone doesn't introduce any change in functionality as the
> clockevents core still looks exclusively at the (untouched) ->min_delta_ns
> and ->max_delta_ns. As soon as this has changed, a followup patch will
> purge the initialization of ->min_delta_ns and ->max_delta_ns from this
> driver.
> 
> Signed-off-by: Nicolai Stange <nicstange@gmail.com>

Looks ok to me.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Are you pushing this through some other git tree?
Or do you want me to push up to Linus?

Regards
Greg



> ---
> 
> Notes:
>     This prerequisite patch is part of a larger effort to feed NTP
>     corrections into the clockevent devices' frequencies and thus
>     avoiding their notion of time to diverge from the system's
>     one. If you're interested, the current state of the whole series
>     can be found at [1].
>     
>     If you haven't got any objections and these prerequisites get
>     merged by 4.12 everywhere, I'll proceed with the remainder of
>     this series in 4.13.
>     
>     Applicable to next-20170324 as well as to John' Stultz tree [2].
>     
>     [1]
>       git://nicst.de/linux.git cev-freq-adj.v10.fortglx-4.12-time
>       https://nicst.de/git/?p=linux.git;a=shortlog;h=refs/heads/cev-freq-adj.v10.fortglx-4.12-time
>     
>     [2]
>       https://git.linaro.org/people/john.stultz/linux.git fortglx/4.12/time
> 
>  arch/m68k/coldfire/pit.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/pit.c b/arch/m68k/coldfire/pit.c
> index 175553d5b8ed..6c0878018b44 100644
> --- a/arch/m68k/coldfire/pit.c
> +++ b/arch/m68k/coldfire/pit.c
> @@ -149,8 +149,10 @@ void hw_timer_init(irq_handler_t handler)
>  	cf_pit_clockevent.mult = div_sc(FREQ, NSEC_PER_SEC, 32);
>  	cf_pit_clockevent.max_delta_ns =
>  		clockevent_delta2ns(0xFFFF, &cf_pit_clockevent);
> +	cf_pit_clockevent.max_delta_ticks = 0xFFFF;
>  	cf_pit_clockevent.min_delta_ns =
>  		clockevent_delta2ns(0x3f, &cf_pit_clockevent);
> +	cf_pit_clockevent.min_delta_ticks = 0x3f;
>  	clockevents_register_device(&cf_pit_clockevent);
>  
>  	setup_irq(MCF_IRQ_PIT1, &pit_irq);
> 
