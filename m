From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 00/14] Modernization and fixes for NuBus subsystem
Date: Fri, 5 Jan 2018 14:20:04 +0100
Message-ID: <CAMuHMdX1Z0y2u1nkj3GqF5N3jYBYvfjM9_jJKH0zM23DBNjhOw@mail.gmail.com>
References: <cover.1513220582.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513220582.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Finn,

On Thu, Dec 14, 2017 at 4:16 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> This series begins with cleanups and fixes for the NuBus subsystem and
> finishes with a patch to add support for the Linux Driver Model.
> A separate series (which requires this one) modernizes NuBus drivers.

Thanks for your series!

I assume you meant this to go in through the m68k tree?

Can you please run this through checkpatch, and fix the reported white space
and other real (some are false positives) issues?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
