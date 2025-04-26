Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402124120B
	for <linux-m68k@vger.kernel.org>; Sat, 26 Apr 2025 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672808; cv=none; b=nDu2/yW5JJP5FoijyoLulHgncgCD+P7DiSgZOMZKm4wpqXRQ7ZZRqYPGK+Zig5p56RZZ1ZC3aPZuk4uaMA20jcdAAR0ONbgiAr59zKSjv0wG006gtit5yqkYz8GGBSocsz+KA/hcWYMNzvx8YIuEVypBURs/0v0yVr9JSCEzmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672808; c=relaxed/simple;
	bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/y7ZXCSix7OoVf/LdsG5D/mFqx1rC7xECPQ10p5c+97HiRRz8oiI8SfLz/2x35wZ3q4CeqjjOVc/Rnrf5R5jbzr2AIq4eacc0dhqT7I6pxPMlXWP/Us1FQIdWlOWX9863PI0GlnSYzJWFLjiX5ayUbveo5gZgh1ylyvVGfPL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=TYprgeyH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="TYprgeyH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4462520a91.3
        for <linux-m68k@vger.kernel.org>; Sat, 26 Apr 2025 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745672805; x=1746277605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
        b=TYprgeyH3paEbw6qhzg8c0Jzboi4BawbumudxfjxwlLEDL2EOdxRa/Seh0exY1zZc6
         MkTDw5IYq2C8I8+u61Hbs/2EvcNtV/QDzhGEP0fYNUXU4u3itr/W2mPUxHtwYLAttqlC
         i8rM3i/Q2ujIo/GTRx36or2tv17NXyLKqgojY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672805; x=1746277605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvMAVFm1NM3ffSnmd9auBChpROT6OsL8ga4FbcDoo8k=;
        b=lBwLy+pjix6ioSQ16a5OFnG3tYu9HVkB0Va/bszcxBBGA41RCh9EygOS8HfeqonL7+
         fVeC7UT1tIBB+Qusc7sPqYu2169S1KjEw0K+mGlvoOK6fZglvD3Za42b6RHlkZXlb2ar
         7O/97mkk+TVJ/T3XDuff1QseaSbI5B9HfV5iZIUema5Y/TAMpYrCz1v3dnC4bZsxMiSZ
         rEMIKrXqDcQL77WYRF45msRkwLS+jrTEWmbyL043o0JmFZkLLBuzSw2gcmDGeAixpEv3
         j1Lhr7CZp5e5QJT8z2twJfMm0SWiisrYKQagIe5OCGbEAc5nJvKUXdGeT3q9Lg00miFg
         SQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrG+j5H4cDQIs9fntEnjI6U/gkvlJ5mqERiyZZVWKIAyGNvzyAZBGzME4UFl3cFwhdVH86p1zLwPjM@vger.kernel.org
X-Gm-Message-State: AOJu0YxRy+FkF+C6fenSZ/xbL+wmD3se/IzyeA6s/N6nqCWUNc0Tzltz
	89gvGNAW88sFQwx6NtrMKTWXBgQb6GtfU3PyaKaUZQovBQTSVQldHuaRcF4eHlwGXWIf2iuCVtl
	1VG46j3/6dgGWsLhHf7tKvwVBr3xWINnnqxYba20pK2F7x5dW/k0=
X-Gm-Gg: ASbGnct64kHx7iMedPPLvwY9aDCOzNfmr7IzoAnCTLtNAy6UjBHlRs52O++dqzqef9f
	QmXdoRtXkBJ2wz75vqUZwRQLhKsOwc5n8hjI0OgWCsGOJ+gdXbf2KECbBchA7GypqJa5QxV2mBv
	vhoLQZzNEdwczzNvp/UPXvpVie2VShH7n7+UiMorv7AXw8XqoR9G1kqZuz
X-Google-Smtp-Source: AGHT+IGEnPlNRu9+3F9xFzOQGqys7rsSoXQK/5LuIDKUDuUshdzQ/sBW67JMAT5qemipeJFWaK/XnOBrmNWIm8Ruqgg=
X-Received: by 2002:a17:90b:2245:b0:2fa:17dd:6afa with SMTP id
 98e67ed59e1d1-309f7e00979mr9790877a91.17.1745672805377; Sat, 26 Apr 2025
 06:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426041212.4141152-1-daniel@0x0f.com> <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com> <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
In-Reply-To: <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 26 Apr 2025 22:06:34 +0900
X-Gm-Features: ATxdqUGsmFXy4Vf-bYG9vLpgPLSGMqnnCiDCkFUKc0t8rFEC8v7yMRUEnllwNtk
Message-ID: <CAFr9PXk5ycoZYce1eBOUBvnP_m7swPLT-giHDQSXaa4ywe7mZg@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Greg Ungerer <gerg@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, linux@weissschuh.net, linux-m68k@vger.kernel.org, 
	geert@linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sat, 26 Apr 2025 at 21:38, Greg Ungerer <gerg@kernel.org> wrote:
> > I need to test actually building and running something for nommu but I
> > will do that later today.
> > Making nommu test automatically might be a bit difficult though as I
> > think it only really works with some changes I have to linux and QEMU.
>
> It works out-of-the-box for m68k qemu and a mainline kernel configured
> for m5208evb_defconfig - when using the qemu "mcf5208evb" machine.
> That is a nommu m68k/coldfire variant.

Ok, I didn't realise there was any working nommu machine in mainline QEMU.
Does direct kernel booting with a ramdisk work there? The tests for
nolibc require that.
Either way, I'll it out tomorrow.

Thanks,

Daniel
