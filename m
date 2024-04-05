Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B25D27447
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Apr 2024 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712312195; cv=none; b=gUwkRAXiOCEMxpaWcs7uWL3JC2mpQbqcy0SGqYaU0wmgYfU5zGdA5/CgZDX67dKMF9AWN1WqtMsw7umqh3Nk0M25ynZTxHsiigQbNaCSM7DdGgTCVWlPvobnpwqOSiax1m0byHZsrHZTkE6Bd5jS8nh1YyOPebZ/F31gfsuNBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712312195; c=relaxed/simple;
	bh=JcY82/C76s0/t6n/adQHbGR8IvfyPU6uK0CJHQnDc3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbxrW4fGlZIw/3Cc0P8ZXKCirB95lMK58hrVccBf0bJLJWhk/cJtri3H+eT5bt2yazALxPJnnT/zYVorDTSZRJod/jPjUgJiFhMZZ2W6yj/A5aI8IOs3xjYt65HSAb765RKhgnqo0jdxrc++jG6GBkH6AsPfT5+D5pMwZGMzqZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61545a0280dso22487877b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Apr 2024 03:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712312192; x=1712916992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+r8oBMZYIdH7mEh+EvZMzslbveSo86ivNfgm6OLNsA=;
        b=I3qVVdX4NnAOcmLyzQXx3a0yJ3NHM/bJK8jJqbsiMZswkQ4iF12BXb8gUsAYsiuWiT
         DfVu3SLrKfCOVvA5l2nTeK2X3F+g/VyqiKmDeXiKryDO6v1FZYP31JpS9sWtLUetw/VX
         BRDephEvyRFV7PoMhNsusnNf9FU+YLDNAA3pf+BHKocprTWBNj8gBx650t1vUMOSM2QL
         4PLt03Hz+PUwL6JiyaPxggB/WahxMA4hPn6xo0ig0/aTBh7KCH2UnsTSwfl8r+eNlAmX
         xzTqPQTAJnBjhtR1kp8xPA7Ch/JkfJSFQRdM/kIn3mykIagXGm020pOwN/HzaV6XBlei
         MZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCUS5h9augdU2rJJgyJ+MZ7XuaNoeJQFgQ9gBNtsU26eAFHbbxdwHxq82ctdP4Hft8go/aqu/qWZqc3vKe6LMSRr1iRwP61KQ3Ni+AsnW8S6
X-Gm-Message-State: AOJu0Yx0hS5+olPksmBYhHmD6FrFW8k6qNm0p98Y6OI/5xMHWDsNDO9H
	+Kq33aex+GTIK21O1xwSK31duC8DOcxcrfdD1S1ZoZTZmt0Qh8NZLuwDV7qtZLI=
X-Google-Smtp-Source: AGHT+IEp3yVh3Z6Qos6IHjZzWaFO2+odOta1Oglv7KhxLM2s2vfpMLD1w1NWULHLGysNvKfT0rrq7w==
X-Received: by 2002:a5b:5ce:0:b0:dc2:279f:f7e with SMTP id w14-20020a5b05ce000000b00dc2279f0f7emr815448ybp.10.1712312190086;
        Fri, 05 Apr 2024 03:16:30 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r18-20020a25b612000000b00dcc70082018sm255696ybj.37.2024.04.05.03.16.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 03:16:29 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc742543119so1989989276.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Apr 2024 03:16:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWt2E7FGm4CiEOtTUs5DhA1n0ORVNCdNtsafetb9SlPLwY/sKYg6mJoPtc9hBXTlOe/mKnXBQQDgGQiCRWBUZO7BU8PGEHLRb0vTMswE+vd
X-Received: by 2002:a5b:2c2:0:b0:dd9:20d6:fd2 with SMTP id h2-20020a5b02c2000000b00dd920d60fd2mr741410ybp.27.1712312189491;
 Fri, 05 Apr 2024 03:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403122851.38808-1-schnelle@linux.ibm.com>
 <dd55afa6-8cb6-4e25-b720-d2df62dbb5e6@gmail.com> <bf276f98-2712-4fcf-a119-f984a1aedbf2@app.fastmail.com>
In-Reply-To: <bf276f98-2712-4fcf-a119-f984a1aedbf2@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 12:16:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com>
Message-ID: <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com>
Subject: Re: [PATCH 0/1] m68k: Handle HAS_IOPORT dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, Heiko Carstens <hca@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Apr 3, 2024 at 8:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> On Wed, Apr 3, 2024, at 20:11, Michael Schmitz wrote:
> > how do you propose we handle legacy drivers that do depend on
> > inb()/outb() functions (_not_ actual ISA I/O) on architectures that map
> > inb()/outb() to MMIO functions?
> >
> > (In my case, that's at least ne.c - Geert ought to have a better
> > overview what else does use inb()/outb() on m68k)
>
> If a machine provides an inb()/outb() set of operations that
> is actually used, it should set HAS_IOPORT.
>
> For the Q40, it may be better in the long run to change the
> drivers to just use MMIO directly though.

Q40 uses ISA.

Michael is worried about non-ISA drivers using inb() and friends.
At some point in time (i.e. eons ago), we were told it was better to
use in[bwl]()/read[bwl]() instead of directly dereferencing volatile
pointers...

Anyway, I don't think we have many users of inb() and friends left, and
I assume the bots should have detected any/most remaining users in Niklas'
branch...

arch/m68k/include/asm/floppy.h on Sun-3x might be the only offender?

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
