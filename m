From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Revive lost ARAnyM config options
Date: Wed, 26 Oct 2011 10:22:48 +1000
Message-ID: <4EA752D8.3040603@snapgear.com>
References: <1319573128-21127-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1319573128-21127-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On 26/10/11 06:05, Geert Uytterhoeven wrote:
> commit 0e152d80507b75c00aac60f2ffc586360687cd52 ("m68k: reorganize Kconfig
> options to improve mmu/non-mmu selections") accidentally dropped the ARAnyM
> config options. Re-add them to the "Platform devices" section.

Sorry, my fault.


> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg


>   arch/m68k/Kconfig.devices |   31 +++++++++++++++++++++++++++++++
>   1 files changed, 31 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
> index 82ddb93..5cf1c54 100644
> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -24,6 +24,37 @@ config PROC_HARDWARE
>   	  including the model, CPU, MMU, clock speed, BogoMIPS rating,
>   	  and memory size.
>
> +config NATFEAT
> +	bool "ARAnyM emulator support"
> +	depends on ATARI
> +	help
> +	  This option enables support for ARAnyM native features, such as
> +	  access to a disk image as /dev/hda.
> +
> +config NFBLOCK
> +	tristate "NatFeat block device support"
> +	depends on BLOCK&&  NATFEAT
> +	help
> +	  Say Y to include support for the ARAnyM NatFeat block device
> +	  which allows direct access to the hard drives without using
> +	  the hardware emulation.
> +
> +config NFCON
> +	tristate "NatFeat console driver"
> +	depends on NATFEAT
> +	help
> +	  Say Y to include support for the ARAnyM NatFeat console driver
> +	  which allows the console output to be redirected to the stderr
> +	  output of ARAnyM.
> +
> +config NFETH
> +	tristate "NatFeat Ethernet support"
> +	depends on ETHERNET&&  NATFEAT
> +	help
> +	  Say Y to include support for the ARAnyM NatFeat network device
> +	  which will emulate a regular ethernet device while presenting an
> +	  ethertap device to the host system.
> +
>   endmenu
>
>   menu "Character devices"


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
