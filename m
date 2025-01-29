Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5701FC8
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190026; cv=none; b=kLwbIvOIMcIdJYA5n+Hnavu9u+2U+B+rtjEEpFuen6Biib5SvOUJuNsAOBFFnYJAQpVAR5YR7PlYxAEaA53lOQ6sl5S1QV+rTVCqua9eEuNSwlNs22zjJlRCarGrhq+yJo++zpWy8btHPcDLCr6ayz+V5Pf7vutVMg3EsvBxH34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190026; c=relaxed/simple;
	bh=CUs4dA7/6BTxii3m1d76YX8eHpqNEmYeKmWTcHxidMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UEUl2Fytz61gncKU8kIhr2AU2oiGy46vyif0Ab0R551k8YPPQtdxFBI9nI2Ze2XeL61EH1/XQ2wXUyrabgwYttk1Zya+M3APmet1kaOiD41c+BzIiBDwfFHmgqTVZzAM8bzrQYje1CgycKCbKuaMj9+8ob+cWpfMG7dxQ0qt9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqTmoa7w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqTmoa7w"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso175540e87.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2025 14:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190022; x=1738794822; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=aqTmoa7wuy0w97kt+fNGoKPi4Z/CpJ+Np+21VdOYks+3lyxQDwDvxiDniaEGmzsDze
         d9WaMjf3yoOhxmWxua8x28LbY44M+u+WHpKuRUGTx7u+GSMIr+Ih4kdYtadEECgpvwXg
         wxEa1/FqAkS3kHoqnYMjCVO8cQM2dw/LvkksHTM5TWH9TyG3f75F5tTW8ADk9vOnLIR3
         LCpJ5tORmNgyklyl2tOtTysBqVcZBDmjJTVMGq0aQGeanBVQMoboVcLU2zZ4aPKGNDku
         ZL1VBwvrIZoDQvwep2aJAMxPp8UxDHXsqIfMvrFzg1XJEtRa723AaHz5dZ/AAuYarORa
         L9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190022; x=1738794822;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=RGJ2C154fiDnzsagpST4BlrIAVXWfUJZrHxjGjSWloykYXsSK2n/q9TjsF+JHCpsRa
         QYwG8zhXoCDWdyRFIRGnQ6ELy1e1vOEyz3kZJjghK/NJjTgEvICEUhy2T6IJCn3liUE4
         m8szhN5RVJrv6piaaDbba3lB/VoPBfM4uNfNrQ2kxzzwBojoWcknw7QXnSz67QXT9G6E
         8tl/OHwvIGirmfHgKfS/PVufeiYxDNyOYI4EgcmyGLsPUlZ8xCEWRrziUWd4ZdaG/Hg7
         z3YLDFkD7IkZQINSUIrEYjdgmuFPHGYbuJITMT1U4h3/tBdQcz7iQlwy6uo7+BHZPtZQ
         Fd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVYtFw70y39MipCvUki+fSqYWNEbwIkILlpglO6YN9an7GwgHIyCW66zsMwgyU2J4diE7ex0vUB7zK3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzUvs9BNHlMzVWLpJWHbI8BgvNNW28njCsoWHury3moVTFArjk/
	QYaN15gnXtJInDXXgrs61v66QMwVgwbwrW/+s3HQVIYVqt6Nba1FIzGxAQoWab+QO0tgugiRbFv
	ZYzlfT6NlE+gaU77cLy5N9mVg28I=
X-Gm-Gg: ASbGncucG6/HLUvA5eXEpmjj/SAFRf+ArkxPa7Rdg9dbxh4k4b2o7WjR9BIN+GkpD/h
	gCQpcUAER6MA7afTlPe0qNQaFAkmj3x0E08b09mKsekVUneq7zBEGJhSPLtqV/I1qFdGqgGHif9
	vUOOrfDpzc7VFB5of3KHYsbtBCQ3h7Fw==
X-Google-Smtp-Source: AGHT+IF2MeaNjouO8R0JM1et8QEoQLnG0VNYPnffzuMibc14Fpm6x8jD+8I3kdg8KrIHS3kDt2XsyPg6S66iF7JWajU=
X-Received: by 2002:a2e:bd02:0:b0:307:2b7e:6ba0 with SMTP id
 38308e7fff4ca-307968b8eb2mr17871601fa.6.1738190022267; Wed, 29 Jan 2025
 14:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 17:33:06 -0500
X-Gm-Features: AWEUYZmqB9KaPVADJVSl0RJAzYftKo4819o4ffb3JmJnxzxyng6OqI0KWIIVhig
Message-ID: <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, geert@linux-m68k.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 5:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Tamir Duberstein <tamird@gmail.com> [250129 16:29]:
> > On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > > > + Liam, Matthew
> > >
> > > + linux-mm
> > >
> > > Thank you Sid.
> > >
> > > >
> > > > Hello,
> > > >
> > > > I believe this patch needs to be reverted for now as it breaks the
> > > > user-space build of /tools/testing/radix-tree with:
> > > >
> > > > In file included from xarray.c:11:
> > > > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such=
 file
> > > > or directory
> > > >      9 | #include <kunit/test.h>
> > > >        |          ^~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > make: *** [<builtin>: xarray.o] Error 1
> > > > make: *** Waiting for unfinished jobs....
> > > >
> > > > this then prevents the maple tree test suite from building.
> > >
> > > How are grammar corrections going to the right person (but not the
> > > mailing list) while an entire conversion to kunit is not [1]?
> >
> > Very simple: the tests are not properly included in MAINTAINERS. I
> > sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-4=
82e31f30f47@gmail.com/
> > a few minutes ago for this reason.
>
> Fair enough, but from the patch:
>
> @@ -6,11 +6,10 @@
>   * Author: Matthew Wilcox <willy@infradead.org>
>   */
>
> -#include <linux/xarray.h>
> -#include <linux/module.h>
> +#include <kunit/test.h>
>
> ...
>
>
> -module_init(xarray_checks);
> -module_exit(xarray_exit);
>  MODULE_AUTHOR("Matthew Wilcox <willy@infradead.org>");
>  MODULE_DESCRIPTION("XArray API test module");
>  MODULE_LICENSE("GPL");
>
> I don't get why the huge list of Cc's didn't include the author who is
> in the git commit signers:
>  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=
=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D17%)
> Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_=
signer:3/3=3D100%)

I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
doesn't know that test_xarray.c and xarray.c have the same maintainer.

> ...
>
> >
> > > Does the patch really need to drop the module testing too?
> > >
> > > What exactly is the point of converting one testing system to another
> > > besides disruption of actual work?  Who asked for this?  What is the
> > > point?
> >
> > All this is described in the commit message.
>
> The commit message says you like the output more and implies you like
> the command better.
>
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.
>
> >
> > > Is anyone doing work on the xarray running the kunit tests?
> >
> > I was doing work on xarray and I was running the kunit tests.
>
> ...
>
> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.
>
> Thanks,
> Liam

For what it's worth the kunit invocation, while obscure, is
self-documenting. There's usage information that's reasonably
understandable embedded in the tool itself. I looked for the userspace
testing initially but failed to find
tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
meant to compile this.

Tamir
