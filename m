Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11471C8623
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739569943; cv=none; b=ga2CtL4Q32kIfpHeakctLlqza7rE4/gg8pM+M9bcgkGFOpElGBGAbwTrGfapQhCs/P2b52TCt7nwHCQ864l1wFvuFQ9Ir0u4YykVG658vAhNDPlSdNTxykDxqGvJ32Q4gan4nJlhPQ7V9Km032y6gBtw3bky3Q5TImYum1Oxbk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739569943; c=relaxed/simple;
	bh=/KKHLAaMFAEPJleSikTB6lnzt8UjdnvqiBRPZj74hNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrpMd7CjmS7O9muZixpkBmx42v2syDbbBas54+i5O9h3r+qMjaaiCBdqJtJEx3v8+n/k4E9S3ChDiBDB45QqWzc3OgeB/jm07WmCILlzwv6JEXxdKrThg7zdaZgyb0hLD95Qc45gAZZBi/OH+vO+4k0zP0vD5SVk13MJFCU65kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYUlagPM; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYUlagPM"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30613802a59so25879771fa.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 13:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739569940; x=1740174740; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRqlyd6oGO0KdHznSNNqTI/AEXRx3zHfr08E+Px4USU=;
        b=EYUlagPM12ZdrHM8uK5Coen2btRUdRrU9bpmLuw02kh0ikQOX6QP8f9hhL9nbHylIG
         3qKKoHIjYp9HYBsNYmh8kYourLvkMZ1wjspI0h37ZLQsHqYcli+ZodtsTuencCbkAtDC
         OdGDclB4Ezt+M+12psfgnMa0IY4okZNpb2dAJ6Mvy1ds/BPtw/lmK/ToFVa1BrK+fMUJ
         +1esoUWdQtnhou9P2QTfRTpdO2pNghjGHO/+P8Kn5TQ6joqUJJwIjM8z1zdkxfxvGq4W
         sOP0j6YUDmEFxULikdzHB7eBKQkDZ5wSzxvHSUMW2OuMaHXck8ygtFkmMM4Dd48uJn12
         q7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569940; x=1740174740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRqlyd6oGO0KdHznSNNqTI/AEXRx3zHfr08E+Px4USU=;
        b=EnDG/5fAYX+ZB3FR9F4jdVqs9c9thgIL/jrgELHh1i8i6ykOfDfbNQZcpW9KUqxedN
         +o0Gz8XkKLGBwx5XZL+EN7JIB1Th/sNfrvoZvHirv62WgVn7XyjY9t+OFvwjkN0jQdnD
         nsXxRu8bcT/QzR576HuRfs07b37WVYnaEorJOoE++HfSe8XzQ3//mp2oAFLLdpxMsMi4
         arOHGTuYLvex13ZR7mf102TMHzpV5P5+V2gChgvc+1ROgcCbtoCxbGrOZhD75Vp82324
         0/tj0RHRDTnoR5cudkd7MVKIP61/FMgaJTzAuflrRzy7TGNaUs3yKZeXLd0BoQmd4DD4
         c5iw==
X-Forwarded-Encrypted: i=1; AJvYcCUjGKKdoqYuzgkLDXKIGBrC8bHOmOCBW8Nv7do7nr0WeHbyAvmIEJjj64eP7jX/APLboseb/I3QzqYg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzA+pK9C5J39i5gu0qGbvz20foKN8wqLJkyItNfOxFfb6Huddsk
	of4QpNoXEvVZ0CFdbtVCYaRLSwpmhLIEj3ITMkVgya4r7uJyTDKwPR/8peYc1EWseufMuduQzZW
	aTRnlWdLHrgz3hzJjqzw9uTNEZuE=
X-Gm-Gg: ASbGncuzd/iXly3MsZZVHDTK61/t0W4cWiniGkgIwcv2XZarlwJsR3VCnEzS0QjCYo+
	hbOS2IV2XiIHSi8RhTnGqKk7eMZ1f01OAbgCYY6lZr5ZhtxMbia2Z8Ym6e22iD6NK1BkhAdJNfz
	fLEPHc/72KEX6a/9WMKvwNagQxXN9lrYs=
X-Google-Smtp-Source: AGHT+IHSpHMu+d9yxfeM9fhEh2exQCFb02zAuHKSY+JxD0Uew6ExTEbIBTjpVBPP5XMmM53Pc3kzV0IcmY9YkC9NKA4=
X-Received: by 2002:a2e:95c4:0:b0:308:ee65:7f4e with SMTP id
 38308e7fff4ca-309279505ddmr4289291fa.0.1739569939469; Fri, 14 Feb 2025
 13:52:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz> <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
 <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com> <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
In-Reply-To: <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 16:51:43 -0500
X-Gm-Features: AWEUYZlIzjGDNjdcMbGasiSVuX4TBnRVStLmaQbB724z7yxjnP4i1AoyHu0JSSg
Message-ID: <CAJ-ks9=T7JJ2W4+fDKeysQ9QOtquMHoGwYU3g8a-A2OJrgL9Sg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Petr Mladek <pmladek@suse.com>, 
	Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
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

On Fri, Feb 14, 2025 at 4:47=E2=80=AFPM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Fri, 14 Feb 2025 at 17:53, Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:
>
> > > > I have just quickly tested this before leaving for a week.
> > > > And I am fine with the result.
> > >
>
> Thanks, Petr, for demonstrating how it looks in a failure case.
>
> > > Seems reasonable to me. But I want a consensus with Rasmus.
> >
> > I have a local v4 where I've added the same enhancement as the scanf
> > patches so that assertions log the line in the top-level test.
> >
> > I'll wait for Rasmus' reply before sending.
>
> I think all my concerns are addressed, with the lines printed in case
> of error telling what is wrong and not that memcmp() evaluating to 1
> instead of 0, and with the final free-form comment including that "ran
> 448 tests". If you feel that word is confusing when there's
> "obviously" only 28 "test" being done, feel free to change that to
> "did 448 checks" or "did 448 individual checks" any other better
> wording.
>
> Rasmus

Personally, I don't feel strongly about this wording, so I'm hewing
close to the original:

    ....
    ok 25 flags
    ok 26 errptr
    ok 27 fwnode_pointer
    ok 28 fourcc_pointer
    # printf: ran 448 tests
# printf: pass:28 fail:0 skip:0 total:28
# Totals: pass:28 fail:0 skip:0 total:28
ok 1 printf

I'll send v4 momentarily. Thanks, all!
