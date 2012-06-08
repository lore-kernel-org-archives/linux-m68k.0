From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 2/5] m68k: Move CPU_HAS_* config options
Date: Fri, 8 Jun 2012 11:38:57 +1000
Message-ID: <4FD157B1.8050509@snapgear.com>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org> <1339094827-12349-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org

On 08/06/12 04:47, Geert Uytterhoeven wrote:
> They belong together with the CPU selection
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer<gerg@uclinux.org>

Regards
Greg


>   arch/m68k/Kconfig     |    9 ---------
>   arch/m68k/Kconfig.cpu |    9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index bc8cc50..87b504c 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -53,15 +53,6 @@ config ZONE_DMA
>   	bool
>   	default y
>
> -config CPU_HAS_NO_BITFIELDS
> -	bool
> -
> -config CPU_HAS_NO_MULDIV64
> -	bool
> -
> -config CPU_HAS_ADDRESS_SPACES
> -	bool
> -
>   config HZ
>   	int
>   	default 1000 if CLEOPATRA
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 2b53254..6cd8c1a 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -360,6 +360,15 @@ config NODES_SHIFT
>   	default "3"
>   	depends on !SINGLE_MEMORY_CHUNK
>
> +config CPU_HAS_NO_BITFIELDS
> +	bool
> +
> +config CPU_HAS_NO_MULDIV64
> +	bool
> +
> +config CPU_HAS_ADDRESS_SPACES
> +	bool
> +
>   config FPU
>   	bool
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
