Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152593BFACC
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749170; cv=none; b=lbq/9QDoEMyaB2r4/7f4hiAXK17vjRwH8EU1ngPybvxDoxNh+Q/SFNHwGU6w8WotYYpSIknfuVM/WOS6Ghga/MF8olDCFR3RLGLH9vN91oDz9+MP4/JE5dgvPdjFI7sNkafl+X8rrJsA8c9hIH9AmfIAavAZvoyETd3Fi8MvGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749170; c=relaxed/simple;
	bh=KSNu2qKdDUKPXS4zpQDu0g3LUL37FxWwVugt6CPoZs0=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=p7HlUdfd7QvuFJ8CFkQhmPRQb8bgP9U7RsId2QxxJoUy114L9kv3NgnvSifl0zm34SzEjis8s0hrPEP+DWeuT52WexGz2GTZr/fTX4fPnD2J57M5J/xtfQODdY1t0FeCjsgQw724J4ULX7Z6KJXrE7Jx3Q5zNS5iDKX/PbQfruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpEG0sqS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpEG0sqS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbf0dc8c871so925068a12.1
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749168; x=1787353968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F8+x0axk8XQ8Qlyy7fnGMGTK1c1CInT+1rLK6scfORE=;
        b=bpEG0sqS4shyF/uGzPaYVmF7eKVnDX/+jIQ1+ishMUvQqtv5wRJivq6cCUP5w476zG
         xKZv4V3xXNl57U4KUK7OsZYV3KW71z4xZj/zWKbMLDCTIexuqsgHBf6+orWldJ2HFn3R
         g6vv80ALikD5DG+u7YMSV9VqMVjNl1zngLkuTqWwmJD495z3/yZOsAhLdlkeyCIPbwKt
         7hX0a1Rx9aKLSLf1jr7lVvK2xQbAqhS64Hv8LoosH295k+UD2e3QwEneGiSi5KYpcW27
         5kNkMLYJFPadyip4lIsGB9F4NZYqOIo98lJZABQiZnjY/kz2CmmphThDCH9TAnt3aTPt
         jBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749168; x=1787353968;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8+x0axk8XQ8Qlyy7fnGMGTK1c1CInT+1rLK6scfORE=;
        b=bODJFH/4Ei/1DD6VCeHK/QjLnW7wYWlZMhZ3IJDkgsVwCO9YORbpfUXBPTyTvuEh0q
         FM/3ZVECvrMMcWi85sjFMiLNkzo9jRirjP0Lt6hWt+MkJ2shylAMxg6/YAK09XtdYd3Q
         0/LLAtBtRlTk5vNSNG2S+6ObN6d2Vjkol+xS62U+QLlgxeV7IWoW0+61+7Agh3x5yU1U
         ObHstG1niZbV+2CS6Ssf9+R9x1wdMe6SGwkIw+n5rpYL29twhOAx/KuDbing5eNUJCrH
         QjCsx43XdqSfLH69rmMGoLUJPx4+ba55nKmtSS22fV9p61b8j1oTtwOgfweP0XeWVEYA
         L45g==
X-Gm-Message-State: AOJu0YyZkXe87+Cj1VsaVkxpB5jrokFdaLjUTBLJ3tAv2xU5K7X1o3/N
	Om3/AMWLk1Bo6GZvcYsGYMSPbCRzbtkh/4a7IeiGwlR4EnKBVWNZDF2dv+GNAA==
X-Gm-Gg: AR+sD11CGzQFAsFiBCIaBbrNrSZvKScb6WqXXSP1GRaE+cXz6378J7gZzrCpGvkOqua
	7Z+TNi5bS8joNOE8ilO/tE8YZYbQ7kHwuLwm4eaOG5a9LqNNgJ4y1datxx2xG1v1Fj6PirLhPJX
	vEhEFPBrEMETcRddAmNfdhk2fmGwvEAojU4MLM/H/EBP8jxxFU9fz7Y7qwvbnazfi17WJDCAT7Y
	/bGHU4ulAfvBfsl0onIoTMpApn77JYAK2IM4qB/5lIuN1eenhoF77qrqaur1YUfVXEA05E+YgpC
	hfq3S8Eu2FtpSEmjhmSyTrmgEWrNBo1Nk01LqXyeLnOyMj7oJalUOBVLuR5d7SlLLg/EzOHLGLG
	axsGT8MmSNktowtKR8q/1259ojtvOKNbVNsKmQ5L5LiAVuinBp5a8J8hi3c4BYUT+Z5tPosyR2/
	CrDWSOCRqf9fVQC3kT5F4s1Gda3KqqGFwunccqynfDjf/TvDJQG8MWZZ2dzd0L1v+rsmLwSnSzj
	nGQyckCciAKz9bCc/PmZBNt
X-Received: by 2002:a05:6a21:998c:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3cc71d50736mr8437572637.32.1786749168343;
        Fri, 14 Aug 2026 16:12:48 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm9165280eec.12.2026.08.14.16.12.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2026 16:12:47 -0700 (PDT)
Subject: Re: [PATCH 5/5] m68k: Add support for Svethlana
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
 <20260814031745.17140-6-schmitzmic@gmail.com>
 <CAMuHMdXQJht5SZf0b2C-=dhYk9NTFZoQE_vKmptE+=TS1w=ZWw@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>,
 Helge Deller <deller@gmx.de>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f60d0871-6d83-fcb5-a51e-32e3eb14f59f@gmail.com>
