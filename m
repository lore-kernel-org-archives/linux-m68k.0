From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Switch to asm-generic/futex.h
Date: Sun, 11 Jan 2015 11:43:21 +0100
Message-ID: <CAMuHMdUB_N12tu0Kdb3CkR+UHE3Kv7Pv7bHJex5+mvJWiJ_8Nw__3638.71838567338$1420973029$gmane$org@mail.gmail.com>
References: <1420530835-8123-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1420530835-8123-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Ley Foon Tan <lftan@altera.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Jan 6, 2015 at 8:53 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> As of commit 00f634bc522dedc8 ("asm-generic: add generic futex for
> !CONFIG_SMP") asm-generic follows the m68k futex implementation.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied and queued for 3.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
