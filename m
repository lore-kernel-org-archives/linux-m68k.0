From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: pull mach_beep in setup.c
Date: Thu, 12 Oct 2017 08:35:17 +0200
Message-ID: <CAMuHMdWwZ0d25bYuneqa_1uFuQ2Zjsrfvbr28uGTpA0fESGFHQ__6933.62914394147$1507790134$gmane$org@mail.gmail.com>
References: <20170928094452.4863-1-alexandre.belloni@free-electrons.com> <1cccc612-b2de-1ecb-db86-d22200961aae@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1cccc612-b2de-1ecb-db86-d22200961aae@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Greg,

On Thu, Oct 12, 2017 at 2:15 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 28/09/17 19:44, Alexandre Belloni wrote:
>> It is possible to select INPUT_M68K_BEEP in a nommu configuration. This
>> results in the following link error:
>>
>> drivers/input/misc/m68kspkr.o: In function `m68kspkr_event':
>> m68kspkr.c:(.text+0x3a): undefined reference to `mach_beep'
>> m68kspkr.c:(.text+0x5e): undefined reference to `mach_beep'
>> m68kspkr.c:(.text+0x78): undefined reference to `mach_beep'
>> drivers/input/misc/m68kspkr.o: In function `m68kspkr_init':
>> m68kspkr.c:(.init.text+0x4): undefined reference to `mach_beep'
>>
>> Pull the mach_beep definition in setup.c to avoid it.
>>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>
> I plan on applying this to the m68knommu git tree (for-next) branch
> in the very near future.
>
> Geert: no objections?

No objections:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
