Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCF266EE9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767114; cv=none; b=GvAP0uFWzdFWdRcWylGPV28Ec81iFnvl6derqQDPIeMVRyDcGeGgeN/j+PyAOxyo03orqH4ya/2NBquSV7Op87y/BiZzUqh8kRjhV3Ooob373+7vqv8TYmNWqHOQPKN8xNz1cvE2ni1kNdWeVnJ5H2FrNtSiwjlFNrT5jo6WC6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767114; c=relaxed/simple;
	bh=/fJzjpPCho25zV5kgp+Mt+JXbM7T0RiVyjwGWi7iCBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoFigdI6jWTFumTuMEUMTzTxLJmf+LI6Ew0wHaGXHghrTDYcYcE3FZn+eLt/m+9R7aB1482xu8XNqi/WClv4nLUCFVsOsveMeiN5i3wpyYHYqeCy9YO7DjgeZ4+UjZ0C7d7EcJTeYrWtaaMhETJnopwg7kKqymAODiFYutcRlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso1652012e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 01:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767111; x=1763371911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRtPdzI1Yw78zykFlB0XCziKqeVOXzigJtW+jsiVzcI=;
        b=NfXvvHKVSfkEDlp7zxq9e1GvOE8UWeqEVe32GlaTuylMz4JW19XuP5erlVI019wFN8
         ziXiEzCQtO+q9IECA1RlnO585O+OO7AafTV90mLwTOzGdm6/+JHNd0dLjUdo/o0nFj5G
         1r9cpqQm6X4zHiib54i7egtj2Oy8Z8NOpmzYjU16Dmu9TyQJMOtKMCSUUWPbnz0B7EQK
         dcdjAMqDaIL7iWo9vLpSi22+jYhh50BHrRHn1iQ2P7uTF6I5XlMSvYJCL7I0cDpWKASN
         flq/p6heHaBHLqWtaJg7mzd7Tgsdkx5CSoBjCJyA1oNLwoqSSF0Cfqrv7W85UApejAuV
         o/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUK+6o3OeJyQAKyarB6tzkWz+yS7ZKV3MlsYhnFlgij8BCq+RBb2qPe0E9bmhCtSbK8StZ5xEdM8tqt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxVyeSJCYpc1UqhO/mghKJ9n7xVzhHFAr/1+TOhi8js1+V33bfN
	aFwDDIcnINlBK93siYTEhmQ2Ox7YqR8MoyPshVeP2W1Oz6n9BYAU2/atliW+XQ3e
X-Gm-Gg: ASbGncsr6ctIHX+hon5IIEegyIr694EEI8hMIDwPE8IKJ6HwpjgToAWYkc0yWI4/mtH
	PZ62p/cywGv39PzUQA+L2XexK13Me3bvPCh6hOpiRvvsgyVhPmXh6Ke3J6EB/hMsZnH+Mbq7ydz
	PyrhNHkwJyJHl3SO50Id6C83q+G2S9Z2JR3yY94rfCvypJekxpniNfeQfoYuTvgy72bYZvgXmpf
	zleMYYZunjhakK5omKzReqtSKvT5WWnhyjcxf2IMmeIwxZRmVkDARc8CawEUKyY5E3IjJTGCR4m
	cBhD0hZ36FLpK9sbgU7gahj23j6BqDR/VsHNqR3pCaBnnndElr63G0WWJBMyDBAU/GLELn0kFOo
	o4Gbe0VrEdKNvU2FBTgplJLHPxfzGRBpZKranMVfwPSJuTXnW0OXAxXteD2BRH+mRe6B0bJoShB
	98GcgXbIRyxvSR1eg+gMLWJRaAi8dw0WIRPe1JZjUlUg==
X-Google-Smtp-Source: AGHT+IGtgHs20BQJHFjyn40aC9OsCGGrOkG2fNQf4sUGK7jS8mzbGpU6NrqJ/jzEN8QGXdRbjh3PZg==
X-Received: by 2002:a05:6122:2906:b0:54a:992c:8164 with SMTP id 71dfb90a1353d-559b323e16dmr2186098e0c.7.1762767111259;
        Mon, 10 Nov 2025 01:31:51 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55996e27abdsm6704094e0c.4.2025.11.10.01.31.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:31:50 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dbcd54d2d8so2488287137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Nov 2025 01:31:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSe05t4WIPwPrDab649DvJygCiR2NJAKswuiQFQuaV/vaWr0LgRnizGCISUQUSZFgUKTJorWo2rlgz@lists.linux-m68k.org
X-Received: by 2002:a05:6102:c04:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5ddc46497a0mr2779273137.2.1762767109934; Mon, 10 Nov 2025
 01:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
 <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
 <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com> <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
In-Reply-To: <12779401.O9o76ZdvQC@jeanmichel-ms7b89>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
X-Gm-Features: AWmQ_blSVM0mC21k2j7-_pQqo1T8ZhoFgD5EPrlyILfYI73Lumvke_itdhGi4eY
Message-ID: <CAMuHMdW26uKBUnYB5c3XAzKPKFVGNoOOwra_u_NOjPCV20Y-AA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Mon, 10 Nov 2025 at 09:34, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le lundi 10 novembre 2025, 09:15:11 heure normale d=E2=80=99Europe centra=
le Geert
> Uytterhoeven a =C3=A9crit :
> > On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> > > Add platform device support for the MCF54418 RNGB hardware with clock
> > > enabled at platform initialization.
> > >
> > > The imx-rngc driver now uses devm_clk_get_optional() to support both
> > > Coldfire (always-on clock) and i.MX platforms (managed clock).
> > >
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/char/hw_random/Kconfig
> > > +++ b/drivers/char/hw_random/Kconfig
> > > @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
> > >
> > >  config HW_RANDOM_IMX_RNGC
> > >
> > >         tristate "Freescale i.MX RNGC Random Number Generator"
> > >         depends on HAS_IOMEM
> > >
> > > -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6=
UL ||
> > > COMPILE_TEST +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SL=
L ||
> > > SOC_IMX6UL || M5441x || COMPILE_TEST
> > Is the same RNG present in other Coldfire SoCs?
>
> According to the RM, it is only present in MCF54416 and MCF54418.

I guess that is sufficient to make it depend on COLDFIRE?

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
