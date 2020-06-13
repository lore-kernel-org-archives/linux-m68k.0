Return-Path: <SRS0=oNGv=72=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED44C433DF
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Jun 2020 07:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 186D820789
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Jun 2020 07:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgFMHHu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 13 Jun 2020 03:07:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgFMHHu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 13 Jun 2020 03:07:50 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA3F120739;
        Sat, 13 Jun 2020 07:07:48 +0000 (UTC)
Subject: Re: [PATCH] m68k: stmark2: defconfig updates
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     linux-m68k@vger.kernel.org
References: <20200607191215.2626739-1-angelo.dureghello@timesys.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <1e8c2220-b0db-0bd0-856c-dd560a4ad01c@linux-m68k.org>
Date:   Sat, 13 Jun 2020 17:07:45 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607191215.2626739-1-angelo.dureghello@timesys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 8/6/20 5:12 am, Angelo Dureghello wrote:
> Some defconfig updates for stmark2 board, mainly to enable
> sdcard and mmu.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

Will apply to the m68knommu git tree, for-next branch, after the
current merge window closes. Should show up there early next week

Regards
Greg


> ---
>   arch/m68k/configs/stmark2_defconfig | 48 ++++++++++++++++-------------
>   1 file changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index 27fa9465d19d..d92306472fce 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -1,38 +1,33 @@
>   CONFIG_LOCALVERSION="stmark2-001"
>   CONFIG_DEFAULT_HOSTNAME="stmark2"
>   CONFIG_SYSVIPC=y
> -# CONFIG_FHANDLE is not set
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_NAMESPACES=y
>   CONFIG_BLK_DEV_INITRD=y
> -# CONFIG_RD_BZIP2 is not set
> -# CONFIG_RD_LZMA is not set
> -# CONFIG_RD_XZ is not set
> -# CONFIG_RD_LZO is not set
> -# CONFIG_RD_LZ4 is not set
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_FHANDLE is not set
>   # CONFIG_AIO is not set
>   # CONFIG_ADVISE_SYSCALLS is not set
>   # CONFIG_MEMBARRIER is not set
>   CONFIG_EMBEDDED=y
>   # CONFIG_VM_EVENT_COUNTERS is not set
>   # CONFIG_COMPAT_BRK is not set
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_BLK_CMDLINE_PARSER=y
> -# CONFIG_MMU is not set
> +CONFIG_COLDFIRE=y
>   CONFIG_M5441x=y
>   CONFIG_CLOCK_FREQ=240000000
>   CONFIG_STMARK2=y
> +CONFIG_UBOOT=y
>   CONFIG_RAMBASE=0x40000000
>   CONFIG_RAMSIZE=0x8000000
>   CONFIG_VECTORBASE=0x40000000
>   CONFIG_KERNELBASE=0x40001000
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_BLK_CMDLINE_PARSER=y
>   CONFIG_BINFMT_FLAT=y
> +CONFIG_BINFMT_ZFLAT=y
>   CONFIG_BINFMT_MISC=y
> -# CONFIG_UEVENT_HELPER is not set
>   CONFIG_DEVTMPFS=y
>   CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>   # CONFIG_ALLOW_DEV_COREDUMP is not set
>   CONFIG_MTD=y
>   CONFIG_MTD_CMDLINE_PARTS=y
> @@ -48,7 +43,6 @@ CONFIG_MTD_CFI_STAA=y
>   CONFIG_MTD_ROM=y
>   CONFIG_MTD_COMPLEX_MAPPINGS=y
>   CONFIG_MTD_PLATRAM=y
> -CONFIG_MTD_M25P80=y
>   CONFIG_MTD_SPI_NOR=y
>   # CONFIG_INPUT_KEYBOARD is not set
>   # CONFIG_INPUT_MOUSE is not set
> @@ -66,24 +60,36 @@ CONFIG_DEBUG_GPIO=y
>   CONFIG_GPIO_SYSFS=y
>   CONFIG_GPIO_GENERIC_PLATFORM=y
>   # CONFIG_HWMON is not set
> -# CONFIG_RC_CORE is not set
>   # CONFIG_HID is not set
>   # CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=y
> +CONFIG_MMC_DEBUG=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_ESDHC_MCF=y
> +CONFIG_DMADEVICES=y
> +CONFIG_MCF_EDMA=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT2_FS_XATTR=y
> +CONFIG_EXT2_FS_POSIX_ACL=y
> +CONFIG_EXT2_FS_SECURITY=y
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +CONFIG_EXT3_FS_SECURITY=y
>   # CONFIG_FILE_LOCKING is not set
>   # CONFIG_DNOTIFY is not set
>   # CONFIG_INOTIFY_USER is not set
> +CONFIG_OVERLAY_FS=y
>   CONFIG_FSCACHE=y
>   # CONFIG_PROC_SYSCTL is not set
> +CONFIG_CRAMFS=y
> +CONFIG_SQUASHFS=y
> +CONFIG_ROMFS_FS=y
> +CONFIG_CRYPTO_ANSI_CPRNG=y
> +# CONFIG_CRYPTO_HW is not set
>   CONFIG_PRINTK_TIME=y
> +# CONFIG_DEBUG_BUGVERBOSE is not set
>   # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>   CONFIG_SLUB_DEBUG_ON=y
>   CONFIG_PANIC_ON_OOPS=y
>   # CONFIG_SCHED_DEBUG is not set
> -# CONFIG_DEBUG_BUGVERBOSE is not set
> -CONFIG_BOOTPARAM=y
> -CONFIG_BOOTPARAM_STRING="console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1"
> -CONFIG_CRYPTO=y
> -# CONFIG_CRYPTO_ECHAINIV is not set
> -CONFIG_CRYPTO_ANSI_CPRNG=y
> -# CONFIG_CRYPTO_HW is not set
> -CONFIG_CRC16=y
> 
