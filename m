Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1B372EE9
	for <linux-m68k@vger.kernel.org>; Mon, 27 Apr 2026 12:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294381; cv=none; b=bTxBSgqbuTacvaPTk2jNPRtei6NNC4vOtm8GJaUbJ+YL8wKAfR1jFi8RhWFN5Z7odCv8ahaQwauzhfxVFfXPy3dXq1VowFdp0CrEjIeNlT6l2nao+aPPkhxvWv3X+qm1CwIfF7LP1+zrYs17qt3AOtX9D8fMTGlmN9o8HWquCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294381; c=relaxed/simple;
	bh=HlPCLI913ZL0uRZeZg3YdSCAmBsQ6raUtr4mkl0RE8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQyVkkDjbKXiFztO/IbLbtAG19jcHNAKb4oIhzx9ly1A7EEmLSHKnfuiKFIKzSZtWWXNHYApEqK/60MXH2vZpmEBA49tgwzSVIf0DRpLOMR/GtqVN2+PkqTW6Yfrp2XLwmGl5xvJHaFKJPSpUsAy34IDCDYFYAcJOF/dQ0fPWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=wkfWIWdY; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="wkfWIWdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1777293978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKrCRGAfUokmv00KL+sugw1S9Gjt7tN657S7qkzeLkw=;
	b=wkfWIWdYSbPapqY+Ll9TJZi0IyyjtfMjpzVkhYJY3M5jp+l/gRowHtYbcQrClnsugv0P9C
	935jpqNYakg790r6XIzBMsstz34HlYTnq10eZrXQE1+/La/N37kb+3eCXAk7YaGb33lCUK
	oNQ+jZNVZxbimaiYiFC93y9ZuySWwC8=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 523457c8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 27 Apr 2026 12:46:17 +0000 (UTC)
Message-ID: <26430f52-4986-4c25-bd5b-0cfc1940feed@kernel-space.org>
Date: Mon, 27 Apr 2026 14:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] config: stmark2: defconfig updates
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org
References: <20260415205042.20930-1-angelo@kernel-space.org>
 <dbaa7733-aa87-49bd-8098-6b6336f3b59b@linux-m68k.org>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <dbaa7733-aa87-49bd-8098-6b6336f3b59b@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks !

