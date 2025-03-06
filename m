Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AB17AE1D
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272146; cv=none; b=nXlrGV8DsWoFH1LYo6SOGmAQzLhS2gwn6n7gp6R+nq1FSQq8MRyFvagp8OV6xMCKUHNBkcMQiSooyXSVKcUJ6pLqd1ZiEOvxPO7QTAnS/lnvsFL3k3nn2EF/J6eHwB1tyIlbCj6/esiytUEAcBQ9MxPkTRIiVjkapmQAw4rK2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272146; c=relaxed/simple;
	bh=ONcS+jkAz8j6DNU4Ezy9NisVJDwwpANbFadbPYOR5JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJjElZeOsMty8RZ/GvdB8oiFXcWzdbcKhsGlK6qhMz54V2dEddnqGLcNpsROPuVcEuM+Vxsz/ffalDEkh1tyLMPbUQZJ5bMKaD5Uu3d+lonpoJMIsZRDV/oyXY1K9G1W3SZZXD1dCFH+XIZiPaitxesqNLDn2gUTWP4sH10Py+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcQyfTcb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcQyfTcb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307bc125e2eso7865781fa.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 06 Mar 2025 06:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741272142; x=1741876942; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCk+JJxMuH+7Xc7MK7xCQnQ/UASRlAowqMx07w+Zybg=;
        b=XcQyfTcb3NODSedt7KSWjbfgzYHlGN/iZh0QYbVwDeiqpnxK+k+hWfiSBykHbKlhdv
         71lrBcVbjWZ+C1O3BfJja/YqJFjBM07pfNQaMmWuKhySSXqksvSX4KShidKVqO1srabv
         JMPqz790XoyK6fZc2H5d3XFU4zazRYhrvahjAcMgLmazhyORAkuvYpSXbeQVKdMAr31E
         Ofmp+2J8lltn6ad+IhZ9luBFwtf7hLQouOtgIKACC0imWZ6qPmQrruocBu98iZ+usrdx
         6rpsGkAbpOr/alxL/oZwipvJ8IsHsT8itMihR4sY/Egt0oodAtypZv+tRu++ayP8Ecn9
         DO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272142; x=1741876942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCk+JJxMuH+7Xc7MK7xCQnQ/UASRlAowqMx07w+Zybg=;
        b=IGEdtny3AkaQURyeythrVNFvOSukQhEWUdAY8dlGDeInQPrVUn5/n1VFApg8ovYRpI
         slxz9pbvZPSEmRNU3QIgokcmtCzN+QScxBFYpiHi2TyYA4qvq6KKoDANENhoQ6zy+V56
         AQ5GRbvnmd60o/Chz+pNT65Q2KjXaDRhlXHYojlk9znRDeHhjNbYDO2+dHZ5ZeGDHky4
         wWn8I9cAU7+N+Mk+ICZMEpaqYhryRtJ1k0jHF3FEcqrZcRxJc/L6OiTsjT9k/speS6vB
         yNqrEY307DPncrZGos4BxvSbwIa5j/WTCrzQrQwRaPeIxukLsETNnE2AngVrWd23cor2
         Y6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkp4ouyClV5VaEPz9wXRRTj9f5lTYm2YxV522xBTG0VVc9FnpFDaiKbSII86eP17XrA5nCgMQhUtyw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzMP1Asa0hkZDbQA8V0HgWWsInGg6TXNA4yFRhROnnxesfOsyRl
	KFeS73u90aP9ZuThMID/Bvc3TBNlCxEXYOaGJVhN+YgVzgvuDel1Q6XIOPFWdQRJ8QQsj7LDMLV
	eIEdxJAEImvNgIjulcJHUTf3KbEA=
X-Gm-Gg: ASbGnctelNvD2n0Ld3tdI+ZQDthGRSGZF6+21zRF/tGfoz1JEtNegHttOKcEdE0lVki
	fS+MUfiDXjXFaZWtqO3ObavWdJ94n29Nhp3C8LhLKll8jnyyx/8eYLjce59GAd6sNG4ThvIluXf
	tXVy6KJ0P75WYxcl17K2e+X5ZPUfAULE0L+SIYevmPmQ==
X-Google-Smtp-Source: AGHT+IGOs0tm+vlePSriOvo4exloY4uff5hQyhMGSFCdw9I6NO0PFz3l856QvBjOCsMzUglvlxiovip4pW93x04X3AQ=
X-Received: by 2002:a2e:a78a:0:b0:306:1524:4a65 with SMTP id
 38308e7fff4ca-30bd7a5453bmr26242801fa.20.1741272141974; Thu, 06 Mar 2025
 06:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
In-Reply-To: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Mar 2025 09:41:44 -0500
X-Gm-Features: AQ5f1JpJWKoqf6Ad0yhsZAI6HTLS5t2uCBoOGMRrpWewZnGmz7aTZFflUPyKXMo
Message-ID: <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>
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

On Thu, Mar 6, 2025 at 9:25=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Thu, Mar 6, 2025 at 7:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wro=
te:
> >
> > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > Convert the printf() self-test to a KUnit test.
> > >
> > > [...]
> > >
>
> > 2. What was the motivation to remove the trailing '\n', please?
> >
> >    It actually makes a difference from the printk() POV. Messages witho=
ut
> >    the trailing '\n' are _not_ flushed to the console until another
> >    message is added. The reason is that they might still be appended
> >    by pr_cont(). And printk() emits only complete lines to the
> >    console.
> >
> >    In general, messages should include the trailing '\n' unless the
> >    code wants to append something later or the trailing '\n' is
> >    added by another layer of the code. It does not seem to be this case=
.
> >
> >
> > >                       bufsize, fmt, ret, elen);
> > > -             return 1;
> > > +             return;
> > >       }
> >
> > [...]
>
> I noticed in my testing that the trailing \n didn't change the test
> output, but I didn't know the details you shared about the trailing
> \n. I'll restore them, unless we jump straight to the KUNIT macros per
> the discussion above.

Ah, I forgot that `tc_fail` already delegates to KUNIT_FAIL. This was
the reason I removed the trailing newlines -- there is a mix of
present and absent trailing newlines in KUNIT_* macros, and it's not
clear to me what the correct thing is. For instance, the examples in
Documentation/dev-tools/kunit/{start,usage}.rst omit the trailing newlines.
