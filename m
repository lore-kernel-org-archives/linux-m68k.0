From: David Rientjes <rientjes@google.com>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Mon, 25 Apr 2011 13:56:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1104251355410.31884@chino.kir.corp.google.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home>
 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com> <4DB3840F.3060503@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DB3840F.3060503@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, schwab@linux-m68k.org, "tg@mirbsd.de >> Thorsten Glaser" <tg@mirbsd.de>
List-Id: linux-m68k@vger.kernel.org

On Sun, 24 Apr 2011, Michael Schmitz wrote:

> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 02b7a03..b806c19 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -300,6 +300,8 @@ void __init paging_init(void)
>                zones_size[ZONE_DMA] = m68k_memory[i].size >> PAGE_SHIFT;
>                free_area_init_node(i, zones_size,
>                                    m68k_memory[i].addr >> PAGE_SHIFT, NULL);
> +                if (node_present_pages(i))
> +                        node_set_state(i, N_NORMAL_MEMORY);
>        }
> }
> 

Ok, would you like to write a changelog for this similar to mine and then 
propose it as an alternative?

Thanks!
