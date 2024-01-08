Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2313ADD
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5f2aab1c0c5so18000257b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 01:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704707811; x=1705312611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6zcoW9ZBE4FkJfB/Sgrd9ilZjNAT7x2Y69neKzMmhA=;
        b=RD7GlDrddevKlnPiX2g4+RDh7prCnLalbaHPmwGCpu6m078aqKGUqugA+eYiin6v/5
         Cp08lFTYdSqUYKWMQJy+qP1qQa9tGrN03dqnJyu602Xv0cqxOIdRQL9TUsaw5I9LJJSu
         RVxEF0bADPoSKtIgtvRqXVGxYkRgRuCef7Qu/t9Md45Ofezbmz8XDLH/skpMjCL9ph/V
         ZR0jFMOqoaBYlFgCUdmZP/SbqWnI4+L0b6Z8hEg3LsSnUZlNgjVPo2wt/KHwWPjVZcCo
         sC32MQDH8ip37GadB46mfsdR/qFExa18UtltSi54E92KYlfls0Tj/8cajwCasRo4pi6j
         TYHg==
X-Gm-Message-State: AOJu0YxuPcvPHeTSRLzlOL/MLsUsPfXZb+TGJaI1L6Sim24cRqnnwitu
	7fgPnuw49J2yKJyTgqjL+WaB76G/pni2/g==
X-Google-Smtp-Source: AGHT+IEjcMAATnoM4NTYDIaNQpiRi/nmE+qGvqIL27WOCfwt0ySD6nYeN2VVoAr5SDl+StCPm6/5gg==
X-Received: by 2002:a81:7756:0:b0:5e2:af70:4f11 with SMTP id s83-20020a817756000000b005e2af704f11mr3652807ywc.38.1704707810601;
        Mon, 08 Jan 2024 01:56:50 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id q1-20020a0dce01000000b005f134299392sm3044873ywd.52.2024.01.08.01.56.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 01:56:50 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbdb124491cso1131344276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 01:56:49 -0800 (PST)
X-Received: by 2002:a25:7ec7:0:b0:dbd:726a:21f0 with SMTP id
 z190-20020a257ec7000000b00dbd726a21f0mr1894139ybc.16.1704707809104; Mon, 08
 Jan 2024 01:56:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108093221.1477020-1-daniel@0x0f.com> <20240108093221.1477020-3-daniel@0x0f.com>
In-Reply-To: <20240108093221.1477020-3-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2024 10:56:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
Message-ID: <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: Fix interrupt stack frames for 68000
To: Daniel Palmer <daniel@0x0f.com>
Cc: gerg@linux-m68k.org, fthain@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for your patch!

On Mon, Jan 8, 2024 at 10:32=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wro=
te:
> The plain old 68000 does not push the frame type/vector on the
> stack when an interrupt starts like the brand new 68010 does.

;-)

> This means that currently everything in struct pt_regs is
> a bit off because it expects the processor to push an extra
> short before the kernel interrupt code adds the rest.
>
> In entry.S for the 68000 we already need to manually put
> the vector number on the stack to work out what interrupt
> is being handled because the cpu doesn't push that to the
> stack.
>
> So we can jiggle this around a bit to fix the issue:
> - For 68000 use the same struct pt_regs layout as coldfire
>   where frame/vector is after pc and sp.
> - In entry.S push the vector number first, the stack pointer
>   now lines up with the sktadj field in pt_regs and when saving
>   the remaining registers the offsets match the fields in the
>   struct.
> - Remove the vec argument from the DragonBall interrupt
>   decoding logic as it's not pushed on the stack anymore
>   and not used either way.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

> --- a/arch/m68k/include/uapi/asm/ptrace.h
> +++ b/arch/m68k/include/uapi/asm/ptrace.h
> @@ -39,7 +39,7 @@ struct pt_regs {
>    long     d0;
>    long     orig_d0;
>    long     stkadj;
> -#ifdef CONFIG_COLDFIRE
> +#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
>    unsigned format :  4; /* frame format specifier */
>    unsigned vector : 12; /* vector offset */
>    unsigned short sr;

I think it would be better to use the classic m68k stack frame.
That would pave the way for building a single nommu kernel for
MC680[012346]0 that runs on e.g. any Amiga.
MC68000 and Coldfire are incompatible anyway.

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
