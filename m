Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F823BD02
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364716; cv=none; b=dPtgxZ8MuYwXcjEKfVeKp7ht4Onc2yKrCl9BuShS8F0yZpeC42uJknL8+8cIrshZByPN6o4VmsWkClfduhxByKD4fEvvjFZs9lKy/Pg/PHkQz99AlYjXFr2lXwZL6F+ea0A1txdeySD5veTw2j78QDPpLl/KsGr6liQZmbFK/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364716; c=relaxed/simple;
	bh=pIN7bvF1ojgXVeTSfCcjU3c2uUORnFTlgctHnNFCycU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5uE1KZMGIxWSc7OVj/qFqhYE2pih75Wxh+csV9834QHxllrLbw52erlaoS7fGAmt7tpJbds69w3d42zuUI4xEIEHVlurDrAEKTCSAmmDmNQiPQTKPE1pSEtUmUkuNoPKY1FwUaM05IidwK93ps3lrN8QVoIINLfLC52GmVXeeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS7lelUT; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS7lelUT"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso884821fa.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364712; x=1741969512; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2CFQJbmHziqfZ1WlA8nTaS4u+SIYAl6KppF5R5h+0M=;
        b=hS7lelUT6HRb1oaovbho10EJG1QWcYsv+bYVgcd+Sv1YW3Mi0Obj5+Tb5W7CKkeD1p
         pd4eWsmRbRKGN8bHnryGOsmhuACnpntoiEuNcCcu6e32STW99+kjZg68KKI2q5H9DUnd
         UGTExbi8Mt+tdRlf1WhyYQ+yWuXBgQSEUDJfKht2jQk2QoC9ejOD8PY+5No5V5Jelo8z
         FcPa7XirBhggixBEpAtxbM88Neib73TKe5RDE/cxQlDu81ghQYwGMU52GXn+toUqWrzX
         Qq2JtC1UBX0/MN3MgXuwt02hhbB9p0g8tQ/X7KikAazDrix0Yb58N8ytENX1cipppCiI
         /5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364712; x=1741969512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2CFQJbmHziqfZ1WlA8nTaS4u+SIYAl6KppF5R5h+0M=;
        b=LoFEDXYfLAAAzWGSMmX0TdNI+Z2SbTGweKCeBTpa45V6fI49+tNGyVouQ5KjBw8BP2
         yEjUIeyuf4899Ezk6SHDbwexUM0Ic32QQ05QhIgTkVA12W31WKRhj9m3UShctka+VIU7
         ca5ISHz5hcaTSucLtEjLpg9hiFXRTm0cLSjrnHoylIphcdLSeZYIGjTsUxEuuCZKaZUz
         75bAgugHQQxjgm3ftpG6yJ0OytRL0xKFj8u3tg4PHh3FMlwX3CQln6kPBvcEHOFsKgd4
         TM0/c1cmGd/N9ZU+SD2oIr3OUglOG39/7nupdx5VdDde2V5116D/gNb2+ZHa6wTFULPi
         nA+A==
X-Forwarded-Encrypted: i=1; AJvYcCXIz+OG3qA2s2yiakg8QdiNqcZ5Kv3eZqOJs8ZYtMMi8QqF0/UuXM+Sgd/IwPoOKq4G4nzC9XshiHKp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YysO4G35ieAcgpMNoPDBZZb89PC/LvVOYcQOC9SrmjIDmiiAAMe
	v4h99bDserZR8bvn77bCBlAb+5YAU+Xqaa2vQ8xSg1GCj6f42mBw2PMBqeES09NyswngX3y0cas
	Y+rFg2t9CUvzmL9/xzTCpi8jMM6c=
X-Gm-Gg: ASbGncu/Bfed99UgXtma/rhuCiN9EtHTt1d0JWW9D93QAgd8bWMJD34cqr2XT7OVSEP
	7CRe4Q41WLpX9Sh1k/tpyvW8qJc8ts07y0DntwqdJw+Y1Z90jh7BAwb1obOo+Lxfbx13xmf7AyK
	G7aqGBpjuK7SbC/38fgYSmhO51klg01vX9sttCwk6zOtBBjJ2WfY+j7iYh+sDC
X-Google-Smtp-Source: AGHT+IGqyL09z7u4Xuju8syY9+78OKZgCCJj4/AtHOZWHMIXhvltnjRbnmZl42z4OZBt1oV5UKnpsTKVfQtr+7NbeCg=
X-Received: by 2002:a2e:7207:0:b0:302:48fd:6922 with SMTP id
 38308e7fff4ca-30bf461caecmr13567401fa.37.1741364710717; Fri, 07 Mar 2025
 08:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com> <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
In-Reply-To: <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:24:34 -0500
X-Gm-Features: AQ5f1Jo_IFcC3B8zSbUncIFkWnLYFACfJ9QNhhH044lkvIrDkmW2XRTqrixiWvY
Message-ID: <CAJ-ks9nA-393OaE8SbttaoQz9s8MUKqED5GNoh8tQyaJm-0GxQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] printf: implicate test line in failure messages
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

On Fri, Mar 7, 2025 at 11:23=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2025-02-21 15:34:32, Tamir Duberstein wrote:
> > This improves the failure output by pointing to the failing line at the
> > top level of the test, e.g.:
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
> >   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1=
234abcd  ', expected '0x1234abce  '
> >       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
> >   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x12=
34abcd  ', expected '0x1234abce  '
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Just for record. I like this improvement. But  I am going to wait for the
> next version of the patchset which is going to add back the trailing '\n'=
.

=F0=9F=91=8D
