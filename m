From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k/nommu: fix build when CPU is not coldfire
Date: Thu, 21 Feb 2013 23:45:22 +1000
Message-ID: <512624F2.2030004__34384.2261973352$1361454377$gmane$org@uclinux.org>
References: <1361064814-9727-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1361064814-9727-1-git-send-email-cascardo@holoscopio.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Thadeu,

On 17/02/13 11:33, Thadeu Lima de Souza Cascardo wrote:
> Commit dd1cb3a7c43508c29e17836628090c0735bd3137 unified mm/init.c for both MMU
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Its good practice to include the text title of the patch along with the
commit id.


> and non-MMU m68k platforms. However, it broke when we build a non-MMU M68K
> Classic CPU kernel.
>
> This fix builds a section that came from the MMU version only when we are
> building a MMU kernel.

Looks good thanks. I will push this into the m68knommu git tree.

Regards
Greg



> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> ---
>   arch/m68k/mm/init.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index afd8106f..519aad8 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -188,7 +188,7 @@ void __init mem_init(void)
>   		}
>   	}
>
> -#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
> +#if defined(CONFIG_MMU) && !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
>   	/* insert pointer tables allocated so far into the tablelist */
>   	init_pointer_table((unsigned long)kernel_pg_dir);
>   	for (i = 0; i < PTRS_PER_PGD; i++) {
>
