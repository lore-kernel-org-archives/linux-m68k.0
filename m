Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795309442;
	b=UW2IoF7wtENQDODxTwoaYJUUPjLO9ubW6KBxkkFPBn2r5d4lzO3pxWQ4PQMXRNNNd/95
	 +KPzO8fh+kNmS+4/m6NhMq55zaNT9JEtWOqOpIY2PuHz2++LuqvntGhHSHLTkmaceYFSM
	 1z8e5YqEq3QhXu//48jUBAy+saXnUhHEn3T9wW3N2yeZ6ZGansD0wsd1SxAsFu8llrG33
	 7lj+KKs2jJlw0hh5U8SOayLP1qhFWpbB5FTtYHk/GWcAZChKIKRDo62Eio6I0O3tNcnbP
	 OUCN+up4H9YqBgya6T0SYwfhWIT3pvHA2nKUNUJxaVERm37p292F8nXa/vIo9TvsJtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795309442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
	b=KqcuZmSMc/ZMMHUZw6UaYVMqdU+OaOu18+nf+u9Zd4RHvQ3M8OEOnwDKWbBLyrQnOzKP
	 LRWJaxMJ6/AxORpDm9NlrcfwFU/+gorQ3a22eBINNcIoyyCRHzbHI0AZEtKALRTktLla1
	 bDa+6B4AJN6xrgOZA4BIg5iK5bKJ5K8zuJbvo44YxwOyP/sw/pAXsrnj2hPU+1D2/aq6G
	 DKYsz2xEAeJa8VFe4KzstyFu/czIYN4QB5pfM49L7mnjd4t0YwTBBo3gjljhWqcbAusN+
	 3JjhQ4pBZqhg4zP4YIsADSZOoinJMVGJcoap0mJ5fjwrNGthXQDJeWIkjhjlCkeym9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47599606A331
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Nov 2026 01:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47599606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so2381327c88.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Nov 2026 17:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795309440; cv=none;
        d=google.com; s=arc-20260327;
        b=NXDXMusT17jCdUbzPw3t7Zb31OE5Ip89bGyAeWglyOMvuicF1PDUmaWoFnksZd/CPe
         lCziv1ZSENTBL2XJQxiEP9yPstxS8dms6rlwXqdMGbKbF3W07vvnuwbu5n+VY5cVcQ18
         Alo/+NzL173VIDju4DSOtI85kT+ZAFLlNEYUH1pGQXvpzKp/WwuyW9r8F+1+6+uC5EG7
         UZp3Yp+4RXf3a50BuhOqg5NYKB6hDwIyS2Uws4nMfzlikBITC4Q59cD2ZGeuX2ACIn5J
         659o9T78eIM57Nl7tlV2RUY0US8cBA7hbLj0ZIy6J1kxgobu9DqrH8HryPLhHoEUNS9R
         xUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        fh=Lbr7W6pllGGMH7eDMlxsopcAoyexbkcabglrnI9v0bc=;
        b=ercI0fqVsgWpJ31Wo4PFLgGqvglYbEkqBmzf1HoC3PNRs27JWZzUdc8Ft4MwlnrnEZ
         /UGy3xUAyLgZ7fPmipnBioCE0sfJPTOsyBbGsFgBVADXm/0s01se0mQ2Ot0WyLEfDcy+
         cNx7VdEQdZtdV8A9JwUVxBdTi8CiqVctMMra3MV95pMq791M/BB6GuTZvn8w7r6bqQoY
         EoQZByU98W5WhooHmmvWlphwoP9qXKOiu0MOE/rdbINHHjbxN78hEvlQNkL7Thtwda5b
         2/A3SOQsI6IaXCphBTWgxUEJL/zdM+fQewffQM1Lgco2lQNrXANOypGUGBM4CaWAHD2Q
         9rKQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795309440; x=1795914240; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=fDaPYFMlGBAbejNvQBrYna4Mat/+FScsBnIEdcljDWEQyEx3neyjhOZDioxDTOpHAw
         mRdv2YFlSiHLVGPXNWfE90UBydPb2Dc09cJTBg/BuDlx76T6U03sBmiAxKSQ7hPbxxRp
         HuyDf4WZkJ1was/FpJm5I2/jNIqx2sO6mDHqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795309440; x=1795914240;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XU9CTY7WoQNjWuyj0O1gIi3t0Gan/b1npHOP4LTTvJk=;
        b=23VCSNIO+i2M1uTjG4pvIIT44dTNjQoxS/pFkKFH6d4cWZV916c82dncUa2Xv27q2k
         H3VTdJaC1udTL1wM3ZlJoi+jl6mOP56KgyRlsJjCLFqJxvqSjEivpDW668kU/iZ7J/yD
         KMu+V9BqixlMW3DEdsL8lIsGKg5GphDffiKYkBwifgxDm9otWAZvWi6ihqx5yQwznWiY
         boREcGtzAsLlkjnJLKNBuK6jgbIPMnZoBb3RDrYTv82KCQ7b/timyma5KYR124Q53dyz
         bJ373mj13Gd/gPLbo1VKLm7oQLbCdEaX4++5ZQ3QElU6dJi7qI1MYjZOMlB5PTERyUP/
         pHRA==
