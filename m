Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE224111A
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Feb 2025 18:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739040162; cv=none; b=qaf9kavU8CPS83SJEhWsXWHspD6X8RvALVsHM2sRan7oEyLqnkVnFoDiSPuk0CatQr0Yuif7kzthN7yUQOPnP9qz0NV6OBCAXJf3Eg4bOvCbkwUpPagOFE7ER0dKtowvuUuJgLhrTagi9AcF0cDDIU16ecWTZf14u9vfZx+cZJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739040162; c=relaxed/simple;
	bh=9FjKQ/BoQv+CHpMARBhnQGJ+h9/ib6o+976NotBuoh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJoWmTPH5fepC79Hn4l+6pr+wu8K53LxjLCqcFcQ/9iT/HCwmOZq9hx9rhS4s+48FM3sb/QhUTgrbz1MLkCHqzf598l9iWORdYUeCihJZxKy6srVfLiUzODMrvPMMalJxKBMOcxToVQhWu0wElFjlyn8NI7gaqri3wGT31pklwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAga5wxb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAga5wxb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a6bso33277131fa.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Feb 2025 10:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739040159; x=1739644959; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3d2v/Cd40GRW7Y3SKITD/wzvp4wTLT0QafaTbIXWQ=;
        b=gAga5wxbe0fWuwARq+T/QKU8nfkyw0XeUk6iKsrpBYC4/uacWjHZcUSTE7o/WYH7JJ
         9VRrKhoYFfC2CGmEyHV0uY8e8VKZHyWLzPq69C7SBir1iCyrQBH2JcICnzk8+TLQxbdN
         ZE9l8NPtODuWFh8uzrHwOlyekCcn4ZSFujgsPf5U/pDDdVhjrCDzDbCi/gfnrIIOmocZ
         xUbFGiLSBq/gyXiZmYFuDduFDUnybWQK7XSL/Zatr5gJmKe4IPR3Ow+iE6uyxNB3naVA
         QD9W8zEyFInIoMRMvr0mvvQiQxQUsb/Eua7kopyQpaJyhmA2dYl/jR7o5A4LGysaNClf
         xH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739040159; x=1739644959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3d2v/Cd40GRW7Y3SKITD/wzvp4wTLT0QafaTbIXWQ=;
        b=sch1bp41NGMkJ664m5OhS141IIiP88obD/B0IlDpfzLnf8CycOTI0pHkte0upBaAv+
         QGPZQfXtWWmA4eAztynLFZs7taK+037nts5WeTplTj3oclNlxAmBdjOgjeKxnle/COFV
         6yYug+lrrf0RuMlMwBJxq8OV2bTfTyHwY93koVUNbOtDKHCtB8zrs13vtCLLXftwgra4
         qlrr3cL/KJdKyijVISbmPqkbgc0zEa6adpTafROyvi2jEEz7SOZkOVuiLAiASsmjW/63
         IJpjsgkOTJJvxOqPxTYNO5bmaWuhTbrMutICTIB9HYFyviFVqt6RaNeie3Wk7kF6WHRs
         3WNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOVVvUOE5LUQlq/JTEB2YKYVTTFRsRN+4UU5/NxgCWSqVV5/kkeP0wLwWAYSypecJhmOmv8WnzRWgT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwIIcV52hwh5/QvWZs7iErGMrobUmxv/URV6vJulgTsCpoeZ3Qk
	YgOXHF41UPe30Z8tRwLE3jsBSkFxIapeXjhmbrXwDnoZ1ZCNviLe4pBNyHXhqYa9QqhwY++MAbV
	QY9Q6NNCJKKm+/GfNkcNo4qSMsA4=
X-Gm-Gg: ASbGncu/hcmaoF8UzsbpjOF3u3C60FcSQGdrkCPbtJysRMWnG4Gqi8EOJYec+K4rKc4
	txkibxkZBsBRIMBXLblN8hdLXu1+q7vvCPkmnmlgfh4q3wxYmefmhic3IxmdqqabRgx04I7ZbPh
	Qn2hwQ5O6dQ+bG3mv9RZslOZqtxCqsjBk=
X-Google-Smtp-Source: AGHT+IE5yIE5Ue/y+RzFKL8z9km0wUX+8BN+VY4C0BGBjE9wQybUdFtxMRSR6CK8CWLDtOvu3dWumbmGNC9v45fv/pQ=
X-Received: by 2002:a05:651c:199f:b0:307:dc1f:e469 with SMTP id
 38308e7fff4ca-307e580c5d1mr26440881fa.20.1739040158468; Sat, 08 Feb 2025
 10:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <Z6eaDuXnT_rjVSNS@thinkpad>
In-Reply-To: <Z6eaDuXnT_rjVSNS@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Feb 2025 13:42:02 -0500
X-Gm-Features: AWEUYZka1JKrPSYInI4GKv2M2y8rfwixxdFsdqTGcwpCPpsY53i6WsWMtdiDkWA
Message-ID: <CAJ-ks9=f8d7jh=15bHc28Z37p9rA-Kg4J2mQ++VBcsesVvezUA@mail.gmail.com>
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 12:53=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> [...]
>
> Take over means that you'd at least add the Co-developed-by tag.

I didn't use their code - the thing being "taken over" is the work of
having these debates with the maintainers.

> [...]
>
> KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> boot-test bitmaps. Even worse, I'll be unable to build the standalone
> test from sources as a module and load it later.
>
> Or I misunderstand it, and there's a way to build some particular KUNIT
> test without enabling KUNIT in config and/or re-compiling the whole kerne=
l?
> Please teach me, if so
>
> Unless you give me a way to build and run the test in true
> production environment, I'm not going with KUNITs. Sorry.

This is a question for David -- I don't know if this is possible.

> [...]
>
> This is my evidence: sometimes people report performance or whatever
> issues on their systems, suspecting bitmaps guilty. I ask them to run
> the bitmap or find_bit test to narrow the problem. Sometimes I need to
> test a hardware I have no access to, and I have to (kindly!) ask people
> to build a small test and run it. I don't want to ask them to rebuild
> the whole kernel, or even to build something else.
>
> https://lore.kernel.org/all/YuWk3titnOiQACzC@yury-laptop/

This is compelling evidence, and it was not previously raised. Thank you.

I notice that two things are true about the performance test part of
test_bitmap.c:
- It's a minority of the code in the file (48 lines out of 1462).
- There are no assertions in it.

Do you also find value in running the testing portion on other
people's machines, to which you don't have access?

> [...]
>
> Nice summary for the discussion. Unfortunately you missed my concerns.
> Which are:
>
> Pros:
>  - Now we switch to KUNITs because KUNITs are so good
>
> Cons:
>  - Wipes git history;

I was very careful to minimize churn, and the result is 249 lines on
which I'd now own the blame (228 with `-w`). Still, it's a valid con.

>  - Bloats the test's source code;

The test is 74 lines shorter after this series.

>  - Adds dependencies;
>  - Doesn't run on most popular distros and defconfig;

Yep, I understand your concerns much better now - and I'm grateful for
your having taken the time to explain and show receipts. Still, I
wonder if we can get the best of both worlds - either by finding what
you need in KUnit, or by moving the testing bit to KUnit and keeping
the performance bit where it is.

Thanks.
Tamir
