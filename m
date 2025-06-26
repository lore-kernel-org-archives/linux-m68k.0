Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4322676CD
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927210; cv=none; b=T3uhILGXIiz2jItxCWb+Lid2XOv1x67LZDi8ulP8K3JyOW1z3gRhmoZOy3LshLH9TJ1Qj3kvEOK/cyjjTSnfqbQahwp0U9ZHAhiQ4f80zjdm5Nf8abqOUGTcUI+mifPkSDpmgwaC/GJlrkJz/gUNgih1LVxVSljLp56LG2qunts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927210; c=relaxed/simple;
	bh=qeXksUF95t7j8fufzrGvvwqKIxNAuDnTZhd6tkl1V8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZkB6PjjTFFj1/6KUTDVr373JQML0SChazAwb8Gyj0OfENkkPzH9RwqnBu5RbgE0O9VLcSm1letqrrebtIj8VUAmTKjhZWgkZMY7Kss1rpX1sR98HVcw2uYQ3kwvSdukX2ZonwXxGNg+T56zS+9X4mdIDGD8vtfAQDt1NwmG9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-532de49b7e2so248077e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927207; x=1751532007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md/YimW6cxDI1mQlDnB4XDpgGsxgoMmV/QV/Bk6cGXo=;
        b=ET+Z2fxvMhj/4ErhjVN0BIsC7EXihPHy7ZiUNwGAQOuduQi5G1r6zuqSaJfSblXUTN
         oew8PuJiZeidM6dywwR7dHa8lE/FxUgtn0zA/tnEMplU3beZtSosGxO5jwDOFotNgkYr
         sqGELSVl9FX9X5Qsqu0aM7m6OUzJsBdx31h+KTvAeGvh2NAPMz8eH0Nf+LE50/t40P0n
         HJCLIlENmv4VW+aWjCy2tqSEgFdfdnKULfOxl9LmtkLn6Kyi46ksrulb2/8omfshE869
         V72WmdgEHPAYHXYwABkRLKeWOhlwnJDwhZb0mrOBvsgECQ2/r05bH7AHa5jAgK5VMpwl
         6JWA==
X-Gm-Message-State: AOJu0YwuyMKae1J9sTxjrM6L9baGa4C5OFeGHrKyrY8hyIj8hhBtK970
	lkLf/R80vyJxl0XdbzAHrGneUIPGIAIou4GCldsD4cgcXAX9PsWN62W9z/LmbyZ8
X-Gm-Gg: ASbGnctfZY3No8V9LWcIciH4r3TOO2xwiih0CaH3vvHQKh3F1g2plqjFy1FKeSyKwnp
	Mk+grz/17YLaGbuZEMRC8KG7MOBoN671iaWLZU2wKkhbmAAsSUykb70ycWWc/nluqCfwdykI3Mp
	EI9ygRzTVPo2kiDZaRBVXmeMOfCpD31I2+qD9uBv6nMhqcN1SJq1jIwbF4RiYrFpp5Sx32We3aD
	kbvSIFqMBRhmFLRUwePMr3SdWVbCCoAULrlWcEWs4Q65ga6Vwkpu+Qxj4UGdxJrMs9kEsHZYl4/
	y6pE3dBs+kBMrWsh0hD41IDcdNN7u2q10Qe+VkogRg94KWDwEmF64EQ6lGcya21izdnEt4dZg+s
	4oFqwDqQ0jxyX4d8CrWj46jVK
X-Google-Smtp-Source: AGHT+IHDaR2B6+TaMzPfXPeT2I5mxAhlNKLivE3KpcZfWv/bEk2Ud+xMoqC6mfjgH7myibzOynu3Cw==
X-Received: by 2002:a05:6122:1ac9:b0:531:19ee:93ea with SMTP id 71dfb90a1353d-532ef208beamr4612246e0c.0.1750927206769;
        Thu, 26 Jun 2025 01:40:06 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab3a4558sm2225793e0c.44.2025.06.26.01.40.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:40:06 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87f2170921dso203503241.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:40:05 -0700 (PDT)
X-Received: by 2002:a05:6102:e0b:b0:4e5:a6ad:8fee with SMTP id
 ada2fe7eead31-4ecc76995e9mr5141786137.19.1750927205507; Thu, 26 Jun 2025
 01:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-5-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-5-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTUH7g8rsv+U7oRQi9Xxrg-_LWmBvAoV1XBa3BvrSA8g@mail.gmail.com>
X-Gm-Features: Ac12FXzMwLUwExJVMIRYYdFiU5SpZE69imPVWDF6nzBjPzIJC28SN5VooQ2k9_o
Message-ID: <CAMuHMdWTUH7g8rsv+U7oRQi9Xxrg-_LWmBvAoV1XBa3BvrSA8g@mail.gmail.com>
Subject: Re: [PATCH 4/4] m68k: mm: Convert pointer table macros to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses its pointer tables for page tables, so its macros should be
> using struct ptdesc, not struct page. This removes a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
