From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] Remove interrupt debug code
Date: Thu, 9 Feb 2017 14:23:28 +0100
Message-ID: <CAMuHMdWvUpwbCCJ59uvZqcUxp7ZHYCgZerRL0VAZK0=ANvSnBw@mail.gmail.com>
References: <cover.1483350483.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483350483.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Jan 2, 2017 at 10:53 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> This patch series removes some interrupt debug code:
> printk statements, associated macros, dead code, etc.
>
>
> Finn Thain (3):
>   m68k/mac: Improve NMI handler
>   m68k/mac: Remove SHUTUP_SONIC interrupt hack
>   m68k/mac: Clean up interrupt debug macros and printk statements

Thanks, applied and queued for v4.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
