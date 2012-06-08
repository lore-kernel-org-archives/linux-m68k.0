From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 5/5] m68k: CPU32 does not support unaligned accesses
Date: Fri, 8 Jun 2012 13:51:10 +1000
Message-ID: <4FD176AE.9030903@snapgear.com>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org> <1339094827-12349-5-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-5-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org

On 08/06/12 04:47, Geert Uytterhoeven wrote:
> Hence select CPU_HAS_NO_UNALIGNED
>
> Reported-by: Philippe De Muyter<phdm@macqel.be>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer<gerg@uclinux.org>

Regards
Greg


> ---
>   arch/m68k/Kconfig.cpu |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index c4ed650..d4f3a98 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -50,6 +50,7 @@ config M68000
>   config MCPU32
>   	bool
>   	select CPU_HAS_NO_BITFIELDS
> +	select CPU_HAS_NO_UNALIGNED
>   	help
>   	  The Freescale (was then Motorola) CPU32 is a CPU core that is
>   	  based on the 68020 processor. For the most part it is used in


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
