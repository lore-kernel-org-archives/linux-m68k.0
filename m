From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 3/3] Add support to M54xx DMA FEC Driver
Date: Tue, 28 Aug 2012 15:51:24 +1000
Message-ID: <503C5C5C.8000901@snapgear.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Cc: linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org

Hi Stany,

I haven't looked over it in detail, but a few little things anyway.

On 21/08/12 22:18, Stany MARCEL wrote:
> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
> ---
>
>   This driver is an adaption of the one given by freescale for kernel 2.6.25.
>
>   Tested with kernel 3.4.8 with arch/m68k backported from linux-m68k head
>   2 FEC configured with shared phy

I would put your signed-off-by line here (with the --- separator).
I would like to see the above text in the commit message.


>   drivers/net/ethernet/freescale/Kconfig     |   27 +-
>   drivers/net/ethernet/freescale/Makefile    |    1 +
>   drivers/net/ethernet/freescale/fec_m54xx.c | 1589 ++++++++++++++++++++++++++++
>   drivers/net/ethernet/freescale/fec_m54xx.h |  237 +++++
>   4 files changed, 1853 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/net/ethernet/freescale/fec_m54xx.c
>   create mode 100644 drivers/net/ethernet/freescale/fec_m54xx.h
>
> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
> index 3574e14..cef3c62 100644
> --- a/drivers/net/ethernet/freescale/Kconfig
> +++ b/drivers/net/ethernet/freescale/Kconfig
> @@ -7,7 +7,8 @@ config NET_VENDOR_FREESCALE
>   	default y
>   	depends on FSL_SOC || QUICC_ENGINE || CPM1 || CPM2 || PPC_MPC512x || \
>   		   M523x || M527x || M5272 || M528x || M520x || M532x || \
> -		   ARCH_MXC || ARCH_MXS || (PPC_MPC52xx && PPC_BESTCOMM)
> +		   M54xx || ARCH_MXC || ARCH_MXS || \
> +		   (PPC_MPC52xx && PPC_BESTCOMM)
>   	---help---
>   	  If you have a network (Ethernet) card belonging to this class, say Y
>   	  and read the Ethernet-HOWTO, available from
> @@ -53,6 +54,30 @@ config FEC_MPC52xx_MDIO
>   	  If not sure, enable.
>   	  If compiled as module, it will be called fec_mpc52xx_phy.
>
> +config FEC_M54xx
> +	tristate "MCF547x/MCF548x Fast Ethernet Controller support"
> +	depends on M54xx
> +	select MCD_DMA

This should select PHYLIB too, since this driver needs it.


> +	help
> +	  The MCF547x and MCF548x have a built-in Fast Ethernet Controller.
> +	  Saying Y here will include support for this device in the kernel.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called fecm.
> +
> +config FEC_M54xx_ENABLE_FEC2
> +	bool "Enable the second FEC"
> +	depends on FEC_M54xx
> +	help
> +	  This enables the second FEC on the 547x/548x. If you want to use
> +	  it, say Y.

We used to have this on the older FEC driver, but it is all removed
now. I don't think we want this as a config option.

Regards
Greg



> +config FEC_M54xx_SHARED_PHY
> +	bool "Shared PHY interface(on some ColdFire designs)"
> +	depends on FEC_M54xx_ENABLE_FEC2
> +	help
> +	  Say Y here if both PHYs are controlled via a single channel.
> +
>   source "drivers/net/ethernet/freescale/fs_enet/Kconfig"
>
>   config FSL_PQ_MDIO
> diff --git a/drivers/net/ethernet/freescale/Makefile b/drivers/net/ethernet/freescale/Makefile
> index 1752488..64dba64 100644
> --- a/drivers/net/ethernet/freescale/Makefile
> +++ b/drivers/net/ethernet/freescale/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_FEC_MPC52xx) += fec_mpc52xx.o
>   ifeq ($(CONFIG_FEC_MPC52xx_MDIO),y)
>   	obj-$(CONFIG_FEC_MPC52xx) += fec_mpc52xx_phy.o
>   endif
> +obj-$(CONFIG_FEC_M54xx) += fec_m54xx.o
>   obj-$(CONFIG_FS_ENET) += fs_enet/
>   obj-$(CONFIG_FSL_PQ_MDIO) += fsl_pq_mdio.o
>   obj-$(CONFIG_GIANFAR) += gianfar_driver.o


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
