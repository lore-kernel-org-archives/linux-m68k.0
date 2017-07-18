From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 4/9] m68k: allow NULL clock for clk_get_rate
Date: Tue, 18 Jul 2017 22:03:26 +1000
Message-ID: <d9bde8fc-acd0-5b27-1c55-53c65a88ee06@linux-m68k.org>
References: <20170718101730.2541-1-jonas.gorski@gmail.com>
 <20170718101730.2541-5-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170718101730.2541-5-jonas.gorski@gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Jonas,

On 18/07/17 20:17, Jonas Gorski wrote:
> Make the behaviour of clk_get_rate consistent with common clk's
> clk_get_rate by accepting NULL clocks as parameter. Some device
> drivers rely on this, and will cause an OOPS otherwise.
> 
> Fixes: facdf0ed4f59 ("m68knommu: introduce basic clk infrastructure")
> Cc: Greg Ungerer <gerg@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Do you want me to push this via the m68knommu git tree?
Or are you (or someone) taking the series as a whole?

Regards
Greg



> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Mathias Kresin <dev@kresin.me>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>   arch/m68k/coldfire/clk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
> index 1e3c7e9193d1..856069a3196d 100644
> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -121,6 +121,9 @@ EXPORT_SYMBOL(clk_put);
>   
>   unsigned long clk_get_rate(struct clk *clk)
>   {
> +	if (!clk)
> +		return 0;
> +
>   	return clk->rate;
>   }
>   EXPORT_SYMBOL(clk_get_rate);
> 
