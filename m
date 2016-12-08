From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/22] m68k/mac: macints - Modernize printing of kernel messages
Date: Thu, 8 Dec 2016 13:25:54 +0100
Message-ID: <CAMuHMdU+Fp+1QCVU4r+h9uUdZKsfa=E4JT7kuK56QjdPxPrSAg@mail.gmail.com>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
 <1481123360-10978-3-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1612080938360.9219@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1612080938360.9219@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 7, 2016 at 11:45 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:
>
>>   - Introduce helpers for printing debug messages, incl. dummies for
>>     validating format strings when debugging is disabled,
>>   - Convert from printk() to pr_*(),
>>   - Add missing continuations, to fix user-visible breakage.
>>
>> Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  arch/m68k/mac/macints.c | 42 ++++++++++++++++++++++--------------------
>>  1 file changed, 22 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
>> index 9f98c08719010e27..8572290cb93b6679 100644
>> --- a/arch/m68k/mac/macints.c
>> +++ b/arch/m68k/mac/macints.c
>> @@ -135,6 +135,11 @@
>>  irqreturn_t mac_debug_handler(int, void *);
>>
>>  /* #define DEBUG_MACINTS */
>> +#ifdef DEBUG_MACINTS
>> +#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>> +#else
>> +#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>> +#endif
>>
>>  static unsigned int mac_irq_startup(struct irq_data *);
>>  static void mac_irq_shutdown(struct irq_data *);
>
> I would prefer to delete all the DEBUG_MACINTS clutter.

OK, can do that.

>> @@ -281,7 +282,7 @@ static void mac_irq_shutdown(struct irq_data *data)
>>  irqreturn_t mac_debug_handler(int irq, void *dev_id)
>>  {
>>       if (num_debug[irq] < 10) {
>> -             printk("DEBUG: Unexpected IRQ %d\n", irq);
>> +             pr_info("DEBUG: Unexpected IRQ %d\n", irq);
>>               num_debug[irq]++;
>>       }
>>       return IRQ_HANDLED;
>
> Is this dead code?

Yes, mac_debug_handler() is unused.

Removing that can be done in a separate patch (this is one of the
patches I'd like
to send upstream ASAP).

>> @@ -319,20 +320,21 @@ irqreturn_t mac_nmi_handler(int irq, void *dev_id)
>>  #if 0
>>               struct pt_regs *fp = get_irq_regs();
>>               show_state();
>> -             printk("PC: %08lx\nSR: %04x  SP: %p\n", fp->pc, fp->sr, fp);
>> -             printk("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
>> -                    fp->d0, fp->d1, fp->d2, fp->d3);
>> -             printk("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
>> -                    fp->d4, fp->d5, fp->a0, fp->a1);
>> +             pr_info("PC: %08lx\nSR: %04x  SP: %p\n", fp->pc, fp->sr, fp);
>> +             pr_info("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
>> +                     fp->d0, fp->d1, fp->d2, fp->d3);
>> +             pr_info("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
>> +                     fp->d4, fp->d5, fp->a0, fp->a1);
>>
>>               if (STACK_MAGIC != *(unsigned long *)current->kernel_stack_page)
>> -                     printk("Corrupted stack page\n");
>> -             printk("Process %s (pid: %d, stackpage=%08lx)\n",
>> -                     current->comm, current->pid, current->kernel_stack_page);
>> +                     pr_info("Corrupted stack page\n");
>> +             pr_info("Process %s (pid: %d, stackpage=%08lx)\n",
>> +                     current->comm, current->pid,
>> +                     current->kernel_stack_page);
>>               if (intr_count == 1)
>>                       dump_stack((struct frame *)fp);
>>  #else
>> -             /* printk("NMI "); */
>> +             /* pr_info("NMI "); */
>>  #endif
>>       }
>>       in_nmi--;
>>
>
> I think it would be good to use pr_debug here instead of #if 0. But that
> will probably break the build... better ignore the #if 0 section for this
> series, until I put together a different patch?

Or worse, break at runtime. There's also non-printing code in that block.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
