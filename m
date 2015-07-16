From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH 08/23] m68k/coldfire/pit: Migrate to new 'set-state' interface
Date: Thu, 16 Jul 2015 22:42:18 +1000
Message-ID: <55A7A6AA.1050602__46615.5857932337$1437051107$gmane$org@uclinux.org>
References: <cover.1437044517.git.viresh.kumar@linaro.org> <e3b21870111e9f0a71a6a9b7ef3aa68fbb772f81.1437044517.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <e3b21870111e9f0a71a6a9b7ef3aa68fbb772f81.1437044517.git.viresh.kumar@linaro.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linaro-kernel@lists.linaro.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi Viresh,

On 16/07/15 21:26, Viresh Kumar wrote:
> Migrate m68k driver to the new 'set-state' interface provided by
> clockevents core, the earlier 'set-mode' interface is marked obsolete
> now.
>
> This also enables us to implement callbacks for new states of clockevent
> devices, for example: ONESHOT_STOPPED.
>
> We weren't doing anything in ->set_mode(RESUME) and so tick_resume()
> isn't implemented.
>
> Cc: Greg Ungerer <gerg@uclinux.org>

Applied and tested ok (against 4.2-rc2).

Acked-by: Greg Ungerer <gerg@uclinux.org>


> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   arch/m68k/coldfire/pit.c | 66 ++++++++++++++++++++++--------------------------
>   1 file changed, 30 insertions(+), 36 deletions(-)
>
> diff --git a/arch/m68k/coldfire/pit.c b/arch/m68k/coldfire/pit.c
> index 493b3111d4c1..d86a9ffb3f13 100644
> --- a/arch/m68k/coldfire/pit.c
> +++ b/arch/m68k/coldfire/pit.c
> @@ -42,37 +42,28 @@ static u32 pit_cnt;
>    * This is also called after resume to bring the PIT into operation again.
>    */
>   
> -static void init_cf_pit_timer(enum clock_event_mode mode,
> -                             struct clock_event_device *evt)
> +static int cf_pit_set_periodic(struct clock_event_device *evt)
>   {
> -	switch (mode) {
> -	case CLOCK_EVT_MODE_PERIODIC:
> -
> -		__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> -		__raw_writew(PIT_CYCLES_PER_JIFFY, TA(MCFPIT_PMR));
> -		__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE | \
> -				MCFPIT_PCSR_OVW | MCFPIT_PCSR_RLD | \
> -				MCFPIT_PCSR_CLK64, TA(MCFPIT_PCSR));
> -		break;
> -
> -	case CLOCK_EVT_MODE_SHUTDOWN:
> -	case CLOCK_EVT_MODE_UNUSED:
> -
> -		__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> -		break;
> -
> -	case CLOCK_EVT_MODE_ONESHOT:
> -
> -		__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> -		__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE | \
> -				MCFPIT_PCSR_OVW | MCFPIT_PCSR_CLK64, \
> -				TA(MCFPIT_PCSR));
> -		break;
> -
> -	case CLOCK_EVT_MODE_RESUME:
> -		/* Nothing to do here */
> -		break;
> -	}
> +	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> +	__raw_writew(PIT_CYCLES_PER_JIFFY, TA(MCFPIT_PMR));
> +	__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
> +		     MCFPIT_PCSR_OVW | MCFPIT_PCSR_RLD |
> +		     MCFPIT_PCSR_CLK64, TA(MCFPIT_PCSR));
> +	return 0;
> +}
> +
> +static int cf_pit_set_oneshot(struct clock_event_device *evt)
> +{
> +	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> +	__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
> +		     MCFPIT_PCSR_OVW | MCFPIT_PCSR_CLK64, TA(MCFPIT_PCSR));
> +	return 0;
> +}
> +
> +static int cf_pit_shutdown(struct clock_event_device *evt)
> +{
> +	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
> +	return 0;
>   }
>   
>   /*
> @@ -88,12 +79,15 @@ static int cf_pit_next_event(unsigned long delta,
>   }
>   
>   struct clock_event_device cf_pit_clockevent = {
> -	.name		= "pit",
> -	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> -	.set_mode	= init_cf_pit_timer,
> -	.set_next_event	= cf_pit_next_event,
> -	.shift		= 32,
> -	.irq		= MCF_IRQ_PIT1,
> +	.name			= "pit",
> +	.features		= CLOCK_EVT_FEAT_PERIODIC |
> +				  CLOCK_EVT_FEAT_ONESHOT,
> +	.set_state_shutdown	= cf_pit_shutdown,
> +	.set_state_periodic	= cf_pit_set_periodic,
> +	.set_state_oneshot	= cf_pit_set_oneshot,
> +	.set_next_event		= cf_pit_next_event,
> +	.shift			= 32,
> +	.irq			= MCF_IRQ_PIT1,
>   };
>   
>   
