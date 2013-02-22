From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] MC68328 platform code fix
Date: Fri, 22 Feb 2013 13:57:09 +1000
Message-ID: <5126EC95.6040004@uclinux.org>
References: <1361404022-3711-1-git-send-email-ljalvs@gmail.com> <512626F0.6060800@uclinux.org> <CAGj5WxAP3U5jspHsR1F3OZnXmBuaS7Pox_N8cmfKeSw1TEmHRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail02.westnet.com.au ([203.10.1.243]:41225 "EHLO
	outbound-mail02.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755219Ab3BVD5R (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 21 Feb 2013 22:57:17 -0500
In-Reply-To: <CAGj5WxAP3U5jspHsR1F3OZnXmBuaS7Pox_N8cmfKeSw1TEmHRA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 22/02/13 05:57, Luis Alves wrote:
> Sure I can do the split up.

Thanks.


> About the changes to the data types in m68328_uart, there is only one
> that was preventing the Xcopilot to work and that was the
> __attribute__((packed))
> I guess gcc (tested with 4.5.1 and 4.7.2 with strict alignment)
> generate a very ugly assembly. It makes all memory access byte sized
> and makes a (useless?) read before the write (check below).
> In a real system I guess it would still work but Xcopilot doesn't
> support byte access to the uart registers.
>
> (gcc 4.3.x onwards really don't care about no unaligned 68k cpu's...)
>
> Anyway, since the structure is 'well behaved', the packed attribute is
> not needed.

Agreed. I have no problem changing the types either, I find the
u8/u16/u32 types much clear when mirroring real registers. The above
description sounds like the good start as the patch description in
any case :-)

Regards
Greg



> Packed vs Non-packed example:
> -- C --
> uart->ustcnt = USTCNT_UEN;
> uart->ustcnt = USTCNT_UEN | USTCNT_RXEN | USTCNT_TXEN;
>
>
> -- asm (packed attribute) --
> 10cc002a:	1014           	moveb %a4@,%d0
> 10cc002c:	18bc ff80      	moveb #-128,%a4@
> 10cc0030:	102c 0001      	moveb %a4@(1),%d0
> 10cc0034:	197c 0000 0001 	moveb #0,%a4@(1)
> 10cc003a:	1014           	moveb %a4@,%d0
> 10cc003c:	18bc ffe0      	moveb #-32,%a4@
> 10cc0040:	102c 0001      	moveb %a4@(1),%d0
> 10cc0044:	197c 0000 0001 	moveb #0,%a4@(1)
>
> -- asm (no packed attribute) --
> 10cbfe8c:	38bc 8000      	movew #-32768,%a4@
> 10cbfe90:	38bc e000      	movew #-8192,%a4@
>
>
>
> Regards,
> Luis
>
>
> On Thu, Feb 21, 2013 at 1:53 PM, Greg Ungerer <gerg@uclinux.org> wrote:
>> Hi Luis,
>>
>>
>> On 21/02/13 09:47, Luis Alves wrote:
>>>
>>> This patch fixes the 68328 platform init code.
>>> I've been able to successefully build the kernel for the Xcopilot (Pilot3)
>>> target.
>>>
>>> A boot log can be found here: http://pastebin.com/9rT02vVi
>>
>>
>> Nice to have that working again.
>>
>> Can I get you to break this up into logical chunks though?
>> Probably the pure definition fixups (broken with whitespace) as one.
>> Timer fix up changes look like another. And the changes to the data
>> types in m68328_uart look to be cleanup but not a functional change?
>>
>> Regards
>> Greg
>>
>>
>>
>>> Signed-off-by: Luis Alves <ljalvs@gmail.com>
>>> ---
>>>    arch/m68k/include/asm/MC68328.h     |   60
>>> +++++++++++++++++------------------
>>>    arch/m68k/platform/68000/m68328.c   |    6 ++--
>>>    arch/m68k/platform/68000/m68EZ328.c |    1 +
>>>    arch/m68k/platform/68000/m68VZ328.c |    1 +
>>>    arch/m68k/platform/68000/timers.c   |   20 +++++++++---
>>>    5 files changed, 49 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/arch/m68k/include/asm/MC68328.h
>>> b/arch/m68k/include/asm/MC68328.h
>>> index a337e56..b3d7afb 100644
>>> --- a/arch/m68k/include/asm/MC68328.h
>>> +++ b/arch/m68k/include/asm/MC68328.h
>>> @@ -288,12 +288,12 @@
>>>
>>>    /* '328-compatible definitions */
>>>    #define SPI_IRQ_NUM   SPIM_IRQ_NUM
>>> -#define TMR_IRQ_NUM    TMR1_IRQ_NUM
>>> +#define TMR_IRQ_NUM    TMR2_IRQ_NUM
>>>
>>>    /*
>>>     * Here go the bitmasks themselves
>>>     */
>>> -#define IMR_MSPIM      (1 << SPIM _IRQ_NUM)    /* Mask SPI Master
>>> interrupt */
>>> +#define IMR_MSPIM      (1 << SPIM_IRQ_NUM)     /* Mask SPI Master
>>> interrupt */
>>>    #define       IMR_MTMR2       (1 << TMR2_IRQ_NUM)     /* Mask Timer 2
>>> interrupt */
>>>    #define IMR_MUART     (1 << UART_IRQ_NUM)     /* Mask UART interrupt */
>>>    #define       IMR_MWDT        (1 << WDT_IRQ_NUM)      /* Mask Watchdog
>>> Timer interrupt */
>>> @@ -327,7 +327,7 @@
>>>    #define IWR_ADDR      0xfffff308
>>>    #define IWR           LONG_REF(IWR_ADDR)
>>>
>>> -#define IWR_SPIM       (1 << SPIM _IRQ_NUM)    /* SPI Master interrupt */
>>> +#define IWR_SPIM       (1 << SPIM_IRQ_NUM)     /* SPI Master interrupt */
>>>    #define       IWR_TMR2        (1 << TMR2_IRQ_NUM)     /* Timer 2
>>> interrupt */
>>>    #define IWR_UART      (1 << UART_IRQ_NUM)     /* UART interrupt */
>>>    #define       IWR_WDT         (1 << WDT_IRQ_NUM)      /* Watchdog Timer
>>> interrupt */
>>> @@ -357,7 +357,7 @@
>>>    #define ISR_ADDR      0xfffff30c
>>>    #define ISR           LONG_REF(ISR_ADDR)
>>>
>>> -#define ISR_SPIM       (1 << SPIM _IRQ_NUM)    /* SPI Master interrupt */
>>> +#define ISR_SPIM       (1 << SPIM_IRQ_NUM)     /* SPI Master interrupt */
>>>    #define       ISR_TMR2        (1 << TMR2_IRQ_NUM)     /* Timer 2
>>> interrupt */
>>>    #define ISR_UART      (1 << UART_IRQ_NUM)     /* UART interrupt */
>>>    #define       ISR_WDT         (1 << WDT_IRQ_NUM)      /* Watchdog Timer
>>> interrupt */
>>> @@ -391,7 +391,7 @@
>>>    #define IPR_ADDR      0xfffff310
>>>    #define IPR           LONG_REF(IPR_ADDR)
>>>
>>> -#define IPR_SPIM       (1 << SPIM _IRQ_NUM)    /* SPI Master interrupt */
>>> +#define IPR_SPIM       (1 << SPIM_IRQ_NUM)     /* SPI Master interrupt */
>>>    #define       IPR_TMR2        (1 << TMR2_IRQ_NUM)     /* Timer 2
>>> interrupt */
>>>    #define IPR_UART      (1 << UART_IRQ_NUM)     /* UART interrupt */
>>>    #define       IPR_WDT         (1 << WDT_IRQ_NUM)      /* Watchdog Timer
>>> interrupt */
>>> @@ -708,8 +708,8 @@
>>>    #define TCTL_FRR              0x0010  /* Free-Run Mode */
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TCTL_ADDR      TCTL1_ADDR
>>> -#define TCTL           TCTL1
>>> +#define TCTL_ADDR      TCTL2_ADDR
>>> +#define TCTL           TCTL2
>>>
>>>    /*
>>>     * Timer Unit 1 and 2 Prescaler Registers
>>> @@ -720,8 +720,8 @@
>>>    #define TPRER2                WORD_REF(TPRER2_ADDR)
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TPRER_ADDR     TPRER1_ADDR
>>> -#define TPRER          TPRER1
>>> +#define TPRER_ADDR     TPRER2_ADDR
>>> +#define TPRER          TPRER2
>>>
>>>    /*
>>>     * Timer Unit 1 and 2 Compare Registers
>>> @@ -732,8 +732,8 @@
>>>    #define TCMP2         WORD_REF(TCMP2_ADDR)
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TCMP_ADDR      TCMP1_ADDR
>>> -#define TCMP           TCMP1
>>> +#define TCMP_ADDR      TCMP2_ADDR
>>> +#define TCMP           TCMP2
>>>
>>>    /*
>>>     * Timer Unit 1 and 2 Capture Registers
>>> @@ -744,8 +744,8 @@
>>>    #define TCR2          WORD_REF(TCR2_ADDR)
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TCR_ADDR       TCR1_ADDR
>>> -#define TCR            TCR1
>>> +#define TCR_ADDR       TCR2_ADDR
>>> +#define TCR            TCR2
>>>
>>>    /*
>>>     * Timer Unit 1 and 2 Counter Registers
>>> @@ -756,8 +756,8 @@
>>>    #define TCN2          WORD_REF(TCN2_ADDR)
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TCN_ADDR       TCN1_ADDR
>>> -#define TCN            TCN
>>> +#define TCN_ADDR       TCN2_ADDR
>>> +#define TCN            TCN2
>>>
>>>    /*
>>>     * Timer Unit 1 and 2 Status Registers
>>> @@ -771,8 +771,8 @@
>>>    #define TSTAT_CAPT    0x0001          /* Capture Event occurred */
>>>
>>>    /* 'EZ328-compatible definitions */
>>> -#define TSTAT_ADDR     TSTAT1_ADDR
>>> -#define TSTAT          TSTAT1
>>> +#define TSTAT_ADDR     TSTAT2_ADDR
>>> +#define TSTAT          TSTAT2
>>>
>>>    /*
>>>     * Watchdog Compare Register
>>> @@ -973,27 +973,27 @@
>>>
>>>    /* generalization of uart control registers to support multiple ports:
>>> */
>>>    typedef volatile struct {
>>> -  volatile unsigned short int ustcnt;
>>> -  volatile unsigned short int ubaud;
>>> +  volatile u16 ustcnt;
>>> +  volatile u16 ubaud;
>>>      union {
>>> -    volatile unsigned short int w;
>>> +    volatile u16 w;
>>>        struct {
>>> -      volatile unsigned char status;
>>> -      volatile unsigned char rxdata;
>>> +      volatile u8 status;
>>> +      volatile u8 rxdata;
>>>        } b;
>>>      } urx;
>>>      union {
>>> -    volatile unsigned short int w;
>>> +    volatile u16 w;
>>>        struct {
>>> -      volatile unsigned char status;
>>> -      volatile unsigned char txdata;
>>> +      volatile u8 status;
>>> +      volatile u8 txdata;
>>>        } b;
>>>      } utx;
>>> -  volatile unsigned short int umisc;
>>> -  volatile unsigned short int pad1;
>>> -  volatile unsigned short int pad2;
>>> -  volatile unsigned short int pad3;
>>> -} __attribute__((packed)) m68328_uart;
>>> +  volatile u16 umisc;
>>> +  volatile u16 pad1;
>>> +  volatile u16 pad2;
>>> +  volatile u16 pad3;
>>> +} m68328_uart;
>>>
>>>
>>>    /**********
>>> diff --git a/arch/m68k/platform/68000/m68328.c
>>> b/arch/m68k/platform/68000/m68328.c
>>> index a86eb66..c042e498 100644
>>> --- a/arch/m68k/platform/68000/m68328.c
>>> +++ b/arch/m68k/platform/68000/m68328.c
>>> @@ -20,9 +20,6 @@
>>>    #include <linux/rtc.h>
>>>    #include <asm/machdep.h>
>>>    #include <asm/MC68328.h>
>>> -#if defined(CONFIG_PILOT) || defined(CONFIG_INIT_LCD)
>>> -#include "bootlogo.h"
>>> -#endif
>>>
>>>
>>> /***************************************************************************/
>>>
>>> @@ -42,13 +39,14 @@ void m68328_reset (void)
>>>
>>>
>>> /***************************************************************************/
>>>
>>> -void config_BSP(char *command, int len)
>>> +void __init config_BSP(char *command, int len)
>>>    {
>>>      printk(KERN_INFO "\n68328 support D. Jeff Dionne
>>> <jeff@uclinux.org>\n");
>>>      printk(KERN_INFO "68328 support Kenneth Albanowski
>>> <kjahds@kjshds.com>\n");
>>>      printk(KERN_INFO "68328/Pilot support Bernhard Kuhn
>>> <kuhn@lpr.e-technik.tu-muenchen.de>\n");
>>>
>>>      mach_hwclk = m68328_hwclk;
>>> +  mach_sched_init = hw_timer_init;
>>>      mach_reset = m68328_reset;
>>>    }
>>>
>>> diff --git a/arch/m68k/platform/68000/m68EZ328.c
>>> b/arch/m68k/platform/68000/m68EZ328.c
>>> index a6eb72d..84a1a9d 100644
>>> --- a/arch/m68k/platform/68000/m68EZ328.c
>>> +++ b/arch/m68k/platform/68000/m68EZ328.c
>>> @@ -70,6 +70,7 @@ void config_BSP(char *command, int len)
>>>    #endif
>>>
>>>      mach_hwclk = m68328_hwclk;
>>> +  mach_sched_init = hw_timer_init;
>>>      mach_reset = m68ez328_reset;
>>>    }
>>>
>>> diff --git a/arch/m68k/platform/68000/m68VZ328.c
>>> b/arch/m68k/platform/68000/m68VZ328.c
>>> index eb6964f..8c4ae7a 100644
>>> --- a/arch/m68k/platform/68000/m68VZ328.c
>>> +++ b/arch/m68k/platform/68000/m68VZ328.c
>>> @@ -182,6 +182,7 @@ void config_BSP(char *command, int size)
>>>          init_hardware(command, size);
>>>
>>>          mach_hwclk = m68328_hwclk;
>>> +       mach_sched_init = hw_timer_init;
>>>          mach_reset = m68vz328_reset;
>>>    }
>>>
>>> diff --git a/arch/m68k/platform/68000/timers.c
>>> b/arch/m68k/platform/68000/timers.c
>>> index ec30acb..49b4b63 100644
>>> --- a/arch/m68k/platform/68000/timers.c
>>> +++ b/arch/m68k/platform/68000/timers.c
>>> @@ -24,7 +24,16 @@
>>>    #include <asm/setup.h>
>>>    #include <asm/pgtable.h>
>>>    #include <asm/machdep.h>
>>> +#if defined(CONFIG_M68EZ328)
>>> +#include <asm/MC68EZ328.h>
>>> +#else
>>> +#if defined(CONFIG_M68VZ328)
>>>    #include <asm/MC68VZ328.h>
>>> +#else
>>> +#include <asm/MC68328.h>
>>> +#endif /* CONFIG_M68VZ328 */
>>> +#endif /* CONFIG_M68EZ328 */
>>> +
>>>
>>>
>>> /***************************************************************************/
>>>
>>> @@ -105,18 +114,19 @@ void hw_timer_init(irq_handler_t handler)
>>>          /* disable timer 1 */
>>>          TCTL = 0;
>>>
>>> -       /* set ISR */
>>> -       setup_irq(TMR_IRQ_NUM, &m68328_timer_irq);
>>> -
>>>          /* Restart mode, Enable int, Set clock source */
>>>          TCTL = TCTL_OM | TCTL_IRQEN | CLOCK_SOURCE;
>>>          TPRER = CLOCK_PRE;
>>>          TCMP = TICKS_PER_JIFFY;
>>>
>>> -       /* Enable timer 1 */
>>> -       TCTL |= TCTL_TEN;
>>>          clocksource_register_hz(&m68328_clk, TICKS_PER_JIFFY*HZ);
>>>          timer_interrupt = handler;
>>> +
>>> +       /* set ISR */
>>> +       setup_irq(TMR_IRQ_NUM, &m68328_timer_irq);
>>> +
>>> +       /* Enable timer 1 */
>>> +       TCTL |= TCTL_TEN;
>>>    }
>>>
>>>
>>> /***************************************************************************/
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
