From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/setup: Use pr_*() instead of plain printk()
Date: Mon, 1 Jul 2013 23:02:06 +0200
Message-ID: <CAMuHMdUA3+gLi00Tvik2SjZaRYSC2sMMmP9TMH=Vb1dAubXx3Q@mail.gmail.com>
References: <1372585689-29492-1-git-send-email-geert@linux-m68k.org>
	<1372630948.2083.3.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1372630948.2083.3.camel@joe-AO722>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 1, 2013 at 12:22 AM, Joe Perches <joe@perches.com> wrote:
>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>
>> @@ -161,7 +161,7 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
> []
>> -                             printk("m68k_parse_bootinfo: too many memory chunks\n");
>> +                             pr_warn("m68k_parse_bootinfo: too many memory chunks\n");
>
> These are generally better written by
> removing the hand-written function name
> and using "%s: ", __func__
>
>                                 pr_warn("%s: too many memory chunks\n",
>                                         __func__);

I had tried that, too. But surprisingly (although the same function
name was in two
messages), it increased the size of the kernel image.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
