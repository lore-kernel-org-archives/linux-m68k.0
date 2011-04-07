From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: Remove obsolete #include <linux/sys.h>
Date: Thu, 7 Apr 2011 11:47:31 +1000
Message-ID: <4D9D17B3.7020809@snapgear.com>
References: <alpine.DEB.2.00.1104062141370.28556@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104062141370.28556@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Geert,

On 07/04/11 05:43, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Looks good. Compile and run tested on m68knommu (at 2.6.39-rc2).
I have added this to the m68knommu git tree.

Regards
Greg


> ---
> Janitors: "git grep linux/sys.h" shows many more.
>
>   arch/m68k/kernel/entry_no.S         |    1 -
>   arch/m68k/kernel/syscalltable.S     |    1 -
>   arch/m68k/platform/68328/entry.S    |    1 -
>   arch/m68k/platform/68360/entry.S    |    1 -
>   arch/m68k/platform/coldfire/entry.S |    1 -
>   arch/m68k/platform/coldfire/head.S  |    1 -
>   6 files changed, 0 insertions(+), 6 deletions(-)
>
> diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
> index 2783f25..5f0f6b5 100644
> --- a/arch/m68k/kernel/entry_no.S
> +++ b/arch/m68k/kernel/entry_no.S
> @@ -24,7 +24,6 @@
>    * linux 2.4 support David McCullough<davidm@snapgear.com>
>    */
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<asm/errno.h>
>   #include<asm/setup.h>
> diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
> index 79b1ed1..935e10a 100644
> --- a/arch/m68k/kernel/syscalltable.S
> +++ b/arch/m68k/kernel/syscalltable.S
> @@ -11,7 +11,6 @@
>    *  Copyright (C) 1991, 1992  Linus Torvalds
>    */
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<asm/unistd.h>
>
> diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
> index 676960c..0747318 100644
> --- a/arch/m68k/platform/68328/entry.S
> +++ b/arch/m68k/platform/68328/entry.S
> @@ -10,7 +10,6 @@
>    * Linux/m68k support by Hamish Macdonald
>    */
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<asm/thread_info.h>
>   #include<asm/unistd.h>
> diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
> index 46c1b18..e1477f2 100644
> --- a/arch/m68k/platform/68360/entry.S
> +++ b/arch/m68k/platform/68360/entry.S
> @@ -12,7 +12,6 @@
>    * M68360 Port by SED Systems, and Lineo.
>    */
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<asm/thread_info.h>
>   #include<asm/unistd.h>
> diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
> index 5837cf0..bc15bea 100644
> --- a/arch/m68k/platform/coldfire/entry.S
> +++ b/arch/m68k/platform/coldfire/entry.S
> @@ -26,7 +26,6 @@
>    * Bug, speed and maintainability fixes by Philippe De Muyter<phdm@macqel.be>
>    */
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<asm/unistd.h>
>   #include<asm/thread_info.h>
> diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
> index 129bff4..da21180 100644
> --- a/arch/m68k/platform/coldfire/head.S
> +++ b/arch/m68k/platform/coldfire/head.S
> @@ -8,7 +8,6 @@
>
>   /*****************************************************************************/
>
> -#include<linux/sys.h>
>   #include<linux/linkage.h>
>   #include<linux/init.h>
>   #include<asm/asm-offsets.h>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
