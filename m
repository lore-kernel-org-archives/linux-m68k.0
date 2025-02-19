Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8F524CEFC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 20:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998728; cv=none; b=eEdW1SYZwwE8828rmhXciArWxr4+rfCKbB65hYrFfVLBcleP4ysufKW4qV2dM5+TWsxxlK0lxht2udDG5d/Wo5z5o6uqgYOcBllGMh3VmoA7z+ilN7P4WC8nmWcind6NMKZpD0N7/oFodUNIIBbvAA1Fvhdvp6WfPQ1bkcCnVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998728; c=relaxed/simple;
	bh=1YnkwmqTBrxU2LC4IjJbS9rALrX2MyA+O3NS8Wavzwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNHyn74FFbamosXN0ErrD8AFFkEe8GG5fvbEQd7590OOSMxvD9sQLIv4HMIMwAd0eWjDGxM5O1Z36RWB6UHKm2EkV3PfDzJZ5j27SjnEwRyBJwi7WUNt5xxzSZtIUWKHh3p+HEi9WuqPQELLzn+lezAyeuA/pGjdf5JWXKKcl9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDg0xdff; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDg0xdff"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-307bc125e2eso2020471fa.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 12:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739998725; x=1740603525; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29zpgtmqkMxdyASEnJJCIlnqLj+EywBz14CpRjuAKx4=;
        b=DDg0xdffNqxhwgDUGhuo526zyE1AZNd186vFFGJlTgNGOLPciR/qBKrwZilznrzY7d
         HKCHU6AriIToFNwZciEXrsShRAax3mQ/p3qqL+taDQmtv8VI95jKmvvsooZw/MkHAxIy
         u3m4CEqwO4O01bWiWJ8WineX677C74BUVoSJzyM0yr90vu9YJhc4EQqkREs/yKnogpy8
         rFlf5C7xh5I7gOOs7Qi1kXGBewPvTnNqpXAV4AnYqbtoJdmQzD3RF5sLqTCrJHqD1vU+
         E31sPyadOuinr6GdjY+MJP12deb8VcubhdO6OBStZ8BBe467kHT078Vh53sGt8ruH8SL
         VSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739998725; x=1740603525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29zpgtmqkMxdyASEnJJCIlnqLj+EywBz14CpRjuAKx4=;
        b=t0h+6VXOtmJzj6tH2bcmH00ktUiGc62B5C2wnNuJC1agBalemSnt7MNHwZClXK4Dgf
         gWl/iFIdTOUwL6t6Iwsj7ga0jomt+k2Vj6NiHcTLfnGzmmoD2XsTF1rtN8B60O4dPs+x
         yC0NcVAvX3YhaYmcxRGc/Fj8e6Fd7NCMtHMiBraT/+TyFAJXHcj0i9lIj6k9BSCkK2Lq
         1d6GSQ1odSA1bP7ycrqyJkWS2BGz5c4DhuWAP5VFDUSYRDoNGIfpe58xtcXRFNwvDYNK
         yvTiisozzELehe+tjT+i+7vsHCdY/2TbB5RBP8RKJ9x0Dr1Uv7sHX1n6WHMGBSzk/U3g
         9ovg==
X-Forwarded-Encrypted: i=1; AJvYcCXeFYTydbDkj5yt1WasVcQjba6N0EGvTuuB2Ccz8VlsvW+RlksLqTGbSSqWX3i9v34mPdzm5GNE/AdG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxAFyuxxTW/MCOpPe2xl7lIUIUZFdEW27s5Dqh5Jf1U8k7soW7c
	VPYgUPhWzzrrqcKADCaNpF2UZUVzOgCzAavv0tLmq68LIJha/2ZNVethFuc+fgSry8lHd9lavmn
	7bkRu5eejjyQLp81Pr96bD0WiPJ8=
X-Gm-Gg: ASbGnctHdVgMsI3DtEWCWnWh85BZbVXJBTMGr4umpfhlxLSpo6tX/b0QqAwUR2HiUlB
	Xn9hH3UUO1Mf4Kj3aPDqmdX2klyKHbp+fckKqK9H7KT6lz5msu6f0RoV1vvfTNUJ5q+/rVS8G7S
	KOwEiT2USMd21k
X-Google-Smtp-Source: AGHT+IGoT3bsf2kdFagKyysGj4sdKTWGjnr/6od8iw5I/qyGVa7OesRWN+3jUei2+ekugunoU+v2tNYtkTv+DDddmPk=
X-Received: by 2002:a2e:b60e:0:b0:308:f4cc:9505 with SMTP id
 38308e7fff4ca-30927a577c6mr53587141fa.2.1739998724732; Wed, 19 Feb 2025
 12:58:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com>
 <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com> <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
In-Reply-To: <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Feb 2025 15:58:08 -0500
X-Gm-Features: AWEUYZllpGxIALFm_VU7C7f0caMYFvyxidAHTXkA2rezSlvudlun8QXj74kF6fQ
Message-ID: <CAJ-ks9kadHvF3gKjZh-_oFdb1x_qOR6i1=Jamuaw9iq129gOnQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] printf: implicate test line in failure messages
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 3:41=E2=80=AFPM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Fri, 14 Feb 2025 at 22:53, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > This improves the failure output by pointing to the failing line at the
> > top level of the test, e.g.:
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
> >   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1=
234abcd  ', expected '0x1234abce  '
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
> >   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x12=
34abcd  ', expected '0x1234abce  '
> >
>
> Actually, I'm not sure that is an improvement as-is, with the two
> different line numbers being printed. It takes some thought to
> recognize which one is relevant and which one is not.

They're both relevant -- `do_test` does a bunch of checks, so you want
to know which particular check failed, but also which invocation at
the top level resulted in that check failing.

> Can't we have a variant of KUNIT_FAIL that allows one to pass the
> file/line info when the caller has better info than the location of
> the KUNIT_FAIL itself?
>
> >  static void __printf(5, 0)
> > -do_test(struct kunit *kunittest, int bufsize, const char *expect, int =
elen,
> > -       const char *fmt, va_list ap)
> > +do_test(struct kunit *kunittest, const char *file, const int line, int=
 bufsize, const char *expect,
> > +       int elen, const char *fmt, va_list ap)
>
> This can't be right, the __printf attribute must be updated accordingly.

Good catch. Oddly I'm not able to reproduce any compiler complaints
here, even with the attribute completely removed.
