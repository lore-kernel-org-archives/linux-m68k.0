Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AE4502F
	for <linux-m68k@vger.kernel.org>; Mon, 27 Apr 2026 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251526; cv=none; b=FLT7kXIe3vHVHSm/wX43r8CTyN1DW/m4Dkd7P1ydLmwHR2z7FrHjLnUle2iqEJ4HGkcToj/4+Rqd/VgXbpElh38wwzzRH6k22yBlHL9ZIfsSNTEDfQlquG/DhRNsucFBu4/nBWeREiDJy8LNy8f9D/8aS0EDQmpKqWctUfmnIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251526; c=relaxed/simple;
	bh=SxFZCoUvQSy7fbfpyi7sxeASqcaxk6vAf4lqzaD3/RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KM0OdLmrau19hwalSe1KlW4Q6AAavueAJPfvas2X0p8wwJWNe44EBMy9VTD2k5wby+zyFtODO4SnrzwtIFM93JcDlIC0Op29fW102VFqPQZUJr5kRw768bHwAy4O6X/lSU+M/hU6IYoDYbwxb5thtEsG77CRwEETJZf9e3uJw2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E2DC2BCAF;
	Mon, 27 Apr 2026 00:58:45 +0000 (UTC)
Message-ID: <dbaa7733-aa87-49bd-8098-6b6336f3b59b@linux-m68k.org>
Date: Mon, 27 Apr 2026 10:58:42 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] config: stmark2: defconfig updates
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org
References: <20260415205042.20930-1-angelo@kernel-space.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260415205042.20930-1-angelo@kernel-space.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

Both patches applied to m68knommu git tree, for-next branch.

Thanks
Greg


On 16/4/26 06:50, Angelo Dureghello wrote:
> Various updates, mainly to reduce kernel size.
> 
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
> ---
>   arch/m68k/configs/stmark2_defconfig | 33 +++++++++++++++++------------
>   1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index 515d9b208b10..b3fb95f73a95 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -2,16 +2,20 @@ CONFIG_LOCALVERSION="stmark2-001"
>   CONFIG_DEFAULT_HOSTNAME="stmark2"
>   CONFIG_SYSVIPC=y
>   CONFIG_LOG_BUF_SHIFT=14
> -CONFIG_NAMESPACES=y
>   CONFIG_BLK_DEV_INITRD=y
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_XZ is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +# CONFIG_RD_ZSTD is not set
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +CONFIG_EXPERT=y
>   # CONFIG_FHANDLE is not set
>   # CONFIG_AIO is not set
>   # CONFIG_ADVISE_SYSCALLS is not set
>   # CONFIG_MEMBARRIER is not set
> -CONFIG_EXPERT=y
> -# CONFIG_VM_EVENT_COUNTERS is not set
> -# CONFIG_COMPAT_BRK is not set
> +# CONFIG_KALLSYMS is not set
>   CONFIG_COLDFIRE=y
>   CONFIG_M5441x=y
>   CONFIG_CLOCK_FREQ=240000000
> @@ -21,10 +25,12 @@ CONFIG_RAMBASE=0x40000000
>   CONFIG_RAMSIZE=0x8000000
>   CONFIG_VECTORBASE=0x40000000
>   CONFIG_KERNELBASE=0x40001000
> -# CONFIG_BLK_DEV_BSG is not set
>   CONFIG_BINFMT_FLAT=y
>   CONFIG_BINFMT_ZFLAT=y
>   CONFIG_BINFMT_MISC=y
> +# CONFIG_COREDUMP is not set
> +# CONFIG_COMPAT_BRK is not set
> +# CONFIG_VM_EVENT_COUNTERS is not set
>   CONFIG_DEVTMPFS=y
>   CONFIG_DEVTMPFS_MOUNT=y
>   # CONFIG_ALLOW_DEV_COREDUMP is not set
> @@ -47,11 +53,11 @@ CONFIG_MTD_SPI_NOR=y
>   # CONFIG_INPUT_MOUSE is not set
>   CONFIG_SERIO_LIBPS2=y
>   # CONFIG_UNIX98_PTYS is not set
> -# CONFIG_DEVMEM is not set
>   CONFIG_SERIAL_MCF=y
>   CONFIG_SERIAL_MCF_BAUDRATE=115200
>   CONFIG_SERIAL_MCF_CONSOLE=y
>   # CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
>   CONFIG_SPI=y
>   CONFIG_SPI_DEBUG=y
>   CONFIG_SPI_FSL_DSPI=y
> @@ -59,7 +65,7 @@ CONFIG_DEBUG_GPIO=y
>   CONFIG_GPIO_SYSFS=y
>   CONFIG_GPIO_GENERIC_PLATFORM=y
>   # CONFIG_HWMON is not set
> -# CONFIG_HID is not set
> +# CONFIG_HID_SUPPORT is not set
>   # CONFIG_USB_SUPPORT is not set
>   CONFIG_MMC=y
>   CONFIG_MMC_DEBUG=y
> @@ -68,6 +74,8 @@ CONFIG_MMC_SDHCI_PLTFM=y
>   CONFIG_MMC_SDHCI_ESDHC_MCF=y
>   CONFIG_DMADEVICES=y
>   CONFIG_MCF_EDMA=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
>   CONFIG_EXT2_FS=y
>   CONFIG_EXT2_FS_XATTR=y
>   CONFIG_EXT2_FS_POSIX_ACL=y
> @@ -79,14 +87,13 @@ CONFIG_EXT4_FS_SECURITY=y
>   # CONFIG_DNOTIFY is not set
>   # CONFIG_INOTIFY_USER is not set
>   CONFIG_OVERLAY_FS=y
> -CONFIG_FSCACHE=y
>   # CONFIG_PROC_SYSCTL is not set
> -CONFIG_CRAMFS=y
>   CONFIG_SQUASHFS=y
> -CONFIG_ROMFS_FS=y
> -# CONFIG_CRYPTO_HW is not set
> +CONFIG_XZ_DEC=y
>   CONFIG_PRINTK_TIME=y
> -# CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DYNAMIC_DEBUG_CORE=y
> +# CONFIG_DEBUG_MISC is not set
>   # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> -CONFIG_SLUB_DEBUG_ON=y
> +# CONFIG_SLUB_DEBUG is not set
>   CONFIG_PANIC_ON_OOPS=y
> +# CONFIG_RUNTIME_TESTING_MENU is not set

