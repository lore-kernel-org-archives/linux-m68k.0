Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305C7465
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Mar 2024 00:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600295; cv=none; b=cuF4bGRyBaC/LNM6M61ijulfXIdEd7b1zko4wALd9MoH5J388z4ByJhfS67rnPvL4OZROA3WYsR5d0iHqEQs93gCqsEmNqa7ePlYZGdpcA5NAaS6q0p9x8xsV0mfIcPnmd+4A+6KJUeN/ANsGpYs8uVL+yHgUHI1sHNya7QurCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600295; c=relaxed/simple;
	bh=gqamz8gw2AUy2EJtreO4nX1BzeePunG///1WJDSBvOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RicPCiLGKYvHXSSN6+Y20SPHJFwN4ODeCR1ajov8PfY2jpqAVFe8qnRd4aj5Fs2T0NK1sZEmiyfxpcEzKS/dCbl5SWyUQhkvn0KvtXmt2IACFDzb2FXChM/s+z4pHUKUNrPRHv8x1NWK8sLUjq7cNNfIvciXC5KVfPJg02w5HsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbW+G70O; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbW+G70O"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e55b33ad14so3101982b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Mar 2024 16:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709600293; x=1710205093; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3LDqpDoxu699F5LFjSKMl7UuKcX5gings9dqZ8r5m+s=;
        b=nbW+G70OzLXuCKv1soI0trPnhuMhlP58B5K2VrRejamQS4hEP+MwiP8SeNb4ycX/4U
         /RfMjZZMlznrFlf76pVQVhl3L2vTTh6EaZzfP2CC49GfeLEjt/bozRXfVpUQm4YPXrYw
         AvpNR9DwtSqKHPcAjsCxvHxJhYP6TleHYEFeg2N4g0Tw4CjoV3zgNt4f3i1ZOqgMzNAJ
         ghSmMR2QvYzwOf1YNn64sN+UoF2i4f5mSFHOPsl70Q/nH4173i9P4xBWRB9QRPSZIm8H
         fAJTC78xn9KuPOJ99MHJIqjGQ+Mgkr4D/TziyP47d7H/6ZN9uqz0G4H1bfLIRvPWUJV0
         hJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709600293; x=1710205093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LDqpDoxu699F5LFjSKMl7UuKcX5gings9dqZ8r5m+s=;
        b=Jqir+Klt2/T7aE6Bk0wKi3VblJpKvh8r5z8M7L4T3cmkii+8+abzptJ4cuE3osuDqx
         m/yXFKHLCIOWqvvD3pVs0ED5BcNFSi/PYT4SyFN2X+ESD/PUUNSlXsmgPk9bnMXLsr2q
         VzdKte2Ct6DJCGMUyQgJvTX+N9XfvgiLcITbnBwawBRoQCrVNky4fndZl1IG4cpA7re7
         XPIsxKucEwZGRiUKzag8Yf6E02/3QCMjJo89Prec30le9fUnqQhPcTtX1Az3WnEMdsBr
         3tT6yRiM2s/kIpczpqthsb5s513X722QUFmAd9AT0HLJVrH9C4Q5F+nH7tWvA/1d1qiN
         v28w==
X-Forwarded-Encrypted: i=1; AJvYcCVi0Q5a2giIKJiwUYCFyeSgFPbc88iSFMFY/qIICchGjqN9JXdratFcKzW/BQAK2b+PQFITj7FFBDLBSrWehuHSjvVXwRiwz4Ytm7FfStjM
X-Gm-Message-State: AOJu0YxOdMq7kyNbATNQnjt/MmzCBarO4LVebOg/vloGM2qfeGNGfvNe
	tc+Sb2BviD3JKzF50Zk7hp9x7L5FEl0tfU+/xupPKJ43phVyf+uGwN2o0RD6
X-Google-Smtp-Source: AGHT+IGZQX9PxMzposgFszaRNQAHEOGy6YRNRRoOdaVAXIUVBV63vHzylzMkJEVn4F2ltRDZVsKQag==
X-Received: by 2002:a05:6a00:2d28:b0:6e5:591e:308e with SMTP id fa40-20020a056a002d2800b006e5591e308emr11958244pfb.28.1709600293301;
        Mon, 04 Mar 2024 16:58:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12-20020a056a00138c00b006e603c538desm3495146pfg.21.2024.03.04.16.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 16:58:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6ba36077-004c-427a-a641-e30e550235cb@roeck-us.net>
Date: Mon, 4 Mar 2024 16:58:11 -0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spinlock recursion when running q800 emulation in qemu
Content-Language: en-US
To: Michael Schmitz <schmitzmic@gmail.com>, Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <2ec644e8-f0e0-ee4b-f866-c27ff531aa3a@linux-m68k.org>
 <fcb506f2-523d-4efc-ae3d-fe3c79c6f09e@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <fcb506f2-523d-4efc-ae3d-fe3c79c6f09e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/24 16:47, Michael Schmitz wrote:
> Hi Guenter,
> 
> On 5/03/24 13:33, Finn Thain wrote:
>> On Mon, 4 Mar 2024, Guenter Roeck wrote:
>>
>>> when running the q800 qemu emulation, am seeing random "spinlock
>>> recursion" messages every few test runs. Some examples are below. This
>>> is not a new problem, but it keeps popping up.
>>>
>> You have to enable CONFIG_DEBUG_SPINLOCK to see it. I have logs from 10
>> years ago that show it. Those logs have the VIA timer driver in the
>> backtrace, like yours. That was v3.17 running on a PowerBook 180.
>>
>>> Is this a potential problem or just noise ?
>> Maybe the locking validation is not compatible with nested interrupts (?)
> Seeing as m68k is the only architecture that allows nesting of interrupts, I'd rate that as quite likely. At least that's how I understood the situation a few years back when that weird access past end of RAM during interrupt accounting bug was discussed.
>> Does "spinlock recursion" show up in Aranym as well? I would check for
>> that myself but I don't have a reproducer.
> 
> If you can give me a hint on what kind of workload that happens at, I'd be happy to run something similar (if not the same) on my 030 hardware.
> 
> I've never set CONFIG_DEBUG_SPINLOCK, so would have missed these messages, too.
> 

No workload in my case, just boot into the qemu q800 emulation.

Looking into statistics, for example at
https://kerneltests.org/builders/qemu-m68k-master,
it is seen every ~5-10 boot attempts.

Guenter

