Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C628C07
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 06:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706423211; cv=none; b=iNrWexSwubqdl6sArYiHCqO2Ebytmus1ziSM70qm3BHfF6aoN7Uq6655IfaYp8bFZUkgyLYCrEMt54O4v6NNIh2sAQLZ3B3RqX/x1gbH6X0DyhKWTZYpN3QV1pxA8G9OYDa8SvufBrQ0Zv52LLeF0RQNG6IyXZJNJoMNnGjCGLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706423211; c=relaxed/simple;
	bh=0VuUp+4ZsliiiSb4hjZG56sXIScuh6lZ/+5zfI8c+7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqm1WQUghYugOiwHKdHttFU6QjiOrgNd1H3A4PWmzqL5/EbIV46KbY7zBIywUiX404yFl0dvvA8UmWb2hqdfHsDdDi7aoOthOMhDP1Y4uvjWH5rvOr638DhmV/7fXCO7Iw/3O9FLDTd8Ot88n1w/iidg3XQYhveWQAwdeseT0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-290483f8c7bso1348885a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 22:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706423209; x=1707028009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6s4FHAhkYRRpccjLUeG6NhBNklr7v290F0N+nkkcriE=;
        b=PCxJ8cl/neeanlSNvJtOJmM9o0dsbHkABUkBHuuuvoiDAGVuMLnoxPuCdEBChoZAbv
         n9N2fldKIa/FbsHdWb1kkqGrVEdt023o0IWUbGDZeERmoXjLAC6Qcb25DeCrkhgbs4hg
         mWaIU7LZ+pPll26hJIrdVtnjqrU/cNBxoGZnGgnLTc+OZXSCcpRq+EGwX0i6NaXq5aXf
         K4SIYYUKgmUSyW09SO3xa8iiB7N5dqWo4DsYzZR+zgQszv5Kejlx7DLgwndenBztQy/D
         fZ1uif6O6aePDZcsy6hlmL7uDrusCK76+hy49lQmO03qHPB8Pc+wAsOmMrKl80eDaDJX
         ASLA==
X-Gm-Message-State: AOJu0YwPUFxpEtvTcz+8R0T54C1JoyRSgoWot6GEhDa9bx2y2w4yQF2X
	hB/CZwUsy0/t3hE0RQ3cK6m1TLjIYf4eI28h3FVakNgsWTG40ky1wfE8aNSsXK0R4OZdTh9ELQZ
	3htWoyj5p+tgF+viuXofyDYyPeCY=
X-Google-Smtp-Source: AGHT+IGYW9N7aNJiJ80fPFqrYKQyluPDY8xXvNjrLn/naIBg/nvR9qGwgcFnzpyBtlakPw0QuXvQv/cV7wG4Nfg1Q2s=
X-Received: by 2002:a17:903:234f:b0:1d8:c01d:cb6b with SMTP id
 c15-20020a170903234f00b001d8c01dcb6bmr2316965plh.18.1706423209097; Sat, 27
 Jan 2024 22:26:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr> <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
 <c47fedaf-cdc9-f970-460f-d2ee7e806da4@linux-m68k.org>
In-Reply-To: <c47fedaf-cdc9-f970-460f-d2ee7e806da4@linux-m68k.org>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sun, 28 Jan 2024 15:26:37 +0900
Message-ID: <CAMZ6RqKj207uv5AF_fvb65nhCM32V=VAQXsUGLNmbeXYKPvZJg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to
 evaluate constant expressions
To: Finn Thain <fthain@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marco Elver <elver@google.com>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Matthew Wilcox <willy@infradead.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Sun. 28 Jan. 2024 at 14:39, Finn Thain <fthain@linux-m68k.org> wrote:
> On Sun, 28 Jan 2024, Vincent Mailhol wrote:
>
> > The compiler is not able to do constant folding on "asm volatile" code.
> >
> > Evaluate whether or not the function argument is a constant expression
> > and if this is the case, return an equivalent builtin expression.
> >
> > On linux 6.7 with an allyesconfig and GCC 13.2.1, it saves roughly 11 KB.
> >
> >   $ size --format=GNU vmlinux.before vmlinux.after
> >     text       data        bss      total filename
> >     60457964   70953697    2288644  133700305 vmlinux.before
> >     60441196   70957057    2290724  133688977 vmlinux.after
> >
> > Reference: commit fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl() to evaluate constant expressions")
> > Link: https://git.kernel.org/torvalds/c/fdb6649ab7c1
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  arch/m68k/include/asm/bitops.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
> > index a8b23f897f24..02ec8a193b96 100644
> > --- a/arch/m68k/include/asm/bitops.h
> > +++ b/arch/m68k/include/asm/bitops.h
> > @@ -469,6 +469,9 @@ static __always_inline unsigned long ffz(unsigned long word)
> >  {
> >       int res;
> >
> > +     if (__builtin_constant_p(word))
> > +             return __builtin_ctzl(~word);
> > +
> >       __asm__ __volatile__ ("bfffo %1{#0,#0},%0"
> >                             : "=d" (res) : "d" (~word & -~word));
> >       return res ^ 31;
>
> If the builtin has the desired behaviour, why do we reimplement it in asm?
> Shouldn't we abandon one or the other to avoid having to prove (and
> maintain) their equivalence?

The asm is meant to produce better results when the argument is not a
constant expression. Below commit is a good illustration of why we
want both the asm and the built:

  https://git.kernel.org/torvalds/c/146034fed6ee

I say "is meant", because I did not assert whether this is still true.
Note that there are some cases in which the asm is not better anymore,
for example, see this thread:

  https://lore.kernel.org/lkml/20221106095106.849154-2-mailhol.vincent@wanadoo.fr/

but I did not receive more answers, so I stopped trying to investigate
the subject.

If you want, you can check the produced assembly of both the asm and
the builtin for both clang and gcc, and if the builtin is always
either better or equivalent, then the asm can be removed. That said, I
am not spending more effort there after being ghosted once (c.f. above
thread).

> > @@ -490,6 +493,9 @@ static __always_inline unsigned long ffz(unsigned long word)
> >       !defined(CONFIG_M68000)
> >  static __always_inline unsigned long __ffs(unsigned long x)
> >  {
> > +     if (__builtin_constant_p(x))
> > +             return __builtin_ctzl(x);
> > +
> >       __asm__ __volatile__ ("bitrev %0; ff1 %0"
> >               : "=d" (x)
> >               : "0" (x));
> > @@ -522,6 +528,9 @@ static __always_inline int ffs(int x)
> >  {
> >       int cnt;
> >
> > +     if (__builtin_constant_p(x))
> > +             return __builtin_ffs(x);
> > +
> >       __asm__ ("bfffo %1{#0:#0},%0"
> >               : "=d" (cnt)
> >               : "dm" (x & -x));
> > @@ -540,6 +549,9 @@ static __always_inline int fls(unsigned int x)
> >  {
> >       int cnt;
> >
> > +     if (__builtin_constant_p(x))
> > +             return x ? BITS_PER_TYPE(x) - __builtin_clz(x) : 0;
> > +
> >       __asm__ ("bfffo %1{#0,#0},%0"
> >               : "=d" (cnt)
> >               : "dm" (x));
> >
