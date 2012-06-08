From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/5] m68k: Remove duplicate FPU config option
Date: Fri, 8 Jun 2012 11:33:44 +1000
Message-ID: <4FD15678.3050401@snapgear.com>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org

On 08/06/12 04:47, Geert Uytterhoeven wrote:
> It's also defined in arch/m68k/Kconfig.cpu

Yep :-)


> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer<gerg@uclinux.org>

Thanks
Greg


>   arch/m68k/Kconfig |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 1471201..bc8cc50 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -62,9 +62,6 @@ config CPU_HAS_NO_MULDIV64
>   config CPU_HAS_ADDRESS_SPACES
>   	bool
>
> -config FPU
> -	bool
> -
>   config HZ
>   	int
>   	default 1000 if CLEOPATRA


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
