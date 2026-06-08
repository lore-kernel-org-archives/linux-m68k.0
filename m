Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC3397682
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jun 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910362; cv=none; b=KPW5h0uMLTv06GOAdEpiT3ZgXJbNqEfPRIY9yQsgOf9+RRvwGZxSUkC8srVynU7U71/c6/0YgoCsSEgztJMS9eGY8s8ZggboC7cBR9gvRtTmLz/tbzS+dI1tOAEnAnRmI7ytKyMLlTLc5ji70DOjXEJOfVFz5Lbg+jZxmJiRjHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910362; c=relaxed/simple;
	bh=BRDQ3F5ledF2CXW6IYeTG3bIaKZ34kU24/d1mkNAqu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+u6hRzor51X3DeZJ3jxDlJpNB55B4soQbuGD6LSv+TLm3SYWNnW+N37ZFuBeD/ac6Pfsk5cUUfeU2Pnh9UZjvjIiMqYo+Q7O+kQadoBwNXHuJE/NZhRB4UB1ICAmFsqOlJ2Ib1FYMrHP/reNgQqX37e2gk2uPUHI2PS4RMLU1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2917990e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jun 2026 02:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910360; x=1781515160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3/GPurzSgREjv7B1h0G4rsK4s4elD3UIKqyELuO3Yg=;
        b=ou9igxMzSSWqiuBCQgRDIeWU20Uq+0uQWkSAcjKd/LXH6tnJf1i/9WRvsDOSdAr8kB
         l6EaaQpheqfeuIJ6muaj6jqgX1cqHRHj+pOC+XA+mUgR6O6IvkiUEXLzyZRdlbalLRPL
         v/hbdsyBw3RZnetV/77V5KZEDCnxftKg/T5o22ErJEZuQMugcdYHxygzPVSzWRwtiIFm
         1wK+UvkVFC7ucbTl3bAKDttd0WCUVG0QYoC6XonVm4CUNW/KkEgzB81sRF2zvVt4MH/l
         CehIRmVxgCgvQkcw9RNEkesZZiU5fJXl1Gp9lcV6pmNfLIcX46x7eABeyn0xzuwuaUS1
         vYng==
X-Forwarded-Encrypted: i=1; AFNElJ/YtWd6ZgZLw+PYx98W+5Qu8Z+eMMPJ0bjkCirnvePFgsTZGU7LJC0LzJAlVf+NUM5BB/AkAch9xAmg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw2DgNpylMDe7ubYeKjjg9OrttWduULQgL8CfUaz61cNAKTgYvn
	kCLUXR6X360lId68rrpxRBFDXtJyh5e1PT8rngYeB3dSau+ycnvhGqXYU8nqRJNl
X-Gm-Gg: Acq92OF8ckD+AftFWXIWVE4BpFKEBGKU9UbgFK6FWqfcJ6IthXOChZtBsz7HeyM/BMN
	1ofytGWue2i6QR8ClnyRLAXXGApOCop4rZKX5NVMkGuoZbAypXgnvVSsZ2hYnMlobj41OG1k21+
	hyLkpBJfNG1Pec0eTd4I3Q5WlUCNW9awzRtxqvluEXooqZD/4UXb0CRNOYimFG9dhmIXTwhtIvp
	XHRCgXzIWYwO5wj1yjzTAauImiG1MgbTSbRVmXXqjiLOrD/HYM4W7MVcv6YHhbP+L3RqqlPfwJB
	ubTljRYUX5ADyo85SrGef/c9LW8iV0QJcFy+fWan6B+F+qfcp+FGohbcNQw6PoO5wpNfQr5cz1T
	JBQ/Gq7LcXNB6w0gPSzQgVbrQ8VjAG32GUQo1WDRIwB8bj978PA8kPOTrgX9HbW4ge/gpIQ3ii6
	i+8CK/6EgDkBEEVn0KCdtlC3mcBUFIkYgYu+I3UFfTcz2OE6ErGQG618ekX9R2FSBGRcP6sCpoS
	eA=
X-Received: by 2002:a05:6122:2894:b0:578:9e26:e439 with SMTP id 71dfb90a1353d-5ac5291a56cmr6831415e0c.10.1780910360234;
        Mon, 08 Jun 2026 02:19:20 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6413983sm13472595e0c.1.2026.06.08.02.19.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:19:19 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59d07df448bso3275675e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jun 2026 02:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8VndoW9PHv/Qmb96ti9t3wM4VseqOJkbYnGVPTAsbo8o7KpbCDyVXs8VPVypL7scamPp1yTIS2AwSC@lists.linux-m68k.org
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id
 ada2fe7eead31-6fefa60c038mr6930295137.21.1780910359364; Mon, 08 Jun 2026
 02:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
 <CAFr9PXn35O=iVKauEAJpj-O7-wytx=eQqyXUexQdu-1gRuwi6Q@mail.gmail.com>
In-Reply-To: <CAFr9PXn35O=iVKauEAJpj-O7-wytx=eQqyXUexQdu-1gRuwi6Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jun 2026 11:19:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3JZBfgKtW149yEYmxVUdcuuuEBppjsneVH+cPGUYuUA@mail.gmail.com>
X-Gm-Features: AVVi8Ce2ltyHlig4JV6VlQsLWFY5LzV1P6zS3A6sqT-teKo8EQkypX9Wf6v2pCU
Message-ID: <CAMuHMdU3JZBfgKtW149yEYmxVUdcuuuEBppjsneVH+cPGUYuUA@mail.gmail.com>
Subject: Re: [PATCH] m68k: hash: Use lower_16_bits() helper
To: Daniel Palmer <daniel@0x0f.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 10:58, Daniel Palmer <daniel@0x0f.com> wrote:
> On Thu, 4 Jun 2026 at 17:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > No change in generated code.

> Tested-by: Daniel Palmer <daniel@thingy.jp>

Thanks, queued in the m68k tree for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
