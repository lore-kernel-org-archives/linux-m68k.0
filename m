Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF321CC69
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 16:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364904; cv=none; b=IlCnmF4LKgtYADKpCF8Fwy3nw8HtDmcjJZNLrvnoZSC/cx2ft/t2g3bpOGrpU82sp1tOFNMnHjGFBnXhtBvwnzJI0Rg/nsOXpQFr9IYpUWdmh1REeG9mym1L1mTsVcGZf8m19C7fHJhv62Vidj2NmH5n8CNXzgfrmhJ0+dwot2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364904; c=relaxed/simple;
	bh=VxcHd1H17cUMYI5rNpPX51cxBoA6PriWVOZUqZM5llk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmrovpGzNUJtwZySqlUB2HtLZTjEmwt2UiTFJOEVRB75D5u0rcJJt5wxIKN8669iTakJUkhtDMXd8SgKO+nJKHuuPVENh79G4V3BkL/LCvlpBXV9Tshqej6H/pIHIImtlsEGsuUEGJyXlh3bDtPQb+HW2rdleeU/GeL5jyQvhMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlxdAss/; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlxdAss/"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30615661f98so21120671fa.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 08:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364901; x=1741969701; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LDrfNP0P1DLF6th+Id2FgZJU1V1LRDhdOalVdghfLk=;
        b=LlxdAss/IzTBqd83Q694Xwy+9fcFZEnluN3xHl7UbX5y6DA+dOWE7B+9Y1LUqwe+lr
         xyU3TlnBwFCa5orjNvPw1+1RScmbL1O9aCpWpoZm+dFD+7W8fxUl2GyI9NxedcSa3m32
         luuy1RKLanjNgHKL0LX09GmCQG0/DN6Qi5FqFK8LmLEDYF7KollL3yQA6dFajwZTpvLD
         jG+k5ms8cWYaRpC0RSi5guZ8FczPPj10c2TEFl2Y44rc7VZACJRuYSUI/ZMgNvsqQHqh
         2TwLK7piPK6hk4EB334E4/+5x0JfkT8krZWGgAdwE2xWZxsa3RGxvkCzNsnrZPUPF/28
         lA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364901; x=1741969701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LDrfNP0P1DLF6th+Id2FgZJU1V1LRDhdOalVdghfLk=;
        b=p8k+fwLcy83YMsXpjDTCTKD7/9HOf+/8COOu+6KVsqD5vgTrIVfc0JnVuClPk8DWEs
         a4jB8jyTMQdz3XKFYvhyyOzgXJMdE1+VoaQB6ewoEW8etEFk+ghtjrGjK/WNaZDqIADk
         yd0/uIVGSJJ1Z0v8XBKWkv2ChRX0LHPtXTF50vdRKQFQif+9yKB5TSgfrz8AKKMr+fhX
         5BKpyHQUVj5fG0e3qAX2CqqHGnF2I1YgoxFDhQcTQhuc5Ps2q16EKuDfhaajF0jsifZb
         eo03947nccS0dpVDo6EBurZTKoAsjuJRIOEiFXvbkjaxbM+JCtE5o9RX1afHOUlFi1bV
         eNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaiOAbkCQbBNe7T3iq1+8tLd6qLJT8e9Bt+zpqsa55OBI2G2Nv4w59R/1nzHQRpLzlFE6U09fdbLuR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy1zFg2lLBynYRF/Ymz/un9GhU45V294kMmtblopNlJy71Ewqv7
	6tnR2U7i+vRS8bpLzuJLRvPgbJ0vfcRln/sFX4kZXovnl93Zp48Ekn+w6y2xJx3QXgWJ+xoudcL
	L3mGgS+0SagyJuCI+S1SNWY1f85w=
X-Gm-Gg: ASbGncsxyJBTnbNeYshUKsScbKLffTsWf5fPTSKTuMG4UE+LigRrZJV8BnHGV/iQ7ua
	xFwDbyy/0L85hDgizHpGdFhaTtoj5jMwhqNdFgxc9oKMjKYDo3RNbZATNF3lN6FLXfV1V8z49et
	8AYMA5x9mRrcrRHabGjB2+nHpdGLsGFNZL+6lpKVvE0P2MhEQZg1RtkCDR9yLq
