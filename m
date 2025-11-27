Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C202319871
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238411; cv=none; b=pvjJCpcxOaj2F3RgCvywLhNjrITBQ7DGTDXEhQ//wSRcX//psqRcF4ZJnbod2pw2BeR+415kb//3nd9AYlC16iakI7ELD9Imrkm5nmsMPkhHBqBzNbKO4jPplo+IDubGbVsZO5cLwfCFdwp7KR55H648jRVJPohnnt2QO+a8wVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238411; c=relaxed/simple;
	bh=4w1bH2Zii6Zu7K0e3B7e/yk8NzMWKK/avccfx9Avjqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clngeubsXc4mQTXs30zHEh7ejD+jrV1TOugvJENN8XpgmXIOlasADk0Dabw+GhQY6ZXPKxZQqFuPLGj9D/yv6lc0RMzxleJ4W1b1QNa1qI1+712pPvMzL/TKm6kJITAX2wOUP0bxsaP5l07txD0eClRRBlm0Jv7RxYhgvyhlpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=AKmTAMhg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="AKmTAMhg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso906462a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 02:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764238409; x=1764843209; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4yXF0STHKbVk68ib7oC0OatHTusRkrsuLLpoDJSIArM=;
        b=AKmTAMhg92pxVlUhek9LzAygAOHINqTf8+VelDV3c5phudNb2IbZGyRZW2JbfwOsE+
         M+lEa/Kp1cVPAVggxar4bXx+ncRyNcRBivnCJIDmnDIuaZQL8F0o+QlyMNubkx53b2lD
         zQbtImdP2RnMBEscVEWLM+x7ipeEh5+uKU+a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238409; x=1764843209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yXF0STHKbVk68ib7oC0OatHTusRkrsuLLpoDJSIArM=;
        b=t5FgsYFpemKnWLbHTt7efWpc7uKF6zKEhkQz6LH66fbmm/FPZHx419qXAiWcwWotJd
         lm8KpNmr6SuIq5+MISN6WywLD+y7P25bBlIVeouzJxk83mGophs+alY1SPQvWtgR15cE
         LkLxGpbXk1OM3WMMhg5qFy/fUrXrMLHM6pcJUEsWyKk04VU6aSRGWTe99TNw9A37xIor
         fQbUs6+Bf6dgxxTOEXh/O8kCjdYOH7nZwmAz0a//9lwzjBkGryUEfntW3wFmvcu8kyKD
         8d/E1wmE2jQAbwhCWSnummA9FCeZ2kxlLvNroEbdUpvttes6Cu26twssneJ+KPv9+l5d
         ktqg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ig5tTixsgxq5o2ylmHGbhEh91vy8gfj4tC/u8sxlMwCa1Epjy4A6JfhEa0TQ6r5hare1ep1l621Q@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwDkChzZt66fWWtC+3EBqiXBGD1KuaOZMQf5MbJ3RoN1JTGCI4z
	VkSBHtfP7T356hwQPnIiz08wnTlZ3sdTmY8AZhrj9tShQarf5bm4MOB/yIh4EOSPZse4m1mx+Ym
	7LEyDQaMwGGqA6UBdCDY/OQorPWOcmbNaxj+ENb24GQ==
X-Gm-Gg: ASbGncvCkVRim0+9zKX4nzVMNMkETiOL7gpvagIXqyHXfuKXG7/v1RREFrdwlc15+NL
	8+zG22BjqAcWwS4JJz915LlIVR1Kws+6XwHKL3pclJda4otDcHXT2OqLkSOQtugDwDxmCVLgGPd
	cEgedvEAITZgCFYwMEVCew7pB+295lmzdAcCVd1uCA+FGWRGcX9m4LLWRnv12duvUc1Ce9hvjlb
	rtR3WT791Jd9v4Y5IdS+DBjEhNSNZt364SyHyYTJLw6vRDMKVLUCb7jEf+52Vjuz6jNOok=
X-Google-Smtp-Source: AGHT+IGs1+Oqa9L0Ztx8wyyjXGhLd8CsGobn9ZgsTmaJJ0XQBMQBnD3KQr9QI20mell3pLRlPlUKRwiPGkG9LWJXLno=
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id
 98e67ed59e1d1-347298a9f91mr23679092a91.11.1764238408648; Thu, 27 Nov 2025
 02:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
In-Reply-To: <202511270956.hzGiPzdZ-lkp@intel.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 27 Nov 2025 19:13:17 +0900
X-Gm-Features: AWmQ_bkTLym0lY7lSJOa-U0lUNbQyc4cDmvAcoBWHk3sm-hpRCRHcHOzlQQfKN0
Message-ID: <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: kernel test robot <lkp@intel.com>
Cc: geert@linux-m68k.org, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi test robot,

On Thu, 27 Nov 2025 at 10:59, kernel test robot <lkp@intel.com> wrote:
> All warnings (new ones prefixed by >>):
>
>    In file included from fs/dcache.c:38:
>    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
> >> arch/m68k/include/asm/runtime-const.h:28:29: warning: unused variable 'end' [-Wunused-variable]
>       28 |         const unsigned long end = start + sizeof(*value);
>          |                             ^~~
>    arch/m68k/include/asm/runtime-const.h: In function '__runtime_fixup_shift':
>    arch/m68k/include/asm/runtime-const.h:51:29: warning: unused variable 'end' [-Wunused-variable]
>       51 |         const unsigned long end = start + sizeof(*insn);
>          |                             ^~~

I guess this is because allnoconfig results in CONFIG_MMU=n and that means
that the nommu defines for cache operations are used and those look like:
#define flush_icache_range(start, len) __flush_icache_all()

And the arguments getting passed aren't used. Also noticed that it's
start and len
there not start and end like everywhere else seems to be...

I guess the  flush_icache_range macro needs to be tweaked to not
trigger the unused
warning but I'm not sure how right now.

Cheers,

Daniel
