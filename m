Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56360EDF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Feb 2024 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708424613; cv=none; b=h/RpqSPsBU9zLQgYnU6+NzQCz62mgf46hN4/svDhUeVyxCCEjO4/ilm+gO4RaB+ikv0qRZSvSmUNnx1o0Uko818PKvmsgKjWK4L8a5UpPTeJ9SZbee0FamXTfCAxeORkJsbrraXNsyvDwFTqItYaYsUtPN5nAZxtA0n/NRqqJ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708424613; c=relaxed/simple;
	bh=mLt4xmejzlrsSSdRTa1yS9wn+ZVm8cOBAXhmP0gRgxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKcRq9dN+pwtx+i1/jDVn97FUNEggL/+ZMrv0tAqgxeghgdq+2QyOryo400NW0SNd5TJZwdQUbY18360ZnmwU+hTzyrOtBgZ4AlLGFwKLZy3R7MzAd4DvJGpKmmApkzesRuhKZVcvl2os4IL697seMZQS7N9SaZ9B6cuXgAhU/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-603fd31f5c2so52743167b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Feb 2024 02:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708424609; x=1709029409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12Kyp8aB3rpgIdqlByHzUCQrNKWenvMCDuD+CWYwf7E=;
        b=kGRQR0KZDPs2e+l/l4vJKCPt9tn/xPMVlnm9l3CfEDINUtrZO5d7PbWBBPg8BXtgXF
         gxr6eozCqByRPPm1Ch5D4Ev9d2VwCUYixDfaHanjy4uybDSbIoggHvweYUoykSlzJVar
         JZ/eDKMiZvgTnbIuQlTHZmN9OawSb7MchN6X7WCrDABTLmjjgNmRMMZbd+y4atzw6egH
         Hk9QqW6KkpdCz+Powe1XT9H0eIcPZaS0+Qc0bYOLVVpGOAt8rRpWQ0Qw14XBK/RvMXBf
         JHHzC29EwMey780YFZItoBey5FLusex3znAt1AAk0A1cnan5jKY1H/XmhfQVVOwbhNfk
         EHkw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZX8G5Cuo3Heyat5ZpCoFPVVLzyEGdhYBNjcD9fqciarJlYevvWo2JXn9qzK7UWK/hAUrE3jJb3HurCmzu1m8lm8YSc0i9A15EGKaYbVq
X-Gm-Message-State: AOJu0YwXmXHkh9NjMICtX/pHDTMKnjjOrbMM6LGPWzon1oz2PJ06zHan
	/ruw6cH8P91gByFA8GDS18OJ9JDhdG28vhBWn6cX2JwGpj8xCTQ8Z08It6imUFU=
X-Google-Smtp-Source: AGHT+IFVZAVyt7oDPJVU4f2yUTU/zNUMZZm0qfCJDkChWLaOV97u24CoHf3l+82DcjNF9oGSMha2IQ==
X-Received: by 2002:a81:4fc1:0:b0:608:4073:6d4c with SMTP id d184-20020a814fc1000000b0060840736d4cmr2740167ywb.20.1708424608928;
        Tue, 20 Feb 2024 02:23:28 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id m205-20020a8171d6000000b006048e2331fcsm2040111ywc.91.2024.02.20.02.23.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:23:28 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607e54b6cf5so31473377b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Feb 2024 02:23:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmmUGo2w1END2003ZWUAdymxP0GVctAuxI252I41ZtsiizJ1Mf2SVcZbszfBPorwVAbvxxx0qI/BbjkqSvViijFjMC78BDZuKYyRLQp81F
X-Received: by 2002:a81:4f84:0:b0:607:df5f:5e0c with SMTP id
 d126-20020a814f84000000b00607df5f5e0cmr9142339ywb.3.1708424607929; Tue, 20
 Feb 2024 02:23:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219164002.520342-1-thuth@redhat.com> <c44bfc7f-7b06-4985-953d-185f8b576a5b@kernel.org>
In-Reply-To: <c44bfc7f-7b06-4985-953d-185f8b576a5b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 11:23:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXc=rR9udEmMsCJof+sCxdoJryF49-Gy9j=DJqiHyUsvQ@mail.gmail.com>
Message-ID: <CAMuHMdXc=rR9udEmMsCJof+sCxdoJryF49-Gy9j=DJqiHyUsvQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial: Remove unused function early_mcf_setup
To: Jiri Slaby <jirislaby@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>
Cc: Thomas Huth <thuth@redhat.com>, linux-m68k@lists.linux-m68k.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 6:11=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
> On 19. 02. 24, 17:40, Thomas Huth wrote:
> > Compiling a kernel for the ColdFire causes a compiler warning:
> >
> > drivers/tty/serial/mcf.c:473:12: warning: no previous prototype for
> >   =E2=80=98early_mcf_setup=E2=80=99 [-Wmissing-prototypes]
> >    473 | int __init early_mcf_setup(struct mcf_platform_uart *platp)
> >        |            ^~~~~~~~~~~~~~~
> >
> > This function seems to be completely unused, so let's remove it
> > to silence the warning.
>
> And it seems so since the driver addition in 2007 by:
> commit 49aa49bfd40d718095669c1c70c9d167b814e29b
> Author: Greg Ungerer <gerg@snapgear.com>
> Date:   Tue Oct 23 14:37:54 2007 +1000
>
>      m68knommu: new style ColdFire UART driver

Indeed.

Looks like the "changes to the ColdFire based m68knommu systems
to use a platform model at init, and this is used there" from [1]
never materialized on any public mailing list?

Greg: does it still make sense to add them? If not:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

[1] https://lore.kernel.org/all/47254BEB.2040609@snapgear.com/

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
