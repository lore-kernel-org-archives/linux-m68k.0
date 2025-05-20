Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24906263F52
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729494; cv=none; b=MTcx8qFNpSmrMe0HPBUaBn8q4RiRL4XQezx1ayRcd2O5qEh/H0jZR/INDHeTF/HpJiu6ALMzvxp+2HOPTzPRBlUtEZgBXX+yoa8f2j2VsVU2vhYOiKzrdn4QoTFp7oFt5LwbWMae4+cv65Ap6v/tInf8Og4NUiT+4M8JopLBVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729494; c=relaxed/simple;
	bh=YPOaLuUYYcNkSXz+X1XppZ2ixwwB6Vbm7U45jWxl8fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnzV+SuQxu5GAVMv/ISLrOTcKx2TC3idZrm/BSCssAJCOg6ZYfQ9wNebmL0SyOFkp8OeZK3XasVY2x+z8D/KNm8bU7D9uy8Mt/LRGlue+O+kP4ftCro/FI25RnSsf15+jjaUyC4ThvpET5I04NNLIWhoW3Fae9WyiRVNk8u1ihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5241abb9761so1910981e0c.1
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 01:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729490; x=1748334290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmydIB+OXGdmiBaysznUkFD/BZjaywhu8z3l1Ymcb9Q=;
        b=kXHamcgVdrjBmetRYjEVB5LhlGk71OcbtlsHrfqWAQ/P5sA3zIXF3BL7wIc/SX27Or
         Bs6gZBXGV0Bf9B1UFdoHcNQZdHeYkmpjyTUFFRNycJRcaqqEbajfT8jIMQTiw9zD1sV5
         81QGfoNX9pJU4q6uBSsffZ6KySyqdGk+R0bywrpdB1DolYqY22tBJ5f1+LWmPkzjS8PE
         3caDuK9rFPnZmc4LG6vdrS5Uv13QkB82IpXf55RvJlWUvwKCnd0earFC3nCtfV+ViTGe
         aHF6peiO56HvM+390yOIhmPhEzc45LDG2e2jP29TTkG0QaNZSX1+41Ivzz08DvaJBlPT
         C2vw==
X-Forwarded-Encrypted: i=1; AJvYcCX5zQ0aoQW35iWu5qRCnQI/J9M4f9LRvIwTpaNHHOH+NcNyGtzDv0EeZgfvoHJlgPC5Fkq7qx9iidC8@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGJ3d1sZw63rb6kqpQsTcsYprPB7xWvyXRzxAHFKj5uu4pK5B
	Qc3NjHwmqFSZq4qYRMHyLCyCC8JrULQ+zLTkuvxcFCo+a5vAdCa+c7X6XD0n01y9
X-Gm-Gg: ASbGnctGGM0ofKBukVDKfNU6toJ+xzUmDSHtAWAWg9HHgHU7jng9iJCBbBuUbkND1zg
	2xfePWfcXccnTsZBFprQvvixLSy/L+Keu/HJxsY/QbZLDlB7IPkYnGOLr0MxTK3FSpu99tl6aTd
	9CHAFS9YSYOpSEJeWJWx7+tOyOpCgrOkugCg8wmQw62xm7BfZBBR1tqFYZ7HAeXpK1KytJFrrPY
	L5ZKxMmUyI1vDmdsQvHVDKeB1h+8ZcDrn2QoGQoU9nrfiG0Fhi7eCEbVhIq6mbNw4pGf95NozM+
	GYPI/krJCWT4kRgTrBR3CwUHa5lVhXVz117lFmFb+xecUjipMVGQNkY3cQotkHSSgGF9FoP5cD+
	2uTc5El9i+o4tow==
X-Google-Smtp-Source: AGHT+IEFn2S4JzS8cDOqORhbRPCrbDZQzAYK8Mc8tDMUD/DHe0ESOGq8OLvMqU75bzHi4RdJk63FWg==
X-Received: by 2002:a05:6122:328b:b0:529:d14:67b6 with SMTP id 71dfb90a1353d-52dba910a6bmr14399851e0c.7.1747729490060;
        Tue, 20 May 2025 01:24:50 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6d2f0sm8065380e0c.44.2025.05.20.01.24.49
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:24:49 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so999631241.1
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 01:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/0l3j/rnKpTMm8EHrz+nhyTlpoXXftQv2p/OTUWz6qBjNh43MbSoPI7d2GAiIf9B37hm+GbWRC4TR@vger.kernel.org
X-Received: by 2002:a05:6102:91a:b0:4c1:8928:cefb with SMTP id
 ada2fe7eead31-4dfa6b9ca16mr13153872137.12.1747729489350; Tue, 20 May 2025
 01:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <8734d1kofn.fsf@oldenburg.str.redhat.com> <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org> <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
In-Reply-To: <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 10:24:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
X-Gm-Features: AX0GCFteAdnd16f03UvcV3TLwqZP469dMyKd4Zqjs_uftPDjErPQgYfWw7jK0GA
Message-ID: <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>, 
	James Le Cuirot <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 20 May 2025 at 09:56, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-05-20 at 07:59 +1000, Finn Thain wrote:
> > On Mon, 19 May 2025, John Paul Adrian Glaubitz wrote:
> > > My argument is that Linux/m68k is a pure hobbyist project and anyone
> > > involved can deal with the changes coming from the alignment change.
> >
> > If hobbyists can deal with ABI breakage, they can certainly deal with the
> > longstanding lack of fancy toolchains and toolkits*.
>
> Being able to build the build dependencies of cmake or parts of GCC such
> as gccgo is not something I would consider "fancy". Furthermore, more and
> more packages are being ported to Rust which means m68k will either die
> a long death or have to switch to 4 bytes alignment.

Is this a Rust or LLVM issue?
In case of the latter, how is llvm-mos coping?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