Date: Sat, 15 Aug 2026 11:12:42 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQJht5SZf0b2C-=dhYk9NTFZoQE_vKmptE+=TS1w=ZWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

thanks for your review!

Am 14.08.2026 um 20:07 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> Thanks for your patch!
>
> On Fri, 14 Aug 2026 at 05:18, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> From: Miro Kropacek <miro.kropacek@gmail.com>
>>
>> The SuperVidel FPGA contains an OpenCore ethernet package. Add
>> platform device data and other necessary definitions to support
>> this device on Atari.
>>
>> The ethoc module must be enabled separately by the user.
>>
>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>
> Since you're now in the path to upstream, you should add your SoB here

Will do ...

>
>> --- a/arch/m68k/atari/config.c
>> +++ b/arch/m68k/atari/config.c
>> @@ -34,6 +34,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/usb/isp116x.h>
>>  #include <linux/module.h>
>> +#include <net/ethoc.h>
>>
>>  #include <asm/bootinfo.h>
>>  #include <asm/bootinfo-atari.h>
>> @@ -748,6 +749,62 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
>>  };
>>  #endif /* CONFIG_ATARI_ETHERNAT */
>>
>> +#ifdef CONFIG_ATARI_SVETHLANA
>> +/*
>> + * SVEthlana: OpenCores 10/100 Mbps Ethernet MAC in the SuperVidel FPGA,
>> + * handled by the ethoc driver. Requires SuperVidel firmware version 10
>> + * or newer (Ethernet DMA).
>> + *
>> + * The MAC can only DMA within the SuperVidel DDR RAM, so the packet
>> + * buffers are carved out of the top of the DDR; the framebuffer lives
>> + * at the bottom.
>> + */
>> +
>> +#define ATARI_SVETHLANA_PHYS_ADDR      0x80012000
>> +#define ATARI_SVETHLANA_IRQ            141     /* vector 0xc5 */
>> +
>> +#define ATARI_SV_VERSION_PHYS_ADDR     0x8001007c
>> +#define ATARI_SV_DDR_END               0xa8000000
>> +/* 128 packet buffers of 1536 bytes each, the maximum ethoc supports */
>> +#define SVETHLANA_BUF_SIZE             (128 * 1536)
>> +
>> +static struct resource svethlana_resources[] = {
>> +       [0] = {
>> +               .name   = "ethoc-regs",
>> +               .start  = ATARI_SVETHLANA_PHYS_ADDR,
>> +               .end    = ATARI_SVETHLANA_PHYS_ADDR + 0x7ff,
>> +               .flags  = IORESOURCE_MEM,
>> +       },
>> +       [1] = {
>> +               .name   = "ethoc-buf",
>> +               .start  = ATARI_SV_DDR_END - SVETHLANA_BUF_SIZE,
>> +               .end    = ATARI_SV_DDR_END - 1,
>> +               .flags  = IORESOURCE_MEM,
>> +       },
>> +       [2] = {
>> +               .name   = "ethoc-irq",
>> +               .start  = ATARI_SVETHLANA_IRQ,
>> +               .end    = ATARI_SVETHLANA_IRQ,
>> +               .flags  = IORESOURCE_IRQ,
>> +       },
>> +};
>> +
>> +static struct ethoc_platform_data svethlana_platform_data = {
>> +       .phy_id         = -1,
>> +       .big_endian     = true,
>
> Does SVEthlana contain a unique MAC address?  Without this, you probably
> get a different random MAC, and thus a different IP address from DHCP.
>
>> +};
>> +
>> +static struct platform_device svethlana_device = {
>> +       .name           = "ethoc",
>> +       .id             = -1,
>> +       .num_resources  = ARRAY_SIZE(svethlana_resources),
>> +       .resource       = svethlana_resources,
>> +       .dev            = {
>> +               .platform_data  = &svethlana_platform_data,
>> +       },
>> +};
>> +#endif /* CONFIG_ATARI_SVETHLANA */
>> +
>>  #ifdef CONFIG_ATARI_ETHERNEC
>>  /*
>>   * EtherNEC: RTL8019 (NE2000 compatible) Ethernet chipset,
>> @@ -892,6 +949,20 @@ static int __init atari_platform_init(void)
>>         }
>>  #endif
>>
>> +#ifdef CONFIG_ATARI_SVETHLANA
>> +       {
>> +               void __iomem *sv_version;
>> +
>> +               sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
>> +               if (sv_version) {
>> +                       if (hwreg_present(sv_version) &&
>> +                           (__raw_readl(sv_version) & 0x3ff) >= 10)
>> +                               rv = platform_device_register(&svethlana_device);
>
> This unconditionally writes to rv, potentially overwriting an error
> code stored by a failed EtherNAT registration attempt.

OK, I'll respin, adding SoB's to the entire series. (Hope this won't 
cause trouble with the fbdev tree ...)

Cheers,

	Michael

>
>> +                       iounmap(sv_version);
>> +               }
>> +       }
>> +#endif
>> +
>>  #ifdef CONFIG_ATARI_ETHERNEC
>>         {
>>                 int error;
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
