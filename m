Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BF1922FB
	for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749979599; cv=none; b=Wz/ZzKS8WGdHrXMmykxDu+nBYiWMoIa0xhqCq6SIEvENlO6UGCT6xljaOiSf1n2wZCUC8wlAPD2iZ4eTbn8ueqmDEBd3fGuxKNa69Ff7FaP2v23UyNEtvm8Krp3Po/akdouTDaN0Amrdskj7jChtG2ZmrBMmjbo5Gs3fGDNIrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749979599; c=relaxed/simple;
	bh=GSpWOHfVXakSaD/Q84GJTChuyjvW2ajkUetlv69EKPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FciUZy6/tbzCD1g7la7jfvPWcfxFuKGS1DqYNNeR5rL+cZVom3VF4dbH8SWjKL82xHDq/vGD8s/JSafFKCNLkPrSe0T9Epd5DGTlGJkpkR1pOlpNgbV/+3g4ZDjIyeSzjBA7ClcvgcnRcNWjrLn2k2M04Vd4B4cVgvCS27QrE6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-530eec21626so1024491e0c.1
        for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 02:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749979595; x=1750584395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3bhViaOaDJ84vNxc7BTgogYnTzaPMwvXPmcmnkqrBQ=;
        b=Cq6I+LNOJY6i+zkfOIfjzHlaJ9Hi7jcsDetsINeSwB1fr9YpE6GDCEle+j3fRq7LDb
         sa4w4QfpsHLVNE3YtU87yN0+W/hO0DDf0Fuu2IY57cONCo8eNHku/pl4Nnj535db43NB
         wR4q5VmQ94Po/WIvm4yTOZOgZ2ZEvZyCyweWbvQ9vyGy2fDDlXPWZ/eoqHN6hsruxrQn
         GvWAi2z6qmsfuhiD/dHeZzsgOtfY2a4//IKNnfcu98pTNtW3i1mnpY6q64ELjJSWBH/M
         iik2NybYuge4Je3pq+Skr209ZjV/zxgKc4j2ZDkyQVJl5TiQzz19Zj6EI6S5XT4m5ebP
         tjYw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3PmpbYMbQnbSIFbI4f2nGlTodFelA2PSzloOX+DRFdQd74Cwliisb+4wjaeM2x83E0wOYjAi0RFg@vger.kernel.org
X-Gm-Message-State: AOJu0YynFkjTEUrlaXFDYBEII5j2NQZIsllAs1fonw+WLS1RKeqaxyls
	DAr+ShOfRDSvNyyFVOJ9vv2MTez2Nls+kTKF9L1prx+NNUdEmj31zN+pDftyp3nv
X-Gm-Gg: ASbGncurUqs4OlH5QP4o+tRYiEPyQgDU/PHFJ5NrobiVSaoi4/3va21wrYMl10WOM+O
	qnCmeSBHJujlnelIOCV/6XuBhtKBYCmQzCS6rKTkwKs7EnxTm6zIbIoA4uDc91aal15+e1sUpEf
	C1x8O0W1h0cMpOt3N81Q/a8s+6ETe54+C8UmaVZu+I07ppKXYE/eM51sWTGjtQZxC4ksKJp9YAO
	OXAqf2lqbGoy7PhfULgn52Dym+psAezfvM/597zsZWbtrxf3nd2P/wId+++I0asZx0cocB8jwsg
	Qr+f8Oub0/Kq3gjuJrDauYjoNQM5UFf9KP38NDDCgcDN26nwSJFyhguOq/zFTHAKfMxXyC7dyac
	oRNKzRQpnsdA7c75/RD3Wycqx
X-Google-Smtp-Source: AGHT+IEfFl7TxysDwXIqHodBKayokjHa8y/jNhWZZh4llWEVtpxKWrYlyVlc0vdkZ7TA9gSqz0z/QA==
X-Received: by 2002:a05:6122:8f8d:b0:531:2afc:463e with SMTP id 71dfb90a1353d-53149551fd7mr3417475e0c.5.1749979595022;
        Sun, 15 Jun 2025 02:26:35 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313ddd7ff2sm865891e0c.12.2025.06.15.02.26.34
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 02:26:34 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7f367ea11so535016137.3
        for <linux-m68k@vger.kernel.org>; Sun, 15 Jun 2025 02:26:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl2BnT90Q04zkYM/kvr9kTdrVMs//r+MvSckhTbj2JC0zZM85osmcXQl2NRbvcudoCYHq83Kdj3Ai+@vger.kernel.org
X-Received: by 2002:a05:6102:2c81:b0:4e7:bf03:cd6f with SMTP id
 ada2fe7eead31-4e7f61373aemr4368017137.2.1749979594027; Sun, 15 Jun 2025
 02:26:34 -0700 (PDT)
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
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de> <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
In-Reply-To: <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 15 Jun 2025 11:26:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzfDxv24wp+AyJs2253+8RHB51oM1Qsc3NUNaf-jE+nA@mail.gmail.com>
X-Gm-Features: AX0GCFtg8nhXgs8fIY3OU9zwX6MTnxWnvnT41hOUut_6OUFk_Jr0wtoL_CU3F_U
Message-ID: <CAMuHMdVzfDxv24wp+AyJs2253+8RHB51oM1Qsc3NUNaf-jE+nA@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Fri, 13 Jun 2025 at 15:00, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2025-06-13 at 14:51 +0200, John Paul Adrian Glaubitz wrote:
> > On Fri, 2025-06-13 at 14:30 +0200, Geert Uytterhoeven wrote:
> > > So you change the default alignment, bump all so-versions in userspace,
> > > but keep the kernel-userspace ABI the same by adding explicit alignment
> > > tags where needed? Old binaries keep on working, new binaries join
> > > the ecosystem of anything that still builds on 32-bit big-endian ;-)
> >
> > I think you're still missing the part that I'm not maintaining my own Linux
> > distribution meaning that I cannot bump SO versions or making any substantial
> > changes to the distributions.
>
> To make this perfectly clear: The whole point about making this change is to *not*
> having to roll my own Linux distribution for Linux/m68k. I'm building vanilla Debian
> on m68k which means that I *don't* want to make any changes to the distribution as
> I simply do not have any control over this.
>
> Do you expect that I can go to the glibc project and ask them to bump the ABI version
> from 6 to 7 because some people think it's extremely important to be able to run a 1993
> Linux binary an Amiga running a Debian unstable snapshot from 2025.

Sorry, I didn't know you have to coordinate this with the glibc project.
But you have to do something to mark it incompatible with older versions...
IIRC, I saw Debian bumping SO versions before...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
