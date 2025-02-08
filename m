Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD411AF0CA
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Feb 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739018055; cv=none; b=NYfPEXIgo05pFGCunR4LT0sA0+A9cZO70S1tnORce2n6POnfjowOhCGLDKy1l/xdng3F1qNBYQL73iYNIXIOD3Q1Do3eoZeDuCjBXsArUYKf6uKsIFJ8hjj2uSXtRlfB4E9jfTQE6VeLNYPG8/VaMos33kdiwyFQFB9h+dVJbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739018055; c=relaxed/simple;
	bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFh1gHngBT2QRs7sA9nr+pYOUBZx7BX1hGdRWIAkVIweLsxrVkndrsUxeuSwmPoOUXQxON3cB07WF24W8C6HMZTf4TaJww95ZQ1umadjv34SdM1+jSPPEXdGiXMukXQyzr8VG0nGQisQDbdui+oLh+VCdPEksjMal6bco/wvWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFtIyZaz; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFtIyZaz"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a6bso31336991fa.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Feb 2025 04:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739018052; x=1739622852; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
        b=VFtIyZaznmY34ucuz85FPsG8hkGFEW3bXTqjG8VkhdRYP0rO2HiTOM2jKgSJbQEAEE
         VpEDmNlJWzOA/qhaqBe3st5hoMG3OXXGHiWcTVDdIPnj2HFcO73RoiBWBeqUTOmNTG7E
         2yOn0lAh4WhBEe9zjBvus4doJDHUrXGJdNeo3PpE1Js/JOovR2jbpZcmWzJUKA6MyajQ
         O3LwYJ6ppERoAJ6TUrd5zsXae5wIE2mDpYzqEHXBUtt4+44k2ecV4Q9IJZpLGX6F7Wui
         iOC8oNexusrAMihKJDVWwoZCwMbab0qPwjEL2wVwfLX1gN/2YcBoPGZnqwxFvdVkys3P
         bJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739018052; x=1739622852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NtmFEV6HVkwd/iCjaBhvbggj+/ki/A/XgNsktxy7yA=;
        b=pL0luq9ZNUu/QU+bNvpwSNCawDp89doRIzsedUB4yjaSEyVGwpv0oD/fwCF1cG2vOq
         1MbIWOXAPzORcOJJGQrbxYiCJHvz622qmUYcjDVr/URuNldQznkAdBhp2bJ2m34S0UOh
         /IIbNBCw/usSPe+qb9p7gbOoysrUj1/2oNivPGjzjOKiAz5T9KhkkRNUDDNsB5z0teHq
         fZs2t7tEehjEV0D6+eghDjj6OgxI1zmv8A7IedTen6xe3aRNUaP7S4xHhBpD4RjxonZD
         BXYHLSTGgUBDbdUl09SfifVkyp0xqYlkrp12IQ/r0P2TLlpGEw3+OdSm/DItpfxFpy67
         2E/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPWReDykFhb7vtOQz23NSKqnNOqdPLgxfsAonpjHhiU79UoiNNHE5NpgIwuvL5SDRmvQUlz/HaQBIP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwEAOAMXXaNwUzUXrXv+q1Rh+Ub0ZBCWHxfyUvKwC1jsyezmJdv
	ztsYsYGzlzPly50z0BZCKaNn4AFAQrBlJoFbyCrVKrj45/B8/eF34WTteN/1Lvr7j5czaGolQp/
	bDwQu69yhdc6Ea8GKNjOo7D8MA3w=
X-Gm-Gg: ASbGncuB9m8gMIAGfCJO3e/U68mTH4NNRzE0d1+HBJ7LRvQ0cMPeciy3qJShdbmhEsr
	/BIwcbMYwZEg/dLjZLVd5lb/8EVCo+8S/yUrU7oxNSqM6nZCb3ed2rO5gVVgucUnbnRqrDINYBg
	HcHaljjV10mI1m4man3iWuFu/PrZeZE4Y=
X-Google-Smtp-Source: AGHT+IHOVYZ6119BddUktzA6djJrY16tcFrgFxUAy4xskpPIrBDV/cXo8QbRQDOfCKTZHGOjX8eg/TALGJvaLhNy1Bo=
X-Received: by 2002:a05:651c:199f:b0:307:dc1f:e469 with SMTP id
 38308e7fff4ca-307e580c5d1mr23625221fa.20.1739018051928; Sat, 08 Feb 2025
 04:34:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <20250207-bitmap-kunit-convert-v1-3-c520675343b6@gmail.com> <CABVgOS=W3Wny0q-Kpj6P1ZXyG1R_HYCrPLtnHiuruW9FxoHrfA@mail.gmail.com>
In-Reply-To: <CABVgOS=W3Wny0q-Kpj6P1ZXyG1R_HYCrPLtnHiuruW9FxoHrfA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Feb 2025 07:33:35 -0500
X-Gm-Features: AWEUYZnxmpKkzSNj_ExYRdu7y-yKEMYavEZgdMaiYXQTRBuM3t00g7LqepmE3D0
Message-ID: <CAJ-ks9mTAp0UwRViKHYqfFV+qkgi89=pNxiQOZYmHdYzkJ6Wcw@mail.gmail.com>
Subject: Re: [PATCH 3/3] bitmap: break kunit into test cases
To: David Gow <davidgow@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 4:07=E2=80=AFAM David Gow <davidgow@google.com> wrot=
e:
>
> On Sat, 8 Feb 2025 at 04:14, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Move some tests into `bitmap_test_cases` and parameterize
> > `test_bitmap_print_buf`. This gives us nicer output in the event of a
> > failure.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
>
> I very much like this cleanup: the static global 'kunittest' was annoying=
 me.
>
> I think there's an argument to get rid of tc_err() entirely, and just
> use KUNIT_FAIL directly, but I'm happy either way: it is a lot of
> churn.

I'm happy to do that. Pulling on that thread ended up producing a nice
cleanup. There's no way to add a patch to the series without sending
it all again, is there?

> Reviewed-by: David Gow <davidgow@google.com>

Thanks for the review!
