Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760721D3ED
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363266; cv=none; b=uW1lkRM/EBwK3ncbBUdkJOuQNXJYp2m8uMae/Y1QwEYIyHsJ+wS56MUAXxcndZhOpzybCfcJ+lsbUx6rMYoWwrWR5fKFrg4e9mLW9oFse10rkQVVmmIqS3aT/P2H8v+9ZXhS1rhcdBIfUjgVtWNKNngk2ZwUkeItRfzkv4CeJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363266; c=relaxed/simple;
	bh=nfaBHRI0nmgDdOpIx0FIBplOt0pS/eaTFzN7nuHrHao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMbeU2HMyQiZa6rTbsnE+uDLyCQ9QcSh6P3YeIZRio/hij3zgYB2nEjwTNhO9IYpvwvussodtwQOK4CKp5+I9djPwUVzVS2gs47NQ6pEi5rgkTFdk91gpfLjmcpRqb74G2bFsJ9zE+8VrlR60naQGgye4rdPR5mj9+3dkn9RN8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RIOcWkUW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RIOcWkUW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913958ebf2so252275f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741363262; x=1741968062; darn=lists.linux-m68k.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=RIOcWkUWAsimmigjSVTt7YQ/FzzD9SIhR8WTdyayiPy5VyLnPSV3z2Xfmmmq3/C+zL
         WA73m6MFDnbaHjcQT8KU+duisxD743oALQq2od47uVzpNVLxNF7lhJ3sC4xMn2abruvB
         FidhuUJ/dX5gZU2+KZtmeMHGCTTIt2s6pgDai1sZ27tOsubcq6ZMTIuXUjReVgdV4Enn
         uCezWsc7PMNzWCSEaM3RWY9J/vEiOlIzpdLeMclPq2VG9LpcDwS9OtdL7Lr5EpRRzqm5
         +RWxlJ+cY/9T08jtAOjmgxEDUnxl2bmUVAWlzVemhFWVsKpgxcNwCKJqnz+nh+q+BYbG
         5BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363262; x=1741968062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=j48UQzcUwaHb/jZn0yVm5tb5FFpqcl9U0+ZjRecmB8g6dM0wYKjMlKIg8EHHlCesjE
         M6EQsAO9f8kvE7PE3N7mLSk4XK3OP9OOQ+Mn8lNaaI0WHaUuEbk+OUYjtd61D2JZS4Hy
         zmflXhelBzRe+HAoxZ1hUPr92QyDxKlFXiKGwc5KsMz66Cx0nHyOrQTpdUDeHbAIydT6
         8DjYreOFdgIQiFJySbqBZghc3PA82aKbu7xn9eRRxY7CGqjekTORi3gvDr6Q74M3NTck
         7eWJvtX5bzo+2mv6/WQZ1TARvUa0032MkeQXLIN4xlxsAKepeK15FA8mduYzM+znORsd
         gPeg==
X-Forwarded-Encrypted: i=1; AJvYcCXtw1jFWM5JWTipzWpWscQxQX7QBpV4GxPl0kh7nCPkcQzmjvbpenUEzdZ0VD5Z84KfItKy919vjkjb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxlnauOgLXkmB7WAB8UBp+m4BDu160kNnTYMryTm1xCJCuY012p
	ESEo05CDIo09/ca5YteANw6cA9mba7aftfjSuvVJGBmGypo9y/oROEwT0xDy/7A=
X-Gm-Gg: ASbGncty/MYV3fFWeBiKmKrdOzNFn82MbRgYt3/QY1huxmvJxDS0vxL44xKa+x8Vvzf
	oH2y923mAFNK5/dCEe00w/5pNrFjCbuEH3rp9nI31qlDHQTLEf2LZuFU4qXvxJ2TS48tn9RidRD
	IanHxryQRyTzIzI5kEy4nrJG1biAozKOqgaKx5trXLm+Fto/5ZggK/GHuqSjCU1K/I9FIK4X2sF
	ITzx7mzioDE0vsU+uO8HVOeCqpeu9tPp8txq7PQE6P4qEDGsz0tjF6SNbVrAQD9viZOrsIv4uH4
	60chq3G6275h4vljMfAHeTLn6noncPyXjLtkWpu9Tchn2+s=
X-Google-Smtp-Source: AGHT+IGwC5RdI2D2x8Mf/1yhLk8SnYyj3NhjKRRM+PHR4SpMZigqBSsZD7IJQFmATNxMAv0Q3Kbu9Q==
X-Received: by 2002:a05:6000:4185:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-39132d98d2cmr2269618f8f.40.1741363260299;
        Fri, 07 Mar 2025 08:01:00 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da473sm54801455e9.18.2025.03.07.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:00:59 -0800 (PST)
Date: Fri, 7 Mar 2025 17:00:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8sYOm4qovtdOSI7@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz>
 <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>

On Thu 2025-03-06 09:25:43, Tamir Duberstein wrote:
> On Thu, Mar 6, 2025 at 7:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > Convert the printf() self-test to a KUnit test.
> > >
> > > In the interest of keeping the patch reasonably-sized this doesn't
> > > refactor the tests into proper parameterized tests - it's all one big
> > > test case.
> > >
> > > --- a/lib/test_printf.c
> > > +++ b/lib/tests/printf_kunit.c
> > > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
> > >       va_end(aq);
> > >
> > >       if (ret != elen) {
> > > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> > > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
> >
> > 1. It looks a bit strange that the 1st patch replaces pr_warn() with
> >    tc_fail() which hides KUNIT_FAIL().
> >
> >    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
> >
> >    It looks like a non-necessary churn.
> >
> >    It would be better to avoid the temporary "tc_fail" and swith to
> >    KUNIT_FAIL() already in this patch.
> >
> >    I did not find any comment about this in the earier versions of the
> >    patchset.
> >
> >    Is it just a result of the evolution of the patchset or
> >    is there any motivation for this?
> 
> The motivation was to keep the width of the macro the same in this
> first patch for ease of review, particularly in the 7 instances where
> the invocation wraps to a second line. If you prefer I go straight to
> KUNIT_FAIL, I can make that change.

I see. It might have been useful when the patch removed the trailing '\n'.
But you are going to add it back. So there won't be any hidden change.
So I would prefer to go straight to KUNIT_FAIL().

> > > @@ -842,13 +836,15 @@ test_pointer(void)
> > >       fourcc_pointer();
> > >  }
> > >
> > > -static void __init selftest(void)
> > > +static void printf_test(struct kunit *test)
> > >  {
> > >       alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
> > >       if (!alloced_buffer)
> > >               return;
> >
> > I would use here:
> >
> >         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
> >
> > And move the same change for the other kmalloc() location from
> > the 2nd patch.
> 
> I didn't do that here because I was trying to keep this patch as small
> as possible, and I wrote that in the commit message.
> 
> As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
> back to an error return in the 2nd patch because this code moves into
> `suite_init`, which is called with `struct kunit_suite` rather than
> `struct kunit_test`, and KUnit assertion macros do not work with the
> former (and for good reason, because failures in suite setup cannot be
> attributed to a particular test case).

I see. KUNIT_ASSERT_NOT_NULL() can't be used in the .suite_exit() callback.

> So I'd prefer to leave this as is.

I agree to leave this as is.

Best Regards,
Petr
