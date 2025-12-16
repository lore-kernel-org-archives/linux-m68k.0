Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7C2BEFF8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927225; cv=none; b=LGP9Hl0kyUFHl7kIYTT+08KvYuab0I1aAXG9sqPMx3hagVELHK9wOnQ+Bv5SndGVbIFUMpV6yhjOtOtIJL0g7PVQYXZME/gcWUmHfxTb8MiPQqLmv6IjpaYbaxjtTjrW62BrxVEsxhRg60BUJDU5BB9aw8X4SLmhfq8+GZHucjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927225; c=relaxed/simple;
	bh=tnDIMW2fMK57uxvstIhw75Gggae731ypToeg9A4Cnu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NP8I2pyiRyuBy+LaVIlOwQwXXD7eoApj9iLVqi95ktY5bCnafuBy0w+5B0LGKlAM17nQpQoTZoWCdo65/BtI31BPyy7G2cXstO1LMqGascC3KJMVcRVbH0ftvndJb21C+YfEFoh06srxmP4sQ2xR4csaRGBtFxhqiRbg4XRJuuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=kvJ8wKtd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="kvJ8wKtd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so2712627a91.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Dec 2025 15:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1765927222; x=1766532022; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gy2rjlQJ/MwlF7d+TSXEhOTxke1Wr2G6RWbQLrYM7Dk=;
        b=kvJ8wKtdv4pVoX768uBTZLxyb7didVi2nhO7WmnaDJKMzEO6NzV7j4zLzyAaHBT8Hu
         D8HdWv5ym52Mw3mczdW+xWivPlK/1gM3C0zFX7+coJ6eWUwWQVCT3wjfkdNy9Jo4stpn
         X5HrV93wRZf/DVqNp9YnyQG0D3R8EgiRuHFok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765927222; x=1766532022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy2rjlQJ/MwlF7d+TSXEhOTxke1Wr2G6RWbQLrYM7Dk=;
        b=BLNiDyqKJxeYME1rEVO6VJClgopAIw+fR+DrxPQOA+f17cwvHBmwsSnBx601e/k5JE
         VRpeI0Zs/kuacaG6rz65oP9GpsZkkr1uSwQJim/gJePESVSeq2izpKnNiE9tqf9IxinG
         fAB8WGfRlbrJakA4lhv4Ty4sm6XO/SWgBTvJd5iyxMVvZdi1/WMoNSjdgHOXEjCmM2nh
         ZRBhuSA28l6M1MrnmvEzz5my4nreNnHF9LFjC//owGdTFvyYUp480VKWyQwezSSf51T1
         1Uv4kLX+sovaxTSisPL0jr0eEAYMSWdN06gzGyp3Ve39hc6nxvoCo76hrkk8dOI1ic3N
         fkJA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPYVVPWxAg0deEryo3+aDd+NIBe+AKj3xDPkYiy20dh871Mn9lfa+QURy6nZxHxf2xYID8rRWI8H0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyG6E2gxd29FrvQAg/JSnz1yUkVwl4FKan62npMg8WHK+e5CbQ2
	JuFsgBW3PAnyvFVP5Hf4tAJqkNq3HWRIqenV7b3M9NO7azDP1mtnGa4LIz/4561TMotC6i4i0Ic
	XqlgpEo2J1w1cjmjDA0HAMSv2+3SIbRbQY+MdRWU1eQ==
X-Gm-Gg: AY/fxX5K1shorbNqO5Tl4SoE0h3orjVK5eEqorPvqqzlV/o5Jkv5ODA5VFOLiBY7AWV
	QrjNzwWtavOceoZ3I33k4Pr0zgijbMKLrKTGccrqWK+A5Jao2lmBvHy+MNnY4w3JNdh11dz/Ktu
	4sJQHwQNVvsy4BLYSY6C4efIGhJdeiJNXh+piyJRw2d9BRc6dlxiG2iNR47hwBShLnxbKR889Sf
	qLBGLlRdn+NekNcNzGiPao0wloYW9mMUig4j28aU8/krQ7dVt+2fCYwBjhvBKhyjf2NlzGs
X-Google-Smtp-Source: AGHT+IHRLmrH0NhxsCVKZ9qmGrCAl+I2i9/10P+TFyGujd+JX2sBrK1stDmkuLqLUE/Qescwxw7u3hLX+aeoqjfkUTM=
X-Received: by 2002:a17:90b:2891:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-34abd78d3a2mr13622806a91.33.1765927222280; Tue, 16 Dec 2025
 15:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009192933.3756712-1-joshua.hahnjy@gmail.com>
 <20251009192933.3756712-3-joshua.hahnjy@gmail.com> <42143500-c380-41fe-815c-696c17241506@roeck-us.net>
In-Reply-To: <42143500-c380-41fe-815c-696c17241506@roeck-us.net>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 17 Dec 2025 08:20:10 +0900
X-Gm-Features: AQt7F2pdkaX_FXf3Vw4ZDQFKJiyh0g2VIemxkf9QfS5MKxqxzb6tlEjZT7oT4fU
Message-ID: <CAFr9PXkRRQwMGzAQyhkaZU-BLFHP02rd3nHy7HR9Z+T5eUaUJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/page_alloc: Prevent reporting pcp->batch = 0
 [mcf5208evb boot failure]
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@intel.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Wed, 17 Dec 2025 at 06:47, Guenter Roeck <linux@roeck-us.net> wrote:
> With this patch in the tree, the qemu 'mcf5208evb' machine fails to boot
> with memory errors such as
>
> S01syslogd: page allocation failure: order:7, mode:0xcc0(GFP_KERNEL), nodemask=(null)
> CPU: 0 UID: 0 PID: 34 Comm: S01syslogd Not tainted 6.19.0-rc1 #1 NONE
> Stack from 407d7ce0:
>         407d7ce0 403df960 403df960 00000000 00000001 00000007 40027c60 403df960
>         400c06be 00000cc0 00000001 407d7d7e 400bf614 407d7d34 403df3ba 407d7d14
>         407d7db8 400c0e5c 00000cc0 00000000 403df3ba 00000007 00000007 00000cc0
>         000d8000 00000018 0000006c 00000001 00000000 40fe6640 00000000 40fe81e4
>         403ffa40 4085eff4 00000000 00000400 00000000 001008c0 00000000 40854041
>         f4fe0000 00004041 f4fe0000 00000000 00010000 403ffa40 4085ed00 4085e800
> Call Trace: [<40027c60>] dump_stack+0xc/0x10
>  [<400c06be>] warn_alloc+0xdc/0x1bc
>  [<400bf614>] get_page_from_freelist+0x0/0xfa6
>  [<400c0e5c>] __alloc_frozen_pages_noprof+0x6be/0x8be
>  [<400c1358>] get_free_pages_noprof+0x16/0x3e

I reported a different issue but with the same change:

https://lore.kernel.org/lkml/CAFr9PX=_HaM3_xPtTiBn5Gw5-0xcRpawpJ02NStfdr0khF2k7g@mail.gmail.com/
https://lore.kernel.org/lkml/20251211102607.2538595-1-daniel@thingy.jp/

Cheers,

Daniel
