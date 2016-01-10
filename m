From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix build failure
Date: Sun, 10 Jan 2016 10:35:37 +0100
Message-ID: <CAMuHMdUHD-ndoenW9WUwqgWQswS_nYi67oF7tFmxgMa7mGYcWg@mail.gmail.com>
References: <1451905062-29561-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1451905062-29561-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>

On Mon, Jan 4, 2016 at 11:57 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> The defconfig build of m68k was failing with the error:
> implicit declaration of function '__pfn_to_phys'
>
> Other architectures have added <asm/memory.h>, but if we do so here then
> we will also get redeclaration of some other functions. So it is better
> to copy these macros into page_mm.h.
>
> Fixes: 0a3c3bf11240 ("x86, mm: introduce vmem_altmap to augment vmemmap_populate()")
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
