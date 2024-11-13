Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7F1FAC53
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731522958; cv=none; b=tBUXtk+RrUPLqHAGp+ELz5EpzULgKJOHYvCMnbT7ui5UcdfcAyaDM3VZq86VQxLWaZ3/SOxbvBrVXe6t8cC4gPQS0FjHjO5ekhka9yLncDBUMtYYbntZwDuxUgE4qadO2zXCyOIJNs966fAfGrMpeOu9q7xI2Ay25Em4f6ZCA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731522958; c=relaxed/simple;
	bh=7aPrGaaIfPW4ro+2dZnsQGyLGi8QEp4cDqxCRbZ2gus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8WH//MSpArXazXhUoGJlVJJQvchZNsrFYgcy+kYBIZADH8X+IMcob/ZKvlrK+lZ3b5m5kSQ6++OprdKAnb83f3IJhfl9eEgeU8/qA+x6iNT0KPrw8v3GlPhAjFTjLU1vQhDYVuqmF8k0Kr4QZDexITRKR3eVrJzCzyafZqirDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FynTm3Lw; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FynTm3Lw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so5507669a12.0
        for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731522956; x=1732127756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYbEuj5fUJwNOJR/RL1ksiDfX4tNtO1GRK+sM2x1VTc=;
        b=FynTm3Lw+OJJCWMKq8w95EGxuNYsjKXx6SvQFAyV5aBUAiGlgndx7HkRyNYS2qK289
         0OLkRPgHxH/aRaXmSOIdMRCzQuYqZaiIZ0PojYxiqwhpjZA8/LEBt33Eq3TQHxWSBXeM
         FRmyiHApLrJNMfDV51KCAp8RvmttHcm14N9zCQSCzUNdUdr0ujfRlOzgC0imGX/LO2vQ
         EKnh5WLfcC5Rj8oIAUZSHGIuU8D0pnEIj4dZQ5jUhNn0ubpMQ//DA8MbyznBvJkfKz7o
         x7ijLB7iw3HNoHfQ8nUWBGRKHRniDKgYqSQ3ddfgQXv0ad1dHIXLB3Dv7Oji+MuQOb9E
         V3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522956; x=1732127756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYbEuj5fUJwNOJR/RL1ksiDfX4tNtO1GRK+sM2x1VTc=;
        b=UNa8yoRPyMhqXitXlMmkDAFK7W6VE0sc/uP7NtokqpA5ZxfjS3MxbM+sotaXOn7+YV
         AOAvUlbMaD2aWZFp+JlW0C5wawOJgPuemJ+gPypbuuw14Ymrzn1RZ09aJv535fEJyQ+U
         HUateNjdUPFTdgUWoJ9WImPMC6xYq/urIQ9+0EpwXK3iUqGPZSslso9r/pbdNU5L5Bcn
         Bzhi3//xA3uSX/cXfXuIbFXF3oVf6gU+Fey5relMOXSs9EE8yD1gw1MMHLaw8nhHAL15
         wRI/sQJVDgjdb4JMDD1pZMVquCjS6KQ54MlE/eDYFC1xey1sgP5d3K1uua4afMS6nygW
         eVEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4ousLBVFoc8fO0zIBn6Q1Cr+FJ71BQPZBTUMJaUFm7ukE11B1dUfbiOaLFSQSbnbWj6F8trbA3yE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFKR0WsiA8AXZEnjmdWeYkaJgES/r/Xt+33stxScH9O5l4D0P
	SbbwM5xV7tzCQsffTGtyggKu4GjJi0Jr9iaIm0EKOAy34zdBy/zU
X-Google-Smtp-Source: AGHT+IELvZlEVYFmNXDZx7cxlLLCxg7gHJLLitx54MbHt68Wi1IcATinFIoMUayBlkFx4mk5BZjHHg==
X-Received: by 2002:a17:90b:1344:b0:2e9:20d8:4147 with SMTP id 98e67ed59e1d1-2e9b178fdb7mr28480377a91.33.1731522956339;
        Wed, 13 Nov 2024 10:35:56 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:a422:b23c:53c7:43fb? ([2001:df0:0:200c:a422:b23c:53c7:43fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3ea56fdsm1798806a91.3.2024.11.13.10.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 10:35:55 -0800 (PST)
Message-ID: <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
Date: Thu, 14 Nov 2024 07:36:15 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adrian,

On 14/11/24 01:54, John Paul Adrian Glaubitz wrote:
> On Tue, 2024-10-29 at 07:57 +1300, Michael Schmitz wrote:
>> Arnd,
>>
>> On 25/10/24 22:55, Arnd Bergmann wrote:
>>> I also expect that a lot of users (of m68k kernels) are
>>> never going to get the benefits as they are already stuck on
>>> older userspace because of added bloat in new software
>>> releases. I assume you have better understanding than me
>>> of what m68k hardware is commonly used these days, and
>>> how constrained that is in practice.
>> I second that - currently bisecting to find out what makes my extremely
>> RAM constrained m68k system fail to boot or run anything past 6.9-rc4
>> (sysvinit, not systemd).
> Should extremely RAM-constrained systems be the reference target for m68k?

I didn't say that - just supporting Arnd's point that much of the RAM 
constrained old m68k software won't benefit from today's user space. 
Development isn't driven by memory pressure anymore, so code bloat is a 
natural consequence.

What such hardware would benefit from is low memory optimized user 
space. That's hard to do with Debian, as bloat appears to have crept 
into the build dependencies chain (if I understand you correctly). While 
Debian was the first Linux distribution to support m68k, these days 
there are other options, maybe some better suited to low memory systems 
(and I'd consider even 256 MB on Amiga 'low memory' ...).

>> Much as I appreciate Adrian's efforts to keep up with user space
>> development, I won't be in a position to help with an ABI change.
> Thanks, I will then just do it myself with brute force or drop the port.

Sure, you do pretty much all the work on Debian/68k, so you get to decide.

If this involves changes at kernel level (syscall parameter alignment?) 
however, my recommendation would be to rather drop the port than end up 
with new kernels no longer backwards compatible with old user space.

Otherwise, I'd not even be in a position to do any kernel testing and 
bugfixing (which often requires hardware, not emulators).

Cheers,

     Michael

>
> Adrian
>
