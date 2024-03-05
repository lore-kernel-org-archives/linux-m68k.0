Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FD5C83
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Mar 2024 00:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599740; cv=none; b=XiSIz6kJGtADoOd78CXJAHCp/Ce/bGwII+SqfMKCiO1y3qdF2Il6T4fzEZWYp5BHKJsefZ/6J8mEmiEHTFnZbfbQIrta8fifT6xi2mNIyW9Iuhqs5/nX7SD6odxpQbB2A7X95rOEkC0DUFK4qaRftHWmesN4ECgTpEfbJ0a4F4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599740; c=relaxed/simple;
	bh=2nm79sKWicApvx17SNrxTPMg9vRL8kA6trlZiEjKDb0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fGSpP8bY30yquuubrIty4QyNtQvebn7Oa920B74cZupptWd1wg5yeYdjdQckQW8tSpRSoag74Jh9qKvnWSDv8SzWdJl4oK65LCcEaiPuiicLm1Adt107wi435S3i/9LNfPwyovc1UkW1NkKa3cp+mJdHCrgSyLXaQTsO3WZdREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjGswNjv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjGswNjv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so41523225ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Mar 2024 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709599738; x=1710204538; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozwVNBUH+SBvyHQBfUdg0gGn0rSgnqlMYF+pLLX6xmM=;
        b=TjGswNjvaejf0HAmSQeL9QHp7xFqV0z+QJCiwMdGuVAUZtOYSkMEDyDHLQnAxx1R4t
         mLhQSlL57Oa4ouhBLK5uDdMEWX+kwlgX7pZdsBB375XXAmt0VUmb8VfqnZ7sDX16bHDs
         MNyIzj9grcsF+11c3D68KZQHBo7UAD8kSAZ19LtEzFXg6nxNJvuSoaglI8+AQOrFbpln
         VHQvNTylVhUj24sW/JAVMKrZnlQE4m3kXeDLvwQg2ldMk8ELiEDFqsOTFxohuuMUrrUg
         F2oO5xqXBw+GH4o4m6Oli2ktvjlNlOLC4UyZdheX6HGq77D7EGcIWJNeRe4jRWWIligA
         YD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599738; x=1710204538;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozwVNBUH+SBvyHQBfUdg0gGn0rSgnqlMYF+pLLX6xmM=;
        b=UmIp1g4vVF4DUZTH4lR6W1nwKkmSEXeE0miBLOxtznEkm8y8xQHC2HrEhYbJ7fXApq
         HPfC0Vhl9bz1pEqFC0Xya1RKPJ46TmV3shmUog7GJZKvNj3cWkGoiYvw0GZ1nen457sa
         0/IJ+z7t/56sV3UsuCAHkjkHbEXuKiMBANrBd/iyuAmGaAlej+VJHwCjDAQBv1nifTJ1
         3F2USym+8eIMqTaQImceWE/VDRaKT4IQtJtsFIAebO74gjhgl86Lc9kCgKyGWRkWlroO
         FL89YGeJpNhznpFARHKaoJQMl+lhB7fX+X3rqpaC2Cp068nz3XnEIMo8K3eJY0ERMdrs
         jYkA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7lw0DhOT7vXNyWGxrNWVM2iFdI4e/fu7kH8xEhnrNbTQzptYZNjFER6rw+JrubiWpuZb0u+qND0PcjCs4HfI9mkhF5lge1WlJ1UQbsaP
X-Gm-Message-State: AOJu0YzaPWoPSePLMowCdC5diRsdOFxC69I5aHsDZ6q9M2oQPUU05Ivi
	cMTF6WBtyqdcbi3XVBOavgam3oHXmcLDAS+D4WSZGFOQUFRdg2Lj
X-Google-Smtp-Source: AGHT+IE6eNpyNLKav+uBskCsNBB4rDK1MUU1Py4Si60hChxQgNQbsuuvxKBDBh788mPZ1vvCTf6UOg==
X-Received: by 2002:a17:903:120e:b0:1dc:ca74:7018 with SMTP id l14-20020a170903120e00b001dcca747018mr469529plh.36.1709599738549;
        Mon, 04 Mar 2024 16:48:58 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:adb8:c71:a09c:347f? ([2001:df0:0:200c:adb8:c71:a09c:347f])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001d9fc6df457sm9159854plh.5.2024.03.04.16.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 16:48:58 -0800 (PST)
Message-ID: <6cf8a790-d251-417a-896e-70a4f8d062ac@gmail.com>
Date: Tue, 5 Mar 2024 13:48:56 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <2ec644e8-f0e0-ee4b-f866-c27ff531aa3a@linux-m68k.org>
Content-Language: en-US
In-Reply-To: <2ec644e8-f0e0-ee4b-f866-c27ff531aa3a@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guenter,

On 5/03/24 13:33, Finn Thain wrote:
> On Mon, 4 Mar 2024, Guenter Roeck wrote:
>
>> when running the q800 qemu emulation, am seeing random "spinlock
>> recursion" messages every few test runs. Some examples are below. This
>> is not a new problem, but it keeps popping up.
>>
> You have to enable CONFIG_DEBUG_SPINLOCK to see it. I have logs from 10
> years ago that show it. Those logs have the VIA timer driver in the
> backtrace, like yours. That was v3.17 running on a PowerBook 180.
>
>> Is this a potential problem or just noise ?
> Maybe the locking validation is not compatible with nested interrupts (?)
Seeing as m68k is the only architecture that allows nesting of 
interrupts, I'd rate that as quite likely. At least that's how I 
understood the situation a few years back when that weird access past 
end of RAM during interrupt accounting bug was discussed.
> Does "spinlock recursion" show up in Aranym as well? I would check for
> that myself but I don't have a reproducer.

If you can give me a hint on what kind of workload that happens at, I'd 
be happy to run something similar (if not the same) on my 030 hardware.

I've never set CONFIG_DEBUG_SPINLOCK, so would have missed these 
messages, too.

Cheers,

Michael

