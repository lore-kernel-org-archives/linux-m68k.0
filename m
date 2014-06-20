From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68knommu: Remove unnecessary prototype for kobjsize()
Date: Sat, 21 Jun 2014 00:21:50 +1000
Message-ID: <53A4437E.1030107__5461.60361632264$1403274142$gmane$org@uclinux.org>
References: <1403249376-27739-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1403249376-27739-1-git-send-email-tklauser@distanz.ch>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Tobias,

On 20/06/14 17:29, Tobias Klauser wrote:
> The prototype for kobjsize() is already defined in linux/mm.h which is
> included where kobjsize() is used.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Thanks. I have added this to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
>   arch/m68k/include/asm/pgtable_no.h |    5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
> index c527fc2..11859b8 100644
> --- a/arch/m68k/include/asm/pgtable_no.h
> +++ b/arch/m68k/include/asm/pgtable_no.h
> @@ -46,11 +46,6 @@ static inline int pte_file(pte_t pte) { return 0; }
>   #define ZERO_PAGE(vaddr)	(virt_to_page(0))
>
>   /*
> - * These would be in other places but having them here reduces the diffs.
> - */
> -extern unsigned int kobjsize(const void *objp);
> -
> -/*
>    * No page table caches to initialise.
>    */
>   #define pgtable_cache_init()	do { } while (0)
>
