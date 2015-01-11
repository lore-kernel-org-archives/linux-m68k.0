From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arch: m68k: atari: atakeyb.c: Remove some unused functions
Date: Sun, 11 Jan 2015 11:42:22 +0100
Message-ID: <CAMuHMdXA+geFx56t61Ec-pb9WaB_yvP7S1NyFVcHoMcTSrYVSQ__34.875112078403$1420972968$gmane$org@mail.gmail.com>
References: <1420126677-27948-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1420126677-27948-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 1, 2015 at 4:37 PM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:
> Removes some functions that are not used anywhere:
> atari_kbd_leds() ikbd_exec() ikbd_mem_read() ikbd_mem_write()
> ikbd_clock_get() ikbd_clock_set() ikbd_pause() ikbd_resume()
>
> This was partially found by using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

Thanks, applied and queued for 3.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
