From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: Restore symbol versions for symbols exported
 from assembly
Date: Mon, 21 Aug 2017 11:59:07 +0200
Message-ID: <CAMuHMdXrYNruQDecYp69XwjPW0tkavuz-nVqvOhw130W59OP-g@mail.gmail.com>
References: <1500966575-4136-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1500966575-4136-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Jul 25, 2017 at 9:09 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> From: Ben Hutchings <ben@decadent.org.uk>
>
> WARNING: EXPORT symbol "__divsi3" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__umodsi3" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__mulsi3" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__modsi3" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__udivsi3" [vmlinux] version generation failed, symbol will not be versioned.
>
> Add <asm/asm-prototypes.h> so that genksyms knows the types of these
> symbols and can generate CRCs for them.
>
> Fixes: d13ffb563044 ("m68k: move exports to definitions"
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> [geert: Add warning messages, match actual prototypes]
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you, applied and queued for v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
