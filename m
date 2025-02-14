Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0708A18A6D4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739569635; cv=none; b=A9NA8sDvHNEAEOUZms/qcPJXDl+XQCG/Igt00hWeu57FKfRLTdlnnTl5oVSFQO/zhszmPmuHMsq8kfTl3bZ+r/GGGdLxbwxUJEtjPsxF5tBEbhECXjWOOw2sJmY7k9af+hnff3n4llzML8+1seuJpFM1ZpbeZjA9ssC8LHhwpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739569635; c=relaxed/simple;
	bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuW08USYLQE/0VFvNltfX3GWHV/rs+IM4p3B3ckXw5pc05WSMx7U++LuMWGcVYsM6zwv8XQcoFYA+FA1G6O8UAmzx843yJArsm/ygIiw+s7TMpGjhcF1sem9e+L9RRBQjpqxBIjMKY9zsG2HIx671MZYGpkHTFDHixBm1fb5E0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=cTdKiUoZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="cTdKiUoZ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543d8badc30so2939701e87.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 13:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739569632; x=1740174432; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
        b=cTdKiUoZP+IMPc1P046JkfKAqYBEDHlnQGbenB70LtGCSaEPJz56FDtwf4/Q/+JGOJ
         5TkfwANDvNv3zaZ+Kin4Nq+51jxOX1NMNsrWBrvvTiaPiG/cGEsUfU98fkI7jhCKUZQz
         jUwhRmuVPbyuYPxNUpmHCO55dKSkQnE+jKRk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739569632; x=1740174432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPrHjyB7ZPEKXqDVTRDLXSWkXWDHoJbDt80UqOOKgaQ=;
        b=qgDiMqKNPiDGJayf03q05Zse/QagzC8fy0d2UU9BdBQ5GJ4vrB06oc1aLLhSf9gTRc
         Fnfuq+STvgH23eZniH+0QSUNzrCTq6V/aU66IG8+2oennWxgw2U+UBlt3H065xqouXIs
         FJe3rdpaKV9D7cKmz03J7Pp4L+Re4HtLprsYNZ0M1K12U27on4VZBw+J5DtL8ZG4uREe
         kIl4BO6ORhAuQMaSaAX4TZjLkNok99Rs4N4BtMS2ADpcxSPsE9JtHA0yO2iUnOiTTp2M
         dKSRPje4OKJSlXzuvbNcv1S5/TH3aBYq2Dtu6tLl1zd0zJngc9WxL3GnS9ol1sDtarXX
         elVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWZoyUJ7Q5UROnnF6HydUY/ZxkUukD3sHjRlD40YJVPkgjYtFDgqNKFwTvwyXRS9JH695HFtOS9jb/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy8/KcRthqJaWHZ3LH0eUz5ehmCs/kygZ2UdWNmyKCb2GDb1uOk
	ZCwZTMQKfH1BCR5qZRpIQZtNvKOqgqwqgKbnGqw1mFrt2NVv8O+KZ+3POQ2B8WF8EDT7vFrgSlc
	BP5mYUTOrg2vxP0crv/H2ys5cz0qk8i1yUVzwCA==
X-Gm-Gg: ASbGncslGe3fezekVzUShyNgdEfTnz0S2WzZizYn4eWht+/PV2ZZxQZJK84UgwFIKWx
	laNqPEBQfZotiCBua0v9SgAZCDOYqvzk8deFRaQRmMd25hHWWFt+v19caxH/QIuvCUUDhPbxm
X-Google-Smtp-Source: AGHT+IGZfHJGA1kl2ksp+VX8NZVZ/NtQgxO8KN5MDCBG/nThtsVDl27BgELuGsdF1JJSR2FyzMBbA6+syzVK0LhHZwU=
X-Received: by 2002:a05:6512:6c6:b0:545:2b68:936e with SMTP id
 2adb3069b0e04-5452fe5c675mr368049e87.25.1739569632059; Fri, 14 Feb 2025
 13:47:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz> <Z69oxhkUzTfJ6YKi@smile.fi.intel.com> <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
In-Reply-To: <CAJ-ks9mck4DzX+WANxKSmcN=mP9ztgwWETXLmX_F-gy=EhmLNg@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 14 Feb 2025 22:47:01 +0100
X-Gm-Features: AWEUYZliySt2EpIgG7ZYOAvFUg1UiYEq1P2CaYZ90n2fK0WzUtLwjUi2YaJ10pw
Message-ID: <CAKwiHFjnY-c01rvkzNRz=h=L-AxRMyUtp2G0b17akF82tAOHQg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
To: Tamir Duberstein <tamird@gmail.com>
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

On Fri, 14 Feb 2025 at 17:53, Tamir Duberstein <tamird@gmail.com> wrote:
>
> On Fri, Feb 14, 2025 at 11:02=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:

> > > I have just quickly tested this before leaving for a week.
> > > And I am fine with the result.
> >

Thanks, Petr, for demonstrating how it looks in a failure case.

> > Seems reasonable to me. But I want a consensus with Rasmus.
>
> I have a local v4 where I've added the same enhancement as the scanf
> patches so that assertions log the line in the top-level test.
>
> I'll wait for Rasmus' reply before sending.

I think all my concerns are addressed, with the lines printed in case
of error telling what is wrong and not that memcmp() evaluating to 1
instead of 0, and with the final free-form comment including that "ran
448 tests". If you feel that word is confusing when there's
"obviously" only 28 "test" being done, feel free to change that to
"did 448 checks" or "did 448 individual checks" any other better
wording.

Rasmus
