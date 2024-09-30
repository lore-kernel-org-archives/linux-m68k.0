Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9818C31
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727718843; cv=none; b=pw4lKN1AuueX3REaDWHHvOFknA0FlT8XD4E3pzo6YVpx3leFs/wGa9WmyUIBT2swZKA9tRgts4HDwwOlI290PgWnauDQlshU35RaAYbyDJJ1SGVzlQnIWTkpammf8sKqVBhXNZnagKuhG+yvKxU8jfBnOLtSNMczU5x30DX0cvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727718843; c=relaxed/simple;
	bh=PQ2VgHYe0Ngojxr8nNlQI/+nPbwGo4g+HQCTJc64GP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsG8fEPiJk3UD3gI8euwuLKDbb1Ojz8S0LQQl+stboDdgNe1dPa3GAp5VVdLHh1mum/zxFp1n5OIWU/0bkvbZCUrmBYw3EsBrV6CugIHcYRBOjE2lQpoUlNkEnT8aZUPmvOgPcn8Lo9LPZLDk9KkbbsUBQUx0I4p4V75Fs9aT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84ea1042bbeso1265272241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727718840; x=1728323640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoyzlnnLRNj4i2u5Dgn44nDbhn4MB5fS72eP0TVQdtc=;
        b=M/JlRzgqaf48df1eiJmoCGXN/qWJGKfNtEzi4zc6QJa8rpACd0YD8k88ooyI+2IanE
         hFWySNL4nWG63v8TgQW7UX8Y26d0v3T2ufaMDFALh66SE6anUBM8JR4PDOVfJ65C+34h
         Y+AnbkbRglC6sayBynOoEqbkoPlus6nxDQASI4tMbGPbAsE2xR+uZsq10byEyOthZ2sO
         Jfrf6WIVJ/NgTiwO7uMwH65BdlQZzQZ+bBRJ+vaCQifqu1sgf8/4/j9oR9+qynUqP9JC
         +nSmkKwTBzpM2fhT2YCntO8aYTlfvziZIgWZfVKqz4RhpvEic4Dyrs6/g1uJJDY80Gdw
         pgMA==
X-Forwarded-Encrypted: i=1; AJvYcCUrujIl0VHgpeQ/EscCGKsm8ocggTc50gT7jXlLw0lYkphtuwCKzeSjJY7t6FYhrebi8nByFWxjGyww@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzuQCivix3FPkP7ZGpZR4gj2E2DWixCXHA399qhCoOBESxxBjEo
	BYDQX8HwN60/HjKwNw+/TlodAZwPvsJ4omTBb6cya9AJB9MIKmZt/pF0/lcS
X-Google-Smtp-Source: AGHT+IFnih5cM0BaS0ydN67h1laDLNhV6AyXhcy3r4rX2lnZ/At0Ad0sFz/VetJp3ShP/detp5s1pQ==
X-Received: by 2002:a05:6102:298d:b0:4a3:b0b7:8505 with SMTP id ada2fe7eead31-4a3b0b78e39mr3307484137.4.1727718840174;
        Mon, 30 Sep 2024 10:54:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84eb2317613sm1052686241.37.2024.09.30.10.53.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 10:53:59 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4a3abd7230aso823342137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 10:53:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZtoOpEJImcY38Y81gqwugGtP+zQfzXU1Sh+L5Clx9YM1P5Fik5UgR1OTnZ1nJVf/OtGT29qexpz/8@lists.linux-m68k.org
X-Received: by 2002:a05:690c:60c3:b0:6dd:bbb4:bcc7 with SMTP id
 00721157ae682-6e2476334f2mr105898897b3.44.1727718393293; Mon, 30 Sep 2024
 10:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-6-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-6-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnb-fo2MP7ERwSj-sPNU3-QyikNinfhvgVa2DnR9jJrQ@mail.gmail.com>
Message-ID: <CAMuHMdVnb-fo2MP7ERwSj-sPNU3-QyikNinfhvgVa2DnR9jJrQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] m68k: Align prototypes of IO memcpy/memset
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
> with the new ones from iomap_copy.c.
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
