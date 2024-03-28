Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5DE5FBA7
	for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Mar 2024 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655666; cv=none; b=g3SBWOAp0dJPn9Z70XyK0r8BowcI6H4YK02Qg0Aeh4uq5CdceEKcGnf8zTUVE1I77IdebaQvb83oKxoAxx4XjUgVBWsz/VNSpI+OTPWhjDfhf7GcpJrLaFZh6JYaNBOQcFmjI//Y9o3gi5GO8JKGk83EfLIL5z8oV4oaZhs2g+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655666; c=relaxed/simple;
	bh=QEks7QENO8V/HRFOm7Fp8dVOAhX+bMBe1VL7AaemCKI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IksAc+clGXN/vDZAJftGhXG+0q67irjgG6otsd1ntBdZYQ0Q64kB1+DkVyVu/IewmUJydA+CDtOgHUBKVEy8llk0WQhWGOrpIO3rPXE9yYuuakI+7ImhYdmDpq6d7mks61OEpjm5YYDzsWrvWHA/nwmSxTjIo08GZKTI3EK3MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSjZLFJq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSjZLFJq"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2a0292c4df5so1108486a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Mar 2024 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655663; x=1712260463; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DNMw6NyNMALxWBWOc+v9XiK060gwtRxaRZmcNUuLTY=;
        b=SSjZLFJqfKWdRnnKfm8QlWbRw5bX3j/cF+knTCI+Tm4xSxQVcy2RSQm2wsJENyUQeb
         +kK94uOh0il62vIibAH8TKUti+RTQYbNl/6RJWz9eWJ9gL4YKIxLXnY7jqhxkoAbK8KY
         vGsYQQAi77Mxwd5sNY/LikqMHQ0npgrmLTtsd52+6e0N2TL70wBxY7lZ2bPAp4EGiNlb
         Vtn7RMWfHiu1y/jVkXWsYBLbyU0NI5JI1BjU2aH0SSH6jz4+KRHviPCmAeNwaDxDtZ/C
         arcbi3DvJjx9Tj0NPin6HGbeoA0YU6r205Va0BIFiboH+cIGxvk5L7BjlmoywjRF6pNP
         7ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655663; x=1712260463;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DNMw6NyNMALxWBWOc+v9XiK060gwtRxaRZmcNUuLTY=;
        b=XSE6vUUU6LkXDuUVc0CYUnVgon9qWHO+bTXDr+BtlJV5bay0B8W8n2aDmaevrHykKE
         eSHiyg6Hn076fCY4iio4ygJ1xkPPWgTYTqKPWGWneDpx43oYjPl+QTguZIOMt6acEH6y
         5g30Kbv+hFqS78+TvxGzod7Xqt3WKm4IOHAx0taIL62qfyF47jsmTEUTBsUw8zFbnldn
         3D6UVfDkAhb75shlJ+ydGQY+hKXl2AgQJd5SCC+iW4W8KtFH+Me3XVS04v81JIuIvDre
         U5PEtLc8H7FhN7XUSj1Kci2y9AbK4Gwl0DnBUAunJObv49wo0LUC1V0baK1QBUS5f2MD
         DTew==
X-Forwarded-Encrypted: i=1; AJvYcCVFS6upLQdngOsRbgTAN2T7yLo1PBUxxKnkY18Oiv2ypBgua18PTFMy32QspHXv8EHak8F9OEKV6oJkwZwawBtosDP74utxGlYdVHQh2K1t
X-Gm-Message-State: AOJu0YyMg/Fre1ahf4l9OSMf6U+En3rRfiHzK7wJzpZbm2S/6LO76sBR
	y2uqs/hVaUW5o1nRBcBr+glX4NspgyLDOGSBGa0L2cugJH4b/CMwdDgD/LGt
X-Google-Smtp-Source: AGHT+IGJZv/FBUjOwy/Z+gnH18X0h/A8rVJE9Hbb5Lwl4gN9Ojb0CGGR5W4CL3KDwI/5GZRyoOmdaw==
X-Received: by 2002:a17:90a:f0f:b0:2a1:f586:d203 with SMTP id 15-20020a17090a0f0f00b002a1f586d203mr444764pjy.41.1711655662899;
        Thu, 28 Mar 2024 12:54:22 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id s36-20020a17090a69a700b002a03da6286asm4210558pjj.35.2024.03.28.12.54.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2024 12:54:22 -0700 (PDT)
Subject: Re: Spinlock debug, was Re: [PATCH RFC] m68k: skip kernel premption
 if interrupts were disabled
To: Finn Thain <fthain@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
 <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
 <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
 <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
 <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
 <e926619a-3b6b-8045-8fe1-59bff5e420db@linux-m68k.org>
 <7aee9fd9-1c0e-4874-bb86-e512a7c0caa6@gmail.com>
 <d19e3768-7edb-93ac-3993-af12259b7705@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <63db5f0b-2a7d-a057-2cfb-fefddc15bc3f@gmail.com>
Date: Fri, 29 Mar 2024 08:54:16 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d19e3768-7edb-93ac-3993-af12259b7705@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 28.03.2024 um 15:48 schrieb Finn Thain:
>> Spinlock recursion in scheduler_tick() doesn't look possible from
>> reentering scheduler_tick() through code in its call path, so the
>> mechanism there would be different.
>>
>> We did rule out the VIA timer interrupt (or MFP timer A interrupt)
>> getting reentered, right?
>>
>
> I never added an assertion to prove that because I don't have a way to
> reproduce the "spinlock recursion" BUG reported by Guenter.

Right. I can reproduce the bug in ARAnyM, so I'll check that the timer 
interrupt isn't reentered there. Doesn't quite amount to the same thing 
though.

Cheers,

	Michael
