Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75154211A28
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Sep 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324882; cv=none; b=WCQDoJphNDDS/6/xgk34ar4bWjXLTNBDAmgyIBjHyzQv2lKHma+Nvu9HSNQKaCcm2KpwAxgmnDP0KrCIh29mqLP/JGveRAjJcc12pVBBbrhgMwTG0WZvw71sOhYS2NzcMpsu7/EJS0J9S8MylM/JjHT3OiNJxVKcVlpCsMBoffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324882; c=relaxed/simple;
	bh=GqqU9gQ6ksLgdH/oUPUWq87ARBy0UbhPT2s8vt4oWCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSH/0nvaYMlVfGVZTEyjIc6iaoRkxacfNvrhg+rL+P3OYkE5og/nY5LtZvOmj1ADkK2JYCXUegqFz5ZME3z75XhBzfFJhdLVWCLctcMKGMJNzb6f7p8UHyD6FAM5DOaPA5DDgsEXO6wIa9atnYxzXd8+0Bz53qKzbEsHec2UHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8a1d640b50eso2342773241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Sep 2025 02:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324880; x=1757929680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzgk0xUzUlh6j52cGVIzM3waTCC9uxV/H9zzF7aMhCQ=;
        b=JnXlFIkZle225vLDTwAVVJIivaV1VPpv+Opt9BLziFweLGKgQVF6h6oCPYrqPXmW1t
         JnUhCle/oD+rQkAkwQMMfcKfJZ2Lq3qQDg/JnpNBD5aa71yVW/s+kjP8NYrQbfsH6TK+
         vHPOtPnCmOT09W6QyWnbegOfG+dheyVQ2tNRCzseBjg/ia/nDdjqpEILRjB7iJeLUQHQ
         14WOOliual8AVQpmMIcUQ8gZy8RDL/povlCyuvRfAVrLgjGTfFwnG3xbFrQ4uK6Q/3Gh
         MkxeUbtIAs60GTdLq8/Rs5aqTycCIvptktvqM3EamLkOLgaVXI/hpYaqUfXsBSyVN8xW
         px/w==
X-Forwarded-Encrypted: i=1; AJvYcCXNB55czNx9R1MiPKsxms8C0SPtyj1GNd27RRjJ2s188p8/QRgA7z2XhnffKMcPFjSFyaFzSsot/LW+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx8Q+z+sBkj9RfVXbM0jwRdYShGE7MKqsONCC2aJf+KTsjEzsPM
	F92DbxkVYEaJg8V2bL9x3Xx+f3QQF3sDxymdxQBsyXW2uYDZn84q56Dldk7ImifK
X-Gm-Gg: ASbGncu8qgFSvLVtCPC8pagF5Jbc1J9zlZyIFZJLeDgJf83PEDX+/qKyEKQC6j4Nwv8
	T7AQhjeQbYThJPs2o+2HfNE10kGpRjbwpCHRrBUj5RL2XHkC/NZZmklZQ+CxqSpJVQDN2nJt8+Q
	6o/pUnIvjuZftj01EvDSX96qWHsGmEdbDkgw7u83CmDJTOV1C/9vLZynGB1ldWYTu36ZnSciuLi
	NbADgi5nX7Zc+uPdxNtdXxyA6qMUzHDEm/k6xJ09pHUSHQsqDOQfmA/6bFnJGzowANZisYIpS1f
	NHGCKxiT8FGT6NJfH7l5V19Fc1zdgpnqX5tQKRd8R/poEWNZSTNCLgW1yJoDA4A0rsfGI9aouBj
	yD5VylC2bGSNCejjhJxe7crjiR2NQ1MxwPOWq/E0EqRsGqX9KP8kqKau5rda2
X-Google-Smtp-Source: AGHT+IGw7sR8eHDkb0RXj57KC2hKi+8FHq2PR76nUW/GMbRRu9WyK2ARHZEL+n5Bq5QrCfINAQrdWw==
X-Received: by 2002:a05:6102:f88:b0:51f:65da:4ada with SMTP id ada2fe7eead31-53d218dd118mr2562338137.17.1757324879987;
        Mon, 08 Sep 2025 02:47:59 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef787faesm10108494137.5.2025.09.08.02.47.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 02:47:59 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso2190398241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Sep 2025 02:47:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg/kHC6FyfG5hlRNl6Pa4l0GrOMhJcjO31cpmDFr7dvedt9akhhsGLELv4ZwCLRlWD3OmLPYebKKi7@lists.linux-m68k.org
X-Received: by 2002:a05:6102:f83:b0:524:b9b7:af01 with SMTP id
 ada2fe7eead31-53d1c3d6e5cmr2054887137.10.1757324879469; Mon, 08 Sep 2025
 02:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822104208.751191-1-jirislaby@kernel.org>
In-Reply-To: <20250822104208.751191-1-jirislaby@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 11:47:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXcm=6HmHYfkDF--jTKu-o7jWO=T6EuzeedhEvU3An_A@mail.gmail.com>
X-Gm-Features: AS18NWDoUuvjHVKj_6IGPnEkgWHda8d2Shyst11eUuVhsnm2ecFd1wqBdiVzjiE
Message-ID: <CAMuHMdVXcm=6HmHYfkDF--jTKu-o7jWO=T6EuzeedhEvU3An_A@mail.gmail.com>
Subject: Re: [PATCH] m68k: make HPDCA and HPAPCI bools
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Jiri,

On Fri, 22 Aug 2025 at 12:42, Jiri Slaby (SUSE) <jirislaby@kernel.org> wrote:
> The only user -- 8250_hp300 -- tests for CONFIG_HPDCA and CONFIG_HPAPCI.
> It does not test for *_MODULE variants. That means that if someone sets
> the configs to =m, the code is not compiled at all.
>
> There is actually no point having these as tristate. Switch them to
> bool.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Thanks for your patch!

> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -105,14 +105,14 @@ config AMIGA_BUILTIN_SERIAL
>           To compile this driver as a module, choose M here.
>
>  config HPDCA
> -       tristate "HP DCA serial support"
> +       bool "HP DCA serial support"
>         depends on DIO && SERIAL_8250
>         help
>           If you want to use the internal "DCA" serial ports on an HP300
>           machine, say Y here.
>
>  config HPAPCI
> -       tristate "HP APCI serial support"
> +       bool "HP APCI serial support"
>         depends on HP300 && SERIAL_8250
>         help
>           If you want to use the internal "APCI" serial ports on an HP400

This still causes a warning if SERIAL_8250 and HP300 are enabled,
but none of HPDCA and HPAPCI are enabled:

    drivers/tty/serial/8250/8250_hp300.c:24:2: warning: #warning
CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI
defined, are you sure? [-Wcpp]
       24 | #warning CONFIG_SERIAL_8250 defined but neither
CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure?
          |  ^~~~~~~

I have sent and alternativ\e fix.

[1] "[PATCH 0/2] tty: serial: 8250: Rework HP300 serial Kconfig logic"
    https://lore.kernel.org/cover.1757323858.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
