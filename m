Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312518EA2
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Feb 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740320743; cv=none; b=b/nNXxw2As/MzPRk3rBza3VtDndr7K4gg281BVPAng08rbWc/lcxXVXuHlOWDIW2Sljambh/Rl+Cx7JJW2ShsE2DgKJmDb9+pMmafHtXXOM+vfQ6blwzLqx+3xog6SmDvBIN/pz/J5nfCpVyBlFH/G6HTE5yZLX+TL2xMK73eBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740320743; c=relaxed/simple;
	bh=7NoCWDiobNxcLw1wWSecg88fMYx0ccyR7BLQOJlULM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6kw8YlwiiEKuVGUVPEgqxBmNopVSpfcpJqICLOw6R8VU7/2JDRRaTTs2V0ffQ2JnQPa8DRMZ4XnbgRy3l8EFqau9KECO1UhUZtMk9Vl3Tkh+pmAzMFO/G5ecxUJL3nh/1YPv3UQPsbWJ5PmN9Ay31PFdG6KFNcQG3ou17WUMyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC8DA5C5B90;
	Sun, 23 Feb 2025 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2A2C4CEDD;
	Sun, 23 Feb 2025 14:25:38 +0000 (UTC)
Message-ID: <6c7b12bd-fcaa-4c88-bb52-21e0b7307dd5@linux-m68k.org>
Date: Mon, 24 Feb 2025 00:25:36 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] m68k: implement an embedded devicetree for nonmmu
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
 <20250218125124.2692982-11-gerg@linux-m68k.org>
 <CAMuHMdUYKyv9rrFgoik3Rc9YGsKtRizxPq5K35_-YLOYOszp-Q@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdUYKyv9rrFgoik3Rc9YGsKtRizxPq5K35_-YLOYOszp-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 21/2/25 00:06, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Tue, 18 Feb 2025 at 13:54, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> If there is no capability for the boot loader to specify a devicetree
>> blob then this option allows for it to be embedded within the linux
>> kernel binary itself. This change specifically adds this embedding
>> support for the m68knommu targets.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/Kconfig.devices
>> +++ b/arch/m68k/Kconfig.devices
>> @@ -144,3 +144,14 @@ config SERIAL_CONSOLE
>>   endmenu
>>
>>   endif
>> +
>> +config EMBEDDED_DTB
> 
> BUILTIN_DTB
> 
>> +       bool "Embedded devicetree ELF section"
> 
> select GENERIC_BUILTIN_DTB
> 
>> +       help
>> +         If there is no capability for the boot loader to specify a
>> +         devicetree (DTB) then this option allows for it to be embedbed
>> +         within the linux binary itself. Typically you can do this with
>> +         something like this:
>> +
>> +               objcopy --update-section .embedded_dtb=<filename>.dtb vmlinux
>> +
> 
>> --- a/arch/m68k/kernel/vmlinux-nommu.lds
>> +++ b/arch/m68k/kernel/vmlinux-nommu.lds
>> @@ -70,6 +70,15 @@ SECTIONS {
>>          INIT_TEXT_SECTION(PAGE_SIZE)
>>          INIT_DATA_SECTION(16)
>>          PERCPU_SECTION(16)
>> +
>> +#ifdef CONFIG_EMBEDDED_DTB
>> +       STRUCT_ALIGN();
>> +       .embedded_dtb : {
>> +               embedded_dtb = .;
>> +               *(.embedded_dtb)
>> +               KEEP(*(.embedded_dtb))
>> +       }
>> +#endif
>>          .m68k_fixup : {
>>                  __start_fixup = .;
>>                  *(.m68k_fixup)
> 
> Please use the existing DTB support in include/asm-generic/vmlinux.lds.h.

Oh yes, that is much better. Using CONFIG_BUILTIN_DTB_NAME simplifies
it all a lot more too. Will use that in the next version.

Thanks
Greg

