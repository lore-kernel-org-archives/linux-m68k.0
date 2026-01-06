Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68032E151
	for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jan 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704186; cv=none; b=Qfq4XCcofTxe+A40UekgtZ8a+ibZ+GpZHtqNev4qm1llJuAeG6Lx+SnIjhUjBKvU4ERmXzTzWyjIDCa7n5CTEaqfVww5ewAGq3etBav3/746y0CeKQ4SvHL6Fyz3rAzmGD+ucic12X08RRMOnkuNgYnodYuEX6Vj/3mPDzhch2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704186; c=relaxed/simple;
	bh=a6QY7v3K7LjddIGzyyZ7ya0cKsRU0fqtaAJcXUSvpLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtdJat6WfD/2hS/yY3tDfjHmw4qNtE5E7nPieN7eofStxw4xR85uKj7rnlF7ezQbQsdHOHZ1bPdLImxOFa0NSG47XxAczgVP3VKc6LFBJtwEZUoNWCLz5j8cRs9V/ZKsBzCNXTHAQFUJG8Nfp3FcCLm0Ikq/G1jqiywNll9WTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=NIQzh2I3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="NIQzh2I3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso858130a91.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jan 2026 04:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767704184; x=1768308984; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6QY7v3K7LjddIGzyyZ7ya0cKsRU0fqtaAJcXUSvpLo=;
        b=NIQzh2I3+7ASO4BFyyvOFg3aKjn1Oyq/v1tsPEuxAJN394wV5Gp5MBndu7jWeHujx3
         se0UdUICNRpl/+843ci5dA2Cm60KlEyg0I2Bdd4BUCe6IMrCE3U6l5zu8D2PGdNNS2Ru
         +gR9YmIlWiwvtlbyxtK9YNR2QmNDnldWZ4KbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704184; x=1768308984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6QY7v3K7LjddIGzyyZ7ya0cKsRU0fqtaAJcXUSvpLo=;
        b=fR08KpAR/wvE7ikcY7sGmLWWEY9zLNNI5yjtVa03BDJ3FoGy8V1rqiFf6AtryUaJw9
         tY9wEeT0r+e7y38keVTk/F3Mj3yGV3SlfgusCT7HMyXwZOD1qyjNhJ3xgBY9MXzjNpFK
         wBrpOdf0L+Nch4it8o9JjcECuGIfKPXqeGFE6PWzSzfgHkQ3JcHtBO6yVWcB1uGXpOnE
         5RuEVdQa57gyR/Lc9zJpoMq3CgkzcAy6cstYTiXLRxcUGlyXP43Ysowcce0VLIMC1OtA
         5HXUlqYORu9i9ktmsCto9fF0uLlQ4Urr7AVNGvhV2XbwU0o6+XRjz6zOPwLXv4RkNIG0
         tQhg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Wr8S/4K0f4HPJCTaXOjQU4X0zElCOG6kVSnixcuBCKFj0+jCanT6F3tXCkrOJKsm06ZnWIoEYvVH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwNulMpIDKYi8E4yrjRuXEejcdO1A1bD/SuGcBibHLTYp64PWrf
	lUmXcjZ4KQcr7znk7dX36vbajMZnD2uymVBDQcRyuGWwJPaeECOcBrPWyy3U3kEI/oIlX9cJjQo
	+qSJ5BDgAGDtaXezW0okXVWYKCTHLLejgQ5gKq5udNg==
X-Gm-Gg: AY/fxX7d+tqk0n/Qs6FPjM+MLJ/yXtLHkISDl6xYOW6p8uw9BWpCw1YxWgHK8nhNUkV
	E9EqRjSAVK+x9/5nNl0J5brvQaXyNV6IC0m1JVVLXsqCSuvA2lUN2BOnsH4U3uvyOGuhoJrm8iN
	TsnAwiCjsAdTPiubVV6Z851mf5BUAKmnejpeldtiwX8rK/Y/2icH6/zJQuulGj1fxNLZaXnY1Y4
	ky3VLiLP1uCUlABEEkT90sCAI2lvBOvM87xssMTEj2TEOCBHfABlA9aHSJzUPlzVtTLlBUeAylq
	RrIEZ/U=
X-Google-Smtp-Source: AGHT+IHnONGJjk+cAuGQ/Uc3C9K5oE87B+HOi6y2Nb+5V2EGCNfaEvbJpioISHK4gDmLBHgSsc6t8cW7NhLgahAIJWI=
X-Received: by 2002:a17:90b:3e83:b0:341:315:f4ed with SMTP id
 98e67ed59e1d1-34f5f280f61mr2131814a91.10.1767704183640; Tue, 06 Jan 2026
 04:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org> <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
In-Reply-To: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 6 Jan 2026 21:56:11 +0900
X-Gm-Features: AQt7F2oqCzC4ATldD0uEPXW8K0e3G46S_P8BzIk8JoOxtgGMBUB2Uvx42XKGtbU
Message-ID: <CAFr9PX=hc31at7uHrZ3qcqtTd=B+726WZyxMz+7j1bAJ1vokhQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Helge Deller <deller@gmx.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jan 2026 at 20:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> E.g. an m68k multi-platform kernel including Mac support will scare
> non-Mac users into thinking their machine was assimilated by the
> Apple Empire...
>

This is actually how I tell if my Amiga or Mac is currently connected
to my monitor... Amiga has the normal tux, Mac has the tux inside of a
monitor.
