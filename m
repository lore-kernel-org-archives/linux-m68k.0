Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001C158A12
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711088; cv=none; b=mcsRwZW1fje7z+mVS7+ruFL57HGfI2erTtvAmTvFoVemQR+VtMa1H8ttg+vl2CrAvMAWQk8o3J+Ciuq+SdoAsYf+vuyexFWotYPolL3XCGI8IsR/CkcSWsjHKesCUSNCADolAhfkpL2pMA05keYhUoib81xXV4bYdiwluiietMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711088; c=relaxed/simple;
	bh=5NTWzAXAMCFG5DfeKq+gXsMBuzgbAfjwKuDL9awGHoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I2xL/Hd1g7zc1wqQcZn+5GTAZ9p1/soK+C7A7h1eeFZyoYVS25w5upH3kFDV1Z0ocJ2+lS3wJy1izPtes0FPxuGUBXtwP47OXOb0A8s5elViNFDFIXhDmsi007um4Q0XmujXKoUawQD+I/YrseLDmp3P6TvVdL6HDPA/JvpUjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter2.welho.com (Postfix) with ESMTP id 9CA85444D3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 14:38:40 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp2.welho.com ([IPv6:::ffff:83.102.41.85])
	by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
	with ESMTP id CdPRus9WU5jZ for <linux-m68k@lists.linux-m68k.org>;
	Tue, 18 Jun 2024 14:38:40 +0300 (EEST)
Received: from [192.168.101.100] (87-92-186-10.rev.dnainternet.fi [87.92.186.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by welho-smtp2.welho.com (Postfix) with ESMTPSA id 6503428A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 14:38:39 +0300 (EEST)
Message-ID: <a9df9249-8bbc-4a23-a12d-b88f276cd14f@helsinkinet.fi>
Date: Tue, 18 Jun 2024 14:38:39 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: add missing MODULE_DESCRIPTION() macros
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20240617-md-m68k-arch-m68k-v1-1-57d38beaeb13@quicinc.com>
 <CAMuHMdWD0Je3HZ+RJyfdxKxKcBp7nt6ooP_YUpiju77Zf1QzVw@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAMuHMdWD0Je3HZ+RJyfdxKxKcBp7nt6ooP_YUpiju77Zf1QzVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Geert,

On 18.6.2024 10.36, Geert Uytterhoeven wrote:
> On Tue, Jun 18, 2024 at 1:47 AM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>> With ARCH=m68k, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfblock.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfcon.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/emu/nfblock.c
>> +++ b/arch/m68k/emu/nfblock.c
>> @@ -193,4 +193,5 @@ static void __exit nfhd_exit(void)
>>   module_init(nfhd_init);
>>   module_exit(nfhd_exit);
>>
>> +MODULE_DESCRIPTION("ARAnyM block device driver");
> 
> I think that should be s/ARAnyM/Atari NatFeat/, as I believe NatFeat
> is also available on other Atari emulators. See also nfeth.c

FYI:

Atari "Native Features" (NatFeats / NF) is an API "family", originating 
from the Aranym emulator project.

While Hatari emulator implements NF sub-APIs that can be used in 
debugging & testing (and adds few of its own), of the device drivers, so 
far Hatari implements only NF SCSI driver (which proxies SCSI commands 
to the host libudev).  Rest of the NF device drivers are supported only 
by Aranym.

AFAIK no other Atari emulators than these two, support NF APIs.

(I.e. for now this is Aranym-only NF-API, but "Atari NatFeat" is still 
better description.)


>>   MODULE_LICENSE("GPL");
>> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
>> index 17b2987c2bf5..0ab2e4d08871 100644
>> --- a/arch/m68k/emu/nfcon.c
>> +++ b/arch/m68k/emu/nfcon.c
>> @@ -173,4 +173,5 @@ static void __exit nfcon_exit(void)
>>   module_init(nfcon_init);
>>   module_exit(nfcon_exit);
>>
>> +MODULE_DESCRIPTION("ARAnyM console driver");
> 
> Likewise.

Yes, this is supported also by the Hatari emulator.


	- Eero

PS. As to other (Open Source) NF API users than Linux:
* EmuTOS ROMs support few of the NF protocols related to booting,
* HD Driver (hard disk driver for Atari TOS) supports NF SCSI API,
* Atari FreeMiNT kernel modules support several NF devices, and
* fVDI (gfx driver) & OpenGL backends (running under Atari TOS) support 
VDI & OpenGL acceleration NF sub-APIs.

Almost all of those APIs are currently supported only by Aranym.


>>   MODULE_LICENSE("GPL");
> 
> If you agree, I can make these changes while queuing in the m68k tree
> for v6.11.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
