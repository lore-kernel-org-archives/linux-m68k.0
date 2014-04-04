From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Fri, 04 Apr 2014 23:35:54 +1000
Message-ID: <533EB53A.2030700@westnet.com.au>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com> <533D570F.8080000@gmail.com> <CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com> <alpine.LNX.2.00.1404041755100.29768@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1404041755100.29768@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <danieruru@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 04/04/14 17:45, Finn Thain wrote:
> On Thu, 3 Apr 2014, Geert Uytterhoeven wrote:
>> On Thu, Apr 3, 2014 at 2:41 PM, Greg Ungerer <gregungerer00@gmail.com> wrote:
>>>> -#ifdef CONFIG_PILOT
>>>> +#if defined(CONFIG_PILOT)
>>>>          movew   #0x2410, 0xfffff200             /* PLLCR */
>>>> +#elif defined(CONFIG_M68VZ328)
>>>> +       movew   #0x2493, 0xfffff200             /* PLLCR */
>>>
>>>
>>> Would it be cleaner to have a defined value here instead?
>>> This moves the #ifdef'ery to just the PLLCR value, and keeps the
>>> code instructions here cleaner. So something like this at the top of
>>> this head.S:
>>>
>>> #if defined(CONFIG_PILOT)
>>> #define PLLCR   0x2410
>>> #elif defined(CONFIG_M68VZ328)
>>> #define PLLCR   0x2493
>>> #else
>>> #define PLLCR   0x2400
>>> #endif
>>>
>>> and then just
>>>
>>>          movew   #PLLCR, 0xfffff200              /* PLLCR */
>
> In this case, the #ifdef ... #elif ... #else ... #endif cascade is already
> present, so I wonder whether your way is in fact better here.

I don't follow what you mean. The intention is to move it away from the
actual code - to make it easier to read. Not add another #elif and make
it worse than it currently is.

Regards
Greg


>> While I like this advice in general, I prefer to use a different name than
>> "PLLCR" for this definition.
>>
>> One day someone may want to put "#define PLLCR 0xfffff200" in a
>> header file...
>>
>
> It's defined in asm/MC68328.h:
>
> #define PLLCR_ADDR      0xfffff200
> ...
> #define PLLCR_DISPLL           0x0008   /* Disable PLL */
> #define PLLCR_CLKEN            0x0010   /* Clock (CLKO pin) enable */
> #define PLLCR_SYSCLK_SEL_MASK  0x0700   /* System Clock Selection */
> #define PLLCR_SYSCLK_SEL_SHIFT 8
> #define PLLCR_PIXCLK_SEL_MASK  0x3800   /* LCD Clock Selection */
> #define PLLCR_PIXCLK_SEL_SHIFT 11
>
> Some bit name definitions are missing, i.e.
>
> #define PLLCR_PRESC1           0x0080
>
