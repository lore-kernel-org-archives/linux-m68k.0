Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E81DF756
	for <linux-m68k@vger.kernel.org>; Fri,  6 Jun 2025 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193307; cv=none; b=Uya3W7o/Mk9Q1OR//QCDsGfbvesJVXX8WeiWCX8Gnnt130yTxNnuZsvoXwvHsotjJwXJm74gVMg3yBG6fvt50JJqHah54h9W44ZD46phIT0ynNLIVc+zw1xGohESpVa3homS/eXlWhvxfUQAGQMkgglNnugn+AJJ2Cz+zZwyt/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193307; c=relaxed/simple;
	bh=hov0vUz2FQHjF3ylrlJs2hUcqCEntF7RUNC0R4UfvaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2Aw+q7itr1cZRiDcPFPPBDZy0ZjfmbR+UFHBB6UqS9382IL95XPexIITUlK2h7B0vJmOBnLsodlYUE6MHjdTvcWoDfs5zz92gA9xQh1Ekv9uXH4tQPuMdj35IEjUqK69NVqFSVuJFfxxVZcCr1LfKAhv600DVg2byjJTKKoKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-530807a8691so639456e0c.0
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jun 2025 00:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193303; x=1749798103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9176Lm3vQiHJl8La2jBGaPieqZUcwnV9bcpYJSs1O90=;
        b=foz774s7fr6XHazLhOHzbCLr2q9NrXDaL7bmJrF3fKsLiBrnEb6x8+i9psfu3ezRcg
         6NhF6E9Nqs29apjxM8zz6uP3xiKFCZseDx5MmjoeEcDYsGWtOia7QNsjiESDUSCnb8md
         agM7TiJjJ1/Sf/a3jM6m4sz/EzThoca5AVHWQtESCEX9eGI0e42bWUxYCS35aGI8qhhX
         slkb3WhMPwfaZsEyp6yYOfWORsXnjADWpQyUp+LgQNe/+Ou5+fkE9LL05Hfijxd9qo/Z
         xvY3eEC0F4U6mXOJfkJ4VGeR0Q5CcndBbSxTbCzmFbcnelSCjuhgcPtelSKOXDOTdl5G
         g73w==
X-Forwarded-Encrypted: i=1; AJvYcCWUYGDL64SShNuQ0TgRSFhZs81eXz1YJ72UuH6tAAKYOdo/o7djl6C89Av42AWOMIDe5i4bzYX+g1Cp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hKEzBbEq7EcVmuN8VnpM6ucjyvFom2dHJqyft1PCsXyIUlzg
	ISDGB2Py226fiaw154G7x4j0y4ooL0Ac0gRxA1WLROCoz//jN2X33Juuv9yHk7VTGp0=
X-Gm-Gg: ASbGncsiyMeKnc5b1Vu8D0wIdfvdn68O08Y63FJSO84aW/2cSlfRYKQwT5xOQrobJ0D
	R6DHOe+yckgrGhKwwm28PwEe7SPrPhSvFYtY5N+OqCHL3e58jweXhfeoNcdjX9z89SNWs0Z5EkK
	5WmTLMXBZiNeiF3nbY0wbcBIR1qe3DKHDjR36HYtdq/slcl39FIQu7D7IgUCgQVqReD7JAcxxN1
	PJsqSw6bNmDYpJXFe9XJRkLnEUqAVSIMxri//0qWCJX4fXQ9WaGNC6979PwFpJ9XiT6LhdroNNE
	GluzFgT6o/6NINpM7Jt8nFdeOYuEGaMzcSLJ89GS0pa3PVab0C1jEvGPE0WG+QS+BeFo9lTPrwO
	l3QXEANt81QQYRA==
X-Google-Smtp-Source: AGHT+IGlmk7CldQzK2ds5ko0ziwrjRv/ddIAHUQvvX1WeWCzlmultBAuwRIV8CIPcppoCRG0+Kge7w==
X-Received: by 2002:a05:6122:d11:b0:530:7a17:88ca with SMTP id 71dfb90a1353d-530e48b1205mr2262633e0c.9.1749193303236;
        Fri, 06 Jun 2025 00:01:43 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e629be8csm710960e0c.3.2025.06.06.00.01.42
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:01:42 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87dfeb9d0c9so386987241.3
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jun 2025 00:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYHeKoFXwTHB9Sja9b6Tb3wkN9Wdn8TI34Fv+w5af17vqAl5VocYNe6VAKtVniQmtQohSClodg1S9K@vger.kernel.org
X-Received: by 2002:a05:6122:45a8:b0:52f:4680:1c89 with SMTP id
 71dfb90a1353d-530e4887224mr2205027e0c.7.1749193302257; Fri, 06 Jun 2025
 00:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <30ad91c1-b42f-48f7-81a0-e1efa64a6891@tethuvudet.se> <20250605103343.GC22312@mail.duskware.de>
In-Reply-To: <20250605103343.GC22312@mail.duskware.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 09:01:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtuj6rJ+yAxAQvGwGUqf-iXTFVY28t2EJdqg7+=Atuig@mail.gmail.com>
X-Gm-Features: AX0GCFsDbQsArl8cIMJQ2BHl3fidvfzz3kuGf60m3BZbkCD1MxS_R57OkXI91qM
Message-ID: <CAMuHMdVtuj6rJ+yAxAQvGwGUqf-iXTFVY28t2EJdqg7+=Atuig@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Martin Husemann <martin@duskware.de>
Cc: Anders Magnusson <ragge@tethuvudet.se>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 12:33, Martin Husemann <martin@duskware.de> wrote:
> On Thu, Jun 05, 2025 at 10:49:08AM +0200, Anders Magnusson wrote:
> > Just curious; does not Linux use the processor-specific flagging in the
> > binary that can tell whether it's 16- or 32-bit-aligned (and handle it
> > thereafter)?
> >
> > NetBSD changed VAX from 1k to 4k pages quite some time ago, and to be able
> > to use both we added a new id for 4k pages.
>
> Or add an ELF note to all new binaries - we do that on sparc64 to mark
> the compiler memory model used and give all binaries w/o the note
> (or a note that it is using "medlow") a different VA memory layout (to
> keep shared libs in range of the instructions used there, but defeating
> most of ASLR).

Op MIPS N32 (EF_MIPS_ABI2), which also uses different syscall numbers.
Then the kernel has to take care of the translation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
