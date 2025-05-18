Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9628F4
	for <linux-m68k@vger.kernel.org>; Sun, 18 May 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747579234; cv=none; b=RZ1B2f7twC83cdGNqxjVoaNxmcq5aPQmTv1LxRQhi21zljlgHiCdcDY7l5N7xpT7d536UCw70c1Sr4Jt8uisxr0P0zppjZvEsThzDIT0UkWD4PzdeEuI75a/rycZoFSrBorF9p3B9CBuDeSppI4b0zlxuRIeKOQmG3CwthzIDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747579234; c=relaxed/simple;
	bh=1DW+Bz+mLDf74NQ7LYX48gqrmjtISvQn9OXeLtZkns4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaZV6am6pJG90G9yZVhPYHJnLLl2OAFkAYoDazCGAaCC3w3fzBpudXT8ZPiTg/Qd+QCs1rva6pb+CW3UruYKyfhdRC3WaAMXGIBKsp1HWBTmdaOJcKobHzx9nfdpWemGiJ1FWZBumu79iZ+C0KgNtIh7sVNRlPk6pNEMQLTnOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS7HJ82a; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iS7HJ82a"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b89782c3so37813671cf.1
        for <linux-m68k@vger.kernel.org>; Sun, 18 May 2025 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747579232; x=1748184032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7g6ulSNqvbOBGWyEqmM1ajFaBVn/GuAzgVj/wd7/gQ=;
        b=iS7HJ82aO7c77L5dNWsBKWHuedq7cff3lfmOXMZEGZtgIpTAZJpzBWcIbj4G2h6kMC
         hnQq9qXEqX7gry25D5WrG+0omyHbhccemnD+TiovHNmgNAqfO/0TRQX2xBpTRHq2vZUB
         /W13g5hb5YHnR8oURIYC2CIHXdXNUNGZy3hPLhbknJnJNINPo7+/OgCO2LZ94edBJpS7
         iD2cOf0HhalkvNuSgyY5nvstqZwVVmOGVJi/wgYpw16aNgRF9gk3to4zRfXZ4Kz69dKQ
         Do9vNmRlPWe8LDaaK0+r66Pn0esUevo4+kzL1mpvDOQbr5wswhMLxSAGM1bFCWF2+nm/
         DYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579232; x=1748184032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7g6ulSNqvbOBGWyEqmM1ajFaBVn/GuAzgVj/wd7/gQ=;
        b=bVfeCS3JmpNBYpEcwXZmva5wYVISBhX6U6K4mXZ9XtruLnkjChtcBP9q6H80iXDLgj
         vpXF6BXumFqb5wkBUX3asHYbX0OLAvc4CqjFoVpIyVps1SpQP1qe8IP/Jhu4G6gsIOsL
         6MhPdSLX63if9z/dF01CyFGwXK/7unR5KwkPN11r/gVbtI8prrToap/Md5ed1ipOoep+
         yK5/QXlTS7aDGaANcF7BmGT5ozQUxhyEqgHsGlILseOZ+Pam5bqn9z8mgOXJ7DRQ7Cni
         l0phdbFKkgoatU/QJ/J65GHzT8OjLAyVhLf993LKCs5z5NhHpTKI6pkdBQkPc7IxPUIK
         7J1w==
X-Forwarded-Encrypted: i=1; AJvYcCVYC86dkQJxEOrhszmysPwSby0nmIbc9Zs9u9/8gm58P6ne9U3CHAgG0xDtqfuiWCuZikv8k6C7Cq0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4YYkBP8ulO9pgnFRoBV2GYdJmUwfSAhTmonSuSQdE75rLJlQ
	jdDD8AApTdYdmqbDH3zowIa/eFLVEt7HQI7pH4pOtZV8iQkK+rhvNCVyQhoLKQZ9oW9n5YaGEBn
	wMTk0BvAtECKDI0YpAWoGJvjOOqNQbA==
