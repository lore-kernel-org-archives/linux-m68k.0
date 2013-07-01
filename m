From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k/mac: Fix comment about iop_*_present flags setup
 timing
Date: Mon, 1 Jul 2013 18:12:12 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1307011812050.9202@nippy.intranet>
References: <1372586362-1206-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1372586362-1206-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Sun, 30 Jun 2013, Geert Uytterhoeven wrote:

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/mac/iop.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
> index 7d8d461..8a4c446 100644
> --- a/arch/m68k/mac/iop.c
> +++ b/arch/m68k/mac/iop.c
> @@ -118,9 +118,9 @@
>  
>  /*#define DEBUG_IOP*/
>  
> -/* Set to non-zero if the IOPs are present. Set by iop_init() */
> +/* Set to non-zero if the IOPs are present. Set by iop_preinit() */

I would write,

-/* Set to non-zero if the IOPs are present. Set by iop_init() */
+/* Non-zero if the IOPs are present */

Finn
