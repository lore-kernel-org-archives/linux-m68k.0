Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877A46B94
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e734251f48so13312927b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 06:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722913; x=1705327713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdHl7md1Zkmv60g30fUAOV7PYkRMYcjuuSdDFpSytAY=;
        b=a4zwSHxqMSqZa3y9BHa0u6WIxW1viCDQZ+XOYUDaoKvYhhG+kuXmo8p8TFOS4SB9+K
         0OCU/6z0wHVl2lfFWwbf4hMXywrnOZanfpbfOLG+DmucZuPlQ9CtwW61koIDHMqJ6t+O
         Hyfz/MCEJ7iXeccc2bUo0bETTPOlhoPzreKa2LoW0EURXY9FjP7Q5tEhIwH+jxxxcgJ3
         jXDPAYIDfM09pyzeccWLLiCCoxIia7iQrhyA4t5wfPTlIPRiTCeYO+cR20RQHOCpDPc0
         Az0gmxt0EQ8vFHc8I6prD3EDfjpdaOEiFAw9jqm8y89pE46atuKaMEX9NXeW1+nJp1AJ
         K9AA==
X-Gm-Message-State: AOJu0Yx50vGyQK3PsAw6krj+1c5a15CpxWnnRrzbd11vz7wkjBAjaf0u
	a4TiK4CRSODD5dznU9Rryozdl727o80S5w==
X-Google-Smtp-Source: AGHT+IEM4tx6hP/T4C8WZuRcOO+oa/GQQbXM6DFEv2weQu23U/vFzb+IUe6gtqCzyRvPakMDtEiXMg==
X-Received: by 2002:a0d:c884:0:b0:5e8:79c8:caac with SMTP id k126-20020a0dc884000000b005e879c8caacmr4697946ywd.18.1704722913028;
        Mon, 08 Jan 2024 06:08:33 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id k126-20020a819384000000b005ef7ecd53absm3195974ywg.39.2024.01.08.06.08.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 06:08:32 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e734251f48so13312597b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 06:08:32 -0800 (PST)
X-Received: by 2002:a81:570b:0:b0:5f8:fc22:93f5 with SMTP id
 l11-20020a81570b000000b005f8fc2293f5mr128986ywb.26.1704722911972; Mon, 08 Jan
 2024 06:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2024 15:08:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW0bU3KO+-S+jZDGUDkb0Nxg6EQUdc_uKTCs8jj6VOLg@mail.gmail.com>
Message-ID: <CAMuHMdXW0bU3KO+-S+jZDGUDkb0Nxg6EQUdc_uKTCs8jj6VOLg@mail.gmail.com>
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>, linux-input@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 2:41=E2=80=AFPM Lukas Bulwahn <lukas.bulwahn@gmail.c=
om> wrote:
> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
>
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/m68k/amiga/config.c        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
