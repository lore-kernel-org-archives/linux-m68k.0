From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] Add correct PLL settings for DragonBall VZ.
Date: Thu, 3 Apr 2014 14:48:23 +0200
Message-ID: <CAMuHMdVECm8bWBZ_ZUhrQ34dgmf3aZ2c7aMnXORtPe9ufggsfQ@mail.gmail.com>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
	<533D570F.8080000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <533D570F.8080000@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer00@gmail.com>
Cc: Daniel Palmer <danieruru@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Apr 3, 2014 at 2:41 PM, Greg Ungerer <gregungerer00@gmail.com> wrote:
>> -#ifdef CONFIG_PILOT
>> +#if defined(CONFIG_PILOT)
>>         movew   #0x2410, 0xfffff200             /* PLLCR */
>> +#elif defined(CONFIG_M68VZ328)
>> +       movew   #0x2493, 0xfffff200             /* PLLCR */
>
>
> Would it be cleaner to have a defined value here instead?
> This moves the #ifdef'ery to just the PLLCR value, and keeps the
> code instructions here cleaner. So something like this at the top of
> this head.S:
>
> #if defined(CONFIG_PILOT)
> #define PLLCR   0x2410
> #elif defined(CONFIG_M68VZ328)
> #define PLLCR   0x2493
> #else
> #define PLLCR   0x2400
> #endif
>
> and then just
>
>         movew   #PLLCR, 0xfffff200              /* PLLCR */

While I like this advice in general, I prefer to use a different name than
"PLLCR" for this definition.

One day someone may want to put "#define PLLCR 0xfffff200" in a
header file...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