X-Forwarded-Encrypted: i=1; AL+hErFW0bCgf6u87u59gtTEuwlbr62tZGGBm/lEX5jos0EBiajL1uCYNv2cw15nN9y8VK3gkOYa8E+bMrKo@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8D7vgyUNLdlSkg/JuvvafQtdqgw8roiICMd+pRqAVF7m01Q+op
	t5LVhC0VABhoQR8l60lCN6Ne5G4xKDtAifUh8ZRSO7qQahl22oduAXPvQ4uhXKapSzVcZIcKBay
	EiVOqi3GLuzt9NplkWIYX8OUai875uY/kKxw/xip1xg==
X-Gm-Gg: AZFdTZcTBWx1cmgjxik0Kv4a8tzz3DNMBoCNUQea64B+gUz2lVdvegCk35KGFvdTOk9
	6JRcYCn/wMGYh+EghXEjp5Jp+KItp/00xT8TUEcUaoGAwFtGHnMWNnIz+Fwa/zm2JXqNvW+qQJ8
	3B53Rqg/uKbIaLiF49GD5pr1F4+DTFIMmQGl2JP3pOLGl3a7yb6RrzQAV6KV+ROri3kTIZu5+bx
	2Suy+afl+lXsjfRFXVhXfvHKILKoBvtY3ttOuodwxlMW/p10n3w+RxZoS+szshEunpzq/UVUAAf
	RRlcgZU+LXF59EUBitnxsk9R7v7HzCbajEGD3cEkbPgfS6dyZnRGWYf+45O2HW4dG592/iKzTt8
	fm4Yy+ROSGucvTEvcZEETcwmMdxUxJq1XBM9k3ek=
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id
 a92af1059eb24-1b56f87ab60mr41806c88.16.1795309440060; Sat, 21 Nov 2026
 17:04:00 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111163735.227286-1-p.pisati@gmail.com>
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 22 Nov 2026 10:03:48 +0900
X-Gm-Features: Aa3M54q1ImzjAY62LMRYJIQ2A3YvuU8mR98bZ0JQppFgLr97xa3DaAxEG-GBzXM
Message-ID: <CAFr9PXm9+gn0Gz47TU+PG7LexCYWWrU915BLcLAHg8GSsEDDeg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] zorro: add a CS-Lab Warp 1260 MFD
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Paolo

On Thu, 12 Nov 2026 at 01:41, Paolo Pisati <p.pisati@gmail.com> wrote:
>
> The CS-Lab Warp 1260 is an A1200 trapdoor multifunction accelerator: it
> contains a 68060, an FPGA, an ARM co-processor and several sub-devices
> hanging off them. The 68k drives the IDE interface and the RTG display
> controller directly, through the FPGA; the ARM owns most of the rest -
> USB, SD card, WiFi, audio, the Kickstart slots, the CPU clock, fan
> control and the board telemetry - and the 68k reaches it through a
> dual-port RAM mailbox.

I can't test your patches (I wish I could but I only have a 060 + G3 +
Radeon hd 2400 A4000 ;)).
But since you have an 060 could you maybe test these for me:
https://lore.kernel.org/linux-m68k/20261119123558.2108296-1-daniel@0x0f.com/T/#m42ec8c1fe97b64b22f9cfc8d7ce753937bdbab1a

I also have a fix for a small performance issue in 060 only kernels
which I'll send next if someone else can test.

Thanks,

Daniel
