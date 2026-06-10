Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F803876BD
	for <linux-m68k@vger.kernel.org>; Wed, 10 Jun 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075160; cv=none; b=b971r0seJxndjAdte+XPHE8mM7LiyGW21wMItwj/CidMMWoU+2HFldnttRz/XdZMzbGRxENrFIfFai8yLRqimmGnYUiPgznYzSM+hLzXBu5lXYbMWEFsjhxqukJ6e6qq+e1cpi3YQPuduVb7stSPTU0QQV699MtI/NRyXQSxaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075160; c=relaxed/simple;
	bh=aC6gxO6DF4Un+4vCRFV56ypuj0LB02pxjNs+XFWH4DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6C2Ys/DDGyyVxPiXOGkIGhu4Xz6FPiLTCY7Ah3QIXOCsExQCSxKCBOEkNIVdobSdsL6bfN0ScK0eOc1P+heIQjDn3hQm7UVRjm5P7tbMdXKirMKHW5yTErnMuBuxFJpmHcS5TTN0sVZtzDZr5iT44SK8vZsDSCN7KNhW9Ps7n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6c3099b11a9so2523576137.2
        for <linux-m68k@vger.kernel.org>; Wed, 10 Jun 2026 00:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075156; x=1781679956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C4uouLzzta8jybomfiYLS+MSW3qkR3oc9h/bVVgdK0=;
        b=m0K0AFZAbDYlJU+LGsu9Fi8HyykBUTISxtYj7ZtL571wULNqjGkObIvjc0yTteb/hw
         UqUYXRjOjklYs4mBZeX8miftRxtaiYuNB6x8QKl3uIvwvhc36TLD61FUeXBI1kdmT9nq
         Zs3lmQg0wX9Fkm9zEzXWOWebvpNDzlZ6xEp9K2L94F2zz20feSWJEcoxjrZP3GhKoCBb
         U5CUepuf8XQDZsv+oGvPnGkQDXtufpMIA8LtyRrTLqVkEaQ05ed5YrSagsZlqMRXhDnM
         uaDmrQ7LacfvepZDmq6I6e9s8pEJ1i/IeKyI/LkI++alqgymlk+o8QhASyfxNgWkjc/D
         OKug==
X-Gm-Message-State: AOJu0YwocQitgiCYDmjtlcSeJJ7I7Rmuu4JTnJ3M14cyTUCSJ/aPullf
	o41j0SKtwu44o00KtLicJRInskQsnotkuz5Wp9s1sUTR08WMUJ8RnFM80OGP6v57Qd8=
X-Gm-Gg: Acq92OFZcEdkmc3sNIG+oCIi8j1/8YR/tVTaIqKQxMNii9tCnNCDNbFX6X0d8c/hM4Y
	Vn/WnG6rSHfLj4kwRFal/zH1yuVEaMBJoGKM+iRVtWBGnhE/NuxzE1EeVhHllpw09AMPDlDOuyi
	cN5Zlsv/LtYtsE0bY/VdDnrgkeg0OizHTkyCdPNhphBgRpGIka6lUjiJMmEXfer4ixkEQ8/LNJR
	GiHSoDbgINQGZVH3CZPxvmJtTmzR1oLTsZ2ZVPty0FS4zerD9zHYBSp81crPWlMKL4LyAiziiut
	5ZTxDiwFFC82OLxCC61t2hnOjjrg54hpm38j44J5vU9u3SWnnt75WlEMIWAs6WovMne7Zbc5f0T
	RcfmMiwum1EUr5unGx0XIjze0Eg9v2I1kPF3Ap9zG5VzxYSTZRilSndLJR0TasjytSEKvWoqNlK
	XzN+1RYhSXPKu7bn/rxwF0VsDDgZfDLKlft+SA6a0vgwWaMyloOn5awNYo2Fko6juVXN2nETfbE
	j+uoyvcNHM+uQ==
X-Received: by 2002:a05:6102:3e21:b0:632:5628:6d8e with SMTP id ada2fe7eead31-6fefe3c38bbmr11781390137.21.1781075156091;
        Wed, 10 Jun 2026 00:05:56 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5745d325sm19261168137.4.2026.06.10.00.05.54
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:05:55 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so2129236e0c.0
        for <linux-m68k@vger.kernel.org>; Wed, 10 Jun 2026 00:05:54 -0700 (PDT)
X-Received: by 2002:a05:6123:10b:b0:59b:1012:3f42 with SMTP id
 71dfb90a1353d-5ac4ff2b341mr10944696e0c.10.1781075154405; Wed, 10 Jun 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609201211.173438-1-enelsonmoore@gmail.com>
In-Reply-To: <20260609201211.173438-1-enelsonmoore@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jun 2026 09:05:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVBAH89ACn-VDOO3Do2tNn16QdGSeQk=-esHn0CEnkFQ@mail.gmail.com>
X-Gm-Features: AVVi8CdNk8PJpsBc6-ipH7V3ntVTbDh16NQQLyrREWfkwZsIAfBSwkoD84Ykv_I
Message-ID: <CAMuHMdUVBAH89ACn-VDOO3Do2tNn16QdGSeQk=-esHn0CEnkFQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: correct CONFIG_MVME16x macro name in #endif comment
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 22:12, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
> A comment in arch/m68k/kernel/head.S incorrectly refers to
> CONFIG_MVME162 and CONFIG_MVME167 instead of CONFIG_MVME16x. Correct it.
>
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
