From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Mon, 23 Dec 2013 22:23:42 +1300
Message-ID: <f61c2f6c42756c3bcd905f901767893a@gmail.com>
References: <1387611538-18305-1-git-send-email-schmitz@debian.org> <1387611538-18305-2-git-send-email-schmitz@debian.org> <CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com> <CAMuHMdXwXi6jeKz0TJPm9iHBBC8vfXrJnG19+Vogq32zr79zmw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXwXi6jeKz0TJPm9iHBBC8vfXrJnG19+Vogq32zr79zmw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Geert,

forgot to reply to all last time ...

>>
>
> Missing SoB.

Sorry, please add:

Signed-off-By: Michael Schmitz <schmitz@debian.org>

>
>> ---
>>  arch/m68k/atari/ataints.c |    5 ++++-
>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
>> index 90f7a48..3e73a63 100644
>> --- a/arch/m68k/atari/ataints.c
>> +++ b/arch/m68k/atari/ataints.c
>> @@ -330,9 +330,12 @@ void __init atari_init_IRQ(void)
>>         sound_ym.rd_data_reg_sel = 7;
>>         sound_ym.wd_data = 0xff;
>>
>> -       m68k_setup_irq_controller(&atari_mfptimer_chip, 
>> handle_polled_irq,
>> +       m68k_setup_irq_controller(&atari_mfptimer_chip, 
>> handle_simple_irq,
>>                                   IRQ_MFP_TIMER1, 8);
>>
>> +       irq_set_status_flags(IRQ_MFP_TIMER1, IRQ_IS_POLLED);
>> +       irq_set_status_flags(IRQ_MFP_TIMER2, IRQ_IS_POLLED);
>
> Why do you set this flag for timer 2, too? Timer D is timer1, right?
>
>

The  IRQ_MFP_TIMER1 and IRQ_MFP_TIMER2 interrupts are the multiplexed 
ones. These are the only ones currently used by EtherNEC and NetUSBee 
(if someone wants to use IRQ_MFP_TIMER3 for another piece of broken 
hardware, this one would need the same flag added).

IRQ_MFP_TIMD is the real hardware interrupt driving IRQ_MFP_TIMER1 and 
IRQ_MFP_TIMER2. It always returns IRQ_HANDLED so no flag required.

Cheers,

	Michael


>
>> +
>>         /* prepare timer D data for use as poll interrupt */
>>         /* set Timer D data Register - needs to be > 0 */
>>         st_mfp.tim_dt_d = 254;  /* < 100 Hz */
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
