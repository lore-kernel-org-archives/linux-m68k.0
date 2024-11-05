Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009891D9A66
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730818622; cv=none; b=VpP9Hnoc05pBqfqYhUdObUB+UvypJJeTC7ansiKYUsIccEiEtIwNLQDtdXVnWE8SIMOIrPflSE+G18yAJQTG6YYh8SCTZtjF3p+5gGWIyXwlZffB5d/kuXpDgoNb4e3Te6laW38IES1NDBMvNCxDeREFBD9zKfMmfeDpHTqt78I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730818622; c=relaxed/simple;
	bh=kz2PwHpWkB6b89mlNrslPR1CQGh2syGsUe1HBwmlb3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZE3UtVMBXor/axWCPhPQ5Vy6Wo933TmkRMZhU7CjD7T8nEch2GYUgYy/p5oH4If+R/iWoKKmtl1/rhf1vkKIecRLEuWWt/PbDspTNROW7lcCxbD5Jet8ABUFB3App21lHkExGssE0bpPKwxffhDXqV2AQfyS1zHzMsmIyc7QgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=VeGZ3hqp; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="VeGZ3hqp"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D95DEC000B;
	Tue,  5 Nov 2024 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1730818617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt05KO7QehHNanvDPk93Fbe7ao3Un8Fn9Np859KAxfA=;
	b=VeGZ3hqpj6zp3/dEY+bUdrT3apkXsrjXDpfUoIZ9AEwZKCudE0Z8jp9xbTdRUbXZNLHgfq
	lQVd7xWmJ5Gnxb9ifE4W9U7WQg2vG2eF0bCrZ43zveDUtJk/I2IJlBMkh49zR59Vx5rZe/
	5jHmRgxnTF+JP0eNq+T1cZyqnsu4e9L60vAovc1WMGBo/AsVNj2G9lizCFRP3mf7Ful9+6
	mxORNYEsW2VKmV644PQMRrNnz2fZkA/zDJoTaZiJfI4ZIAj4vh49tYXRGmtreklP7uDLLH
	CKdfkVer5Yj+uly41SmSGYatcQBzk5nvpC15e20bNd1XsZ+mak0qO4BzBQtRNQ==
Message-ID: <d8d99f60-7a51-4b5f-b281-11fe6322a01e@yoseli.org>
Date: Tue, 5 Nov 2024 15:56:56 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Initialize jump labels early during setup_arch()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20241016-fix-jump-label-v1-1-eb74c5f68405@yoseli.org>
 <CAMuHMdULfk-_VGXBsnD+Gc7h4c5PRAYDdgx1zEeW=4+1fA0N_Q@mail.gmail.com>
Content-Language: en-US, fr
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <CAMuHMdULfk-_VGXBsnD+Gc7h4c5PRAYDdgx1zEeW=4+1fA0N_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Geert !

On 11/5/24 15:03, Geert Uytterhoeven wrote:
> Hi Jean-Michel,
> 
> On Wed, Oct 16, 2024 at 6:18 PM Jean-Michel Hautbois
> <jeanmichel.hautbois@yoseli.org> wrote:
>> The jump_label_init() should be called from setup_arch() very
>> early for proper functioning of jump label support.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -249,7 +249,11 @@ void __init setup_arch(char **cmdline_p)
>>          process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>>          *cmdline_p = m68k_command_line;
>>          memcpy(boot_command_line, *cmdline_p, CL_SIZE);
>> -
>> +       /*
>> +        * Initialise the static keys early as they may be enabled by the
>> +        * cpufeature code and early parameters.
>> +        */
>> +       jump_label_init();
>>          parse_early_param();
>>
>>          switch (m68k_machtype) {
> 
> This is indeed what some (but not all) other architectures are doing, so
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> I assume you saw some "static key used before call to jump_label_init()"
> warning[1]? Since I never saw such a message, can you please elaborate
> and explain your use case, so I can add that to the patch description
> when applying?

Indeed ! I saw this when I was passing the "threadirqs" parameter to the 
kernel commandline and the "select IRQ_FORCED_THREADING" line to the 
Kconfig.
I suspect this might be true for other keys.

BTW, threaded IRQs work fine ;-).

Thanks,
JM

> 
> Thanks!
> 
> [1] https://elixir.bootlin.com/linux/v6.11.6/source/include/linux/jump_label.h#L81
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
