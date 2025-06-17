Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CD75C96
	for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159312; cv=none; b=EY1lxIL+RTOhQSoecl2lNAkMD6ToLwLmgg3yJJFVsq++qH0SUQcksNJggHsZmsAIjMObkXG8fkebVPdeua9dHM40DfwUPDUx7uMw0QIyO9BY8DzdOW9gLULnv6X92XHXxWaU/LAvljLd/t2GNudqKRjCe4uk/HMNMfBDPapQDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159312; c=relaxed/simple;
	bh=dPDUDIYrXGdrowISqiTQ1V5iJBDG9W6il4uFRy3Jz5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLEuZSJJ68hsfutTZgpzx6RxyMXulsZ/hZCdn40cPmfzW/JUQcNP37UQYF7WOI3RH9jaQ+7ffyfjaBRv4AxUNvXQqS5BGP/wt1SMiIaDQtDjyBr1xDXNB7d75yskA0k1HFPw/KYyhptrQK40HPkp0aF2M+aCuw3pyvSiRf0heXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e80edfa06fso659894137.2
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 04:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750159308; x=1750764108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKRZ0ZoG+dRtAJ01BDIXEVwjMFDuT9AwdQ23Z21QXBE=;
        b=Q3xmDY3oh2Lcu53t4F2ZGiC+m0mX/CV8EhO4F7xK3lgL6a54IXea62buv+EHfy2Ii6
         91P+zdBjD0I3iO7UiIgA6mUV9kFLqiLTSbsOkquCcbSp5GgLZ8vY1kINNaEu6cSHZ1og
         0dhqyKAIqtzCvIn9HF3n7Q08o7qlsM0mTG3I4rS7+6IvtO09LrDAt4SCfqeI/CWlkONJ
         Zbz0k7BZCKBVF3daStsEtpVL1UFFVTrVVn667zguEPJHD4eRsiU45P3row5xfNUe8zco
         t5jCLqnx3oUPKYWd4V9X/w0/Pufd9xF27zNH4Uziak5w+GUDX8Mzu4CNkxUGEV27QHjT
         8kvA==
X-Forwarded-Encrypted: i=1; AJvYcCVzCQSR7kBEERJsdaVetb/4C9kj3XCCiRPB+C7rkYECw0r1LQ4AQmeZJU7NIb8UiHFpV0qY7V4vTXJz@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhoToyydDjqQh9sqJ9jdvfBvxxSabIqwAp0sXSFaXi8byUUTf
	5asO9vsZhy9BJ2507bvmY3Sa+U92Mx5ew2Yd1UkRHMvZ4XI+Wtysq6EnkA/ntV9B
X-Gm-Gg: ASbGncsoV/Qn3N6brXyXDESqd+7yfciJAYWLUZpmEe6ejHHv33QFF7/ZRWmCI9fT+qr
	nchBhPSdQRxSIETOQn+2eksvSojmFqoZU0f68HOc7cyEKzmxnM7nrvfC7U0v0cud/PS7R3yVjTH
	KOBASkAgiM1JyFp/4zo2smP4ijOggHSQ+y7CiwD3Ac+Yju6xu2PHwVBRa5N5EZZ6LY7vO/JU+dN
	xROYNTlxwlHodcz92+du4EgmwdEAupcAIUmrQ1lhYg3ubqmnnHVmmGhGIAiWWcyJbriSDPPdXYy
	ZS683CIyG5BjeKXdqedauMrKsXbNlz+638VkkwzuFnp5ErEgyz5L3fqO3qA6JbmT1Zv9KhWy4dV
	cumJmHqA2ykLCrKXQNtyD7fNQ
X-Google-Smtp-Source: AGHT+IFvqpWfxtMZvZVzrifbzhoiTpn2KUR9b3ACvhmvL5TD5HOotPMByk61iaQyu4/pOwSDGfOiZg==
X-Received: by 2002:a05:6102:4b88:b0:4e7:db33:5725 with SMTP id ada2fe7eead31-4e7f632331bmr9516685137.3.1750159308220;
        Tue, 17 Jun 2025 04:21:48 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e70c6449sm1576239137.22.2025.06.17.04.21.47
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:21:47 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e98a88fa5aso104541137.0
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jun 2025 04:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeQryR1c3/gOQQrk39YepFzcfriMLaJ8HOYMo4czX2pU+Ty6taRHLsBtdKT8aWHHjYBZ21s+XEPJ41@vger.kernel.org
X-Received: by 2002:a05:6102:e07:b0:4e7:5f31:7443 with SMTP id
 ada2fe7eead31-4e7f6388321mr7875345137.9.1750159307365; Tue, 17 Jun 2025
 04:21:47 -0700 (PDT)
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
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <8cc5d290-ced1-cbe8-66c5-23977869f22a@linux-m68k.org> <235be957-538f-15bb-3d92-0a4e393906f5@daisy.zia.io>
 <CAMuHMdUznJ3Zm9JnhLG4MmEO1WODL0bddwN4rvO-eTdVUDzFjQ@mail.gmail.com>
 <bf1e84c20996f003645a182d46535758fea10b74.camel@physik.fu-berlin.de>
 <CAMuHMdV6zMWPOD_t0HoWgJDeGJardpqKgbZb9+HLCJZPsp-yCg@mail.gmail.com>
 <dd408059d1861b055623386e1b8aac5c5bd53e49.camel@physik.fu-berlin.de>
 <CAMuHMdVgqoFo132WPzAFcEG0gdxkCHA98jzek9b4Da+n_xOvwA@mail.gmail.com> <730b54f202dac75ec23d59e7c90bb1b13bd30a58.camel@physik.fu-berlin.de>
In-Reply-To: <730b54f202dac75ec23d59e7c90bb1b13bd30a58.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 13:21:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxUSQ3uKstM96U3Taj_dyCM5siGHO8i9qAO5iVadoTqg@mail.gmail.com>
X-Gm-Features: Ac12FXx5ol9MtzcxOsdoydBmh24ZwYZKxwYQZmFTMZsHWkii2shSQOiBRausjO8
Message-ID: <CAMuHMdUxUSQ3uKstM96U3Taj_dyCM5siGHO8i9qAO5iVadoTqg@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: John Klos <john@klos.com>, debian-68k@lists.debian.org, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 17 Jun 2025 at 12:13, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-06-17 at 11:59 +0200, Geert Uytterhoeven wrote:
> > > What's keeping us from creating an ABI v2 using either e_ident or e_flags from the ELF
> > > header so that we can fix also all the other packages that don't work like Javascript?
> > >
> > > If MIPS can have a plethora of updated ABIs and even POWER got an ELF ABI v2, why should
> > > that not be possible on m68k?
> >
> > IBM annual gross profit for 2024 was $35.552B.
>
> I'm not sure how this is relevant at all. What is the gross profit of the NetBSD organization?

IOW, you can have plenty of ABIs, if you have the manpower to create
and maintain them.

> > > > Is this a Rust issue, or an LLVM issue?
> > >
> > > https://github.com/M680x0/M680x0-mono-repo/issues/10
> >
> > So you mean it's an LLVM issue.
>
> It's an issue on many projects that use things like tagged pointers etc.

I know.  If you want to tag pointers, it is your responsibility to use
unused bits (Hi Apple 24-bit).  When using the low bit(s) for tagging,
you have to make sure the objects you are pointing to are sufficiently
aligned. BTW, how does LLVM tag pointers to chars?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
