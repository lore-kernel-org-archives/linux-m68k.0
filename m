Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36523F295
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997686; cv=none; b=CyZBikV9lcv/CozGAtHyysba0nrEojCRzcyS6qdYXYrIkFSPFy+QxdiC2txagK4ONZr93ZML0KLXUUCfk8Ki7kxI3J3rHEgUAdXH+qM2PXniHQJ5su2QZwEl+6ME09rnO8Pd/4ir8g20nXq+F32lB8DZdG2T+Im3Jtxtg7gySbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997686; c=relaxed/simple;
	bh=yraqLzxeh3b7rHBkfWikDJTuU2Al31V4abfQMTxxX+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4hwefdXyonCyIVjwrVlq/1URmPsEJ0MJ6OPsHmc7eJIyQSfHOckOeZ7PmqrclSsV2Sfn/bmfdrVg8u+D7d9esjRrk+X5llUuXIEoHPm4+wcEz/G5bmRt//vaKHmGW6Z7715Yg0gz51hEm/XvMgrQUmFkFYBtE91Oe/l5qhRLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=ZTczbz4V; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="ZTczbz4V"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452efeb87aso242999e87.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Feb 2025 12:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739997683; x=1740602483; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQWKjia1YEhq+PMd/nXG3fmWx8U4DeTtcDG7C2yzBs0=;
        b=ZTczbz4VKdT0H4frQqU/a2Mk6LYhF2ixsYyl3PKr4jK8P2XYnSGv3Zjq/1nbmeK/DE
         2zoti/hp/jGSwuHvcdPxPcebQLBMmIKoGUM+B7mhV9eZiwTUrLNOboyYsP2tZ902z3dO
         QYRav4Um3m39xCCGIUtVdSuKCtjBMoxBYWlJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739997683; x=1740602483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQWKjia1YEhq+PMd/nXG3fmWx8U4DeTtcDG7C2yzBs0=;
        b=drh9tRJR7OOQgSQCyGOxIszxer0Tgv3iF7rLhv16tDwN8Lez7ABx8mLNDJ7zzVJpyk
         ZEVJ6Nr/QGsbFt4aw+t/AkL+D1nm7QaUlOPxr6Wx9MT0PUvejs928Q0YOv6D0EJArPgp
         GPsQV6Z4psULo7fECCRo8TABrKUOMvl5JUiISLUvrTktLr6xxRVPci80gLcWmc3/IoCT
         4vm0Xu9q7E7xEhhfafL+a/+HbQ5Yv7Jsn/sF/W+sIbop/S6rfr2a0Uk3M6xL2f/VyfHG
         5VHateLyCW+R9q0jqKT09v7DwSDSnAtpASzzkiR/uj7RJlUayYoMcCDcRasUu3xD+Jk+
         3pog==
X-Forwarded-Encrypted: i=1; AJvYcCUGKiidcVMscYKyv/HmYc+X2dleHfZiRER3etVlMpXZyedC/7VU9sAk2ZVF37ebrn7EZzKUHJNZDB9H@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxXGMZJjcz+VyBnTO3OhgEV5GQIczUHaeCeLm7Vv8srpeuQX/6+
	EgGMW5Fq1q+wJ5BwuMDLq28fmtgFKD8LWCCfs2xkgIz2Jt/vv3pMwT/q37+XUWcd2RdO8EglDAS
	yd9p1alXZ2/JkTxEpeM4gerszJR6nF7dfqDaQrA==
X-Gm-Gg: ASbGncshIXMimn/4SvEQjua6y6vj/UVsiQ8WHAFOUNpZhrRAzFdqfMT0N57OSUXbumu
	80HjkKhos7lmVJTV37xgx+gUDCBa1j+taQ38hDswo2zidBI4p9wQ3x4GCRy4P41ZhfCgYSOUf
X-Google-Smtp-Source: AGHT+IENNNpeaMlkD/fiQQAYZ6iJNFdOYrpRNg7fkEna3OdCDK3VAQtFcLuzSuMXXgumt+4ZaeEHehD2gwq2A0TLKZo=
X-Received: by 2002:a05:6512:2398:b0:545:ee3:f3c7 with SMTP id
 2adb3069b0e04-5462eef4e56mr2154420e87.30.1739997682815; Wed, 19 Feb 2025
 12:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214-printf-kunit-convert-v4-0-c254572f1565@gmail.com> <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com>
In-Reply-To: <20250214-printf-kunit-convert-v4-3-c254572f1565@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 19 Feb 2025 21:41:11 +0100
X-Gm-Features: AWEUYZnPvEz-Qu0Q_eOs4K3mND8N5X48foEj8aBLKco5JWWCbd2AeY_UnbAb5oM
Message-ID: <CAKwiHFh52-_ssWjC3wdtZ=92AHAw7grnDugZpmf7T962VQrEbQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] printf: implicate test line in failure messages
To: Tamir Duberstein <tamird@gmail.com>
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

On Fri, 14 Feb 2025 at 22:53, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This improves the failure output by pointing to the failing line at the
> top level of the test, e.g.:
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
>   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
>   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '
>

Actually, I'm not sure that is an improvement as-is, with the two
different line numbers being printed. It takes some thought to
recognize which one is relevant and which one is not.

Can't we have a variant of KUNIT_FAIL that allows one to pass the
file/line info when the caller has better info than the location of
the KUNIT_FAIL itself?

>  static void __printf(5, 0)
> -do_test(struct kunit *kunittest, int bufsize, const char *expect, int elen,
> -       const char *fmt, va_list ap)
> +do_test(struct kunit *kunittest, const char *file, const int line, int bufsize, const char *expect,
> +       int elen, const char *fmt, va_list ap)

This can't be right, the __printf attribute must be updated accordingly.

Rasmus
