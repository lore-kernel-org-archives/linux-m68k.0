Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1B1C286
	for <linux-m68k@lists.linux-m68k.org>; Sat,  6 Jul 2024 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720247055; cv=none; b=ahcTv2D8zheuJPg8zKGKjE8BQAz9oCjlKHOMFkG6KFOiGcGhz/r3wrzJ9SwCO0qfydnGdchhL4eXWnG1c/IjA/Cg1fCaQ1wfMGsEwcZayICl+rD+MBKjE89BBCNsbdcOPqX39NkC/M8e63BLJxf5TTmYDPXktKUTd2erYA9uD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720247055; c=relaxed/simple;
	bh=JKse070+sS5qDKWVbIFCfU3xee3WglP9rsaYjbsPCGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoL3aWih5COYCTo8Gd0MrGtWUY0M5KXKmqw+0oC9L56iNYgVjUoV6G/HotmARuSpLd3vx+8iuxwRZEtokwI+VR5KwTt/UsFDOEsvtGLHIspBuAgIlafG5hk5E18VRQYADjSDcpGfNgD0oEyTrFSaoJf/wuNV9uVRgizXDNbxmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=VZucIfJA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VZucIfJA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-75b77be7611so222964a12.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720247053; x=1720851853; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNowAKT2Yx4bsVVhZtPKWhVqvIPgWNNxysVwRFzN78A=;
        b=VZucIfJA1YBU4Hkr8FPERModq0M7t+IwjvZjvMhlWAYuoeOJA7UK/EoKNlFEjZwET0
         zKAl662uESsv26LkJVPYdUpenoI7IQeovmBWTQxbXRJ1H56PqdGS8Oq/gwjeB2unAVB2
         IeUIRc54I4BP+UWG/mDmP+5AK8BeTgknO3SYpEGdPOxx9UOeeCLvlL9NDqxVZZyjCvXc
         WkleB4J/j1Kc/gZNy5apEwP5bn28UwObHuub7ZZfYRbAafVHUgo5KPU0afELdnEB47Fv
         xXJ0nN/b83rVze6khr1HGY00Dabmg8wC673+4FfaTUmZCcWxgZzmWTn3BTEgaGKdxgHd
         MvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720247053; x=1720851853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNowAKT2Yx4bsVVhZtPKWhVqvIPgWNNxysVwRFzN78A=;
        b=hIoqSxpC7jBeJ/xViwPDeOsK5pWHuF+9gTJTf3PQbIgDd8XCnAVIQijxCCHmLPjOyk
         qMZtbwL1wrtxxaHwanqy90yXNBdR+CU2G6p9KGcjy2Hwz61dB4T/ZhVdzGEDWVk11Jmz
         pz+KJnuEu1p55hmzDpz72uAz7Fy0sLs/0EN7BvUeWqYTvU9Dy0zdpITXtU4jq8FrZWHE
         cuPK/XxNXJD6lefGNwHdj8P5YbBj16GkbFB/xW/oAMEBr3oMZhy115Wu07fITKiqSeNC
         lEz4RXlI+yfOXBJg8V69H0rk0BakhiHNiZIWQjohT+lyTk6djkUI1C9221Xo+pHz0sTo
         gweg==
X-Forwarded-Encrypted: i=1; AJvYcCV3w0KJzO7bsCddDxEGDvG1YvXpsDintPsMP1zvvG+eXQGASZxk74JJQJjR6lZ42Bb5pQRf0XYlaQBbbagzUfmT3bfDFB77BcFg0YTJE9Wt
X-Gm-Message-State: AOJu0Yz+vzYdyOabIPX4gUpxXenvvMqDZo3ZjP3LGqOr2jVLMxbgy+2p
	8Y3rd0M7o2RpChFnbZ8bCa8lFcBDwj1SRU3O/xpwU4SZ0nk+oBa4zvlKnXOlMMM=
X-Google-Smtp-Source: AGHT+IHkATLu1IOVXZo0JSeysD65rehYU+N2CceBVCaz6QV3RMSnuU+l7AFk6tgRwEv2nx+DTk2O3A==
X-Received: by 2002:a17:902:e747:b0:1f7:1bb7:39db with SMTP id d9443c01a7336-1fb3402a38dmr74437755ad.5.1720247052790;
        Fri, 05 Jul 2024 23:24:12 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c8::1011? ([2620:10d:c090:400::5:7b2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8b3fsm149983025ad.5.2024.07.05.23.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 23:24:12 -0700 (PDT)
Message-ID: <bfd407d2-64bf-4e3b-961d-adb51269170a@kernel.dk>
Date: Sat, 6 Jul 2024 00:24:07 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] block: pass a phys_addr_t to get_max_segment_size
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-block@vger.kernel.org
References: <20240705123232.2165187-1-hch@lst.de>
 <20240705123232.2165187-3-hch@lst.de>
 <c2333a14-04bc-49be-8cc6-a03dcdb2eec3@kernel.dk>
 <20240706062228.GA13842@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240706062228.GA13842@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/24 12:22 AM, Christoph Hellwig wrote:
> On Sat, Jul 06, 2024 at 12:21:06AM -0600, Jens Axboe wrote:
>>>  /**
>>> - * get_max_segment_size() - maximum number of bytes to add as a single segment
>>> + * get_max_segment_size() - maximum number of bytes to add to a single segment
>>
>> v1 had this change too, not sure why? The previous description seems
>> better than the changed one.
> 
> Because it is used to also append data from another bio_vec to a
> pre-existing SG segment, not just to create new ones.

Sure, but then let's make it something that makes more sense at least.
Maximum size to consider as a single segment, or something like that.

-- 
Jens Axboe


