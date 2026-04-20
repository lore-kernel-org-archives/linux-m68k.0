Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C1382F09
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Apr 2026 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667822; cv=none; b=jjW5xeYOms8PyejXCWHzk7/NXX3++1+j+5jTc0D2ph92t/38VZAkueIf0MfrzvZAHcWqBJdl5MBblRHc8sL4NVJ/enxnK0MI7XNxkzxxCc88IlkAKvNJLHx5Nh1Nz4QR0y0DfcpbBYWq4gehLkZNFZwqUUhQppeWx2VYG0wwoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667822; c=relaxed/simple;
	bh=66683rtKBPWrf7C4XTuvMiaBte65Hl+xhzNuAjnDIic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xl1L5yagdqqBK40ewp9JTSj6s4oPv2xcFhIIQi5uBrwuxlgxxz4KBHZPHlE5lTlAypeEJImIw6/dJLaT6FGLOXR5nks94KA+NIpzcp5xRiHgeiU5Vo02+Rbd8tDQAixZdeo6GHIEnTk4hGuw3uKbakqGWOUzkrL79Y5VKrtAqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56f3e6bbecdso809967e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Apr 2026 23:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667820; x=1777272620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev7Q2PR+MzeC42yfPBg+fufDGNaPf4avnQMcEXwV9q4=;
        b=geVyvtCZWZTtEzufqUdtpFFhagYWy2c3/bgyJEz4aqUjeEfSBuD9o99kYZ/d6pBaIt
         Uf08D3Lok+tgRoWgl+0u7YjV76FYlP88LddLz+mdo637XR5MR62gNHeZomg2+FZnHMs6
         RUIBYTQ11Y13sL/sbkG1IHE6gUzO5937aEJCfZ44Y0hkjuGU4hmDmhIFkfwWDtm8XK1k
         +g53i0LGVHhywC468vrKZQaygoDq2liGzMqo2Z4zidLQj/ot0wuO/ECfQcjfESjyicz/
         iQz1HNH+zigoANZIPQPu6uVZABx7VySpsXIgfHiT16dJGqqs0IZjocFv60GYYoOZdeqS
         u9tw==
X-Forwarded-Encrypted: i=1; AFNElJ894oL7YYqcDNls+P1jCZSO0n5TUy5iWIrAiJqHdNuCwSu4f7HxHFi4EJpuJniGCe0wYjLNHOXLN9Mj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxIjbNN9Y94PF5RrJqOnU5etQVAjz3kzWFKwFmrJinkFy3anubt
	QIp/sryBx06jtJQbH3wspRlZTX2onH0aAYSBkFdpRbSTvKiGCVEgeVzunmq2Uob5
X-Gm-Gg: AeBDietXzW4bNSbXrKc10Zpx6xYI58bfBCB+KeEiLJO9m5BX3xqupjf9IYBFy2NQE+Q
	K4CDqDBo8xCSnWWUJY5ynkyWOopA+MojU+kNiYJhU2vsazA18t2UaR/aaxGv+aP2fh8SIFduIa2
	6I7sj3UWjINV0VBAuTtVLfP47IQND9RYafKJjCemQbJEQiz1Q0Cj7UsrFlaVdk7OLxi1mPx5Gbg
	M0t/fUdvFmi43fBw5QiO5Af+EVz1ubp/zskoCJeI2L6uQDi3EjsUE5v2eyn8v+SlKX3fNdbo3LL
	ruCoS0yCZ9pYuqXazExvmgDdP/r/cq82gZHl2g4ofPqgFeTTJcBbMqofh0azy4yEoLy3ZW9pGPr
	G7UH5c5ZXxeN/VyOPO5cSkMIpWOYdjVxaTF9BsJ6hntm/ygsKlhaVk7pD8jYZIKPUkwZklmsApl
	e1RhxFLbOejm+ncRg6ZPmaCHCYrrOWDnFNo14l9GC7rBEq6xdCyJf9jrU0jN8LMe7LruFQb+w=
X-Received: by 2002:a05:6122:4fa2:b0:56e:ded3:98eb with SMTP id 71dfb90a1353d-56fa585d299mr5227033e0c.6.1776667820247;
        Sun, 19 Apr 2026 23:50:20 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93513c6sm5601700e0c.17.2026.04.19.23.50.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 23:50:19 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60580b17793so839606137.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Apr 2026 23:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/7MYxNDaSNsluDmJPw1vI+FcuDwin2cCEEkMocS1lFdOpfH+EU/RZ2gz/AEcc7JClWc11f18xeJ4a3@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6051:b0:60f:7499:9b6b with SMTP id
 ada2fe7eead31-616f859752fmr3673069137.29.1776667818181; Sun, 19 Apr 2026
 23:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 08:50:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
X-Gm-Features: AQROBzDvJRShLyy63Y8y4xm5mUkGqHiHZxGK82_lU0-LEkdWIcvZD7MEx0w1d6U
Message-ID: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Fri, 17 Apr 2026 at 15:15, Thierry Reding <thierry.reding@kernel.org> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Peter sadly passed away a while back. Paul did a much better job at
> finding the right words to mourn this loss than I ever could, so I will
> leave this link here:
>
>   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
>
> Co-developed-by: Paul Walmsley <pjw@kernel.org>
> Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>

   "every Co-developed-by: must be immediately
    followed by a Signed-off-by: of the associated co-author."

https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L506

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add more missing entries

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
