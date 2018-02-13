From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mm: Stop printing the virtual memory layout
Date: Tue, 13 Feb 2018 08:34:37 +0100
Message-ID: <CAMuHMdXjUCR0CxNiF7quz0dmM3K_6ocMJ0-mwBi4Y5KbFY=3FQ@mail.gmail.com>
References: <1518425633-19803-1-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.21.1802131143320.8@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1802131143320.8@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Kees Cook <keescook@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Finn,

On Tue, Feb 13, 2018 at 1:48 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Mon, 12 Feb 2018, Geert Uytterhoeven wrote:
>> Since commit ad67b74d2469d9b8 ("printk: hash addresses printed with
>> %p"), the virtual memory layout printed during boot up contains "ptrval"
>> instead of actual addresses:
>>
>>     Memory: 268040K/276480K available (2979K kernel code, 310K rwdata, 784K rodata, 144K init, 172K bss, 8440K reserved, 0K cma-reserved)
>>     Virtual kernel memory layout:
>>       vector  : 0x003d2e74 - 0x003d3274   (   1 KiB)
>>       kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
>>       vmalloc : 0x11800000 - 0xd0000000   (3048 MiB)
>>       lowmem  : 0x00000000 - 0x11000000   ( 272 MiB)
>>         .init : 0x(ptrval) - 0x(ptrval)   ( 144 KiB)
>>         .text : 0x(ptrval) - 0x(ptrval)   (2980 KiB)
>>         .data : 0x(ptrval) - 0x(ptrval)   (1095 KiB)
>>         .bss  : 0x(ptrval) - 0x(ptrval)   ( 173 KiB)
>>
>> Instead of changing the printing to "%px", and leaking virtual memory
>> layout information again,
>>
>> just remove the printing completely, cfr. e.g.
>> commit 071929dbdd865f77 ("arm64: Stop printing the virtual memory
>> layout").
>>
>> All interesting information (actual section sizes) is already printed by
>> mem_init_print_info() just above anyway.
>
> Or maybe revert to %lx with pr_debug instead of pr_notice. Just a thought;

(%px prints unhashed pointers, no need for %lx and cast)

> I don't have any preference.

Dynamic debug is hot these days, so that may be enabled by distros,
still leaking the info.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
