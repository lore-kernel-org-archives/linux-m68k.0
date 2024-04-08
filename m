Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1539FC3
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Apr 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564620; cv=none; b=houAn/gts3ygUFz3alFBxX62hxMMN3ndDK8POPPmabRn3/R1yvpuiP0OzsnJW+7RtwFexVc/zn6g2uoyqkQ8JidMYUSt1WnBl8P/xinAWHUSDNrE+S2CbVXgjXlTqC/s72NrZi5pbiKLjz+6EbtbV8mZ4esidXBAsYZX9zocDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564620; c=relaxed/simple;
	bh=9BucTodjQZA0C+PXetagehbEC3XeicZcpxm1poATaVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otm+DPkRa0SIF3kxhqVASGA4JTpjKmqjPm/utH7ENS/I9Pp1ybWRlMPb3NkuJmNbAbD7jmqYwA2QPNiQLfWt+pbUdrYB0AQIco3ydNvz5T81Cew+5Bil6iDGUE+bxsUvCv0Lqb8iYpGuFiF2gPXc4TElGGUfYzixpWfiCDr3j5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4060871276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564618; x=1713169418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDWiWLcu7csgHD8oiwim7vv9Jne5blOZ8xlpqmcE10I=;
        b=WyELCDo1Lxb9EGJwH2qaItOwIhWwCzridykGRHMsuiUbXOaNFb2fmpALZ/5zNMAZL4
         heeSPQA1Qd9bICc2LcKocP4HMQyYcNUTR5V4Qv5+pMrbsGToshXOh8Ijg/CXHRAnKaxd
         0WzolrNcqngl0Jfg98UnXB/J8E8phzd0/j/d5RI7VrjpdtHe3A8CNLip5sBR+lb/+mn/
         fldKPQ5HabFO1g8V9ePkROynagoyz+dPf8v82Kggei1lyTyhU3a1pOVRNU2JGuNom7xv
         VydxVdhMwwdu8IIjqWHEt6Bv/FdVrPKrwOHimN1pAJiLrvN0hlxAUy6Fyzds0yZhJqyP
         tQOw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvjznNG6kC5if6UCnNRtgLa2knOAJvZAqe7ZgUWX0hOFvkCWjP1jgEnQ9qndJNCUU5XwV6YRwOYSwuVdN4GnkvstKf/+KlAhZETttjPUN
X-Gm-Message-State: AOJu0YxDnA42ajnIFEPdOLvhIUAY9QLVg7TgKreYS7E8OBaEjWAhUe8q
	zUrdZ7JTLj03WWYQk6LHKOGFjIDcTGnqEmBmyQiHFbhI4lu8DCp+Hxd0R3/iHnE=
X-Google-Smtp-Source: AGHT+IECanJ+NMrJVJ+IbTcnKUiybNTsTctPN/uuJk5u++pONCs6eoqCTK+yXSOtH2MV779CrxbdXg==
X-Received: by 2002:a25:6f89:0:b0:dcf:30d9:1d7b with SMTP id k131-20020a256f89000000b00dcf30d91d7bmr6186525ybc.45.1712564617641;
        Mon, 08 Apr 2024 01:23:37 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id e128-20020a251e86000000b00dcdb0f80b69sm1347288ybe.48.2024.04.08.01.23.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:23:37 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61587aa956eso37716107b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:23:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWm/Qba6gXTZc9Pw6NbHFcYyRA90T9YJwC27m1FWwAX26DUZrXyg27kEg8k54AUQMZKdXh/9Msw28yVsD7DdNgjXzNXSj4CgzuozmWm3aG4
X-Received: by 2002:a25:2610:0:b0:dbd:553d:9d6a with SMTP id
 m16-20020a252610000000b00dbd553d9d6amr5403540ybm.40.1712564616812; Mon, 08
 Apr 2024 01:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403122851.38808-1-schnelle@linux.ibm.com>
 <dd55afa6-8cb6-4e25-b720-d2df62dbb5e6@gmail.com> <bf276f98-2712-4fcf-a119-f984a1aedbf2@app.fastmail.com>
 <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com> <11fdef9b-413d-4f88-b3d3-e5b27a88cf6f@app.fastmail.com>
In-Reply-To: <11fdef9b-413d-4f88-b3d3-e5b27a88cf6f@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:23:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX026rLnJP2K-MhBjzVnmu8EReYe3PJc595Vjp4GoBK7w@mail.gmail.com>
Message-ID: <CAMuHMdX026rLnJP2K-MhBjzVnmu8EReYe3PJc595Vjp4GoBK7w@mail.gmail.com>
Subject: Re: [PATCH 0/1] m68k: Handle HAS_IOPORT dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, Heiko Carstens <hca@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Fri, Apr 5, 2024 at 1:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> On Fri, Apr 5, 2024, at 12:16, Geert Uytterhoeven wrote:
> > On Wed, Apr 3, 2024 at 8:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> > Michael is worried about non-ISA drivers using inb() and friends.
> > At some point in time (i.e. eons ago), we were told it was better to
> > use in[bwl]()/read[bwl]() instead of directly dereferencing volatile
> > pointers...
>
> It's definitely still better to use an abstraction layer for MMIO
> accesses using inline asm instructions than open-coding the
> volatile pointer dereferences. Over time we have gotten better
> at defining which of the available abstractions should be used
> for a given bus, so inb()/outb() is now only really used for
> things derived from ISA in some form, including e.g. PCI and LPC.

Indeed. Nowadays the consensus is that readl() and friends should
always perform little-endian accesses, thus implying byte-swapping on
big-endian platforms, but most of the m68k drivers were written long
before that enlightenment...

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
