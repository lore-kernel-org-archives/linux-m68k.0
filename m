Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E722337
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jan 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e3338663b2so4817937b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Jan 2024 06:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376854; x=1704981654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMIRCf1hELpQQI/9AUrNKF35LBb9Occf+oAXsSwV7oo=;
        b=eSr+e1SgXm3/m7IL1PLGKox2WllLwC8V58b0KCT1DN7r7t/bSOBYj0vcRwPYci37FT
         6FfTHNvysWxXPZqeii7QGkknHF+mH8pF0ADNNg8dbNgLHijxpQVUPU3vHi97BFFz9mOF
         v09j532Gp8DiluRFvuNXs0k/7poWggQ8DMBvbnM16/L7Z0CR2rEluT12DPzVG4mNhfaa
         HccdhqvrwQmtM4TApJ2StRQthrfvab1Feo6jMcyOZmcMOy2WdIUm6W5HqJhddwYnixxj
         kNH71nscFb53gYUimx4rJM3qW4WG5TK+vfzojuwiWbJ9VFteM7IapGQhS+1T0sX0oP5s
         8Gbg==
X-Gm-Message-State: AOJu0Ywl2ahmZ9AoUNNzWfq1wVSJrM4iLpD8bkDmkSyzA/nx1oqateRO
	ghl59IWHyHEJCGBCE7R/sNFx4XFMt5zZuQ==
X-Google-Smtp-Source: AGHT+IHuEkMU3nrS4upNY1kVENuVm+Q2jcBTW608szbdo17mA7b0dyVPPxP8JzycEtEJF+l27b/pIQ==
X-Received: by 2002:a81:5456:0:b0:5e8:45c5:a6bf with SMTP id i83-20020a815456000000b005e845c5a6bfmr524059ywb.32.1704376853476;
        Thu, 04 Jan 2024 06:00:53 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id l18-20020a815712000000b005f445345522sm1497208ywb.3.2024.01.04.06.00.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 06:00:52 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbe78430946so503103276.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Jan 2024 06:00:52 -0800 (PST)
X-Received: by 2002:a25:d24e:0:b0:dbe:3183:2faf with SMTP id
 j75-20020a25d24e000000b00dbe31832fafmr533300ybg.74.1704376852530; Thu, 04 Jan
 2024 06:00:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024010426-junkyard-overshot-5c16@gregkh>
In-Reply-To: <2024010426-junkyard-overshot-5c16@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jan 2024 15:00:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUN_AciSOrxYehoyOqYG8BFOJN2CLjY+PeqZW+ze2zf2g@mail.gmail.com>
Message-ID: <CAMuHMdUN_AciSOrxYehoyOqYG8BFOJN2CLjY+PeqZW+ze2zf2g@mail.gmail.com>
Subject: Re: patch "nubus: make nubus_bus_type static and constant" added to char-misc-testing
To: gregkh@linuxfoundation.org
Cc: fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, Jan 4, 2024 at 2:39=E2=80=AFPM <gregkh@linuxfoundation.org> wrote:
> This is a note to let you know that I've just added the patch titled
>
>     nubus: make nubus_bus_type static and constant
>
> to my char-misc git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> in the char-misc-testing branch.
>
> The patch will show up in the next release of the linux-next tree
> (usually sometime within the next 24 hours during the week.)
>
> The patch will be merged to the char-misc-next branch sometime soon,
> after it passes testing, and the merge window is open.
>
> If you have any questions about this process, please let me know.
>
>
> From 3faea80bd9ff02b655cb0c80a1c0bdca44c0f94d Mon Sep 17 00:00:00 2001
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Date: Tue, 19 Dec 2023 16:47:41 +0100
> Subject: nubus: make nubus_bus_type static and constant
>
> Now that the driver core can properly handle constant struct bus_type,
> move the nubus_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> It's also never used outside of drivers/nubus/bus.c so make it static
> and don't export it as no one is using it.
>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc:  <linux-m68k@lists.linux-m68k.org>
> Acked-by: Finn Thain <fthain@linux-m68k.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/r/2023121940-enlarged-editor-c9a8@gregkh
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I have already applied this to the m68k tree:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit=
/?h=3Dfor-v6.8&id=3Da15f2d48c6f84ae0dd2000288592c79d5d1acd0e

You even thanked me when I said I was going to do that:
https://lore.kernel.org/all/2024010254-truce-populate-70d1@gregkh


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
