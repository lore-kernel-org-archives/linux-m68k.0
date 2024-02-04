Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2E4224F1
	for <linux-m68k@lists.linux-m68k.org>; Sun,  4 Feb 2024 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707055003; cv=none; b=OSzMQTV4moJuF3xWUK9reDi3CwgqjGWFX1g5tydssLbCC3ktIMVhmWBze5RGCDprb0X6XWBp3AcenBKX78iAPsrT4Q2GjBlmkx4PN0EySUS1wXdABwipvK2YuaFBcKou+QpU4IGb7UKmPLcSMyYFYxfqonrFifZETuOON2nV5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707055003; c=relaxed/simple;
	bh=tJuCMmVGPqjd839e1z8+vTfJCbhSpH7uhSZwYeJ2Rn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3kUGdWUdx1H5Z5Yxi8dkO+GP8upI6qcmD9w88Jq2l34JPLhyRITHl+PpH6bkm8RzGEmzePfpgkC4NKPKa+gzfSbHfJrevRXTC4nsF6XA3Ueiy8+MQhjQa5lTcf3dh03Rv7HZoY//uv7rIsVrec4O1U0XAHGx6dIKJPbQ60sPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e11faeb125so1803609a34.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 04 Feb 2024 05:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707055001; x=1707659801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK5HHzPHOnJw06PkmeDxTeJoWKOlCirPBPN/7WaX+mg=;
        b=SpeCvNUudQp+nV6aQaC+hYXGDJjtsOCAFd0PBTvP1IDbaPdsLd/4FgFDLZQktdDg4k
         MWuw29NwhJsSbjZ3ZjSOhaDJL5G1IaNqweShgT3M4dwvKpqEo74UVYH6hI1xy/3f9/3r
         HMcuekBVhC18oLViKF1awFX+r4e4j6cFA3aSDZbodK/0WF6yyaUP2RMHWLdLaaXEAGPf
         hIA2nIpU4KjNsMhRs3W5TLRAwmwHgCucLIul0ITmC10NzNzUoT2TCrFeycqhbRGuEsKV
         y4ME2kb60+XqBVgeMXX1FzLLkMrRJHrasgrot+eH21DHmuAFHuwdU9ziVQhJsF4jVJyM
         EL+w==
X-Gm-Message-State: AOJu0YznuPSr6kBsZh01yW1HDAfufgfWjj2bpN8eDVbku1jb6yPh+xE4
	oILwlIsivDFQaMw+ut6TImZRVnud8OB+6JLuQKk+tBrSqVXu3R0ga3eFAZjV4It6UZEtaf6rQNx
	4w6nVJJ5GU0/uj5i+4nMbIvIihI8=
X-Google-Smtp-Source: AGHT+IEgFL+oArtYo9MSy3rjb/Xp9QIC5qVF6dVHA9GYj9ihuddYCKzmTlB0ALs+JGFe1SiI2g1uBGusiLUzvu83rLc=
X-Received: by 2002:a05:6358:7e13:b0:175:67e3:cb28 with SMTP id
 o19-20020a0563587e1300b0017567e3cb28mr11987431rwm.12.1707055000858; Sun, 04
 Feb 2024 05:56:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr> <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
 <c47fedaf-cdc9-f970-460f-d2ee7e806da4@linux-m68k.org> <CAMZ6RqKj207uv5AF_fvb65nhCM32V=VAQXsUGLNmbeXYKPvZJg@mail.gmail.com>
 <9d9be9dbe92f43d2a95d11d6b2f434c1@AcuMS.aculab.com> <CAMZ6Rq+RnY16sREhAZ6AFn3sz1SuPsKqhW-m0TrrDz1hd=vNOA@mail.gmail.com>
 <77831c6f-7fc9-c42d-b29b-c3b2f3f5e687@linux-m68k.org>
In-Reply-To: <77831c6f-7fc9-c42d-b29b-c3b2f3f5e687@linux-m68k.org>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sun, 4 Feb 2024 22:56:28 +0900
Message-ID: <CAMZ6RqLyRxvUiLKZLkQF1cYFkdOqX73V2K=dGbNROMDj61OKLw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to
 evaluate constant expressions
To: Finn Thain <fthain@linux-m68k.org>
Cc: David Laight <David.Laight@aculab.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>, 
	Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Marco Elver <elver@google.com>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Finn and David,

Sorry for the late feedback, I did not have much time during weekdays.

On Monday. 29 Jan. 2024 at 07:34, Finn Thain <fthain@linux-m68k.org> wrote:
> On Sun, 28 Jan 2024, Vincent MAILHOL wrote:
> > > > The asm is meant to produce better results when the argument is not
> > > > a constant expression.
>
> Is that because gcc's implementation has to satisfy requirements that are
> excessively stringent for the kernel's purposes? Or is it a compiler
> deficiency only affecting certain architectures?

I just guess that GCC guys followed the Intel datasheet while the
kernel guys like to live a bit more dangerously and rely on some not
so well defined behaviours... But I am really not the person to whom
you should ask.

I just want to optimize the constant folding and this is the only
purpose of this series. I am absolutely not an asm. That's also why I
am reluctant to compare the asm outputs.

> > ... The only thing I am not ready to do is to compare the produced
> > assembly code and confirm whether or not it is better to remove asm
> > code.
> >
>
> If you do the comparison and find no change, you get to say so in the
> commit log, and everyone is happy.

Without getting into details, here is a quick comparaisons of gcc and
clang generated asm for all the bitops builtin:

  https://godbolt.org/z/Yb8nMKnYf

To the extent of my limited knowledge, it looks rather OK for gcc, but
for clang... seems that this is the default software implementation.

So are we fine with the current patch? Or maybe clang support is not
important for m68k? I do not know so tell me :)


Yours sincerely,
Vincent Mailhol
