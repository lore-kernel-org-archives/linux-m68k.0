Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616C11CAD
	for <linux-m68k@vger.kernel.org>; Mon,  5 Feb 2024 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707120648; cv=none; b=WI/hxfVVPz6Ez+UdjBNYZaP4SgJem8R7W2v8qsPTdcINPr1SsTxhE/qO3wC7HH1G2BI8LfiURRlxwt+toDU5DwsGxuofXEQ9bMheKFkldNM9sppxz9GjGoQktWHkDtN/pj1WQJ7sXAbgQLlZ2f1Q8gbfdmtM/YcyfhXMMSLtAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707120648; c=relaxed/simple;
	bh=z886diQCx8FBiESMrgrGn34N/afNzUt046B6/LBocFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHH0bC6hzczp7at83ONx6P7TcNtNZf67RPbi14E3Sx0PQv8+c5j0q435D3mijifzFfUEutXEKxrMUSUVD5MmDNiUChsJGOBUzvN0nvawtdAMM6aDlHPd/NXqKb1Lbx3iXSd/iD7J/B9xIFMIczItv4tcwZ6Nwh3SV/s8cgXhJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60406da718aso41264477b3.1
        for <linux-m68k@vger.kernel.org>; Mon, 05 Feb 2024 00:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707120645; x=1707725445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ai9w879nWv0dbT4IZhKWbMNJNw2LJvIyrZ3Li+PRgW4=;
        b=I3nBOQFwp6NpM7UogXxRdnUUkbn6gFGq+PitG9tof2Jey+isDjklcVMq62VI0UukvK
         10qmbCuA7RAMOipKm82kF3bO2QZDpfZIzAr6QJu1LbGSkTpxNKEaZknCEcJJA692HCeL
         L5y2+un6KAiXJPmpaUSCaxYbqXsYDT5K4rCy5KWPBqHckzlKFK4RDh5lBpLG376F/Hwn
         KILxpXLjhE8RDIS+Wz12w4S5MZjJHBhiKWujEBff/cCdrG3llWDaC43L///uuGyaTQxK
         LRuftHeeXP/ACnO02CqJamfNGDTMtRO8wQaFOJRlSFcv58MXACGMztMfEm2ZGnJr5iZ/
         WKkw==
X-Gm-Message-State: AOJu0Yzm8yvvenz9IUPp2LuVr20R7i2ZfO0N8ixgYGwo79WAPHQqFCSS
	FAOWu2fH/uccKmbvWq8kWHqaSlLZ9cNwwOQM9TF8XivMRIfzipGNL0dP1nGIZFE=
X-Google-Smtp-Source: AGHT+IFH221fHA2wjyCAfj6mY/fLWo56u9HRSwDR0Ink7Ylbm4uuQZz8NMGWK6+6PgLrm2DZGT5bZg==
X-Received: by 2002:a81:5743:0:b0:5e8:995f:6a0f with SMTP id l64-20020a815743000000b005e8995f6a0fmr8627908ywb.13.1707120645022;
        Mon, 05 Feb 2024 00:10:45 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id m83-20020a0dca56000000b006040ac59200sm1841223ywd.102.2024.02.05.00.10.44
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:10:44 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60412866c36so40210757b3.2
        for <linux-m68k@vger.kernel.org>; Mon, 05 Feb 2024 00:10:44 -0800 (PST)
X-Received: by 2002:a0d:d811:0:b0:5ef:317b:67ee with SMTP id
 a17-20020a0dd811000000b005ef317b67eemr9403459ywe.9.1707120644671; Mon, 05 Feb
 2024 00:10:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205023236.9325-1-schmitzmic@gmail.com> <20240205023236.9325-5-schmitzmic@gmail.com>
In-Reply-To: <20240205023236.9325-5-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2024 09:10:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
Message-ID: <CAMuHMdUMwQSEwDQ3tsmChutY3P0VQUA0A8jg63NxfyrmxfKWXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/8] m68k: Handle arrivals of multiple signals correctly
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, uli@fpond.eu, fthain@linux-m68k.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thanks for your patch!

On Mon, Feb 5, 2024 at 3:32=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.co=
m> wrote:
> From: Al Viro <viro@zeniv.linux.org.uk>

When submitting a backport, please add lines like

    commit 4bb0bd81ce5e97092dfda6a106d414b703ec0ee8 upstream.

> When we have several pending signals, have entered with the kernel
> with large exception frame *and* have already built at least one
> sigframe, regs->stkadj is going to be non-zero and regs->format/sr/pc
> are going to be junk - the real values are in shifted exception stack
> frame we'd built when putting together the first sigframe.
>
> If that happens, subsequent sigframes are going to be garbage.
> Not hard to fix - just need to find the "adjusted" frame first
> and look for format/vector/sr/pc in it.
>
> MSch: Minor v4.4 backport merge conflict fixes.

Please move this to "[MSch: ...] below...

>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> Tested-by: Michael Schmitz <schmitzmic@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Tested-by: Finn Thain <fthain@linux-m68k.org>
> Link: https://lore.kernel.org/r/YP2dBIAPTaVvHiZ6@zeniv-ca.linux.org.uk
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

... i.e. here.

> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Good.
Please add your SoB on all patches you handle, some lack it.

Thanks a lot for taking care of this!

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
