From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k/sun3: Dynamically allocate the table to track
 IOMMU use
Date: Wed, 26 Jun 2013 17:00:09 +0200
Message-ID: <CAMuHMdUuxvaMJP6rL6HgrPix+asx7acCfA=mZV_CFki5r103hw__10301.6392015435$1372258849$gmane$org@mail.gmail.com>
References: <1372189326-12230-1-git-send-email-geert@linux-m68k.org>
	<1372189326-12230-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1372189326-12230-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Jun 25, 2013 at 9:42 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> -static unsigned long iommu_use[IOMMU_TOTAL_ENTRIES];
> +static unsigned long *iommu_use;
>
>  #define dvma_index(baddr) ((baddr - DVMA_START) >> DVMA_PAGE_SHIFT)
>
> @@ -266,6 +267,7 @@ void __init dvma_init(void)
>
>         list_add(&(hole->list), &hole_list);
>
> +       iommu_use = alloc_bootmem(IOMMU_TOTAL_ENTRIES * sizeof(unsigned long));
>         memset(iommu_use, 0, sizeof(iommu_use));

Bummer, the sizeof in the above line is no longer valid.
As the bootmem allocator zeroes memory, the line can just be removed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
