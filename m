Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205C1D0BA0
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730806276; cv=none; b=FtonACuq0q6V/6JioPsYFxJO7o7iwuS50+ZhbRjOCR2bksrJE5ESdxMmriu3u6JZd9q0uGk/V4BJPuCVG7Jpt6ZtozTBO5H7UHgPPnhXvngwYzgyT0eklZct2O69dTXHxDU+El0/KXVlGLwq7j+rCx5hpICuG3EMUxopu3ooXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730806276; c=relaxed/simple;
	bh=fjybbPLO/BWHNGOywGvWPA3ZiGSWpzxjmYukNCTlqp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlvBPVd4l6kNzJUFUrnHD5XLMxWEQbuGPUNwqCWpUZooXEEY1Jc+3cq+qOAv0hVf3eI9sUq7JlLAsIbl9He+K35RO+hcFVBBQrkHg3Dfy33WobtBfhNOuLROyew+r0wWKdSkfPedRvCekARkKckEV6rqpZV9SLIQjrhrYHMK3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3009472276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806273; x=1731411073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuN371NGARBXakroR5Vw4RFIFEwA0E/afFCyC5RBX9Y=;
        b=nDMUv1xug9wcWjbsvT48ppt1qe4bEYZ+Za1ARLNhn9tKJAoGk3K6ha/BpIfg6LR6Nm
         zkJ2ZZ9Dq6ipkODw/eFzsMul715p1Uf7MunAaVOOBOtTZ/yBhgfR6eZblVN1XhU0ULCr
         hvOGMuifob/LZpnq8uGx1e0IrOROf34JecG9/C7LTsRMZ4K8/f+kJpBdlcavrmzobwIs
         S3GrOe1LzFxezbpPwy0H66osDIr3gyBh8RheFuScuyjiv37gVIANOyIEkoEbdmaOpV0y
         TFJIo/amgNJccNSTDmiMg3x5YuJqh17cqvySM0fYc+RlfGsU8hLnUB/EU6uBuRroaJMP
         y4qg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2n/arozB3XK9WtLf9qYXU14SKCyfF48cz63onwgUF618Fh2Q7XGlvudKa8EfU1x4Sv/T1TXmUUfQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyLaXo71KTN8xkdn0eq/0eKR39++vGGkUkHQ5ah/PKltIl2AT7F
	sqTedKEM5FIkFP3uxoMehEI6O8iY13usL3V1ccbjnukDnC+RNTl8DJr38BIP
X-Google-Smtp-Source: AGHT+IHVPnFfHww69qkaWr9bN6kgixFcjgNfyKbbmA4B5OxOZeMecOVHLqy4rdwTebXu09QcktxynA==
X-Received: by 2002:a05:6902:c0e:b0:e33:4854:7c79 with SMTP id 3f1490d57ef6-e3348548d86mr3179198276.30.1730806273216;
        Tue, 05 Nov 2024 03:31:13 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8acda8fsm2443438276.46.2024.11.05.03.31.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:31:12 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3009435276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpm2WL8Z+RpNNtq5YbXhcW++2fz+vEhW/1q3JoweZ/uPrGja7PIuhS2FLony9SLEPBUzJ3iu0OY6j+@lists.linux-m68k.org
X-Received: by 2002:a05:690c:a:b0:69d:e911:88c3 with SMTP id
 00721157ae682-6e9d8acb3bfmr309446657b3.29.1730806271787; Tue, 05 Nov 2024
 03:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0e7636a21a0274eea35bfd5d874459d5078e97cc.1727926187.git.fthain@linux-m68k.org>
In-Reply-To: <0e7636a21a0274eea35bfd5d874459d5078e97cc.1727926187.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 12:30:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZV7Fjy3ZmFimwoYqC2dR3zdjRKdS_rWQ37o-rA64DWw@mail.gmail.com>
Message-ID: <CAMuHMdUZV7Fjy3ZmFimwoYqC2dR3zdjRKdS_rWQ37o-rA64DWw@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147: Fix SCSI controller IRQ numbers
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, stable@kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 5:32=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> From: Daniel Palmer <daniel@0x0f.com>
>
> Sometime long ago the m68k IRQ code was refactored and the interrupt
> numbers for SCSI controller on this board ended up wrong, and it hasn't
> worked since.
>
> The PCC adds 0x40 to the vector for its interrupts so they end up in
> the user interrupt range. Hence, the kernel number should be the kernel
> offset for user interrupt range + the PCC interrupt number.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Cc: stable@kernel.org
> Fixes: 200a3d352cd5 ("[PATCH] m68k: convert VME irq code")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Reviewed-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.13.

> --- a/arch/m68k/include/asm/mvme147hw.h
> +++ b/arch/m68k/include/asm/mvme147hw.h
> @@ -76,8 +76,8 @@ struct pcc_regs {
>  #define M147_SCC_B_ADDR                0xfffe3000
>  #define M147_SCC_PCLK          5000000
>
> -#define MVME147_IRQ_SCSI_PORT  (IRQ_USER+0x45)
> -#define MVME147_IRQ_SCSI_DMA   (IRQ_USER+0x46)
> +#define MVME147_IRQ_SCSI_PORT  (IRQ_USER + 5)
> +#define MVME147_IRQ_SCSI_DMA   (IRQ_USER + 6)

Indeed, in all other locations where IRQ_USER was added, 0x40 was
subtracted, but these two were missed during the conversion.

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
