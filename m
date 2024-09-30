Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DD613DDB8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727719116; cv=none; b=sC+IT8xFC0KC+5s1mjfD5PQnlZbECnlP1j98WZPT4x3srkXa2jVrnQmSvnuIHbB3ZFfhOO4FSRBn6fi58RK3/sqis9Y/TSqHsmAfQCI75tNqxP2HIanEK47hIjMqqB/sXiye01K+IOssHvODCaY3iZNVKDzaQbI8Xbz2CN2q9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727719116; c=relaxed/simple;
	bh=TOOuuBttpBHTK/VFXkEJ6D++xCveU/rYxT8fYGWJb0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/UAmskO28C4SRH+9DgJF97swEMKa+rAT4mIJAqrkD7StCSzMEnTEV+9cmMKUessxV734/iPnyr2DAQW2nOlt5j0qhPnndE3tY7iTnzx2fDsCaGMqPd/61hhKNMWoP5FDRoLf3n9tf+1f+9Sz+gVIyZrqUloR5nTJhEn42hIvbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-710e14e2134so2592678a34.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727719113; x=1728323913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uPwxLcg5Bq74tqCqqhr1kbUuC1X8WKeLcVZP/gaR94=;
        b=dmAjJVHJUIzcJBAV1HFvmcqQbDBz9W+1uYA0CBlKWSSCceu34kHZJfVX7bnVlyNZfZ
         sDz8j1WEdgr38MfYw6IL3TfZcqIhz/fvmG8/8N+XVsdZpx6JTrf/0oizko7H04OfiBuk
         EeLiepqUSQYkVEgENOVCuJrPGLTbI10uHXr4/S5M/Ww0Du68jou4YWbTcWqRqreBIWla
         2Ce1HXsiPP7v2llFnZUs3nlgv50PI3VqbQnYsgBc0gJ44OKiMhWmdx6233ARmjZgM8X7
         wUvcoCHWlYu0FFnFn5kl63m4HqxZjLpoj2q3vkDXjjlQBnnZbHnl/xbE/lSXt7WIZRgA
         wwog==
X-Forwarded-Encrypted: i=1; AJvYcCV4sHdP5HkpAA2M0bKsoIaKHgK6JolNi8H6IDPvJybcUi/DbK0TBcGlSmkTzKiq0W8JqwQCcZGQ0d9i@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwRBETPdsGPJvitWoazlGGRO9dfVukn4ouIvAyuA8dxxkfHzHVr
	sKFjcu3wBoKMHtE+LpWxnfEsp5IYeJUmwWuwVXAD3KgGvYfUYHKf2C2ENTaC
X-Google-Smtp-Source: AGHT+IFVb2xx7TQL/tkQC83OQNyaS/vGBPH7Yp9vvtxMPR3n8ckNiAQagb44ZnmQzwUzvnF1qw5k3g==
X-Received: by 2002:a05:6830:3111:b0:710:9f33:1827 with SMTP id 46e09a7af769-714fbeb0394mr9343606a34.14.1727719113344;
        Mon, 30 Sep 2024 10:58:33 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-714fb667911sm2499144a34.26.2024.09.30.10.58.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 10:58:33 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-710ddb52139so2570756a34.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfmqaRb2sph/6F1Zb3r/IPOyYKwqiF9Zaulbz89xbMKb6ZQrJSfz8o5t5JJBo6SHcoeGJfZbjR4mw/@lists.linux-m68k.org
X-Received: by 2002:a05:690c:d1b:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e247561690mr104291347b3.13.1727718756479; Mon, 30 Sep 2024
 10:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-9-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-9-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:52:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpiS-MgQZ8YyX=PDvQ+ZvS5TdMV5wn11MKFZVT7CHDhg@mail.gmail.com>
Message-ID: <CAMuHMdWpiS-MgQZ8YyX=PDvQ+ZvS5TdMV5wn11MKFZVT7CHDhg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] sh: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Yann Sionneau <ysionneau@kalrayinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:25=E2=80=AFPM Julian Vetter <jvetter@kalrayinc.co=
m> wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
