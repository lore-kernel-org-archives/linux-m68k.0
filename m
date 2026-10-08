Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E1E49504A
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Oct 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463041; cv=none; b=FmVdgR6tHm5I6T4E8sfHMSM73TaRxxaY4XHCHnifMFDvCqmJQZ7q5DFezCX/iQz/4XoeJ5vDR80vVGpHz8gTCz1yPxeiK9sNM5vvkxx8pkwowuIRNZps83FcHxxFp6YtfEJUYYJG1XLjYWdSten47vuN4E0+W3bJixSDZCeuR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463041; c=relaxed/simple;
	bh=bEdd1Ku0vh+291cwy0D9AUNsiYbnfA3xPUUpYei8Wyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+zd1iAY0/penb1OymkdoWVnZKiIznOmMbl1CrFlcp3i+d+V97e7YF6wo0J7T1HZZRCunLCa6v9cjH+ff2QC4VTKC8QF1uz8n1wrUsgD0U+2qeGSRS5w8MS7CJ8afjOqRefgi2NImdJPnq5qzJGKBAb0bGk2HvXddlYXDwS8j2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDFC642B77;
	Thu,  8 Oct 2026 12:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9901F00893;
	Thu,  8 Oct 2026 12:37:17 +0000 (UTC)
Message-ID: <e3031344-a7af-4d8f-804b-6009588acd2a@linux-m68k.org>
Date: Thu, 8 Oct 2026 22:37:15 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Oct 7 (arch/m68k/coldfire/nettel.c)
To: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org
References: <asZL8ElkW3Dx1ZgF@sirena.co.uk>
 <3a927133-3e27-4557-9887-7ed0c7315a7d@infradead.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <3a927133-3e27-4557-9887-7ed0c7315a7d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/26 08:43, Randy Dunlap wrote:
> 
> 
> On 10/7/26 6:41 AM, Mark Brown wrote:
>> Hi all,
>>
>> Note that I will be travelling to LPC from 2nd-9th October, as a
>> result -next releases will be at best spotty during that time.
>>
>> Changes since 20261006:
> 
> CONFIG_COLDFIRE=y
> CONFIG_M5206e=y
> CONFIG_NETtel=y
> 
> ../arch/m68k/coldfire/nettel.c: In function 'nettel_smc91x_init':
> ../arch/m68k/coldfire/nettel.c:126:9: error: implicit declaration of function 'mcf_setppdata' [-Wimplicit-function-declaration]
>    126 |         mcf_setppdata(0, 0x0080);
> 
> 
> Full randconfig file is attached.

Thanks for letting me know Randy.
FWIW this is not a regression in linux-next, this looks to have been 
broken for a while.

I will issue a fix in the coming days.

Regards
Greg


