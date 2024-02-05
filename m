Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416412B8C
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Feb 2024 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124641; cv=none; b=Hrdz3Fp0KzM39z199W4i9dhiHP7fz7IJgMMbBvNxFscRYDZQF/gS8GhvvmT6xh1FhDylJEZP8wfOkloqO1rjxBt3CtoECPHFH04LTBNlgvsTbFD473yI+9ryWD7OHKXVU/uLjvbUuhcrygyEgp/IlFCFyFq3HNHAAoT0hI5nrPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124641; c=relaxed/simple;
	bh=96MPBiS40e0x9Vw86i9UrFnPx8o4zrAU2LTLF+KiPMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saQKrueGipubS7cdQr1ulbWYVCiPJPaS+tl3/NdNnIkeCdkDnNd7/+OW1o8a4VtAOnWvuQ5bgcOR7A1QSxZvjvU4EtXByPFj39xPy1+y8AZ1N+J8K1UjPRc0jsw1J1Jjo1UVjv7KJCZjZAigbQvkLiyjMTCQHq53qFXpEVvYQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-296a02b7104so457197a91.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Feb 2024 01:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124639; x=1707729439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU3n7CJ8LR2Ka0hr51hd9lp4PmyuHjFJfmGGeQpcndM=;
        b=wTzbCXrhpYwDhaPMNYdj3a2+6LaKlLEKKniv0lCnssHSLKXJh1pMq/CBevkAGgLw9N
         m+nSL6dO5Bbp0WBfjv+JeYdAM+DEMc47HatN9gcq41NPnWGzTVZr89aNiuJ8lONvBTdh
         ShWnJEnvw5mg73/JiEF+vUtSNF4AkIJiO17WIrPq9PuVvfPyLRQPhPqR/3rGDqPkbAd9
         IIlHw0ypvRGd1GRAE3h2vmnr7xm0eRrfF9MRJNHxkCNuTSL98+pPOduoyUJtF2cMWjE2
         rYk9j7bORieiALdW8a9Yv5x5p67+ylpA+Q/bRN/Q1H9fUYdNyLU7NaxqpdA4yJLeGRAj
         yZdg==
X-Gm-Message-State: AOJu0YzYBNWHj+tBzi5ssE+pqiVH5rnkyPl8Y5qeo1YTjlfv04iGXLx+
	IhylLMu3PBpbxXptPS7CINhmswyBcSOjuxXw9bMBdb7ljp42sBA+tdDMzf3VtoZn7/OkhlmqtiH
	xAHRy2MQ1H65NVuBB0+B2RZ5uBv4=
X-Google-Smtp-Source: AGHT+IFfZf+XD8BOSl7R7bC9f9eXgr73a5N6xcGPxMPSXsWh7hXatH3CaIIqjbH6bQN1DrRciODcjMzAjFn8nQ7Nry0=
X-Received: by 2002:a17:90a:3006:b0:296:2035:a3c2 with SMTP id
 g6-20020a17090a300600b002962035a3c2mr10729751pjb.36.1707124639396; Mon, 05
 Feb 2024 01:17:19 -0800 (PST)
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
 <77831c6f-7fc9-c42d-b29b-c3b2f3f5e687@linux-m68k.org> <CAMZ6RqLyRxvUiLKZLkQF1cYFkdOqX73V2K=dGbNROMDj61OKLw@mail.gmail.com>
 <002675b0-6976-9efa-6bc5-b8bad287a1d2@linux-m68k.org>
In-Reply-To: <002675b0-6976-9efa-6bc5-b8bad287a1d2@linux-m68k.org>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 5 Feb 2024 18:17:07 +0900
Message-ID: <CAMZ6RqKx=EO9kcOmxRyBuhULdDyTCeAXz25j_uF7TSy72Jahpw@mail.gmail.com>
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

On Mon. 5 Feb. 2024 at 08:13, Finn Thain <fthain@linux-m68k.org> wrote:
> On Sun, 4 Feb 2024, Vincent MAILHOL wrote:
(...)
> Let's see if I understand.
>
> You are proposing that the kernel source carry an unquantified
> optimization, with inherent complexity and maintenance costs, just for the
> benefit of users who choose a compiler that doesn't work as well as the
> standard compiler. Is that it?

My proposal is quantified, c.f. my commit message:

  On an allyesconfig, with GCC 13.2.1, it saves roughly 8 KB.

"Saving roughly 8kb" is a quantification.

And clang use in the kernel is standardized:

  https://www.kernel.org/doc/html/latest/process/changes.html#current-minimal-requirements

GCC may be predominant, but, although optional, clang v11+ is
officially supported, and thus my patches should not neglect it.

This is why I am asking whether or not clang support is important or
not for m68k. If you tell me it is not, then fine, I will remove all
the asm (by the way, the patch is already ready). But if there are
even a few users who care about clang for m68k, then I do not think we
should penalize them and I would not sign-off a change which
negatively impacts some users.

The linux-m68k mailing list should know better than me if people care
about clang support. So let me reiterate the question from my previous
message: is clang support important for you?

I would like a formal acknowledgement from the linux-m68k mailing list
before sending a patch that may negatively impact some users. Thank
you.

> At some point in the future when clang comes up to scrach with gcc and the
> builtin reaches parity with the asm, I wonder if you will then remove both
> your optimization and the asm, to eliminate the afore-mentioned complexity
> and maintenance costs. Is there an incentive for that work?

I will not follow up the evolution of clang support for m68k builtins.
The goal of this series is to add a test to assert that all
architectures correctly do the constant folding on the bit find
operations (fifth patch of this series). It happens that m68k and
hexagon architectures are failing that test, so I am fixing this as a
one shot. After this series, I have no plan to do further work on m68k
and hexagon architectures. Thank you for your understanding.


Yours sincerely,
Vincent Mailhol
