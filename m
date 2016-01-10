From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] zorro: use kobj_to_dev()
Date: Sun, 10 Jan 2016 14:08:43 +0100
Message-ID: <CAMuHMdX44MiektD8ybZU0nqbvkemXABVP29seWAqAX0PXN-nJw@mail.gmail.com>
References: <c7cde940d70112539785968854715fd55af63ecd.1452094082.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <c7cde940d70112539785968854715fd55af63ecd.1452094082.git.geliangtang@163.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 6, 2016 at 4:28 PM, Geliang Tang <geliangtang@163.com> wrote:
> Use kobj_to_dev() instead of open-coding it.
>
> Signed-off-by: Geliang Tang <geliangtang@163.com>

Thanks, applied and queued for v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
