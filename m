From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/sun3: Use %pM format specifier to print ethernet address
Date: Thu, 27 Aug 2015 14:41:00 +0200
Message-ID: <CAMuHMdV9jp4mttyHc7TN7Z7yod4pH5Moizcv0WJMLNmU20D6dg__25737.1520776816$1440679295$gmane$org@mail.gmail.com>
References: <1440678643-7171-1-git-send-email-kuleshovmail@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1440678643-7171-1-git-send-email-kuleshovmail@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Kuleshov <kuleshovmail@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Aug 27, 2015 at 2:30 PM, Alexander Kuleshov
<kuleshovmail@gmail.com> wrote:
> printk() supports %pM format specifier for printing 6-byte MAC/FDDI
> addresses in hex notation small buffers, let's use it intead of %x:%x...
>
> Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>

Thanks, will apply and queue for v4.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
