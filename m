Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5986211712
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 01:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718846684; cv=none; b=OXS6KdW9Nhk7K03owgXDdKAR7+xD/l3I5NnUq4KVYhVmd1xEjC7xI6Okfvkf4YrQ0078JRijf/qsHOIYG9zTN26w1pBoelryMKRG1UUqycgifqOK6YZwQiVN0Ca07tXrX687FohvF2UtMSNyE9Aa25a9vPoXxUV/R36k2mKrPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718846684; c=relaxed/simple;
	bh=bZ8kaY+GxiPrycAxTVqtm6U7mgPDSQJFONKiph3dUzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBHXwuvjCRMein4IfgA0J5re1GsZZXf/H2EIFtult+WbZgaUe44oOCzWCUeSvcFny1YrCQrzqOD3NrDDZIsgysEy5F3/4OGroN3HG87BJyW+8fwWkiejATSOPD5Mdjyqkp0vnW6bG0QGkLWObsx6Hk/GPa/kibuByWAllln4B74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcZkZdbs; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcZkZdbs"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6e3ff7c4cc8so276706a12.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jun 2024 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846682; x=1719451482; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EoUkbaKHpsJD6TpAHGIRGeF5DzuNGWruFeqeZaWPjc=;
        b=NcZkZdbsPsTJRpPT+sA2tHKuip5s8Pvm3EDI1zu1dVeuLcS4zYhsF4giV6hmyM72mM
         ps9bnjpTrpygRal4Cnh1hUzgc9sdkv193A7be0epGJCDQOxddOjP72f7lQmLrmt6N/kn
         UZ79kA52y8UUeApPb3uOUEwbMxhBR1B9A/yIdphHMDfVNKqReuWxN1uz/wby7yAOfVYS
         lutIvQAqeAzNiVthlVo7RexMsGHJO2j0a/2B4RvJ2WQzJ7eDyrg9QX7R0dQlFfr4HGLU
         E57qQ/5anfeSi3SuWJj1i1p8XzfBpj4qECTQIIciuzgqlPHsldnrUdxnp+S9nTqkFfA0
         nZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846682; x=1719451482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EoUkbaKHpsJD6TpAHGIRGeF5DzuNGWruFeqeZaWPjc=;
        b=ksQx10XH6BfzRiz5bJnrHqIpNUsTHQjoTxN0s7fGWtGuO3GKWMWfR3f9W5JK6wiaZD
         HmEkx43qfkMDwFapQiPP394xddAPkEyprYrVzg09ftQ/0hDKvMJofGEgbcelv1+v+s4e
         mG01xKfA7IKbAaufisf5d3e/GGvh9AiV0LKprPeI0UpKvxuW6OLoZ2GvWF65ENuV3giR
         8Wo0gWlBcokVoB9Ygg3scxvB5hmu3TadCMVLGvGRo2Px700iZzrvTc4zbrYYL1xUJarb
         SfT2o4I228N6HvDrSKXYDwGJaL71u64jTjriwmHvsxiKYiPq/FRIDdhMWxf0Qwuzo2xz
         2PTA==
X-Forwarded-Encrypted: i=1; AJvYcCWTM9lAr1/0oEyC3edn2YSdeo5ghjechXH4Z7cuOWa3zSYcH4pVpGrDIXuqMo8yhPV//p47GKw4APZHIBzvlnarCBmW6ON0qaL06Cv76Fvu
X-Gm-Message-State: AOJu0YyFTeUiB1SS4ToTDXFbnAFifFn6SDo+/De+JHVlSciGN/A+U0T4
	fWlkr7yZIXslTvGE+UkYRQJUSnr6iGZ0aRU2Baz9Il8XjVCmBTZK
X-Google-Smtp-Source: AGHT+IFyTYc4wZiyqKMm1r+kiOOiih/TZv+qe4e0Pm2t9kRbgWB3BTodGVJRlz0ySoSSFPjsnBdkGA==
X-Received: by 2002:a05:6a20:4f8f:b0:1b1:d31d:c0c5 with SMTP id adf61e73a8af0-1bcbb5cd527mr3828024637.37.1718846682284;
        Wed, 19 Jun 2024 18:24:42 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:91b9:f8f5:b83b:e630? ([2001:df0:0:200c:91b9:f8f5:b83b:e630])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55e54sm124469515ad.23.2024.06.19.18.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 18:24:41 -0700 (PDT)
Message-ID: <5ee6ef02-75ff-4d3b-b4c7-37da47a40a76@gmail.com>
Date: Thu, 20 Jun 2024 13:24:48 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: Atari SCU support
Content-Language: en-US
To: Eero Tamminen <oak@helsinkinet.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <9aa793d7-82ed-4fbd-bce5-60810d8a9119@helsinkinet.fi>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <9aa793d7-82ed-4fbd-bce5-60810d8a9119@helsinkinet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eero,

while the workaround will shut up the unexpected interrupt messages, it 
still does not prevent that interrupt from happening.

falcon_hblhandler() will not set the IPL sufficiently high for that, and 
I do not know whether permanently setting IPL 4 will quiesce other 
system interrupts.

Setting tt_scu.sys_mask zero is indeed the preferred option.

If you or Christian want to submit a patch to that effect, I'll gladly 
add my review tag.

Cheers,

     Michael


On 20/06/24 02:43, Eero Tamminen wrote:
> Hi,
>
> During the development of Atari TT / MegaSTe SCU support for Hatari 
> emulator, it was noticed that m68k Linux does not properly initialize 
> SCU registers / IRQ handlers on boot.
>
> Currently Linux freezes at boot and spews "unexpected interrupt" 
> messages constantly on TT.
>
> Nicolas Pomarède and Christian Zietz investigated:
> * Issue to be due to VBL IRQ handler removal [1]
> * boot to succeed if either 0x00 is written to the SCU sys_mask 
> (preferred), or handler is provided for VEC_INT4 [2] when SCU is used
>
> Christian has verified the issue and its workaround on real Atari TT.
>
>
>     - Eero
>
> [1] 
> https://github.com/torvalds/linux/commit/1fa0b29f3a43f9dd8080d24cd16790b15ef963f5
> [2] 
> https://git.tuxfamily.org/hatari/hatari.git/tree/tools/linux/0004-WA-avoid-unexpected-SCU-interrupts.patch
