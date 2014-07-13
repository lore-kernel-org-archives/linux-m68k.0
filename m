From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 3.16 (take 2)
Date: Sun, 13 Jul 2014 20:16:35 +0200
Message-ID: <CAMuHMdXAaVkNTikKcSY5oOHGD=M3cYTLObXb5Hx7V0wHgSe+iA@mail.gmail.com>
References: <alpine.DEB.2.02.1407131105390.7520@ayla.of.borg>
	<20140713093438.GA3115@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20140713093438.GA3115@infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Hi Christoph,

On Sun, Jul 13, 2014 at 11:34 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Sun, Jul 13, 2014 at 11:08:07AM +0200, Geert Uytterhoeven wrote:
>>       m68k: Fix boot regression on machines with RAM at non-zero
>>       m68k: Export mach_random_get_entropy to modules
>
> What modular user of random_get_entropy is this for?  Can't find one in
> the current tree, and I don't really think this is something that should
> be exported either.

The second to last chunk of "crypto: drbg - Mix a time stamp into DRBG state"
calls random_get_entropy(), cfr.

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=27e4de2bd1804c24e3e517dd54026c1f60e8fe27

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
