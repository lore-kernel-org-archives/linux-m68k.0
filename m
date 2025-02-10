Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C361B87F3
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173397; cv=none; b=QGy19QI5RY75mzqcYVfIpgl98o0zCcIZzs3ltzPLoaw/ZAScH4gG3rRtDHSH+4RjDDLJhfG5WROFe9ga2QJs0H/FOegCktH4u1iTL8NLWHRZYxzzeXFnE+t/B/uJth4ilO/iLSOhcB07mgkOtccXnuayG7dJlJMM9y8sx6GLsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173397; c=relaxed/simple;
	bh=CwIlx4OEEN9ZRtZ1QafElHuN1i+vBGr8+n1N88C+kBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO4Q5qYe5c6ovYEiofsHNkDIgH3YxHMV659lNB3lO5JvRPpQIUgRwj3La278dnFvh8u0lr2YBVfnJcibuXXPSx2xVVS/zYsf0xgZBgLKPGlWB+nytB3ws1IrbC5/nzsJdK/rne8Tj2wTE27Nb8Cjzj33nXbt25D6Jtd9MfuUJiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so911894241.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Feb 2025 23:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173390; x=1739778190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1HAXrO7siUncPkj5ofDqgDnxHSc+KQ8zsK7WabjOVA=;
        b=Qyptq4gp6O8T51OmNe8HOrTyA+0qmirl5P1kXg5p5lGfe3SIMNT45jhtyUh6SrhhWo
         xPCfuAhDK/5i+DdYiGGxihZrJOyybEssjagBMhB+iUEN4f6e1qcy+wVfMIIzfaMDA9xt
         ClJzZ+Z6SySH2lPZ9mRJV1/z50JPUwH6K09KrpDwvRyLJQ9gsq99khjWjvyNSDbg7cj2
         X01rJmtE2JsGW+mFswdGIput6HeNMibLV/Drj5m+VJR6rKPaL2vpdsxhwaBg+seQ9VG3
         jVf/F7iaahCkbz1El3OTo91/01bXuMbJEeF1BakcZrWSylNRs6Sk0oMMpcAz5ioR+1Ta
         hBog==
X-Forwarded-Encrypted: i=1; AJvYcCXPNJaej5AZFNIAIKmqIPuzr1TMXYBQEmyQMhFj19Izz14/SYvVvrsGg1RgfuSxww4Npq1QYSrRxJ4Q@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyfzfLhBavY1aGOokjjhSZFSlkscSyz1wGpJYqn7fqGVhI6xNTu
	j0I6dufrk0kAmQBNrHoko7T5y7GaujJrR90RAeDDkVbyeIZM1vtBlUnxgbQv
X-Gm-Gg: ASbGnctQDAR08dqDtiwb+3rPgGZOs+u6rge/7CvX+YDKIEu+jzT/BgLAWUxEcTJxpkE
	twVUMRWtMTkhjs1e78xNV+jUb5WvCweBwwFYSJ4vLH47wkIWGlvoxkUl1wbNiisN5eRoezrttfs
	F96NCxMvH+xPJ7gmoIfQTTZxZKSsTtee1FcGnvS2TDo7SyB6mBXDRVovA+qKv26la4gVwpfqHpB
	SP3n51qIbJbZ3e+73rgmy14d0zWqDCtayVoVN34FsiAbIZoQdjLyMQfwoS2L3UaASWfjd+6+D3K
	+tinyyCOQpQfPAIz3MLeddRCAMCFZ+Ohd8S6QuuXaxk2shVsKL/FTQ==
X-Google-Smtp-Source: AGHT+IGkXr6IHXY+EY9FlzSP+AECr+8qYEzor4jvYmImxL1Rh9ZaKzNEonj9Wb+Ww12cuJrIn0w8LA==
X-Received: by 2002:a05:6102:3b0a:b0:4bb:becc:c7c7 with SMTP id ada2fe7eead31-4bbbecccbbamr1555546137.15.1739173390336;
        Sun, 09 Feb 2025 23:43:10 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbcf5660c0sm227218137.18.2025.02.09.23.43.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:43:09 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ba7ab22192so1147626137.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Feb 2025 23:43:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzG6J1/G8Y3ibD65x/opc8HxyQwsR8nsNbVg46GV54uDoWvgOVo5KG+y0vGdbMmu20HBOaw3eUD/od@lists.linux-m68k.org
X-Received: by 2002:a05:6102:c54:b0:4bb:c24b:b623 with SMTP id
 ada2fe7eead31-4bbc24bc2e1mr2033659137.19.1739173388892; Sun, 09 Feb 2025
 23:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <20250207-bitmap-kunit-convert-v1-2-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-2-c520675343b6@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 08:42:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ5vbhWsJgsGUny=9b4p0cvML+GkLJ=BmWnG9Q6FE78A@mail.gmail.com>
X-Gm-Features: AWEUYZkkTrEuq6WMVMpODBTYSjpUaxRBgiMamGpu9Ed_-WnWv5jDfkFeFpfmlCY
Message-ID: <CAMuHMdXQ5vbhWsJgsGUny=9b4p0cvML+GkLJ=BmWnG9Q6FE78A@mail.gmail.com>
Subject: Re: [PATCH 2/3] bitmap: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 21:14, Tamir Duberstein <tamird@gmail.com> wrote:
> Convert the bitmap() self-test to a KUnit test.
>
> In the interest of keeping the patch reasonably-sized this doesn't
> refactor the tests into proper parameterized tests - it's all one big
> test case.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

>  arch/m68k/configs/amiga_defconfig     |   1 -
>  arch/m68k/configs/apollo_defconfig    |   1 -
>  arch/m68k/configs/atari_defconfig     |   1 -
>  arch/m68k/configs/bvme6000_defconfig  |   1 -
>  arch/m68k/configs/hp300_defconfig     |   1 -
>  arch/m68k/configs/mac_defconfig       |   1 -
>  arch/m68k/configs/multi_defconfig     |   1 -
>  arch/m68k/configs/mvme147_defconfig   |   1 -
>  arch/m68k/configs/mvme16x_defconfig   |   1 -
>  arch/m68k/configs/q40_defconfig       |   1 -
>  arch/m68k/configs/sun3_defconfig      |   1 -
>  arch/m68k/configs/sun3x_defconfig     |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
