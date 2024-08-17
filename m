Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E3146019
	for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Aug 2024 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723894166; cv=none; b=Eou57pyBhOGYOhTOC3+33xt+XsZFBMh63JLOLTmpde+D9kfVFJjjQ/ggNFlbHneChCIOaRhL5LTs/Zg0Sy6eMyn/ZFdMOf4/U/fLvQ/xlfbB94Zpb9sNfRwvZkrIa9caqvx+qIFoW0N7WUD4ahlcafWgMo5/hkANw/MnnS0jscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723894166; c=relaxed/simple;
	bh=VYdQL4HycLBApXUzI99povsLrS3ApxCsNKu9mKUX8DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0dHZ4hGykXuhQNVzoR3hfgp8HNAQ+VSyMwXrsrcacoXYfa6b6WTcZdoX8eUhuTpwSiMIljXgafGlQ5ZM63G8ZNG4HWEHPIJWG+/LLU6GaF1Y2zR9/gIkNt9bPsP4gzqJ3zaumLX3gILNbPC4Udwhi04NFV2HmUczNY36cu3UvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso2996721276.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Aug 2024 04:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723894161; x=1724498961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XM6ythytb0slRRW9rR0HCeFWdoQmTXUFBzMIyoVQLMo=;
        b=gk3xHPOhAqS4IGReNtfVWBGHyrKR7ri7oZ8gQIEMMoo/3t3TG2eYmrGw3gWFPDekJI
         Hxtvjv3LC6rhyn4HFhGJnHI4iiSuujcbjbKLD/XSgXn0lzypoYUMffL9MZUZny4YblS+
         WyDgidMFecWcHU+jp4Q60Lk7ylD7MPRNk1qXwJLVn82BHz8vs86jU4HSBlXE8BH5yAI9
         1PELwaUf+YuwuZtpYqlxm44vVEx5huCmZWGtiehFU3uetP3F63sPytEaVeMQTGqAJ0Gv
         m/Ox79PUrun2lUSLeSLuS7V7CZELGZlZJ2uBRNxcaqvJfDob7cPC/UyPH5gnwtMGzIzp
         kgoA==
X-Forwarded-Encrypted: i=1; AJvYcCUlxQ6MDnBFR3oxQRuFVXvNmf/m7lvXz6qegwEUWpZJBQIwaElXBi87LnDFxDLmK53ImD5RbrElJY+7osZ7QN/Z/nlI6shRuCT7CP53/tBv
X-Gm-Message-State: AOJu0Yx0ocqyPKQKBIpXuM+oKWycGw/Kyj7d2eHXvLwexMsboNdqpM7y
	XtHryW67xAUHd09E8Y5RWCVdSHIHkPrrEJszqMRUFvawtRU34TWIkGV8dIvY
X-Google-Smtp-Source: AGHT+IFVtjUzOw3fFwJv331Goc4UkaINr+lSa8q1cby1mQFCx/eyFC9Sp4uhJehChCvUJ8QCxXaYhQ==
X-Received: by 2002:a05:6902:2508:b0:e13:d0dd:b21 with SMTP id 3f1490d57ef6-e13d0dd0d31mr2144332276.20.1723894161101;
        Sat, 17 Aug 2024 04:29:21 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1172006f9asm1203053276.50.2024.08.17.04.29.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Aug 2024 04:29:20 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-699ac6dbf24so27002107b3.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Aug 2024 04:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7DxxHDXy1MRejbAMsG2WJFgKJzk9sxnY0CYQ+M/TJNWuwloNirt1u6QCiGIbHlyZxJRuZQl4TcpyfQ8cxAO4ZKPBmunYjrcYadOBZKt0t
X-Received: by 2002:a05:690c:3206:b0:62d:45:4098 with SMTP id
 00721157ae682-6b1b92b10e2mr43363047b3.26.1723894160059; Sat, 17 Aug 2024
 04:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3633d85c51d2133622708e5b0e07cfea96fc295b.1723445731.git.fthain@linux-m68k.org>
In-Reply-To: <3633d85c51d2133622708e5b0e07cfea96fc295b.1723445731.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 17 Aug 2024 13:29:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx8XL5qPE0fWM3p6hWyUUH5FxSp-wCF5Q1ekXCSemmXA@mail.gmail.com>
Message-ID: <CAMuHMdVx8XL5qPE0fWM3p6hWyUUH5FxSp-wCF5Q1ekXCSemmXA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Revise PowerBook 500 series model name
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, Stan Johnson <userm57@yahoo.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Mon, Aug 12, 2024 at 8:56=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> The PowerBook 520, 540 and 550 all have macintosh_config->ident =3D=3D 72
> because that's their gestalt ID in MacOS. Hence, Linux describes them all
> as "Powerbook 520". Change that to "Powerbook 500 series", which is more
> accurate.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: Stan Johnson <userm57@yahoo.com>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -677,7 +677,7 @@ static struct mac_model mac_data_table[] =3D {
>                 .floppy_type    =3D MAC_FLOPPY_OLD, /* SWIM 2 */
>         }, {
>                 .ident          =3D MAC_MODEL_PB520,
> -               .name           =3D "PowerBook 520",
> +               .name           =3D "PowerBook 500 series",
>                 .adb_type       =3D MAC_ADB_PB2,
>                 .via_type       =3D MAC_VIA_QUADRA,
>                 .scsi_type      =3D MAC_SCSI_OLD,

This is a user-visible change, through /proc/hardware.
Do you know if any userspace relies on the old string value?

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
