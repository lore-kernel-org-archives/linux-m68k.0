Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D33192D77
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732042962; cv=none; b=hS0eS05ZWeNlHXMEzBufuWv1c8HtYt+0AzBnKWM8uNgGfTqELUlM73BVLDvzCTa18IejTEmx32ekrteOzUU8HfsZ4Na9k6TIXCDS4mBazzrvsJd7T141Sr7JRkRkApfWQBfH3kpaDXnfmFYwmSA8pkm4WuBWFvPpeoxDiZkYUjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732042962; c=relaxed/simple;
	bh=y+UxJkEPesqMLF84U+t/E/lqQVamvm5QAcaft0yOS8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoqTmBiND9nAsFj8eMuJwc90LByjGzRa4hqiFsvtM2Vsb8/7cwK6hKw58Mi4O2atzioxGyEUVfHDA4JPwcmIN3Xr3nRxBJcPPmJm+NSstyl8OZlqdnQKJ8TS0VOmJe/jxLU5FEsI51mU2Td2FPjbTfCoO+oAmzhlegHhuIBGqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eeb66727e7so7741897b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 11:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732042959; x=1732647759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0fp0XnUxNxL7PZB7gv+woUGcpwTbov1O1u2skS2Vxo=;
        b=Rm8fDllvAgOPonwL+6paji5IIr3HPG8NQH7CQcpPGd1JQsURPTdoC5HnyaSlenYhBi
         nu5PFtcvMoU6hTIDhr9J6kcd9vvGkaqRJgNWJOVA12/MWGrePbT9i0XsdxegZtWlVR2E
         n+mfVP6+Qdzi6UrXMdukSvdtPcF13ZjRQ1YpZluzMmXqtVYWXmRabwi1I9qbB9pw0M9c
         Rj2NNX2aLk6WqtpSXgzKtwEPubdmTtO/xxDpjAosqkG5ZDLdfs5czZWMAwo0hjaPrg0x
         mdUSg3tviQ9Iaogxrwh0pntlmv5vsBK24mhlhXerX36LDt8zyLvYr/qEdSWl2cahsTTF
         qR+w==
X-Forwarded-Encrypted: i=1; AJvYcCXUivxhhx2GfjMZIE/axsTnng4Oget7R+JUtGM4WYwE1DrqxuTeatVURgNcTc4V0yg2UciAsUVULpxv@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxw6lmVrslJIKNOk9unQ/f+52FQ+nQL/0KKS1kLNA6GmxUBauVN
	0qVbpofZGJh36TP/MKqUa9qVB6gogBetmrJDRFhj7OEMLebsh4MTZqZtS79V
X-Google-Smtp-Source: AGHT+IHkAm/H/+yL7BMP+qEpJ99pCTIFGKuKW4M4QM4/wixHt+pDolnyGyIdOzcgxKV4FR7fpQnJMA==
X-Received: by 2002:a05:690c:94:b0:6dd:fb99:c220 with SMTP id 00721157ae682-6ee55a4f04cmr157776077b3.11.1732042958645;
        Tue, 19 Nov 2024 11:02:38 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71342667sm18565687b3.75.2024.11.19.11.02.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 11:02:38 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee7ea48ad8so16089707b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Nov 2024 11:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMZTgOuk8DjLtojy1LcmYStK29FhiLVr4bcO2QipI43Qj5oNl9XURgyIDCZPXn9epJs8z8PjSHc3wK@lists.linux-m68k.org
X-Received: by 2002:a05:690c:6404:b0:6ee:6e8e:6f84 with SMTP id
 00721157ae682-6ee6e8e71ddmr133325447b3.12.1732042957570; Tue, 19 Nov 2024
 11:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029152249.667290-1-axboe@kernel.dk> <20241029152249.667290-4-axboe@kernel.dk>
 <37c588d4-2c32-4aad-a19e-642961f200d7@roeck-us.net> <d4e5a858-1333-4427-a470-350c45b78733@kernel.dk>
 <ffc9d82d-fedf-4253-bbc1-c70c339c8b23@roeck-us.net> <CAMuHMdVAnJ8Tczm1=c=HOiWMZrNk0i_c1guUoqQbJRmdaXqPGw@mail.gmail.com>
 <5a7528c4-4391-4bd9-bbdb-a0247f3c76a9@kernel.dk>
In-Reply-To: <5a7528c4-4391-4bd9-bbdb-a0247f3c76a9@kernel.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Nov 2024 20:02:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9rHUQYn34_Hz=3TKjbFqzenoDCdwt-Mqk1qXJiG4=Zg@mail.gmail.com>
Message-ID: <CAMuHMdX9rHUQYn34_Hz=3TKjbFqzenoDCdwt-Mqk1qXJiG4=Zg@mail.gmail.com>
Subject: Re: [PATCH 03/14] io_uring: specify freeptr usage for
 SLAB_TYPESAFE_BY_RCU io_kiocb cache
