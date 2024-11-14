Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC019993E
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731613586; cv=none; b=d63gbqgf3QZgC0gM9+38YqULMHBfvdCMz9j6n/IwdiBc2nPvgGZuJXd6JTozfFFW98bumCnEP/CQ1O2UQkvj5+iQ0z9uR9P+9qJl8kTWH0SglIa0EB3bCVJOw9irUFvvp3H7BOL/e7Z58vDWPI/0RG4Wy+QDCMxXt9Ix32DHHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731613586; c=relaxed/simple;
	bh=qLBbHLwPsP2IjErrmhyTxWDdugobOBIxU1od6p7Jnhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IwrkGCybgs3MbZfciPYE10t7pJFQmWdl9P5eRs0EdkH/kaCZOgFAH5eAaO3jqR+yLohRu4grptsy0TAf9/saa7kbh0kGx5LkKSxCpCfRMuKOdfD14bhAPQHPXJp3oE1oC9/kpz6kauXUMEdjnG3kYSvJYOnjmddGxkU1RBiiPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e380f8b0c6aso1007576276.0
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731613583; x=1732218383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MD3GIE3np7zSC+vtYk3LVZeukLqDFDs7l/0Ka+9oIag=;
        b=NsdWvhDh+QV9xlAzzj+rcTy1Fx7FJajv6lBqad6sBj8m/oAqvsJRCsHVBb7BjHqleG
         ivgVxJNS+EMEo5g4AtTt64bFqOIMiQc8uGt7v0V/6CmLsZzxbCejxdidMSntbFaKxkGL
         yEh8D5jAWLzK0yo4YrqKadw0A+iOcQTzpejsP8ws13hwzvrUQeJzB4O47wjP34A5IXMp
         LRru1Fm8WZsWG6vuJHQAlZccvhjtRJOvrMuKhQt3M7wWwk7XKj2MRUjdn15vKFv9BjQl
         oekI5cwOGpW64YpDrM6gqSR0mkCT6wctQtOtygI+7AMbI3ox8HO7TUgI7OWot/rhDjka
         0faw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ/PcKwZuU5WvDZPB32g3USti2KzNoeHpWQs9qKP44KlmR5MNEyxGLjagaM1TUZXVVL7OWSql5kY0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGskLuqs2bcQwgTJCGQSqn1EDpsZ4VrmcZAbfKpq+xRcoZ2cr
	PAO4brxrk8Ua6zv/2mB5MUrALdwlv2K9cg7FdLVAP6zdW/zfs4UqpzkmpfJb
X-Google-Smtp-Source: AGHT+IH5iGzahcILeuzB5r5E4NRJGbQhBPzAALqWkEU9S29/Afz5VRCpJGfsJO9DEBc7EubSnaL7+A==
X-Received: by 2002:a05:690c:2a8a:b0:6ee:4855:45de with SMTP id 00721157ae682-6ee48554791mr17998967b3.9.1731613583519;
        Thu, 14 Nov 2024 11:46:23 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4400da83sm3945797b3.22.2024.11.14.11.46.22
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:46:22 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ee3fc08d3cso9281127b3.0
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 11:46:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSrtzqmfY/mZFfLmzEWSjI6TlExZy9JEH98+RXbv46g/swnfpszot6zXHqYCZPYzyY5Xt6c1qNTZsM@vger.kernel.org
X-Received: by 2002:a05:690c:424a:b0:6ee:49da:1d51 with SMTP id
 00721157ae682-6ee49da1fc4mr14570037b3.15.1731613582671; Thu, 14 Nov 2024
 11:46:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com> <bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
 <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
In-Reply-To: <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 20:46:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSy1zCyUV9NYyy4CT3qTYJkV0G4REtfjROEWsTc53RuA@mail.gmail.com>
Message-ID: <CAMuHMdUSy1zCyUV9NYyy4CT3qTYJkV0G4REtfjROEWsTc53RuA@mail.gmail.com>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Thorsten Glaser <tg@debian.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Arnd Bergmann <arnd@arndb.de>, 
	linux-m68k <linux-m68k@vger.kernel.org>, debian-68k <debian-68k@lists.debian.org>, 
	James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
	Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Fri, Oct 25, 2024 at 11:38=E2=80=AFPM Thorsten Glaser <tg@debian.org> wr=
ote:
> On Fri, 25 Oct 2024, John Paul Adrian Glaubitz wrote:
> >as m68k has supported 32-bit alignment through the "-malign-int"
> >switch for a long time.
>
> That switch constitutes a fundamental ABI change, even if
> the effect is limited.
>
> Question is, do we need a kernel change for this at all?
> Is there anything in the kernel/userland interface that
> gets affected by this, or do these APIs use sufficient
> explicit padding? Has anyone looked at this?

As pointed out by Arnd, there are.

> (Another question: does -malign-int switch to natural
> alignment for all types, i.e. 64 bit for llong and double,
> etc. or are we going to have to change GCC first as well
> to avoid more surprises?)

It only changes alignment for short and larger from 2 to 4 bytes.
So long long and double are still aligned to 4 bytes instead of 8.
If we decide to change alignment, I'd rather change all types to
natural alignment, to avoid future nasty surprises.

What to do with long double, which is 12 bytes on m68k and i386?
I386 kept its alignment at 4, while amd64 changed both size and
alignment to 16.

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
