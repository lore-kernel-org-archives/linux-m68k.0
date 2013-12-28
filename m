From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] m68k/defconfig: Enable atyfb for Atari
Date: Sat, 28 Dec 2013 20:12:50 +0100
Message-ID: <CAMuHMdVjsxk1RSX--tCart4FeF=yVFcc9Pgx-cipr6SkPvT3mQ@mail.gmail.com>
References: <1385463434-16605-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1385463434-16605-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Nov 26, 2013 at 11:57 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Does anyone find it worthy to re-enable this? It will cost ca. 24 KiB.
> IIRC, atyfb was disabled a long time ago when it stopped compiling.
> In the mean time, that got fixed.

No response, so let's not enable it again. We need smaller kernels.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
