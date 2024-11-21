Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD2C1AAE1B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Nov 2024 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732215159; cv=none; b=gIrNK/ps/VbPHcpI49+qQadWuohVGJrTsM25cAC7L/OzoO0yA/JldkS/d/Hv+LLvhjM7fhpcMZGlSMMbymKtadQZxJHZ3GESHL00699PY75nc+egHzApr8RwJZDb7fdZqyZFI7rzVd7pj5B0y2Ke+MX4HQiyzP1w3a7MnfzFfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732215159; c=relaxed/simple;
	bh=oqqondy23S74aGu5BrVkzbnRTmFRm6XLzCNLrVkrraE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4VwwUrLifEkGl1MKFBQpm1fxV/EjcpYmv6APJOorjXHDxKAEpb6RvqW7P1TiOP5rvEdO0wK2cg6T4qptTDWR8MhbroE1gPeIyUwz5YTLQL1ZcCL2O1p3jG1EKbYKnOqJKlDXTmZzCXEQSlaqkFzpDo6+8EvQ54CJ6wQ32di1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so1214204276.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Nov 2024 10:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215156; x=1732819956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiKmU47CtbBGWKBpE0HqbPui0PwogHusuDbrIOQ4p9Y=;
        b=PWE9kF9kBd9zEhxKSuc8ZoRUtb+waBFeewu38JbkKg2GET3clklsIs1zyV05F/zMAr
         bH91+WKPUw6gs1YrlIo6WprA4eeAVnQEPg1yq/RlsKNj+NiPlrfGY0q7Fc+hGGkgg4iG
         EcVfkQx7ojLLHxCSLZhgktq3PSFJRwLflYa8DL70h3FuywofvbXF6//uV5eaFoXJr33/
         xRPWxnNqdRJtx7pxTq0yXl/h0V2CtENjtFmBKsaad7jFOMV/pBZ9WMGqINqRDS6aaSxl
         Dsz1kzLcoN/osw7NxTWCHC7AhPHf5E8bVzFYTtJIdNgaSlxUNFd12hVbAN1wsc92p2QL
         7Erw==
X-Forwarded-Encrypted: i=1; AJvYcCWMv7C5LJ/SfsEWQMb9viHEdqQh+n0/QjeOongNE2mSeKhoyxSI7K/uicyuU5z2zuU7FP+gEeiSXzQ0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx5ZhZdlzPoj6q8CY33PhyeQe1TP1UzWJOE/i518KmgtsLL+GEQ
	Rux/Wc81qR4VgcfYhy2A6vSX7y5iOvekSeGNATXChaPbvhhRgfH2Vaq1TbkI
X-Gm-Gg: ASbGnct/WCXTqsDp1FR4arV9hNt+gu/mgI4qW1eJVYOFKTSNFM8BX3FTPizJSMO7p50
	xlknytcKNCZ1b9b8hs8KK/R+N/HmnVwA0hUyPuDyiaHOzdj0SKxbnghqruu99q99CWOl+9YgiMk
	a/C90MAYKMiXd4AoPOpoog2DoUTlyn/WhftTKEd9b9rThKtsxqLTaeQ1CmZPfwEjXs6BsAY6tjX
	KXDXLsqv+lFk/dIQBlFIEBM1Z7x7M+hw/l3jTM/xEj0JUee4OJuazRuXYzkkILUvxbfx3XadMS2
	+leps6hNLYdirI2H
X-Google-Smtp-Source: AGHT+IHyMFT3nOyTDDhQZNxTnCl0xxhPHSof6FKsO44HNRyM3nDFIlQUAj002IX0FpNXYVvyuwH/Ww==
X-Received: by 2002:a05:6902:2011:b0:e30:e0ab:8eed with SMTP id 3f1490d57ef6-e38cb56edf3mr7557895276.17.1732215155910;
        Thu, 21 Nov 2024 10:52:35 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f601c8f5sm87531276.10.2024.11.21.10.52.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 10:52:35 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e9ed5e57a7so10197737b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Nov 2024 10:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJSxpj8s7b+VtkWJjd6xEWhFNuy7GZjpPPrkWqpiT0hPAq+4lU5OAz5K8BvWChOQXtcpYNv56PTU+0@lists.linux-m68k.org
X-Received: by 2002:a05:690c:7406:b0:6e2:1a56:bff8 with SMTP id
 00721157ae682-6eee0b7584emr3584917b3.36.1732215155155; Thu, 21 Nov 2024
 10:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731450735.git.fthain@linux-m68k.org> <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
 <173193673970.37302.12055966881506116157.b4-ty@bootlin.com>
 <8140c873-3456-1469-8bc5-2e94d409cf8a@linux-m68k.org> <20241121174630cbc6cfa6@mail.local>
In-Reply-To: <20241121174630cbc6cfa6@mail.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Nov 2024 19:52:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCjC92DUxNiMQufaoaR4mzH+gshYnFayjka9-hH6DhFg@mail.gmail.com>
Message-ID: <CAMuHMdWCjC92DUxNiMQufaoaR4mzH+gshYnFayjka9-hH6DhFg@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 1/2] rtc: m48t59: Use platform_data struct for
 year offset value
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Finn Thain <fthain@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Thu, Nov 21, 2024 at 6:46=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 21/11/2024 09:13:32+1100, Finn Thain wrote:
> > On Mon, 18 Nov 2024, Alexandre Belloni wrote:
> > > On Wed, 13 Nov 2024 09:32:15 +1100, Finn Thain wrote:
> > > > Instead of hard-coded values and ifdefs, store the year offset in t=
he
> > > > platform_data struct.
> > >
> > > Applied, thanks!
> > >
> > > [1/2] rtc: m48t59: Use platform_data struct for year offset value
> > >       https://git.kernel.org/abelloni/c/a06e4a93067c
> >
> > Thanks, Alexandre. Would you also take patch 2/2, please? Geert has sen=
t a
> > reviewed-by tag for that one too.
>
> I thought Geert would take it as this only touches arch/m68k

I can do that only after v6.13-rc1 has been released, due to the hard
dependency on the new m48t59_plat_data.yy_offset member.

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
