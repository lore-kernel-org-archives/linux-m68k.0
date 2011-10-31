From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Revive lost DIO bus config option
Date: Mon, 31 Oct 2011 13:51:22 +1000
Message-ID: <4EAE1B3A.7010303@snapgear.com>
References: <1319835295-19519-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1319835295-19519-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On 29/10/11 06:54, Geert Uytterhoeven wrote:
> commit 0e152d80507b75c00aac60f2ffc586360687cd52 ("m68k: reorganize Kconfig
> options to improve mmu/non-mmu selections") accidentally dropped the DIO
> bus config option. Re-add it to the "Bus support" section.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Oops, another one.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Are you going to push these to Linus, or do you want me to
collect these fixes and push?

Regards
Greg


>   arch/m68k/Kconfig.bus |    9 +++++++++
>   1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
> index 7703b54..983e176 100644
> --- a/arch/m68k/Kconfig.bus
> +++ b/arch/m68k/Kconfig.bus
> @@ -2,6 +2,15 @@ if MMU
>
>   comment "Bus Support"
>
> +config DIO
> +	bool "DIO bus support"
> +	depends on HP300
> +	default y
> +	help
> +	  Say Y here to enable support for the "DIO" expansion bus used in
> +	  HP300 machines. If you are using such a system you almost certainly
> +	  want this.
> +
>   config NUBUS
>   	bool
>   	depends on MAC


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
