Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E62EBDE9
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jan 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943714; cv=none; b=opehfLT0hp0yCDKCYuElEDi2xDXUavW9o/fFXSBDQcGgavNK5OS0sNYJG3QdedgrwEh8Va2vRyDr+sWg+yQhecFQ5o+FQdg/UE7rZCX917gOFzjrfPLD6hHDrjxOzu+paLIt23Xhq0QrgXYWb4KLOGm9fl82xFA73fFnu5H+KzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943714; c=relaxed/simple;
	bh=z4zdMgkF80Daz5JaXcAIXXKM0qk/WNZUzdY7NnN+H2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eW2DOamMRzY+NPGhSCV9QhDe7u6qbK62rJnyElHJdOiVfiqafPjIzrkqWckTG77+z0uv4AO+LIKsozvOWdxWqyPY4ML1eueDKazMezrQ/KRehGLnCqRlWT0HEopWYw+cuWbyL+RuEfyVJoYAlatG3Td8gFOXJz4YKORDenS7m60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Bew1D6qZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Bew1D6qZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c565c3673so1343538a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jan 2026 23:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767943712; x=1768548512; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z4zdMgkF80Daz5JaXcAIXXKM0qk/WNZUzdY7NnN+H2A=;
        b=Bew1D6qZbDzXuSPcp4R+fm/h2wcXNFPWQ82APs8m+HbZbAvgI2hLgLTVOz36NvrG6l
         oTyGsuhgh/kmP+PwdyUfhIdQ5n1EiMM/cFh4/hODoR9woacn9tpzM+O+vIDSKUEevvaX
         j92/DKgX34KGrrtKJiEuPCQvgp56FBHYmZ0yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943712; x=1768548512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4zdMgkF80Daz5JaXcAIXXKM0qk/WNZUzdY7NnN+H2A=;
        b=OwexEhLE8E5NstmY6ymzAdwcH+OZik2mNWWr5Wn9idJa9XAygeKihHKOCen9t9bYm0
         hXqg7pZt4rHJgitCedQr/X1n7hMnGpEUZhNZGBu3dDYJCYKMrxZipZDW24YcYqv36k86
         VWy90p0lrCazbSDKcdoJBhkj/yocGPPdHshb4L6j/LNpfnisxTti45ttF6Wn09CX52s4
         SmtUAurFKku0S8tkLi5s7l+G0NkQ7AwSg38BU2hNHYz4fWxoA01BohIsmA1YrB/yKe18
         PX6FNeTucWs31UV0hoxVCJaufty4pp2+mXV5pkE5Vf8by+7hiwbwKXtvNxA6BYoRiX7D
         Qyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWWP1Y0mRvbaAmg8De2gXcKGtnxJNXet2oYw77Q6O/Yc8i9v/lSVK6e+yXik/4d81B//mFnokgx+74T@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxfgga2QKRsZnmM9HeGuQXQzAA3xAeHibq4+wLJPmGDZGppPsvY
	jpgxrmaivLL0rzAIsHD1jDNBTUYZiAtsWhv6gz+Wm7TB3OGstCXYYB6elv7dN2XD2F55vclyY2F
	s5mnV0QGXa6S+LPEmTlONT6pIIa2oi1z4FALFpDl3SA==
X-Gm-Gg: AY/fxX4tIdPvgElFyOYUOtaIL198vUHUKwR7klGfgnWxwLGT/6XWzgNSBzwzxwuW9Sm
	2M/rLT9D3BrRw4akMn2Ixhw9XNmUo5s2nSf6YKr/qUd/rrv+SbdCbB7IkRow3kX7M68z061aw8x
	Uhk2jH/KttWz0zM8y+5z3ogTmvvplOOImCcvTneUYnsiDgHOeIjoa8dUO6U+Jrd8nu6eKoifDTR
	kNJNjmkKOhbiB0PTsZMHE8rvHPJL8y+6tzEURQ7ZTQqgSHfCI44MYxgWrJ1BNTe2amlidgsYouq
	MLax1UY=
X-Google-Smtp-Source: AGHT+IGhY024567WzIfV7SQyZniYkmhCoMDXSKq8EUCc6rVKifO3Af8TaSrLk2X1FvkcDFG9K8f9sjPRQu55hlxX9Jc=
X-Received: by 2002:a17:90b:4c0c:b0:34a:be93:72ee with SMTP id
 98e67ed59e1d1-34f68b64e1fmr8314764a91.8.1767943712031; Thu, 08 Jan 2026
 23:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org> <20260108-custom-logo-v3-6-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-6-5a7aada7a6d4@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 9 Jan 2026 16:28:21 +0900
X-Gm-Features: AQt7F2qucaTCcxw87Ptbiuf4h1j-D8sMO9Oi1oo6s6YL0yzRkC93FMC01A59Z3s
Message-ID: <CAFr9PXkbkxKzT=p7xrz3Ti9+1S5B=qfNanw31hs9rbNuOZb=jA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] video/logo: remove logo_mac_clut224
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Fri, 9 Jan 2026 at 04:08, Vincent Mailhol <mailhol@kernel.org> wrote:
> Considering that the logo_mac_clut224 is only used by the Macintosh
> 68k, a machine whose sales ended some thirty years ago and which thus
> represents a very small user base

I guess I'm one of the few people that has actually seen that logo on
real hardware in a long time...
This change seems fine to me.

Bit off-topic but despite the 68k mac not being sold for 30 years
there is still a very active following around it.
This year might be the year of a 100MHz 68060 powered classic mac[0].

0 - https://68kmla.org/bb/threads/new-project-prodigy-040-060-card.51381/
