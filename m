Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A351DFE8
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731601813; cv=none; b=axRNVGpUkvlVlDnLGb1VJfyJb2ciPx4LD+qBZGGkHhlO9p89d0obixD/vcdIJGzrUV6ZDjSj/KuAE0o+jgU7K0vooQbACs5vnxDfNgC35/DYBKa5iTscqTdlLVX4Qse5x6D7Ytu45FUJieHkHxhs6XXOkUS9/Hj+JIyLRx4Mzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731601813; c=relaxed/simple;
	bh=hE+NcsecyAGWc3I8WmNJELnR26MgyMj4iqMYlgtSDMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxO+aF0+ZsIcJUQEECdg7zH+x5Hta867fXvp/xxE0XSjpWA+GrbTEZ7ehWF2+fa6Orvt0sZeWIOiq67AjsnHw1Bei+Z+WWlldEN8CZORwLqqvZbs0UZ319K41SQNhO/6U8v08C4wT6ZnGmv0E+yCe/1BIhzL15CaeYIANqM3gZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9ba45d67fso8973237b3.1
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 08:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601809; x=1732206609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xJI0w1gKIx5aH4r0+X7zIq8kBSVmYbK0kIPJ6ZIgac=;
        b=h92qF8kikk9Ib6+JC7pPMA9nD4TyN5A6O1Oq/tR0BJY9cGd4Zw18qQ/sprlD+oh+gB
         G/VEUw/rFCS6/NmlXXIidckoSUgWb6VPYLj4/moJefW5oIqzK8aVVfYrAxQu+Moa5cxA
         il4dj5UuxZ6pJj3skuVKrpGAZpGKBWyOJTUXDCIlOCclDYrNrhuqKgBqPNSpzKHmdTZV
         iQA6beTqrkeG6QbCu5bO5IV367aKMWOBiHnVnCI4DW1/4jthTHPpfvnHbDGIAPzyEJCn
         9bKkeNzoDSYQqEeXVzQITWB1g+gQOp8WkC+3uTqSPQ5K4Xu/cHbbQ/bfRgIhUUFYyZ1R
         5mUA==
X-Forwarded-Encrypted: i=1; AJvYcCW6/rSIxx4XfsirXOa3BduvTiNgUnm76B9pXT5ZGItfKEvtXhK9duToGhFOjcyInmFb9vC1ijg18usS@vger.kernel.org
X-Gm-Message-State: AOJu0YxXY4WlvhlK3AxpYI/iwG9NDZHxVArCux3KzeJ7RFw2yb68h5bl
	PhoH+U6SHcLTLabis7YVKQJTqzqIjdB0wrvA3JWxEOtflbQ+Czzy7ZB56pYg
X-Google-Smtp-Source: AGHT+IFADCwqXhabPvdmcKYXk8AOBFsrOBeRKuheSUIIeQ9tOigFmS0FJdlpjoh0dNZB8uZ/gn5kjw==
X-Received: by 2002:a05:690c:4d01:b0:6e5:9bc2:53a0 with SMTP id 00721157ae682-6eca4c2d15fmr131727527b3.41.1731601809593;
        Thu, 14 Nov 2024 08:30:09 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee44494fdfsm3036757b3.125.2024.11.14.08.30.08
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 08:30:08 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea7c9226bbso9277487b3.3
        for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 08:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGD34fer7rGzMmZN3LZvtewZjY1fdEWl4LdkId+MCGELVyX3SKDvdE7UT9W/yWSuSTmfD/ZDDsUjuN@vger.kernel.org
X-Received: by 2002:a05:690c:23c4:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6eca4660545mr125829467b3.15.1731601808302; Thu, 14 Nov 2024
 08:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org> <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
In-Reply-To: <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 17:29:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com>
Message-ID: <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-m68k <linux-m68k@vger.kernel.org>, debian-68k <debian-68k@lists.debian.org>, 
	James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
	Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2024 at 7:16=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> On Sun, 27 Oct 2024, Thorsten Glaser wrote:
> > Finn Thain dixit:
> >
> > >That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's not=
 the
> > >case on my Linux/i686 system. 4 !=3D 8:
> > >
> > >struct baa {
> > >        int a;
> > >        long long b;
> > >} foo;
> >
> > That struct is just 12 bytes for you then?
>
> Right. i686 and m68k agree on that.

On i686 (i.e. gcc -m32 on amd64):

    __alignof__(long long) =3D 8

but

    sizeof(struct baa) =3D 12
    __alignof__(struct baa) =3D 4

???
Isn't the alignment of a struct the largest alignment of any of its members=
?

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
