Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57F2E0909
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Sep 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822460; cv=none; b=s57zoMABwsArwzBSIvzEIBOqaTpW3ATix+/VshQyc9c7SpasyCI++LlezhfNgq/CNwr4aXyLnKE7kJ+YLwKIlOHhbRQTTTSN4z/ppKnfCcz9ixHcfKVKHXPfNU3Fd178V0rOSUojOqyJtGunGMv9g36ErhkqzxfmvXibl+Qa1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822460; c=relaxed/simple;
	bh=zqmHVRVfG5H2JdQZxR3TN93cPyGuhdQLjL2DVyfehZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWnuHLchPa/x1OmlJqUMnNf/J0tf+nWD/Isqiu6M34n8GdIVzYh9T+khctgklBQ2dHP0nioAIyy8+p1usCxItM2FjWrcGJE347p5KNByi5nBTWJwjqrY1EE5kM1g9KAk1hNFbpK/oJn8R+uNEhTK9L/qArL1yCY0ZeHbfNE6StA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52a8b815a8aso1526655137.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Sep 2025 07:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822456; x=1757427256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mgo2uDMTTEUtNqi1o/66IFpTB7qN2XeEQUc+iUdZ+rs=;
        b=m/fAd2CC+Hy2eXAnP6csyaxMHvvkPmTd8WGicnoGhKhchvT35zPM5btVoyQ+T1dkAh
         r6v7eyRgry5VEzYIx5XirpjvTyxsPqfmgryxPZgRrEmQJhsRY+EX9849UKCN/JqeuoCY
         BvAhMLTGVNyKhr042MpjPCY67FBjIb2S/3ic8StuPqmGQASE57S9jJhhL9mOzEGPAxiE
         l1u9NuICzxlFAEtvi37qpULb2UxAnsyFa8RoLyjuYRUK+9FWJRxnSKBWXpzZQhn3+Fht
         6rJ+13MTiHP44Pq1dT9lcJhWQ2bPm2gqAlVyUDv1452UAREmlzYG5q6QMg6R2NTiwwPL
         qh7g==
X-Forwarded-Encrypted: i=1; AJvYcCXYOPx2JULhhQR/isAFI56mixki9SFMu0/mSXAhGj0enGFZ7mg0ImSZ9Xs0HNi/FFbxoDNsP7fTKjaG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxg14NloWs7jiMEb36gbNLQZBbLmaX2SecRZc5ZBQWix7/eFOXl
	15p9f0pOoxWq1saLTHL6/MztVcg/KzJrSa6Fj3Q2EBzFNoDCIf684BTpOb0cO/zC
X-Gm-Gg: ASbGnctOYLjHMga1UJMmWPipD7JxvPML6tRhY8tYDAGmS74P1KxgeLUvxTgSMVc2K6f
	DSCIK9Y75vqGxmbClKmdsLzAD8jc3BTq/S8vkWeg4bPJFySjhK3MJ6thOYh5HbrI8kn8325hADX
	qWbXNg/0aY9xrTtj2V6QjN8yiI4+c+Z9nmFFYbZYQ9cyQgW/Aqd4dY241x52VzMUOa0PxurtnSg
	USfbaBcOQtzARsXgmfDFAwLBPYVYgtjL+m8YAJ+oU8GwrHw6CW5x2cVB8XVhEQvvrPoKllizCao
	2nLNRvpdjArTVaiDXzOPnMEw/Kq4IEJKodnt5zdp4tE3B+6B9OSMXtWRjWVp2dWDnP4qNZyl3n/
	13c7+39N6TTygWwL+nCKSx6VqcVx1qvI0Dyc6vvSeq26FTEGjETFF1/Ym4kjScqKENLJ3gUBUT9
	pR37GgJg==
