Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8C85279
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220131; cv=none; b=HH2sPgjsjBTd99pnTzAmW3nNTqh+26vLq5egxxm+/LMEbBEkCjrDK9ht/v9DW6FPGOxUg5V5y99WtQg6mKYup61LoG3TVPG5A2lEpp1vbj/bdiTHaFcFtDplZtNZoaAQaKnMCkUxG4qJlIVmHRBGjVRBw7n3eBQ/p9pEitKFMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220131; c=relaxed/simple;
	bh=EJ2U0PBqYGloWqGwHp67L2zESA8Kvm6C7y+3Lwt/JAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2cPq5z2/R0m7mOxKA4sjh+QRkdtHRWSsCmLp7jCE7eF4KUOkXTcNj3ejFjeJgfh5pK6yHNcyjmyXB0OvISpyctPQTdIjPjz85N3biRja+wZWrpByrHY/XK+5yBOcAJbU4pIhYVD6VCghP5bcB/gDgeRL3fOBZpCO1HxcdmfndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfea5f628e9so260701276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 12:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718220127; x=1718824927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9H3Nrhjw0EDFs2mHp/oL+kQ0y9WJBzcaGC/TcFVbrU=;
        b=pDNpbDZWJIr4mMwL/hsCluTXXske90iOtpRFe/I8lW8zcXkRvEEc8Y8CndSjjJa+P7
         qQ++ZxPpEzEB+Z0FC51tcZ8GMgQk54+EmeDE5EoFJTBjLJpvPSnOZv8EfAyy9lUAZIX4
         Jjh+IFj+4euxC8FZPp9c6VHkW7nZb6Eeaop3MeIYe9hVPU7JSVIOGb58h6n7wFcSAM9M
         2+poSmsOWXVRlKcTrVXc7xHaRqb3JfyuAFNc31nGjV5PCXnD67OHp7Zo5uuOUIY2GHNM
         P1XsXjDiWdisEAUPRybotze96i3Se4S09nYbLE56eootQEsWH3ohsLQ/AmjKwIn4hEAw
         mIYg==
X-Forwarded-Encrypted: i=1; AJvYcCX2EN+OZTqBJdz7AHBtiF+iq1cJAWcG3BRQ3faMV9aj3MVoeCqILqmYRYOTFyzF/visAGzshBIfMd7o+MM652qiEJ1H+tgsdmF2r/SgCpU7
X-Gm-Message-State: AOJu0Yw7lis2SydfNYU9nhV0J19M+nD4XkIRZHxPEnPuOB86Wl6dAI3l
	sHeAXDFair38q9WkmKQZQxHgJzV7qlxalMQGDc/cYeuaqU2DOu/GyFX93sl3gZU=
X-Google-Smtp-Source: AGHT+IGaCU2EK115edGpF8nEwTMkXwn6I7zL3ki9MaTkpCLQ3zpgl12N7xSRDQehVA8ERy+a/LPA0A==
X-Received: by 2002:a05:6902:4e8:b0:dfa:5895:7814 with SMTP id 3f1490d57ef6-dfe67261a4cmr2576888276.36.1718220127085;
        Wed, 12 Jun 2024 12:22:07 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae52bcf5bsm2475488276.6.2024.06.12.12.22.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 12:22:06 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a0809c805so2789657b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jun 2024 12:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW9nzouhCkvh6IANO/KfAOO0NJzJDtWjJYFsazv4xUk3y9v+3XGbtVeLjWZ4ex0KMdKOVNozMMdlBWQax3r2oIcbtu7i4Y4YdnUJ90gn58
X-Received: by 2002:a81:4fd8:0:b0:615:e0e:d234 with SMTP id
 00721157ae682-62fbbde9490mr28515547b3.16.1718220126141; Wed, 12 Jun 2024
 12:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610213055.it.075-kees@kernel.org> <20240610213330.1310156-2-kees@kernel.org>
 <CABVgOSmFL50_qYOBROkE9LZx__W6MLnHWahGnAVuLBDVO4k1zQ@mail.gmail.com> <202406120927.3C64ACD6@keescook>
