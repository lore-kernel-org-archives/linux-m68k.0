Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399172EB5CD
	for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jan 2026 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948023; cv=none; b=WyxJszsFoCNtNGCxRTdEtWO+cdZgNlfrG6LMvgInjLqc3KQnD7YFOVCOtuWtHtTu/7UfNwaaIKwpQ9ipf5NShjsvJq8I/ggTCf69VEl5inyWoYFJ5f+u/OKqTvGf0hNOyL4psNKHBFyAcD4sTTCuZWoutvuKaQXjVrgpSPRKy1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948023; c=relaxed/simple;
	bh=4aCwjP/3aetiY+Pdvnezx+dDqcFJcvkgbunGRgECQRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWhBlFaxxrml9pDLaepye5Hlwpgrrpjb/AFJPjl2L/ld9SgU58/HixcU77RvleAmjYkGsSI6wtE0d/KY4Ffz9AWxzBQhag8hGBEi+oRUacMQnZOFxROLFjEUHMkWh2RGVHy/9FAvli77GsLhFSIDrA5gIX0xYPtATtC7OhC/G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea31b5c48so888949137.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jan 2026 00:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948021; x=1768552821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuAsW8sPlBb3HXHQgJVVkI+Y7zt+NEPceHiguDOxVbc=;
        b=mprYrFv0JSAG9bZQWyErNmgNlljcqPo4oIXejP31QswaGV+0fg0675gVEqYzBAdIMB
         3R8pnF5TPInLtFc433KJF27GpugfTIA8ym7/XjNz166H4gTp7sJLchMaN/xi1Wkv6BJW
         ux+8r70oPAVN2eMVZv64Ls13iUWPKV+AnI89zID80Zisw5Gmam7pPo+VckfqVNDiI5ax
         6FoucCTS3itOfa+Z9mXMIt/RZVYlkc5mwzNI0sLyhUNgzdl0V3E3NCff+NaN1FGPcGlj
         Uc7sVtULXPgAvkpLdCL/Hh/A7sHkswXr+wPtwByQFlK9/TD7ALS9bcJQjiADq7xdCNE4
         8b1A==
X-Forwarded-Encrypted: i=1; AJvYcCVXUu6booB7CihAEuq8QUgiTq43eqWwVEGUI5OkZsvSZ9S+iUT20GTWGtyZhrJG4i5j7D4RwLCvnvU5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzFd1EbT5FYyKVPExIFR6KRrRrv8LmnN7xuDS3ihxB1/2SWUnF8
	TNBDgL4CjHZ/W3mbySCCWwLvCN253mj2g8TxnIfPj5TsrIESFggfKBOrfRV5VAmM
X-Gm-Gg: AY/fxX7vH4b/JUTaLrRJwKSF2nzdN9CeVGzSkWxYldvmXkA/k/SjkIY3tcwdlb4C1gL
	D5/2axt+r6AfJsN7zEFHbJxu5+GJfl4Ikq24utpYHRU1XhuUcgrH1VUF0px9HF1FB84prjkjQGe
	Hk9Rg9vLlfLnFuPSJKQFbJZ5oQj7pcy+jyp4xxb0XPqKRYnb1O/v+BR8rFWYzNUirA0u2WEm/i1
	iRwCV8lvqpAuDRtVYU4u3XwnVsYuzDabAOQ3bXPnGUu11MaOHU5tDAValskKcSSIEwxs8WK5P2S
	XeUIM8q1A3doSEOaFj118cfv4fQmY9CVIcROyu4SpnDr588pNzSdPKRemANQcaRjcH0nalgATmr
	rVvyyzsAHKU+K52CjqG/sAxSYf5I5zfB2ZRbY1tFcFey8txdtZIJYST7vHXcVo2qVCzcj/EkLcE
	k3qV28LEqgyG5jF+CZMqqiicilGeduyIGa50S9cnZc8UwiKTz1SUNz
X-Google-Smtp-Source: AGHT+IEGZRYxv/bH25+4294UVOJMxfiUrDihxMqNUOCUZXgnexVIvfwsQefyVvsNERQOgZ5xWG8Ajw==
X-Received: by 2002:a67:e701:0:b0:5e8:1f33:bb1e with SMTP id ada2fe7eead31-5ecb6920ec4mr3823310137.38.1767948020937;
        Fri, 09 Jan 2026 00:40:20 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ecdaf1bab4sm7941555137.2.2026.01.09.00.40.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 00:40:20 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-563610de035so809631e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jan 2026 00:40:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWg5sb6kCHz8v8zkFThgGh5AP8Lz7HXu2lFN5juihKQXWR/EOU57qaUPD6WutOzxlyCg2HXbEExQMnP@lists.linux-m68k.org
X-Received: by 2002:a05:6122:2887:b0:55b:305b:51b4 with SMTP id
 71dfb90a1353d-56347ffbd4emr3088425e0c.17.1767948019706; Fri, 09 Jan 2026
 00:40:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org> <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-1-5a7aada7a6d4@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 09:40:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
X-Gm-Features: AZwV_QhxZ4-tEsGEnK584clI_hiMcF81rYfU7L-GCTH9ANG1oGbPxo_i7btpNjs
Message-ID: <CAMuHMdX04g+BfEuBt_0iCvmZiyCLp58d0QwnFtu3bM1Cv59TzQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] video/logo: remove orphan .pgm Makefile rule
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

On Thu, 8 Jan 2026 at 20:06, Vincent Mailhol <mailhol@kernel.org> wrote:
> The kernel has no actual grey-scale logos. And looking at the git
> history, it seems that there never was one (or maybe there was in the
> pre-git history? I did not check that far=E2=80=A6)
>
> Remove the Makefile rule for the .pgm grey scale images.
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

Thanks for your patch!

There newer were grey-scale logos. Linux also never supported
drawing them.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
