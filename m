Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED526289
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Mar 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741438327; cv=none; b=BusJhpAar2PK0XaTrJh/j1xD35LlcA7Lv3yfRyHzoDTgcSlOdl1Z5SkVtUJ6Wt1OnzoruJcHC4Y38ufh+0XmEr8C+1950426AwsZj9mPEdq7gIGjJPFo/dmLnhz2c8W45V/jNWXfuu7zwgReMz/pTkbhb025+6mm9hYHkNPImu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741438327; c=relaxed/simple;
	bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bafYscWi/iJDggG5ZoOhVVt4ILnHoD6DNqwPcji41Gf4CEp+O1Ldx5gzJHpOw/59OUssVk+IONt5avW76HSAWGiaXB+4ZY9f3crhzNBkINI2v6jOC4XB7mVVnRNcAvHwmnUDM3btzxVq5jsYhZsDMM7Sco8vk9tx2IvL7HvO1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5ZimFYh; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5ZimFYh"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfca745c7so10230301fa.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Mar 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741438324; x=1742043124; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
        b=K5ZimFYhQ2d6g0Vi5BW7boweDvmbRR7DOB8Gr1Ugai2YE44BU7tRHl4jnjfj7OMRJP
         gzvUC+pMGWOTun3v/0FmiPJZn26/Xd8yOarq0c6q759WjoN9diNmsgkaiikAqTDUjs8I
         2du453QPoHtmHhVmwQ/FJhPxGV5RY2KMpG9fjz2sEkvbDVZUhIApH/MVVUmqck8xLtqX
         ulgAGl3Uzx0u5AGwZghTou6Ve2HJfF+x28CCHvfPoF21Ba+JiWqZnnjrfpiGn2OvdAHG
         ToHi8wlRBg5pZH/QZzCQYPSwLIQXepteXCn747XQC+ht9Y7vEIyVU1GO+wCUYC2JefAK
         V9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741438324; x=1742043124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljcSe8icqYARGbv2/xhAvm/DCpz0wTGWoW545h+pz7A=;
        b=oHnYp34wKEN3s7XnGgVWJlm8XezCr0xzx2HUH3e6IRZR8VA/P6XBC8z17u1yOiQ653
         K08PaH9VnkgbgTaAZRsqQKYDd0zve4qJiIcB8qwck981Mof0c8eSTsNF3zGwpIWyWCku
         gTAx85LC9RpMUFzb83AtFTSd1IVXDf4WMRkLEsAAeJSkPvSIeQ2KoS/UvGhp1rmQwvkj
         saPH9ip/fp7JobIw4OjOU6zyLBxPfGmReozcxpXrMVAdgpRwc5KJ+bYdW1WdgxoGPbvP
         k/qPiyJffUL1BA2PCdtPUC6FXmKu2cDGkKENJ9XXmG8hZJI0RiAkp/K9TYVNA4dizw0O
         yBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXym5HQXNjSTWD4/YBLpRNTInCjkbXAgMzchFD1gegDFIofSwhrF+aILnSMvdQcy92J9LLpTpzE3Arg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz2vBTyDamMLtpMaND4zE3bh5y1KC0wtXh0I/7Ak9k9ihzLFejF
	ZRytxA9fCWlC98yJjREy220RIS87+m3WEt4ioG9ELX/3EVq9di5fDF1HjbDmqcsMi9oFPlAK0bD
	5p+w7aDV5ipmS9CO2VQuCw6tbwgQ=
X-Gm-Gg: ASbGncvIvO0VwhLTowoK5zNTXfvVryUuDXVUBckc881/vbs61Z+ZX5E9PcXVwvo76nE
	ATek6B34lQJsJO3odXPK8AURM0U7ZLICjJTe5PBOtve+G4xPnpuaFJB40asTnhDeti4Lxgk224T
	h0S63s2Dx2q4o2TurJv/qryyJ8H3UEYbbdvO4m46pgqZuoNS5V2IIYNOH8mWNA
X-Google-Smtp-Source: AGHT+IHdstqcViUgKKVj/dxOVnnCRmRtk0n+Jmb8EXvBPRxEstCxyV8oevucwu1Qdxz344u8wFGVHkGcozJRwQRyjxo=
X-Received: by 2002:a2e:a495:0:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-30bf4535ca8mr20702861fa.21.1741438323386; Sat, 08 Mar 2025
 04:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com> <202503072046.34DAF614E6@keescook>
In-Reply-To: <202503072046.34DAF614E6@keescook>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Mar 2025 07:51:27 -0500
X-Gm-Features: AQ5f1JrzFDCikkubFSehWJW1k-o-BEpIkGHx4XfrgD5nfeGf55hOd06bCk68tB8
Message-ID: <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
To: Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 11:49=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > This is one of just 3 remaining "Test Module" kselftests (the others
> > being bitmap and scanf), the rest having been converted to KUnit.
> >
> > I tested this using:
> >
> > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=3D1=
 printf
> >
> > I have also sent out a series converting scanf[0].
> >
> > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386=
d7c3ee714@gmail.com/T/#u [0]
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > Changes in v6:
> > - Use __printf correctly on `__test`. (Petr Mladek)
> > - Rebase on linux-next.
>
> Thanks for doing this!
>
> If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> infrastructure in lib/tests/ exists.

I think the plan is to take it through the printk tree. We're still
working on it, here's v6:
https://lore.kernel.org/all/20250307-printf-kunit-convert-v6-0-4d85c361c241=
@gmail.com/
where I've rebased and put the test in lib/tests.