X-Google-Smtp-Source: AGHT+IHx1kUvjF00AHJ9J3L5ITEytbdRfQvXtFGFxoLSrqiRjEGD72zbGCOCsERKFlZxWvUyGiVWpVwdMG0d68/WjgE=
X-Received: by 2002:a05:651c:1502:b0:30b:d187:622b with SMTP id
 38308e7fff4ca-30bf452957cmr18814461fa.18.1741364900897; Fri, 07 Mar 2025
 08:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <Z8sYOm4qovtdOSI7@pathway.suse.cz>
In-Reply-To: <Z8sYOm4qovtdOSI7@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:27:44 -0500
X-Gm-Features: AQ5f1JqgJJnekMi4RiL3kK2pqFYWGaUWb_12GtlPRw-AyLWVF2WVbXCe9PmZGXQ
Message-ID: <CAJ-ks9k5wLpeg7JFL-T6SYN62y7FWeQDbS9Q34TC-zY-dyM3HQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
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

On Fri, Mar 7, 2025 at 11:01=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2025-03-06 09:25:43, Tamir Duberstein wrote:
> > On Thu, Mar 6, 2025 at 7:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> w=
rote:
> > >
> > > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > > Convert the printf() self-test to a KUnit test.
> > > >
> > > > In the interest of keeping the patch reasonably-sized this doesn't
> > > > refactor the tests into proper parameterized tests - it's all one b=
ig
> > > > test case.
> > > >
> > > > --- a/lib/test_printf.c
> > > > +++ b/lib/tests/printf_kunit.c
> > > > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int el=
en,
> > > >       va_end(aq);
> > > >
> > > >       if (ret !=3D elen) {
> > > > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d,=
 expected %d\n",
> > > > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d,=
 expected %d",
> > >
> > > 1. It looks a bit strange that the 1st patch replaces pr_warn() with
> > >    tc_fail() which hides KUNIT_FAIL().
> > >
> > >    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
> > >
> > >    It looks like a non-necessary churn.
> > >
> > >    It would be better to avoid the temporary "tc_fail" and swith to
> > >    KUNIT_FAIL() already in this patch.
> > >
> > >    I did not find any comment about this in the earier versions of th=
e
> > >    patchset.
> > >
> > >    Is it just a result of the evolution of the patchset or
> > >    is there any motivation for this?
> >
> > The motivation was to keep the width of the macro the same in this
> > first patch for ease of review, particularly in the 7 instances where
> > the invocation wraps to a second line. If you prefer I go straight to
> > KUNIT_FAIL, I can make that change.
>
> I see. It might have been useful when the patch removed the trailing '\n'=
.
> But you are going to add it back. So there won't be any hidden change.
> So I would prefer to go straight to KUNIT_FAIL().

=F0=9F=91=8D I've restored all the newlines and added a few previously miss=
ing ones.

> > > > @@ -842,13 +836,15 @@ test_pointer(void)
> > > >       fourcc_pointer();
> > > >  }
> > > >
> > > > -static void __init selftest(void)
> > > > +static void printf_test(struct kunit *test)
> > > >  {
> > > >       alloced_buffer =3D kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL)=
;
> > > >       if (!alloced_buffer)
> > > >               return;
> > >
> > > I would use here:
> > >
> > >         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
> > >
> > > And move the same change for the other kmalloc() location from
> > > the 2nd patch.
> >
> > I didn't do that here because I was trying to keep this patch as small
> > as possible, and I wrote that in the commit message.
> >
> > As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
> > back to an error return in the 2nd patch because this code moves into
> > `suite_init`, which is called with `struct kunit_suite` rather than
> > `struct kunit_test`, and KUnit assertion macros do not work with the
> > former (and for good reason, because failures in suite setup cannot be
> > attributed to a particular test case).
>
> I see. KUNIT_ASSERT_NOT_NULL() can't be used in the .suite_exit() callbac=
k.
>
> > So I'd prefer to leave this as is.
>
> I agree to leave this as is.

=F0=9F=91=8D
