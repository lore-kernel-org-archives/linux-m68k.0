Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A67160860
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jul 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532768; cv=none; b=tF6TEXyv0/WOmBkOGcfndnJeOv21jIjG3jq2UTZssBBZUW9p4ipqNlA6uUgjaqUGZpKhHJJpoUoIMehYVVIV0U5y8UsFAmENG9xpzTf/ccSpPPLGJn3W0rPhstwr9C7lFx++xEpsFPKPhApA+WdoM8M/T1Dk1/GY8hIBthFr3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532768; c=relaxed/simple;
	bh=9ZAwhP7S1P1iG0E4F25DC+zNoC01hdAIA+xBbmnD+QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjRlKfMSgAlW0ORcbUweiSRwJKo9LGp2pHSKWRyji0NNYs3mg9L9YOsMI2aDeRybAuPr18UwqkZdzqvsnHNO8bdj4gFE4+VRnef/xk9OFnioAp4ME89BwFHDTT4j2/gx5OHmPZzG3hfJ84t8kQZT+DSaHLdJg3loWZBzS9PG4ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so5750585276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jul 2024 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720532765; x=1721137565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gr8V5Z/ZDduxgzrEpspzwkUwhp8x2tSzBoVCNs7Fd8=;
        b=v8fhjWwGKy6OK3plw47YJH410mWNjSLtdRdi4FBHK7CnAdQreTniasp/0ZqYel1iYc
         i8w/od/RTinxhalJ1pMhgBM6E08yJKdBuuRO5EZzXGqfERMfbPOM9ecbhjHF4wO16wCN
         J4skzKJ66oq7ojnslv0WCQJPDN2A6TZtiDRSbFWY6LGpwnbUJnh+aCNAxjeh+l8agt8T
         Tq30Y2VttQdYiDWLTktn5270UPFmfgLQbJ4jH2Gcb367MJjysVdrYkDtAVVn9rIGIM45
         o+C/iT1deufNsb2kRp0LgK/1NRmTM2cVTIOkbM0dbvdFVtKoQ6rkPg5KDr8icld2i4GR
         /xuA==
X-Forwarded-Encrypted: i=1; AJvYcCV05g8Jys+LEHyi+Lx6thQ5EDSc9TvthJUJYboFJGn6+Q3BQ07fvJdCJeSPSosUbsXMvq8lxc39AYrd8S/uP/kHpFew4z+ksZMrrBAU07iO
X-Gm-Message-State: AOJu0YxhPj9J5WoczrIXAPeAlkubGLgoNNDxSXSGKs/4WItppM5VFrsy
	ctaL6DOIr9yX9qbafKb0vbbVHQ0Tcrg1rMyjV2YeRyHB+5RfBew+srahYa9v
X-Google-Smtp-Source: AGHT+IHjAecZXBmPYqvpzzhhzmNcMyqYbGtV1GzZEOPP7goQp/ZsA/RCCGI7cbcrRkutJAwh68nbbA==
X-Received: by 2002:a05:690c:dd3:b0:61b:e645:3e94 with SMTP id 00721157ae682-658ee79111dmr39513417b3.5.1720532764753;
        Tue, 09 Jul 2024 06:46:04 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e521b1basm3446487b3.60.2024.07.09.06.46.04
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 06:46:04 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64f2fe21015so49051787b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jul 2024 06:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhhRi0uXZrvlAL+vJZSL8PIl2KCXOaQnC4B5xTQym2Z4xygmUhyNXQ2Xtd7FH40fTw4hLAC23O5FAXOpQCYoqQXnkRosIdjgNF2ql0Ggwg
X-Received: by 2002:a05:690c:dd3:b0:61b:e645:3e94 with SMTP id
 00721157ae682-658ee79111dmr39513077b3.5.1720532764216; Tue, 09 Jul 2024
 06:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407091931.mztaeJHw-lkp@intel.com> <c1d4fcee3098a58625bb03c8461b92af02d93d15.camel@kernel.org>
In-Reply-To: <c1d4fcee3098a58625bb03c8461b92af02d93d15.camel@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jul 2024 15:45:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsDSBdz2axqTqrV4XP8UVTsN5pPS4ny9QXMUoxrTOU3w@mail.gmail.com>
Message-ID: <CAMuHMdVsDSBdz2axqTqrV4XP8UVTsN5pPS4ny9QXMUoxrTOU3w@mail.gmail.com>
Subject: Re: [jlayton:mgtime 5/13] inode.c:undefined reference to `__invalid_cmpxchg_size'
To: Jeff Layton <jlayton@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, Jul 9, 2024 at 1:58=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
> I've been getting some of these warning emails from the KTR. I think
> this is in reference to this patch, which adds a 64-bit try_cmpxchg in
> the timestamp handling code:
>
>     https://lore.kernel.org/linux-fsdevel/20240708-mgtime-v4-0-a0f3c6fb57=
f3@kernel.org/
>
> On m68k, there is a prototype for __invalid_cmpxchg_size, but no actual
> function, AFAICT. Should that be defined somewhere, or is this a
> deliberate way to force a build break in this case?

It's a deliberate way to break the build.

> More to the point though: do I need to do anything special for m86k
> here (or for other arches that can't do a native 64-bit cmpxchg)?

64-bit cmpxchg() is only guaranteed to exist on 64-bit platforms.
See also
https://elixir.bootlin.com/linux/latest/source/include/asm-generic/cmpxchg.=
h#L62

I think you can use arch_cmpxchg64(), though.

> ---------- Forwarded message ----------
> From: kernel test robot <lkp@intel.com>

>    m68k-linux-ld: fs/inode.o: in function `inode_set_ctime_current':
> >> inode.c:(.text+0x167a): undefined reference to `__invalid_cmpxchg_size=
'

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