On 4/27/26 02:58, Greg Ungerer wrote:
> Hi Angelo,
> 
> Both patches applied to m68knommu git tree, for-next branch.
> 
> Thanks
> Greg
> 
> 
> On 16/4/26 06:50, Angelo Dureghello wrote:
>> Various updates, mainly to reduce kernel size.
>>
>> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
>> ---
>>   arch/m68k/configs/stmark2_defconfig | 33 +++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
>> index 515d9b208b10..b3fb95f73a95 100644
>> --- a/arch/m68k/configs/stmark2_defconfig
>> +++ b/arch/m68k/configs/stmark2_defconfig
>> @@ -2,16 +2,20 @@ CONFIG_LOCALVERSION="stmark2-001"
>>   CONFIG_DEFAULT_HOSTNAME="stmark2"
>>   CONFIG_SYSVIPC=y
>>   CONFIG_LOG_BUF_SHIFT=14
>> -CONFIG_NAMESPACES=y
>>   CONFIG_BLK_DEV_INITRD=y
>> +# CONFIG_RD_BZIP2 is not set
>> +# CONFIG_RD_LZMA is not set
>> +# CONFIG_RD_XZ is not set
>> +# CONFIG_RD_LZO is not set
>> +# CONFIG_RD_LZ4 is not set
>> +# CONFIG_RD_ZSTD is not set
>>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> +CONFIG_EXPERT=y
>>   # CONFIG_FHANDLE is not set
>>   # CONFIG_AIO is not set
>>   # CONFIG_ADVISE_SYSCALLS is not set
>>   # CONFIG_MEMBARRIER is not set
>> -CONFIG_EXPERT=y
>> -# CONFIG_VM_EVENT_COUNTERS is not set
>> -# CONFIG_COMPAT_BRK is not set
>> +# CONFIG_KALLSYMS is not set
>>   CONFIG_COLDFIRE=y
>>   CONFIG_M5441x=y
>>   CONFIG_CLOCK_FREQ=240000000
>> @@ -21,10 +25,12 @@ CONFIG_RAMBASE=0x40000000
>>   CONFIG_RAMSIZE=0x8000000
>>   CONFIG_VECTORBASE=0x40000000
>>   CONFIG_KERNELBASE=0x40001000
>> -# CONFIG_BLK_DEV_BSG is not set
>>   CONFIG_BINFMT_FLAT=y
>>   CONFIG_BINFMT_ZFLAT=y
>>   CONFIG_BINFMT_MISC=y
>> +# CONFIG_COREDUMP is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>>   CONFIG_DEVTMPFS=y
>>   CONFIG_DEVTMPFS_MOUNT=y
>>   # CONFIG_ALLOW_DEV_COREDUMP is not set
>> @@ -47,11 +53,11 @@ CONFIG_MTD_SPI_NOR=y
>>   # CONFIG_INPUT_MOUSE is not set
>>   CONFIG_SERIO_LIBPS2=y
>>   # CONFIG_UNIX98_PTYS is not set
>> -# CONFIG_DEVMEM is not set
>>   CONFIG_SERIAL_MCF=y
>>   CONFIG_SERIAL_MCF_BAUDRATE=115200
>>   CONFIG_SERIAL_MCF_CONSOLE=y
>>   # CONFIG_HW_RANDOM is not set
>> +# CONFIG_DEVMEM is not set
>>   CONFIG_SPI=y
>>   CONFIG_SPI_DEBUG=y
>>   CONFIG_SPI_FSL_DSPI=y
>> @@ -59,7 +65,7 @@ CONFIG_DEBUG_GPIO=y
>>   CONFIG_GPIO_SYSFS=y
>>   CONFIG_GPIO_GENERIC_PLATFORM=y
>>   # CONFIG_HWMON is not set
>> -# CONFIG_HID is not set
>> +# CONFIG_HID_SUPPORT is not set
>>   # CONFIG_USB_SUPPORT is not set
>>   CONFIG_MMC=y
>>   CONFIG_MMC_DEBUG=y
>> @@ -68,6 +74,8 @@ CONFIG_MMC_SDHCI_PLTFM=y
>>   CONFIG_MMC_SDHCI_ESDHC_MCF=y
>>   CONFIG_DMADEVICES=y
>>   CONFIG_MCF_EDMA=y
>> +# CONFIG_VIRTIO_MENU is not set
>> +# CONFIG_VHOST_MENU is not set
>>   CONFIG_EXT2_FS=y
>>   CONFIG_EXT2_FS_XATTR=y
>>   CONFIG_EXT2_FS_POSIX_ACL=y
>> @@ -79,14 +87,13 @@ CONFIG_EXT4_FS_SECURITY=y
>>   # CONFIG_DNOTIFY is not set
>>   # CONFIG_INOTIFY_USER is not set
>>   CONFIG_OVERLAY_FS=y
>> -CONFIG_FSCACHE=y
>>   # CONFIG_PROC_SYSCTL is not set
>> -CONFIG_CRAMFS=y
>>   CONFIG_SQUASHFS=y
>> -CONFIG_ROMFS_FS=y
>> -# CONFIG_CRYPTO_HW is not set
>> +CONFIG_XZ_DEC=y
>>   CONFIG_PRINTK_TIME=y
>> -# CONFIG_DEBUG_BUGVERBOSE is not set
>> +CONFIG_DYNAMIC_DEBUG_CORE=y
>> +# CONFIG_DEBUG_MISC is not set
>>   # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> -CONFIG_SLUB_DEBUG_ON=y
>> +# CONFIG_SLUB_DEBUG is not set
>>   CONFIG_PANIC_ON_OOPS=y
>> +# CONFIG_RUNTIME_TESTING_MENU is not set
> 

-- Angelo