X-Google-Smtp-Source: AGHT+IG+yNusu9Xubk0FpdO4YpnFxz7u9ZCMwf+itH5zgPwxd7nk+CxZkWZ97TRk+sh0AMrsV2sfXg==
X-Received: by 2002:a05:6102:2909:b0:4ec:c4f8:c4d3 with SMTP id ada2fe7eead31-52b1974a6b2mr3031577137.5.1756822455164;
        Tue, 02 Sep 2025 07:14:15 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-898364cdf79sm1473367241.1.2025.09.02.07.14.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 07:14:14 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8920ba68af5so1240371241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Sep 2025 07:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVsPfvMXlNMEZVJWAXFjBmgyJGEXMhpnf5x4NuU956sTM2+WS0Ixu2b6fxCQiILxl0+MemHNc6pGmz@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5710:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-52b1be3a542mr3788218137.25.1756822454173; Tue, 02 Sep 2025
 07:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
 <20250825032743.80641-1-ioworker0@gmail.com> <c8851682-25f1-f594-e30f-5b62e019d37b@linux-m68k.org>
 <96ae7afc-c882-4c3d-9dea-3e2ae2789caf@linux.dev> <5a44c60b-650a-1f8a-d5cb-abf9f0716817@linux-m68k.org>
 <4e7e7292-338d-4a57-84ec-ae7427f6ad7c@linux.dev> <d07778f8-8990-226b-5171-4a36e6e18f32@linux-m68k.org>
 <d95592ec-f51e-4d80-b633-7440b4e69944@linux.dev> <30a55f56-93c2-4408-b1a5-5574984fb45f@linux.dev>
 <4405ee5a-becc-7375-61a9-01304b3e0b20@linux-m68k.org> <cfb62b9d-9cbd-47dd-a894-3357027e2a50@linux.dev>
 <CAMuHMdV-AtPm-W-QUC1HixJ8Koy_HdESwCCOhRs3Q26=wjWwog@mail.gmail.com> <f6835c03-3c3f-40ee-8000-f53f49d2b4a4@linux.dev>
In-Reply-To: <f6835c03-3c3f-40ee-8000-f53f49d2b4a4@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 16:14:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWkkofG2M3zqxo6DmiZc7OJ8-2p+kJ1gxan0_nVFoiCA@mail.gmail.com>
X-Gm-Features: Ac12FXzoAJTS6asLcRAF7gXDrJv7Cp9NcWKCJrI8Ef4AzRDbSg57ifH0BPfyuUo
Message-ID: <CAMuHMdXWkkofG2M3zqxo6DmiZc7OJ8-2p+kJ1gxan0_nVFoiCA@mail.gmail.com>
Subject: Re: [PATCH] atomic: Specify natural alignment for atomic_t
To: Lance Yang <lance.yang@linux.dev>
Cc: Finn Thain <fthain@linux-m68k.org>, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, oak@helsinkinet.fi, 
	peterz@infradead.org, stable@vger.kernel.org, will@kernel.org, 
	Lance Yang <ioworker0@gmail.com>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Lance,

On Tue, 2 Sept 2025 at 15:31, Lance Yang <lance.yang@linux.dev> wrote:
> On 2025/9/1 16:45, Geert Uytterhoeven wrote:
> > On Thu, 28 Aug 2025 at 04:05, Lance Yang <lance.yang@linux.dev> wrote:
> >> This proves the problem can happen in practice (e.g., with packed structs),
> >> so we need to ignore the unaligned pointers on the architectures that don't
> >> trap for now.
> >
> > Putting locks inside a packed struct is definitely a Very Bad Idea
> > and a No Go.  Packed structs are meant to describe memory data and
>
> Right. That's definitely not how packed structs should be used ;)
>
> > MMIO register layouts, and must not contain control data for critical
> > sections.
>
> Unfortunately, this patten was found in an in-tree driver, as reported[1]
> by kernel test robot, and there might be other undiscovered instances ...
>
> [1]
> https://lore.kernel.org/oe-kbuild-all/202508240539.ARmC1Umu-lkp@intel.com

That one is completely bogus, and should be removed.
Currently it would crash on any platform that does not support
unaligned accesses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
