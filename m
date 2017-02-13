From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/6] m68k: paging_init - remove dead code
Date: Mon, 13 Feb 2017 10:05:37 +0100
Message-ID: <CAMuHMdWJDRYQAKd9QF4qfKHa1rvmBmik-XpdkvdomDWfOj4z7A__10606.8627130755$1486976756$gmane$org@mail.gmail.com>
References: <1486933932-585-1-git-send-email-minipli@googlemail.com> <1486933932-585-7-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1486933932-585-7-git-send-email-minipli@googlemail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mathias Krause <minipli@googlemail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>, Jesper Nilsson <jesper.nilsson@axis.com>, Mikael Starvik <starvik@axis.com>, the arch/x86 maintainers <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Sun, Feb 12, 2017 at 10:12 PM, Mathias Krause <minipli@googlemail.com> wrote:
> The macro TEST_VERIFY_AREA can never be defined as there's no
> wp_works_ok variable. So just remove the dead code.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Mathias Krause <minipli@googlemail.com>

Thanks, applied with rewritten one-line summary to match subsystem
style, and queued for v4.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
