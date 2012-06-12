From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] m68k: Replace m68k-specific _[se]bss by generic __bss_{start,stop}
Date: Tue, 12 Jun 2012 13:17:32 +1000
Message-ID: <4FD6B4CC.4060409@snapgear.com>
References: <1339338998-24629-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339338998-24629-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On 11/06/12 00:36, Geert Uytterhoeven wrote:
> BSS_SECTION() provides the __bss_{start,stop} symbols, so there's no need
> to wrap our own _[se]bss around it.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Both these patches look good to me:

Acked-by: Greg Ungerer<gerg@uclinux.org>

Thanks
Greg


> Prerequisite: mtd/uclinux: Use generic __bss_stop instead of _ebss
>
>   arch/m68k/include/asm/sections.h      |    2 --
>   arch/m68k/kernel/setup_no.c           |    4 ++--
>   arch/m68k/kernel/vmlinux-nommu.lds    |    2 --
>   arch/m68k/kernel/vmlinux-std.lds      |    2 --
>   arch/m68k/kernel/vmlinux-sun3.lds     |    2 --
>   arch/m68k/mm/init_mm.c                |    2 +-
>   arch/m68k/mm/init_no.c                |    2 +-
>   arch/m68k/platform/68328/head-de2.S   |    8 ++++----
>   arch/m68k/platform/68328/head-pilot.S |   10 +++++-----
>   arch/m68k/platform/68328/head-ram.S   |    4 ++--
>   arch/m68k/platform/68328/head-rom.S   |    6 +++---
>   arch/m68k/platform/68360/head-ram.S   |    6 +++---
>   arch/m68k/platform/68360/head-rom.S   |    8 ++++----
>   arch/m68k/platform/coldfire/head.S    |   10 +++++-----
>   14 files changed, 30 insertions(+), 38 deletions(-)


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
