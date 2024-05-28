Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D613550297
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 May 2024 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716883479; cv=none; b=OZA2NY1gEOUW2V76ktQnmdXrmlB1MbQQ45hHwWR5nAC/hybIaEn+0Q95+QVLkTx9jDOpDoW0IOPIc5XT7SGGY3Juv4pIDRFo00eBun6cwcCj2HLg6zzVcR8UhvVbIWQqZq5nrzr1Gj+9Ja+Ual3Al+PGpNixd2KtZ/WihJaX9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716883479; c=relaxed/simple;
	bh=nT4KBjGWwrMFQtPznkuzbkqfi2DQqgbhjz0Rvy1di0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjbnBoqqMr3uhlOuBGoPbGFKZUpGZvTsggzzvHRP9S6PdlOXnx6Q71cGgrUaYTRBl0IhJEgvSbdtODUHCd8tA72pxgk+aNHMKpRvD7loBrsVbRfGIDmSxDS1gxFJOmJmaJFr4f4Mh4b3UixVtU+nXIcSJ8qIXPFgZPQmcEW4FOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=GFLQ3QtI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="GFLQ3QtI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9ED9FF809;
	Tue, 28 May 2024 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1716883470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nso8kOJxe+RZMbn1gM8t67k+XahK6OeRv+iOM4ymen0=;
	b=GFLQ3QtI12NrnMFa8A31dcWx4oG/zyJQBsrqmoSQ2ZbZUe+vWU1kN3x9CPD6y6DL2Gcpiy
	9xicItU0bB03BCDAGk/yXC9730xPq2OMNl5iWdwO+/6h0JxXPWgMZfOT06/zzbfs6FUhcb
	EzUvC9FOUubBQlEqGEUaf2H95pzjcBCv4a8Yz1bA6Igqbxb4Oi4FOneuQyoBeOU3EBlbCy
	DnnCSeTaLBw5qsxVSSeophza1iv84yk0wiEeR+QP+iuTsE2LSLjinLlq6IAYAHU6vxs5rG
	QYO1L/Fxj6jFLUFphSm4+ycAh3ivWjOI1xIp5j3JGOIuJ7tCNnz7T58bH6cvbg==
Message-ID: <650f832e-ee4d-43bc-8e53-dc43aec35201@yoseli.org>
Date: Tue, 28 May 2024 10:04:29 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Image Format Issue - Coldfire mcf54418 CPU Failing to Boot
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Ungerer <gerg@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
 <d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
 <45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
 <d94c6e57-58d4-4299-a23e-013a3cb13997@linux-m68k.org>
 <f316b64e-c696-478d-8383-5d18c96e6c11@yoseli.org>
 <106876d4-a93f-433f-848d-da85ab84bd14@linux-m68k.org>
 <6376845d-e741-4117-bfd3-81860ba08399@yoseli.org>
 <9cd36f99-f4d3-44bb-ab22-e1e497906048@linux-m68k.org>
 <6120cdb4-4666-418f-8d2d-5b0e72662e3e@yoseli.org>
 <fa1cb665-965d-4215-bb28-82b629156d83@yoseli.org>
 <e736c8a8fb9cf601f949197b228bdc472a09d212.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <e736c8a8fb9cf601f949197b228bdc472a09d212.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hello Adrian,

On 28/05/2024 09:47, John Paul Adrian Glaubitz wrote:
> Hi Jean-Michel,
> 
> On Tue, 2024-05-28 at 08:32 +0200, Jean-Michel Hautbois wrote:
>> For the record, I found the issue, which is already corrected latest
>> kernel by [1].
> 
> That's great. Since I have a similar problem with my SH7785LCR which hangs
> when u-boot tries to start the kernel, maybe we can debug the issue in a similar
> way?
> 
> If I understand this correctly, you hacked in serial output at a very early
> bootstage so you could see what was going on?

I did two things, as this hangs even before the uart is configured. So I 
used a trace32 jtag to see where it was really hanged.

I don't really know about sh architecture so I can't really help you 
sorry :-(.
The command line seems to be set in arch/sh/kernel/setup.c:setup_arch() 
so you should probably try to set CONFIG_CMDLINE and 
CONFIG_CMDLINE_OVERWRITE as it should then be able to go on but without 
a jtag, I am not sure you can easily debug it...

JM

> 
>> When I get into my kernel after u-boot jsr, the SP is [2].
>> I don't have any initrd, and it is deactivated in my defconfig now, but
>> we still try to access the address, which is 0x00000000 !
>>
>> I think this patch should probably be reported to the stable kernels too ?
> 
> Such patches are normally backported to stable patches automatically.
> 
> Adrian
> 