X-Gm-Gg: ASbGncvXhIajm3XVhE5xjJpocwWl5aRxjiHEKa01fjAVl3tD5acO1oirlnXPTF+NulG
	1WPjjxInXul+QeyXeQdqQtyf3ZiyO0xu+R322HfG44LambYck0nwMFW95b/jHGaaan1qq53IKn9
	S2yP1SiWPJA+NHneVU5PcaxAAux4tGpMs=
X-Google-Smtp-Source: AGHT+IFOfNuPiUGO8LHjTTvJzspklP5Ms2wp1O+liovC4OhAeKNtnuoMK/gusywvEFhSPRUiqQGb8plvXuco9TZyirs=
X-Received: by 2002:a05:622a:4083:b0:497:7110:2005 with SMTP id
 d75a77b69052e-497711028bdmr54089021cf.24.1747579231654; Sun, 18 May 2025
 07:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
In-Reply-To: <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
From: Antonio Vargas Gonzalez <windenntw@gmail.com>
Date: Sun, 18 May 2025 16:39:55 +0200
X-Gm-Features: AX0GCFt0KyWUnUe2rVIGevUzLDXM_MPhWv6kt1kDOkN3gh7ebowAGCnPYyRkgSc
Message-ID: <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: James Le Cuirot <chewi@aura-online.co.uk>, libc-help@sourceware.org, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 9:09=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi James,
>
> On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> > Once that is agreed, I'm happy to put together the patch to automatical=
ly
> > enable the flag for this tuple in GCC. The part I do need help with is
> > necessary changes to glibc, if any. Assembly is not my area at all, so =
what I
> > came up with here was a total guess.
> >
> >
> > --- a/sysdeps/m68k/crti.S       2022-07-29 23:03:09.000000000 +0100
> > +++ b/sysdeps/m68k/crti.S       2022-11-30 21:41:52.710135230 +0000
> > @@ -56,7 +56,7 @@
> >  #endif
> >
> >         .section .init,"ax",@progbits
> > -       .align  2
> > +       .p2align        2
> >         .globl  _init
> >         .hidden _init
> >         .type   _init, @function
> > @@ -74,7 +74,7 @@
> >  #endif
> >
> >         .section .fini,"ax",@progbits
> > -       .align  2
> > +       .p2align        2
> >         .globl  _fini
> >         .hidden _fini
> >         .type   _fini, @function
> >
> >
> > I did try this out, and it largely seemed to work, although processes
> > occasionally hung. Perhaps this was unrelated.
>
> I was just looking at the necessary changes to switch m68k to 32-bit alig=
nment
> and I'm not sure we need to do anything about glibc. I am documenting my =
current
> findings here [1].
>
> What I have found out so far is that official ELF ABI documentation from =
AT&T
> mandates a default alignment of four bytes and any SVR4-based distributio=
n such
> as Amiga Unix and NetBSD/ELF actually adheres to that. Why Linux uses a 2=
 bytes
> alignment when the official ELF ABI documentation clearly says 4 bytes, r=
emains
> a mystery to me.

It correlates with the default in AmigaOS, which was originally
optimized to fit in 256K of RAM.

> I'm not even sure whether we would have to change the target triplet sinc=
e the
> current implementation for Linux is actually violating the standard and a=
ny
> application adhering to spec written for Linux ELF m68k would actually no=
t work.
>
> Anyway, looking at crti.s for other 32-bit architectures such as powerpc,=
 I'm not
> sure we actually need to do anything about glibc. I think just changing t=
he
> default value for BIGGEST_ALIGNMENT from 16 to 64 similar to NetBSD/ELF i=
n GCC
> should be enough, shouldn't it?
>
> Adrian
>
> > [1] https://wiki.debian.org/M68k/Alignment
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>


--=20
Antonio Vargas Gonzalez | winden ^ capsule ^ rgba ^ network ^
batman.group | +windenntw | windenntw@gmail.com
