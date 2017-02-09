From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/22] m68k: Modernize printing of kernel messages
Date: Thu, 9 Feb 2017 14:25:51 +0100
Message-ID: <CAMuHMdU3aM3CUHyMpW+PinYO28pqXRNv0uwdKrtCVjBhqDMhsA__29510.928100399$1486647330$gmane$org@mail.gmail.com>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, Dec 7, 2016 at 4:08 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> This patch series modernizes the printing of kernel messages in the m68k
> architecture core, which is mainly about converting from printk() to
> pr_*().
>
> The trigger for (finally) doing this was the user-visible breakage
> caused by commit 4bcc595ccd80decb ("printk: reinstate KERN_CONT for
> printing continuation lines").
>
> I had hoped to sent this series much earlier, to be still included in
> v4.9, but that didn't happen due to lack of time. Fortunately v4.9 will
> be an LTS(I) kernel, so the first three patches (tagged with a "Fixes"
> tag) will hopefully make it to v4.9.x later ;-)
>
> Compile-tested with my standard set of configs.
> Boot-tested on ARAnyM.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (22):
>   m68k/atari: Modernize printing of kernel messages
>   m68k/68000: Modernize printing of kernel messages
>   m68k/bvme6000: Modernize printing of kernel messages
>   m68k/mvme147: Modernize printing of kernel messages
>   m68k/mvme16x: Modernize printing of kernel messages
>   m68k/q40: Modernize printing of kernel messages
>   m68k/sun3: Modernize printing of kernel messages
>   m68k/sun3x: Modernize printing of kernel messages
>   m68k/kernel: Modernize printing of kernel messages
>   m68k/mm: sun3 - Modernize printing of kernel messages
>   m68k/mm: Modernize printing of kernel messages
>   m68k/include: Modernize printing of kernel messages

I've applied and queued for v4.11 the subset above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
