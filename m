Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC37266EE6
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739552032; cv=none; b=TeKDlpIoFfwgmzcRBKqdXB85Z/JvrSNJkkxxyt2yExKvVCss91Yu6rS/JmeVojVIIsQFKd0U9sMtXvey1dGtcOgdwykYRGQnsHiMN9utbfHo2hVllSp1OEAYBQHnctTY0dllVP9JT2ZOZ7G2aM70mPMnAR4h7SyphFuWUbIXvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739552032; c=relaxed/simple;
	bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDZ0Vl4XrKBcFQ+xISqtvJNR5P5PHUAGZqha6tWUephuaio6/JNLvm35UBFE9zBEJUVjbrg29P9CFxaMejJkH3qQKUIBXwX17BjlOuNJuDtZRlgtuBhaGgnFPjlzJ+moTXxfcjaG59afEjcMWVw4TOiV+QU1vpkUO6nccN7aNlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbksmbpo; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbksmbpo"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-308ec50eb3dso23403941fa.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739552029; x=1740156829; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
        b=gbksmbpoae67abtPTzKFJYo3zE9MleJBqbq1qvIots1z9Anga1CLmGyVEsKtyEz+pK
         qeFb17uOFZGFY6bl3+j5sezo2qsT0GvxsjMBjv2u2z1wlOZHNQuLMi//qtNUS79KtgwZ
         2JcyHGRQJFwTrSABwDXGqeqp24M8C9zaf3VkGE3idizxi5Ji03H1daIXF1OuezS25vfa
         MgGNdkPS5rMnULTtK1/ktRjOS+FKVZvMGFbaaiDJaWazLVnGD+lp4tGizj7ObWH+vSi8
         9WyWoX+0wJ7tp9xHmX1Ldlc5Mu8DMftnyhuKVqBi9ZeIpFLqF5S6GnDMkAtASot6sWrU
         WB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739552029; x=1740156829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c5NuBDyo2m0shbPuVy5ObaCNtX5qBwlWxjze7MTKVg=;
        b=cdLKTiD932AW9rdBkdSU4w1zEmCXl1JwkN4WGq82a1BSg1ExZK1aGo5MFuySsklP6g
         TgiQO5Jh5xYOp9Jn618pIb8JJgj0RGagSaiBVq3tIHhKNjf7mBKYWGmgZYm+jcN639R5
         7IOoVBpE24BOdmAkKb+KxLBD64DcHayftcBZlHOsEqOGB247pNGNnuOVE8oQ7hsN9jHP
         EncPR2LVOqsy4WLlr/ZNVyaboAGc7vXTMQxFXFmiuva2oDRWII7Qy54VwtwlCoBsOcm9
         Pylo7crc1+e9WKW5zjkCSZbvMv1blLPiLyFotcddwUsxG4PXQo5nF1UpfO5Qq+DD5mHw
         Qi0A==
X-Forwarded-Encrypted: i=1; AJvYcCWcUJjhLMzSHIbOg1nVpw2iYMPdQ+wWEPBb9wbhx9cTYgcrmAbAaxurlht2TkOWJvXR86+Menb50rvL@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzp21SP5T73b5fUkLRP0+xS9L6nrnmbqqYRPDldWRkHB9VW0ChH
	Ei/IPniUSklhOdxGACjzzXbAg5vn0YEnM0+mTdR8J1Xso/baANOBvf2qq9QQDrFuYoshG2A1CL+
	kkPXTTfldDDWUMGd/84BEuOslkyw=
X-Gm-Gg: ASbGncu7YHZdCuFx0mzis/K0PsbvfvtPMzF8ygjdK8ebyx1hqDF2wuR59sXPZA65LED
	yjjuZX+UPcKt2Bpvqu73ooemjoEel1XsvGoFwDnKooLZuiuJNvfY8AGO2UAgB67JKVQDg06Ewvc
	QRIOQcZIFgBta6UB7BaN+9i+rGpjZlL28=
X-Google-Smtp-Source: AGHT+IH+ZY2j63cWbogB9A3vuP8zUi7lLVt1mNv8t9yoNtwWn6FsGoTMpU+6/obf1W6ICZ9peOj7KrEV5ms8Ua3/CX8=
X-Received: by 2002:a05:651c:548:b0:301:12:1ef3 with SMTP id
 38308e7fff4ca-30927a2cde4mr1356071fa.4.1739552028486; Fri, 14 Feb 2025
 08:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz> <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
In-Reply-To: <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 11:53:10 -0500
X-Gm-Features: AWEUYZlnq5SWYMq0W8Wtx8_gV8oE6jI4f_XCC4fWZ0NXKTJTv_1uIYIyKaB7JkM
Message-ID: <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Petr Mladek <pmladek@suse.com>, Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:
> > On Mon 2025-02-10 13:23:21, Tamir Duberstein wrote:
> > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > being bitmap and scanf), the rest having been converted to KUnit.
> > >
> > > I tested this using:
> > >
> > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=
=3D1 printf
> > >
> > > I have also sent out a series converting scanf[0].
> > >
> > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-3=
86d7c3ee714@gmail.com/T/#u [0]
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >
> > I have just quickly tested this before leaving for a week.
> > And I am fine with the result.
>
> Seems reasonable to me. But I want a consensus with Rasmus.

I have a local v4 where I've added the same enhancement as the scanf
patches so that assertions log the line in the top-level test.

I'll wait for Rasmus' reply before sending.
Tamir
