From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68knommu changes for v5.3
Date: Wed, 10 Jul 2019 09:18:00 +0200
Message-ID: <CAMuHMdVTq1mftwsLuePwzNN33bsNFWyL99bwnvJLhAO0RgSeXQ@mail.gmail.com>
References: <cf9d62c7-2b47-e234-ee35-2562b125a411@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cf9d62c7-2b47-e234-ee35-2562b125a411@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

On Wed, Jul 10, 2019 at 7:22 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> Can you please pull the m68knommu git tree, for-next branch.
>
> A series of cleanups for the FLAT format binary loader, binfmt_flat,
> from Christoph. The end goal is to support no-MMU on RISC-V, and the
> last patch enables that.

Please note there will be two add/add merge conflicts in
arch/m68k/Kconfig.  The correct resolution is to keep the additions from
both sides (and keep them sorted).

Sorry for the troubles.

Thanks!

> The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:
>
>    Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)
>
> are available in the Git repository at:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next
>
> for you to fetch changes up to ad97f9df0fee4ddc9ef056dda4dcbc6630d9f972:
>
>    riscv: add binfmt_flat support (2019-06-24 09:16:47 +1000)

>   arch/m68k/Kconfig                                  |  2 +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
