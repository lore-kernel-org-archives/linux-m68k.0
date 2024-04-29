Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5A7E0F0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401777; cv=none; b=L0umyVkuYjwRT3iyE5dZhgvtPsSbZiuspm+YewpHFi3AzMs0EG1FH+gBUcnMz7DvrOD4coCyTw/xcwvvealig1EP5Q6QV4adW5DLGPU+GOHjvuMoQg7nLY0FUh23s7yNYeZZGq6Ja6t2iWdmlJfrHHWnv1FACaVteCxS+HouBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401777; c=relaxed/simple;
	bh=4KHo3K0yMqAtatyZFcanNVB7mzLD4SlZydyr9+0iJPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1Tb6KyZbAVxHy8ShV+MnHH3Nk8XzXZ9lzFx+Fy79Ppua5+IKOkoui7RmLS+gB66uAQVAc/AKuzmQJnJzkC/hDEoU8TcHFOTbF5Y0yy8RaHLn6bmGpodxCVYNJckOX2vQH+nuiSQ8lVtYNM849ar4NqrRONcKl1B+PIqtkylIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-617ddc988f5so49064597b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 07:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714401774; x=1715006574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9Gzfsp8ljXq//x61giKmA5xlVQsBt5j2vtHzz0iF6k=;
        b=QRpOb+xG9MasxbzOZr2rB+Vi9nWjX7B9Mj8ulCbBrbqzy1I+YO+lsUOAoByIMtpyg4
         8O+iI8O7Gx/9w4YjN5BubxF+bRm4RKeeTk8BniWaHUnrXt99fAezT9ZXHVW549hEJsR/
         89hXu40/lE7fnLaw1hDgTCO0uPKzy9FAAmUnLmtCCCru8pPEREBXPgo8I3Slx37vmSr+
         4ke3Hcm6tC993HTor2PLmVQoQ1Z/u8t7WdHq/Pl6GZw16OIZXeYpqaswlTj3mIjOjf10
         FtkGE268XXICFU2fiz5saasz7tC5Ov51iTlZhtCdqXi0JhOrsyqF6FWorFw8B36iJHkZ
         S2dA==
X-Forwarded-Encrypted: i=1; AJvYcCU61dEl598QWuImiXHvJkDwzZncCYTVwQMjjuofVJE7AQdcuUIif03wxxzo0Wun2iV4HkCRaOiW1TlkfwC1589TzBuGgxl7Hukok9l2ajRU
X-Gm-Message-State: AOJu0YyfSOVA/6s//uzjN+PCxMBQ8SPh+QuHi/tQbDDl8YWecl94u4Hz
	ZxufDT1SEKbUfsT7IjH0IITlsj+f2nSlb1F0VXfbHDLiHRDct5iqBBK2DN+n
X-Google-Smtp-Source: AGHT+IE1rW667y9z8erk7HFNgepCUyZm/B9hOCw/W0B1e3rXCb7MYNWHFuErPmv1DV2snXgPEWCg4Q==
X-Received: by 2002:a05:690c:3588:b0:618:6fc7:2218 with SMTP id fr8-20020a05690c358800b006186fc72218mr9027269ywb.38.1714401774270;
        Mon, 29 Apr 2024 07:42:54 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id v62-20020a818541000000b0061ab7b7a119sm5358109ywf.21.2024.04.29.07.42.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:42:54 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de5a7b18acdso3714386276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Apr 2024 07:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXyIBxc65ZG4GWfNe/T4M6bkPvTHmAnrlIOhpwLLxDKNjBGH8Qf08j7KebtU9e3lbyesPcOyreHLxrz5a58H1Id0poroJraWrab2Oo0HwC
X-Received: by 2002:a25:b286:0:b0:dcd:2f89:6aac with SMTP id
 k6-20020a25b286000000b00dcd2f896aacmr11362965ybj.10.1714401773859; Mon, 29
 Apr 2024 07:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330175720.126122-2-thorsten.blum@toblux.com>
In-Reply-To: <20240330175720.126122-2-thorsten.blum@toblux.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Apr 2024 16:42:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW==FUNJe79TPi_3r8VP1jUo6LOL1MvJgEr4uRgd1yr3w@mail.gmail.com>
Message-ID: <CAMuHMdW==FUNJe79TPi_3r8VP1jUo6LOL1MvJgEr4uRgd1yr3w@mail.gmail.com>
Subject: Re: [PATCH] m68k: amiga: Use str_plural() to fix Coccinelle warning
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 6:58=E2=80=AFPM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
> Fixes the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
>
>         opportunity for str_plural(zorro_num_autocon)
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.10.

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
