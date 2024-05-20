Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB41C286
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716242461; cv=none; b=u9tOR8p+MpaXUsEKNwiglv/WAro4QdFfv8ITmrZ99RT9+WzeI6UkF4CLHi/B6oLonpKN4MdBdKK1Zwiv4ujY7nSSCiPQHiiEIdZ2YN/NH+ep6dJX0vZI5+pkxRMqiznbW9Ty7m+C9hZTawBBrIakxuyXZzhuVoX8uASyTDMmH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716242461; c=relaxed/simple;
	bh=dfqUqTS+yQvFPtyXVFDBPDz+/vBq3O8qIw/G8mkv3wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnTfhhqjbTryNlXXbLnVPv8f8Wi3zJmRUzr2pAPk6JDdV8XGk6jmbMvFiS/f4Fdv/i1M1P88zOaw1PdhoZ4I8epsF3/VxD5WePcqPWm7v5aizQFx1EKxNejt/JuaWZO/LakKVsmdhrhpzaPSfNyWp9UFsXyyzKXIhfkUQdABk/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmmjAbFt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmmjAbFt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2072634b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716242459; x=1716847259; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mA8zSKtDWz7A+T6ifxD8Z6D/P3YXBko+rb41MAkYp1Y=;
        b=fmmjAbFtQ1Bl8cWGNhWNBCk9m+BSrCV4lBHFGAEwsiQ0pnBcpB+ckDl2p8vLkwUUlP
         Nxtpr1OTzR6GhieffIPm6bdz8s5OBaPX+h6tdlg1s8sntElRv9OujTmNVzg7MglGebDV
         LcotRnmWccXpGj7WtnAXX5DqkrYsX16snoytcNLa3EwvTb9xJTzEX4YBt9PCUXu7qx7t
         geRC/wujEcPxwgvsYzBLkOx6njGsnppS40mfAqaLsds6ute1b/qH0OQb9nLK+OT+31uq
         Gy56S+WF1hQL/6trXT5NipP8MLcRxbZmYqmsyTR4QvLhVVVKwTXh7r6SmgpKdXKv2qee
         mB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716242459; x=1716847259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA8zSKtDWz7A+T6ifxD8Z6D/P3YXBko+rb41MAkYp1Y=;
        b=pjVLPXbCecrA2ndQzA095ltLR/ryhdNen/WgwaG8I1WGKmb883qvnuzolEa/b8739I
         wLD+H8T5fHPtyhwqyrqyopRzV7yVwC2BdP41M7KpQCfkDkGoQflPpD3rH6W/JpZbQLDU
         KWZGX3QwY7kHrRuRCS6qVGz/9oo6Yg+L4QP2mrn6cdUQN5bsmRNfPhovsX1negrv1VDP
         anR4ljlPomxYUlW20zHsw/ilrytblXvu9b9qC/XZDA4Nc7+gMDjknWU2P2hNJNGG1D3A
         ciozLNL37GwZMdWfwdjS2n7hFipYn3cO6cKA3iJcaPsFohtdcJ+6+6bYc03+/gKKrX7f
         TqYw==
X-Forwarded-Encrypted: i=1; AJvYcCXU4VaecT6QobtaFxj2cwBgMyn/yAUjEjikFzmDY9Dr+dfGoYIZmonyV7QkHYDLcG1Cuq06/q3fUSUUSAbsFTYujf3zJAaQLctUPluxW6uM
X-Gm-Message-State: AOJu0Yx6BHZQY7iNpin8pzIeToygvfNBmjX9UzOoFmtSEjWT/iezmed1
	IaIs0hcmtgrLqHabWada4bFictV2Q4QtTXzwfKBZVT2xFxUX5JeHtt6DxA==
X-Google-Smtp-Source: AGHT+IEDMJmmYbjGAambTiFUSmUU8bC6xNaA4a9osTAraKLGHMw/yhk8rK/70GD3pW/EiXcm35WH3A==
X-Received: by 2002:a05:6a00:8a10:b0:6f4:669d:8c64 with SMTP id d2e1a72fcca58-6f69f8ea48cmr9089725b3a.0.1716242459073;
        Mon, 20 May 2024 15:00:59 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2fb8bsm19543700b3a.209.2024.05.20.15.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 15:00:58 -0700 (PDT)
Message-ID: <7f0d9037-ea3e-4ae7-8926-57cf1762ca5b@gmail.com>
Date: Tue, 21 May 2024 10:01:01 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Amiga, serial and SYSRQ
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
 <ZkuFrTQDw6iM9Z7K@amaterasu.local>
 <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com> <874jasfamq.fsf@igel.home>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <874jasfamq.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Andreas,

On 21/05/24 09:15, Andreas Schwab wrote:
> On Mai 21 2024, Michael Schmitz wrote:
>
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7 is what I have set in my builds.
> Which is also the default.

Begging the question: why do we not see the warning message?

If the interrupt were to use a vector address set up by AmigaOS, 
shouldn't that cause a kernel panic instead?

The Amiga serial console driver does not rely on interrupts but polls 
for transmit completion. Not sure whether interrupts are disabled while 
the serial console driver pushes out data - if not, a pair of 
local_irq_save(flags) / local_irq_restore(flags) around the loop in 
serial_console_write() could help.

Cheers,

Michael