In-Reply-To: <202406120927.3C64ACD6@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2024 21:21:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsjy86z3=s6ipFSQrbsycPaExNv8oxrcL_8FhzabMoTg@mail.gmail.com>
Message-ID: <CAMuHMdUsjy86z3=s6ipFSQrbsycPaExNv8oxrcL_8FhzabMoTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usercopy: Convert test_user_copy to KUnit test
To: Kees Cook <kees@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Gow <davidgow@google.com>, 
	Vitor Massaru Iha <vitor@massaru.org>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Wed, Jun 12, 2024 at 6:51=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Wed, Jun 12, 2024 at 05:13:39PM +0800, David Gow wrote:
> > On Tue, 11 Jun 2024 at 05:33, Kees Cook <kees@kernel.org> wrote:
> > > Convert the runtime tests of hardened usercopy to standard KUnit test=
s.
> > >
> > > Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > Link: https://lore.kernel.org/r/20200721174654.72132-1-vitor@massaru.=
org
> > > Tested-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> > > ---
> >
> > This looks good, particularly with the x86 fix applied.
> >
> > It's still hanging on m68k -- I think at the 'illegal reversed
> > copy_to_user passed' test -- but I'll admit to not having tried to
> > debug it further.
> >
> > One other (set of) notes below about using KUNIT_EXPECT_MEMEQ_MSG(),
> > otherwise (assuming the m68k stuff isn't actually a regression, which
> > I haven't tested but I imagine is unlikely),
>
> I'm trying to debug a hang on m68k in the usercopy behavioral testing
> routines. It's testing for the pathological case of having inverted
> arguments to copy_to_user():
>
>         user_addr =3D kunit_vm_mmap(test, NULL, 0, priv->size,
>                             PROT_READ | PROT_WRITE | PROT_EXEC,
>                             MAP_ANONYMOUS | MAP_PRIVATE, 0);
>         ...
>         bad_usermem =3D (char *)user_addr;
>         ...
>         KUNIT_EXPECT_NE_MSG(test, copy_to_user((char __user *)kmem, bad_u=
sermem,
>                                                PAGE_SIZE), 0,
>                 "illegal reversed copy_to_user passed");
>
> On other architectures, this immediate fails because the access_ok()
> check rejects it. On m68k with CONFIG_ALTERNATE_USER_ADDRESS_SPACE,
> access_ok() short-circuits to "true". I've tried reading
> arch/m68k/include/asm/uaccess.h but I'm not sure what's happening under
> CONFIG_CPU_HAS_ADDRESS_SPACES.

On m68k CPUs that support CPU_HAS_ADDRESS_SPACES (i.e. all traditional
680x0 that can run real Linux), the CPU has separate address spaces
for kernel and user addresses.  Accessing userspace addresses is done
using the special "moves" instruction, so we can just use the MMU to
catch invalid accesses.

> For now I've excluded that test for m68k, but I'm not sure what's
> expected to happen here on m68k for this set of bad arguments. Can you
> advise?

Perhaps the kernel address is actually a valid user address, or
vice versa?

Does the test work on systems that use 4G/4G for kernel/userspace
instead of the usual 1G/3G split?

/me runs the old test_user_copy.ko on ARAnyM
Seems to take a while? Or it hangs, too?

Related reading material
https://lore.kernel.org/all/CAMuHMdUzHwm5_TL7TNAOF+uqheJnKgsqF+_vzqGRzB_3eu=
fKug@mail.gmail.com/
https://lore.kernel.org/all/CAMuHMdVQ93ihgcxUbjptTaHdPjxXLyVAsAr-m3tWBJV0kr=
S2vw@mail.gmail.com/

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
