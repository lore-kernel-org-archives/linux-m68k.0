Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072611DDC0F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739918745; cv=none; b=vDKNQKhZhA+27kpp5HkqDIJ61xHACykGgy5MzVqN18889xCc3qC77zm4PCqdxlPDWxfmKmJzi0GuzUJyghOsyOlAcnZrSY/Vsan1cdAfKdi9Vv7ojNRTJ2OwuPUpP0DEKp7kGY/jWfOMoBae5+HNVKbrrp68Km5qsIuodGgABA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739918745; c=relaxed/simple;
	bh=sDM6PjBnv/qkFI9lVJD4mTBbYz1hsrit/mzWN3ZzLSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYPKP8k6rrKVIqukWT8tPVKqzwJ9wVkxB8aUMy8D/1TQSHHb9ausLrFL1dASMjooy5tuD4sUUQf3GFwTc7qVbIk9b2heYG4jwFtv05KWXwaKxio2llrhD8Zr1+8bYJMqwKUeXgYYpr85uVvMr9Odj5to8M49+ZNAvWnLmGVi5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8919B5C62CC;
	Tue, 18 Feb 2025 22:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239BCC4CEE6;
	Tue, 18 Feb 2025 22:45:39 +0000 (UTC)
Message-ID: <1fdb09f3-c228-45eb-99f8-fdbc8b4f9dcf@linux-m68k.org>
Date: Wed, 19 Feb 2025 08:45:37 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: mm: Replace deprecated strncpy() with strscpy()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-hardening@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250213141037.50394-2-thorsten.blum@linux.dev>
 <CAMuHMdWFaudnOhwXpYJSwt3R909D8GLV+bLK7UhnH1Z3NB3ZsQ@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdWFaudnOhwXpYJSwt3R909D8GLV+bLK7UhnH1Z3NB3ZsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 19/2/25 00:13, Geert Uytterhoeven wrote:
> On Thu, 13 Feb 2025 at 15:11, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>> strncpy() is deprecated for NUL-terminated destination buffers. Use
>> strscpy() instead and remove the manual NUL-termination.
>>
>> Compile-tested only.
>>
>> Link: https://github.com/KSPP/linux/issues/90
>> Cc: linux-hardening@vger.kernel.org
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>>          setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>>
>>   #if defined(CONFIG_BOOTPARAM)
>> -       strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>> -       m68k_command_line[CL_SIZE - 1] = 0;
>> +       strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>>   #endif /* CONFIG_BOOTPARAM */
>>          process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>>          *cmdline_p = m68k_command_line;
> 
> This seems to be used mostly by Coldfire, so I'll let Greg handle it.

Looks good. Pushed into the m68knommu git tree, for-next branch, with
JM's tested-by and Geert's reviewed-by added.

Thanks
Greg