To: Jens Axboe <axboe@kernel.dk>
Cc: Guenter Roeck <linux@roeck-us.net>, io-uring@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens.

On Tue, Nov 19, 2024 at 8:00=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 11/19/24 10:49 AM, Geert Uytterhoeven wrote:
> > On Tue, Nov 19, 2024 at 5:21?PM Guenter Roeck <linux@roeck-us.net> wrot=
e:
> >> On 11/19/24 08:02, Jens Axboe wrote:
> >>> On 11/19/24 8:36 AM, Guenter Roeck wrote:
> >>>> On Tue, Oct 29, 2024 at 09:16:32AM -0600, Jens Axboe wrote:
> >>>>> Doesn't matter right now as there's still some bytes left for it, b=
ut
> >>>>> let's prepare for the io_kiocb potentially growing and add a specif=
ic
> >>>>> freeptr offset for it.
> >>>>>
> >>>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> >>>>
> >>>> This patch triggers:
> >>>>
> >>>> Kernel panic - not syncing: __kmem_cache_create_args: Failed to crea=
te slab 'io_kiocb'. Error -22
> >>>> CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-mac-00971-g158=
f238aa69d #1
> >>>> Stack from 00c63e5c:
> >>>>          00c63e5c 00612c1c 00612c1c 00000300 00000001 005f3ce6 004b9=
044 00612c1c
> >>>>          004ae21e 00000310 000000b6 005f3ce6 005f3ce6 ffffffea fffff=
fea 00797244
> >>>>          00c63f20 000c6974 005ee588 004c9051 005f3ce6 ffffffea 00000=
0a5 00c614a0
> >>>>          004a72c2 0002cb62 000c675e 004adb58 0076f28a 005f3ce6 00000=
0b6 00c63ef4
> >>>>          00000310 00c63ef4 00000000 00000016 0076f23e 00c63f4c 00000=
010 00000004
> >>>>          00000038 0000009a 01000000 00000000 00000000 00000000 00002=
0e0 0076f23e
> >>>> Call Trace: [<004b9044>] dump_stack+0xc/0x10
> >>>>   [<004ae21e>] panic+0xc4/0x252
> >>>>   [<000c6974>] __kmem_cache_create_args+0x216/0x26c
> >>>>   [<004a72c2>] strcpy+0x0/0x1c
> >>>>   [<0002cb62>] parse_args+0x0/0x1f2
> >>>>   [<000c675e>] __kmem_cache_create_args+0x0/0x26c
> >>>>   [<004adb58>] memset+0x0/0x8c
> >>>>   [<0076f28a>] io_uring_init+0x4c/0xca
> >>>>   [<0076f23e>] io_uring_init+0x0/0xca
> >>>>   [<000020e0>] do_one_initcall+0x32/0x192
> >>>>   [<0076f23e>] io_uring_init+0x0/0xca
> >>>>   [<0000211c>] do_one_initcall+0x6e/0x192
> >>>>   [<004a72c2>] strcpy+0x0/0x1c
> >>>>   [<0002cb62>] parse_args+0x0/0x1f2
> >>>>   [<000020ae>] do_one_initcall+0x0/0x192
> >>>>   [<0075c4e2>] kernel_init_freeable+0x1a0/0x1a4
> >>>>   [<0076f23e>] io_uring_init+0x0/0xca
> >>>>   [<004b911a>] kernel_init+0x0/0xec
> >>>>   [<004b912e>] kernel_init+0x14/0xec
> >>>>   [<004b911a>] kernel_init+0x0/0xec
> >>>>   [<0000252c>] ret_from_kernel_thread+0xc/0x14
> >>>>
> >>>> when trying to boot the m68k:q800 machine in qemu.
> >>>>
> >>>> An added debug message in create_cache() shows the reason:
> >>>>
> >>>> #### freeptr_offset=3D154 object_size=3D182 flags=3D0x310 aligned=3D=
0 sizeof(freeptr_t)=3D4
> >>>>
> >>>> freeptr_offset would need to be 4-byte aligned but that is not the
> >>>> case on m68k.
> >>>
> >>> Why is ->work 2-byte aligned to begin with on m68k?!
> >>
> >> My understanding is that m68k does not align pointers.
> >
> > The minimum alignment for multi-byte integral values on m68k is
> > 2 bytes.
> >
> > See also the comment at
> > https://elixir.bootlin.com/linux/v6.12/source/include/linux/maple_tree.=
h#L46
>
> Maybe it's time we put m68k to bed? :-)
>
> We can add a forced alignment ->work to be 4 bytes, won't change
> anything on anything remotely current. But does feel pretty hacky to
> need to align based on some ancient thing.

Why does freeptr_offset need to be 4-byte aligned?

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
