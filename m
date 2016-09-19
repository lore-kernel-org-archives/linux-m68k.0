From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH v4] m68k: let clk_disable() return immediately if clk is
 NULL
Date: Mon, 19 Sep 2016 10:08:17 +1000
Message-ID: <1ce86362-df47-bbb4-3f44-1f65fb340aa3@linux-m68k.org>
References: <1474221674-21625-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1474221674-21625-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-m68k@lists.linux-m68k.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org

Hi Masahiro,

On 19/09/16 04:01, Masahiro Yamada wrote:
> In many of clk_disable() implementations, it is a no-op for a NULL
> pointer input, but this is one of the exceptions.
> 
> Making it treewide consistent will allow clock consumers to call
> clk_disable() without NULL pointer check.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Greg Ungerer <gerg@uclinux.org>

I will apply to my m68knommu git tree (for-next) branch.

Thanks
Greg



> ---
> 
> Changes in v4:
>   - Split into per-arch patches
> 
> Changes in v3:
>   - Return only when clk is NULL.  Do not take care of error pointer.
> 
> Changes in v2:
>   - Rebase on Linux 4.6-rc1
> 
>  arch/m68k/coldfire/clk.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
> index fddfdcc..1e3c7e9 100644
> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -101,6 +101,10 @@ EXPORT_SYMBOL(clk_enable);
>  void clk_disable(struct clk *clk)
>  {
>  	unsigned long flags;
> +
> +	if (!clk)
> +		return;
> +
>  	spin_lock_irqsave(&clk_lock, flags);
>  	if ((--clk->enabled == 0) && clk->clk_ops)
>  		clk->clk_ops->disable(clk);
> 
