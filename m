Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97D29AF
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Oct 2024 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727749459; cv=none; b=Q6GictqiDNkgf09ABqciwq4MCj+ZxxoiOpN+iQjLSOS8/LqNUxsrl9PPwu9uYJ5abRoReMzIbRaxknciOJO0j+hBlBpVLVGbDndjRI+4GQZCOEb3D4OfzU4PMxGTEwgqoTQoJedJkfZBDY5ZClwY37TfIzaOiQXJ7CX5DtS2suw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727749459; c=relaxed/simple;
	bh=JM0WYAbxPlbdyprgIMBYsy2OQaTI8oQO3UmTCBTIlG4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bvEAZFmr0kF1F/7NdP+MHv+IAnQM/FNK6NjrUX+m5R98Z6xR8qzzps+Tx06VlekeSO6xVTmcwtt9ibL4vm8J+5Wim3uhbvrHy0QQ+mG/D41YxACQaKPOQAgF+0+zXb4/mfYqGbn1CJlO+HZ3bQVWeIz53N7VPCPektZ6b9yXf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSpK4m9l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSpK4m9l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ba9f3824fso4145435ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 19:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727749457; x=1728354257; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj2Zq4rFUfPj7s+1mSg1ox2SuMruzqexFx+BHkuRKQk=;
        b=ZSpK4m9l19CNRJLVsIrSzWXbH6pwtnR6YgXtgR3I7JLOorrCutovY+6h8F2aGQ7Cly
         1ksJYHM0O5M83LddT5CLx+uppwPhpfBU2qaLoMUlAfjkDrOKRhnIVQnaw90vALNYvSEu
         OoEotGD9NTiHLDFgxJcJFn7E73c4GZbkhnHXib6g/Ifgx9qlaNDuBdKJpPp4BXWLPmUx
         HnWZh56qnwguuGHX/aoHMXsvtUcExtch419zZRWp1891jUI8p4vEfyb/7Ye+yuMqdQ/L
         sjyiYF++jYbfsOLoSj6858CMY3KTnankcLrXr4WJf05/KgE815Lq0OFSu57Jxeh57Kwe
         LQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727749457; x=1728354257;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xj2Zq4rFUfPj7s+1mSg1ox2SuMruzqexFx+BHkuRKQk=;
        b=UxSdE5z7rAbeN5tz8K+brLpFS9wQ7hEi9GLYScnX6pO/W1vwg6HAUt7ZcHr5qmJsM9
         ZenO5okY72QOK2Aps1Ky3o6epQ4CyBGVmcuJKbVOLefySQLatQlFA0yhxKjkIgkzmfVd
         65VnILOucymdJ79PadxOomM8GtIOsoKAIpqG7JS24z4tZUQ/rOKdc3dYtZpW0DnFiTno
         /sthdxk28ZhuhQldINQDR3LwsZQPmul2CoqTC/H5zDeT9EoUtM+fFzQoS0phlhPPzkPu
         2d2UJyy9f1pClkYJhfiHreErZOFlC1hnfv7/vhCi4Hx1vRN9icaIVZbsMwGBcexer25r
         kyqA==
X-Gm-Message-State: AOJu0Yzj+ELsX3RYJLAU2VarS4FbRxpa7Yri7aGTFA0YSFhxYUAQn/2w
	em7gX8BCz7s4ruR4Dle8/zDfEcKj7eLLq2D69WjcxOoTFWJ3sactmbnaAA==
X-Google-Smtp-Source: AGHT+IEmwJkHvQwo2/uSHYxHYbucT4XTJBT68CPfJDqCyX3nKlBBR1U8HHdF0Z6+ODlumeq0w+ootA==
X-Received: by 2002:a17:902:e84f:b0:20b:4ee6:31ef with SMTP id d9443c01a7336-20b4ee634b9mr164620215ad.31.1727749456680;
        Mon, 30 Sep 2024 19:24:16 -0700 (PDT)
Received: from [10.1.1.24] (125-238-248-82-fibre.sparkbb.co.nz. [125.238.248.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da012fsm60764815ad.96.2024.09.30.19.24.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2024 19:24:16 -0700 (PDT)
Subject: Re: PREEMPT_RT support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
References: <a5f3b0f5-ed38-40be-b6bd-69e3b29ee399@yoseli.org>
 <0bd77991e6223c4cec065ac6f7a348f9ea8e6c2a.camel@physik.fu-berlin.de>
Cc: linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a67fb246-4902-1b82-44cb-029f20fc36fe@gmail.com>
Date: Tue, 1 Oct 2024 15:24:11 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0bd77991e6223c4cec065ac6f7a348f9ea8e6c2a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

Am 30.09.2024 um 21:38 schrieb John Paul Adrian Glaubitz:
> Hello Jean-Michel,
>
> On Mon, 2024-09-30 at 10:19 +0200, Jean-Michel Hautbois wrote:
>> I wanted to try PREEMPT_RT. I added the support for it:
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index c7880f375518..b0360167574d 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -39,6 +39,7 @@ config M68K
>>          select OLD_SIGSUSPEND3
>>          select UACCESS_MEMCPY if !MMU
>>          select ZONE_DMA
>> +       select ARCH_SUPPORTS_RT
>>
>>   config CPU_BIG_ENDIAN
>>          def_bool y
>>
>> And set PREEMPT_RT then it fails to boot:
>> [    6.517000] BUG: scheduling while atomic: init/1/0x00010001
>> (...)
>> Any idea, thoughts :-) ?
>
> From what I know an architecture has to be explicitly ported to support
> a realtime kernel. Simply enabling the feature therefore won't work.

Making sure softirqs are run from a separate kernel thread and not from 
atomic context would be a good start. Adding preempt_disable() / 
preempt_enable() around more critcal sections may be needed as well.

Git history of those architectures that support PREEMPT_RT might be 
informative.

Cheers,

	Michael


>
> Adrian
>
