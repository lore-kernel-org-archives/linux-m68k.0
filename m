From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] unaligned.h fix for M68000 core
Date: Mon, 14 May 2012 11:10:10 +1000
Message-ID: <4FB05B72.7030901@snapgear.com>
References: <68000 unaligned.h> <1336927182-3505-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1336927182-3505-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org

Hi Luis,

On 14/05/12 02:39, Luis Alves wrote:
> This patch fixes unaligned memory access for the 68000 core based cpu's.
>
> Some time ago, my cpu (68000) was raising address/bus error's when mounting cifs shares (didn't bother to debug it at the time).
> After developing the MMC/SD card driver I was having the same issue when mounting the vfat fs.
>
> I've traced the issue down to the 'unaligned.h' file. (I guess nobody has ever used unaligned.h back in the 68328 'era'.

Looks good, thanks.
I'll apply it to the m68knommu git tree.

Regards
Greg


> Signed-off-by: Luis Alves<ljalvs@gmail.com>
> ---
>   arch/m68k/include/asm/unaligned.h |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unaligned.h b/arch/m68k/include/asm/unaligned.h
> index 019caa7..f4043ae 100644
> --- a/arch/m68k/include/asm/unaligned.h
> +++ b/arch/m68k/include/asm/unaligned.h
> @@ -2,7 +2,7 @@
>   #define _ASM_M68K_UNALIGNED_H
>
>
> -#ifdef CONFIG_COLDFIRE
> +#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
>   #include<linux/unaligned/be_struct.h>
>   #include<linux/unaligned/le_byteshift.h>
>   #include<linux/unaligned/generic.h>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
