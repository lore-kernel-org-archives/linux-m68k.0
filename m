Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2CA2C08D0
	for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jan 2026 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785466; cv=none; b=AY+b2pCgn7URdvszvUy9XAU1VtMX2S0jpXGflgaThyxLz+PVHxWu9uRy82b4jUuG2u5m2RtGMVCe4ofiY/+Dikfc35/qbS7VE9/KvXoCV+5tYji0O3yMVzXPwTDNiW6Rc5z7QBg3xU7vyMgD/4HqZNkWRPReoqhqX9oEhYqlFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785466; c=relaxed/simple;
	bh=u7pHaGvmHTojx5iXR3lp59lQCFmb0Z1DN+pq81nREqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oD0zJT7gKS3jrREwSNNUuLgpQriADHw49ME/cpZYIh/VOcZ92ap66nR3KHojq09iltbZ9dN2zqwkijT8YPbqIMLagh1gsZDFV10SyvcZxoXErc1p4Yh3xm9/MOy6euvn417oP35CPBIXD1/uM1QoOiDxARZW4BPzBl/CNjCUo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6F9A6001D;
	Wed,  7 Jan 2026 11:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E62C4CEF7;
	Wed,  7 Jan 2026 11:30:58 +0000 (UTC)
Message-ID: <3405e3f0-0efe-4c57-92c7-9c425f3a9963@linux-m68k.org>
Date: Wed, 7 Jan 2026 21:30:54 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: defconfig: Clean up references to non-existing
 configs
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
 <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/26 20:19, Geert Uytterhoeven wrote:
> CC gerg (coldfire/m68knommu)

Thanks Geert :-)


> On Wed, 7 Jan 2026 at 10:21, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>>
>>    - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
>>      ("i2c: Remove I2C_COMPAT config symbol and related code"))
>>    - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
>>      ("sched/debug: Remove CONFIG_SCHED_DEBUG"))
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>> ---
>>   arch/m68k/configs/amcore_defconfig   | 2 --
>>   arch/m68k/configs/m5475evb_defconfig | 1 -
>>   arch/m68k/configs/stmark2_defconfig  | 1 -
>>   3 files changed, 4 deletions(-)

Looks good to me, I have applied to m68knommu git tree, for-next branch.

Thanks
Greg



>> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
>> index 88832e9cd7cb..f310b5dacfd8 100644
>> --- a/arch/m68k/configs/amcore_defconfig
>> +++ b/arch/m68k/configs/amcore_defconfig
>> @@ -61,7 +61,6 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
>>   CONFIG_SERIAL_MCF_CONSOLE=y
>>   # CONFIG_HW_RANDOM is not set
>>   CONFIG_I2C=y
>> -# CONFIG_I2C_COMPAT is not set
>>   CONFIG_I2C_CHARDEV=y
>>   # CONFIG_I2C_HELPER_AUTO is not set
>>   CONFIG_I2C_IMX=y
>> @@ -83,7 +82,6 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
>>   CONFIG_PRINTK_TIME=y
>>   # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>>   CONFIG_PANIC_ON_OOPS=y
>> -# CONFIG_SCHED_DEBUG is not set
>>   # CONFIG_DEBUG_BUGVERBOSE is not set
>>   # CONFIG_CRYPTO_ECHAINIV is not set
>>   # CONFIG_CRYPTO_HW is not set
>> diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
>> index 2473dc30228e..9be4dae84ebf 100644
>> --- a/arch/m68k/configs/m5475evb_defconfig
>> +++ b/arch/m68k/configs/m5475evb_defconfig
>> @@ -46,6 +46,5 @@ CONFIG_EXT2_FS=y
>>   # CONFIG_PROC_PAGE_MONITOR is not set
>>   CONFIG_ROMFS_FS=y
>>   CONFIG_ROMFS_BACKED_BY_MTD=y
>> -# CONFIG_SCHED_DEBUG is not set
>>   CONFIG_BOOTPARAM=y
>>   CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
>> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
>> index f9ecb1dcc060..515d9b208b10 100644
>> --- a/arch/m68k/configs/stmark2_defconfig
>> +++ b/arch/m68k/configs/stmark2_defconfig
>> @@ -90,4 +90,3 @@ CONFIG_PRINTK_TIME=y
>>   # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>>   CONFIG_SLUB_DEBUG_ON=y
>>   CONFIG_PANIC_ON_OOPS=y
>> -# CONFIG_SCHED_DEBUG is not set
>> --
>> 2.52.0
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

