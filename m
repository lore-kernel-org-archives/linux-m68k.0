Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22371F3BBC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Apr 2025 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479709; cv=none; b=eEZIViS8sq/MZv7fpvZewl1EZbnvESb1pQl5nGGzZgYoFLwC5L6dSLwsbiHCDagOvI0G5GlibgQ/a+rznSQL1il9c9VpNBZuRyZN76TCT0iZeZdiECNft3RpNF4uriGefNdi7+55KhGjfjiyLwC7yiiESxpSrk+vRSUu1zJZzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479709; c=relaxed/simple;
	bh=rrafsmQRgHakfZDjK1w6FolouhAo42wX9rjQTJYVUM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcHvZ8cZSFfuuOl3nWrVaknsjXa7/JlUXntTIyAoGxCFYmx2mQEugAsuPBMOCL/YTL14FphHIC5vkR0Mzc24ZyQJyCOOzzwatw8J2JtP3bAmNvAJ/ja53MBIH6lNMx2xJFOUTbllfspw4h547W2pO2pfrNqpQkvBRSZfx4DOdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso309933241.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Apr 2025 00:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479705; x=1746084505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9seCpacsNWkUEqB++ORNCS6Ujo5QbBvcFa4UL8hXrKk=;
        b=Zw//lamzUjC+o+XZeu8y8SnFTFr6GmYwoFRA+GAgjKQIyrBptcxaHGEu61giN63xzw
         8WBdvwm7yAIUoe1fwmVIRuSZndkZzXVCQeIs4Efwf48CQeVkslWaRDTqeyaNVGJgy08Y
         9ft6atOM8Yfa+iF1nS36LNWaHU0+mJDNTbuCTinWu2qFvVB3ciDZSYMJF174fVmZkeZK
         62CuIiFj0BqMwrhPeuvyXbJp+VshpsBAQhBXIBGIuqV63wz4Yjbl+GEHWCC/xR9fu+e6
         h/ORjce1pcnZb2t9YLcFZUHPHDs8nAQppnOZbtvgsUf+q0nZAamg8gfclVA+RCeMr4dI
         x8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeIiCtHwsnDmEU+ro0by0S6C3ls2xh9Hs13GzESsKjogQB4vvPlxeyfQMZO5lt74V/Hf+mFDlvf4sV@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz5BR/4lgqc1hLOLx0OzQgAv8cjBGwlGqFHVwm2MjHBZeWl8pP4
	U7Lgecuw6vQUONdY+iXM4jWK0SWSzeLYjd9ij6JFlDaIyGS5lVHFihSE8ug6
X-Gm-Gg: ASbGncvSAxbrYakZSNgEZ1D5PDGZ9VlZhVk605HVe3/xhytnoCEJM/62KLFWfdTE025
	IErfsMJM+/tJIolddg2DQTZvkg6WceHCC7IpiBsj4rmCWZLV4W1BJ/6EvToMEZDWuCwhiarHQgo
	JfmtgUOhX5uNFqQF3D8YkuvvSBSKdbO0/saqyuVY+Z8j5BTg1QiKmEL1dGVxIQN7Jz9/tyCeJrE
	1tmTPRYuXt3o9pM+Fq0zDi1ajJjMwQiBM7rM6Cgvpwp9ei/s8ug1X/7YNNlS1h3VS4PcMehzhLF
	Lai5kwl3+zrRPOqqyjVKOrHcrKp9qc3cDULfouVkfCrj6jK3eiBPeNKNJ692R3PT00r93XlMl6d
	t0FtXZJg=
X-Google-Smtp-Source: AGHT+IH722paWbOv+hJaF2Iemd2gNa1I/0OasQ/OQCPpFXLjjPgg5Kw9Us83BpcWJ8Zl9qSxmfbaig==
X-Received: by 2002:a05:6102:54ac:b0:4cb:5ec2:52ea with SMTP id ada2fe7eead31-4d38f2e79e4mr1249733137.22.1745479704516;
        Thu, 24 Apr 2025 00:28:24 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-877aef2f8ccsm190226241.27.2025.04.24.00.28.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 00:28:23 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5262475372eso364817e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Apr 2025 00:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXp5FuFT2I/M62QdNaqnidg0MZijqPI+aTvucgLB80MxYZBc9FarehiLT3gPq00ZlAh8AN6wGdmXeX+@lists.linux-m68k.org
X-Received: by 2002:a05:6102:94d:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4d38d2231b4mr1364322137.10.1745479703504; Thu, 24 Apr 2025
 00:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0f30a551064ca4810b1c48d5a90954be80634a9.1745453246.git.fthain@linux-m68k.org>
In-Reply-To: <d0f30a551064ca4810b1c48d5a90954be80634a9.1745453246.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 09:28:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD6GXLiKeOQRUT9BSPzXcMKYyk-YonvodZvTia2VEzHA@mail.gmail.com>
X-Gm-Features: ATxdqUHeMyl0vXyqZGyuC_hoFBTwBf9LswSSeAvstppnbqazV4KiNo1iFAwzm_o
Message-ID: <CAMuHMdWD6GXLiKeOQRUT9BSPzXcMKYyk-YonvodZvTia2VEzHA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Fix macintosh_config for Mac II
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 02:13, Finn Thain <fthain@linux-m68k.org> wrote:
> When booted on my Mac II, the kernel prints this:
>
>     Detected Macintosh model: 6
>     Apple Macintosh Unknown
>
> The catch-all entry ("Unknown") is mac_data_table[0] which is only needed
> in the unlikely event that the bootinfo model ID can't be matched.
> When model ID is 6, the search should begin and end at mac_data_table[1].
> Fix the off-by-one error that causes this problem.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
