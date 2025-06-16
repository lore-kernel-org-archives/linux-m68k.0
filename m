Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEA191F7E
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068460; cv=none; b=vCfnzNKtOeU4J5SfcClhDpzLfx+bY/HmrEyzYSC81bQmmFYZak2uZI1Ad7r7EcGIBpPF99fuT/JPOIMJoHYGXhq1SUxGph6u5ABFSst82dLgc+ZK7W48OGUAM5juJsHAJIlOYglFF8qJu/jB3aVcwPIxwQRKfT0CbCvqV844ouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068460; c=relaxed/simple;
	bh=68CrTtcISaplxhBqUGqwszijK0/7trBLQ5qKynTiuI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyNfSN+mcWi3EnA0kTHuxiK3Rq7xhX15Q95j9uuXtdxc1wBMPgnxaCvjFHGLA+UrOHcjpseQ5GkS9nkEm5uuvb/fm5MbuB9HtfVAUN1iqezOn4rCcdPmiSfWqgpT2toQK0HI38bwphL1LzUsDKGqidutvPL1NgcLlyzIJ2oryiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e770bb7b45so1266601137.0
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 03:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068457; x=1750673257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XT5tzPGrSiEVv5VLH4Brng8OmzArfdN3GlRiLSIRA1Y=;
        b=NzRo0u5gUNpNhqk12M5cRUyaNPbz2TE1kiTwViQHaSPQoEiPdmtRoE9E/g8tRiwQmz
         AcWkYFCGWX00/lGwqJRbmGt81toAy7aOZBhWuqCUh/rhoBinH/NEBrt7S9xn3Fj3Trw9
         fCnKVqDuyIPodK0/Ipmn60vIG30PfD9lI+Y0631jub0iCUlIirdmi6zhzq2xARzPu0zE
         QHi0Y/cK6kYjM5wQnddnB3RbuGwjX2128zKDYHogkKVdfdhazAL6btUhuFFUHDgvPGop
         csN3gjTrTa9QWiRCbZ8AWAj57ExSE8alzPTLfGBMZtWSkxrnW1w0Otcac+8PicJadZfZ
         Ba3g==
X-Forwarded-Encrypted: i=1; AJvYcCW1Jnfl/sUUEwZUfIYLiEyQO5Pikia+I5sJoZ8nZ+mpw0JPqcEyuwfBPJNZbm2AVcuCvKK3cOJn3e4n@vger.kernel.org
X-Gm-Message-State: AOJu0YxAA+4Oj+Ftdv4GfF7UWARZc0JhFEgAOGplpQS+raOu37Ur5VC/
	+4vWU73Mlrb6ELsdpTIDi4gt0e38EjY6qlwRp8GnJZ0cEOKKuQgA2z+oWeKBjrQs
X-Gm-Gg: ASbGnctolCEemlqcJKnueVKCvsUJGyz0FLvZdf4esUvrCxN9KTHFOdgd6385JRN02Qt
	fRb0zOvJnxhV5KZi7rU+echir8WngSMTEC/KFlkMQkB3GAEUpMPnwVlCPIX4G3oBo2NMrd3kder
	sBEwgvFnibmAfEUSEmzxvAPbhOR6iPVGZQEN71oul8+wo4yN0orHcphPfkKAz5amfP5XGlDrd2v
	dNDYQBcXUP2DMZQQ3Gxkmzgs0JA1WS7v2ibd2Jso4khL/ZDpYRlKaiY4RzIYg2/D5uyFnMsE76D
	y9DtA9BcIV0bz8ULwxAIV1wJ8kMT63YPPcRHE6v3JtT5WyVDPeaGa3kF3g57BeU9muyaPY3bKTo
	71RSttB5ssGbrL5zxvsWx53S0
X-Google-Smtp-Source: AGHT+IEhfvjo/Zi9yvdBRyFJWGePrSLR5ni3+RtN11Tb4NWz+i1N5h0/B7bUF8G+wXZ1y//ZB1fgKQ==
X-Received: by 2002:a05:6102:4b8c:b0:4dc:81b7:f031 with SMTP id ada2fe7eead31-4e7f5fc9869mr5454910137.0.1750068456884;
        Mon, 16 Jun 2025 03:07:36 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313e05f317sm1171861e0c.46.2025.06.16.03.07.36
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:07:36 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e7971effd6so1293712137.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 03:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCddqQ8Z8070QWiwymgwgyv7wOAKDwn28T7oJdKwnfM40Ba/YsZHfpEhIsfquJVtYnTqFIhzJ5yaaj@vger.kernel.org
X-Received: by 2002:a05:6102:2b99:b0:4e7:3efd:ac76 with SMTP id
 ada2fe7eead31-4e7f6161424mr5524502137.8.1750068455818; Mon, 16 Jun 2025
 03:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu> <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu> <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu> <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
In-Reply-To: <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 12:07:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
X-Gm-Features: AX0GCFu4RCVe2XEBMl4jn9cEyiUj4qVtnMt5oisuDzXVHCBOW6MHFG_bTdYepU0
Message-ID: <CAMuHMdUH3zfrxSV9UqxnG1dEnHA_SmeYVsmKzV3kzYq6TLnucg@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Laurent Vivier <laurent@vivier.eu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, 16 Jun 2025 at 11:16, Laurent Vivier <laurent@vivier.eu> wrote:
> Le 16/06/2025 =C3=A0 11:00, John Paul Adrian Glaubitz a =C3=A9crit :
> >> And there will be a problem with binfmt_misc because we can't rely on
> >> the ELF signature to know which qemu-user to run, the one with 2byte
> >> alignment or the one with 4byte alignment?
> > What about the ELF note [1] that David Brownlee suggested? Can these be=
 used?
> >
> > Adrian
> >
> >> [1]https://www.netbsd.org/docs/kernel/elf-notes.html
>
> binfmt_misc doesn't use the sections to select the interpreter, but the
> 128 first bytes of the file.
>
> I think you need to change the ABI type in the ELF header:
> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format

Interesting....

Does any system actually use ABI (byte 7) =3D 3 (Linux)?
All of amd64/arm/arm64/ia64/i386/m68k/microblaze/mips(el)/powerpc/risvc/s39=
0/sh/sparc
seem to use 0 (SYSV).

#define ELFOSABI_NONE   0
#define ELFOSABI_LINUX  3

Ah, parisc does. And C6x uses 0x40.

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
