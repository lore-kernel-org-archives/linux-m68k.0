Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789825E445
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821104; cv=none; b=rEJYhna+/cVhvHnWsKRmMfoUzITv+NphlbT6vJ1cyfjFX50jcnKHArnxoGk+HHUCY5jDBd04WTZfX7ZQ1wdmIZhxRrhjAPOjpE++7Hs1iqZ2t5ur31Szr7UVPxYQ/Xie683EAD6PEfCIW76SyiAkwezaEyy/qNCiPXS5egpW6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821104; c=relaxed/simple;
	bh=TNp1OPkGqBU1QA4npSv/D4DILYmbk00gq8bA84JoTuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHYU/DgcTUOCWNA5uldeKWWipDQ8pahnU9yM/azjfaAYYc0Lq/T9ZuIsj2KD6cxMjHpF9Wa2b1/Sxg/ixHmvGNmeGMz7BDAeDoSGl0vinNskMn2gQ2YE9l/UGPT3iJt2KQ6IHNAp6/GBehTnaytbu4g72c+EXIgg3XddBIjWdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so3979750241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 05:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821100; x=1743425900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hMaW+j0ix8yucAj8zHWEI7223vtN8mVOwYO+GlnwwM=;
        b=R4huGF585+/rLcaB2kUBnalJLDMv9Cp/HlZ4Xf6N5vaw84xvWg3x76sM02v3eIGVFz
         Y8ovkobwvUfWDKCVd50o+KldoyS6HEH/6Z0KaY1XoOPWAddF9X4vFblWL0e3yDnTwO4a
         BUD4O08E8XHY8aFl8p8nRVChvCW4nHD8QpJad4W8ORes7lyFOuZ3A/QVpB6CMTt6tnQR
         GwPBKWODG6jjmEuyoKuAvl55obED62RUuDSBJIT/VmeILXglGZyG4tQ9BHAlGSBtZAHf
         pEdt30Ixdn39M0SGZOJkH5Zhy/RHiOJOLYYNZsjQM6zn0a6uDNxux2VZ8Xiu5V+MLkuh
         2LcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9H3/ueipeL1IQOTUTasXeTaymrCPhiv4hLm02/qC/sc3qVhUoHVt7p0wOV5ONmKfX2vZCXZodRKPH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx+0M9gp/8SINz173okKEgbdcss43EQ3LPJWwi6TBnpLDPBagXA
	f+pAVy2pMDnBBHibsf8dnIDr+7xLUOxZIcTiKx1/yjRSDhL5/TjmG7BbTBw7
X-Gm-Gg: ASbGncvvzZdcvtzK4sL9MpvmwXp8+XJszrZMK/EcdYNG+w/ok0bQ9FsDUQb7a1E3wEL
	xfhlfhLYH5wUIkSYEjD/3YwaWsfVIcWGgmRm+rnrZXb5KICNsNXWuTZ3iqIW+z50oqcdFqvA+GP
	PysyBO+tv1xJohi9bFFyz+kHklGIvVxLsce9qIislpGlqmyHcjKwRQOVbJOkODFlgmu6vI72F5e
	/GFM8nlbVIph73rl3YGPxwJ6UyNlBfiHJNKZ6DAIBmE4VcAm61kDanHiZVRrLFUc8m/bry3+AfJ
	Zrpic64xWCYa8Ujvt9tsVq4khu1hEObhgn9st+TP7TWTdRmeQ2fUAA5RH4NQnTWFVIqxNox60xH
	01I//hqlPGClC3zVvkw==
X-Google-Smtp-Source: AGHT+IHN5gv9n859upem/eDO0bJF0DGVqVKGQ1xZWj7jJJMdIuiFmodOdf4HDH8EEf61owj+lhNLeA==
X-Received: by 2002:a05:6102:54a4:b0:4c1:83c4:8562 with SMTP id ada2fe7eead31-4c50d4f79d0mr8626961137.13.1742821099202;
        Mon, 24 Mar 2025 05:58:19 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a73ecd29sm1370896e0c.25.2025.03.24.05.58.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:58:18 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so3787535241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 05:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXvdFTFMYJ/gp+VB6QQy6/3It2IWo0nBiehiWzv0nmMVOwoqPmQp9I6SEjjDBzbXW2sEUkKha4jyn3@lists.linux-m68k.org
X-Received: by 2002:a05:6102:f11:b0:4bb:c24b:b61a with SMTP id
 ada2fe7eead31-4c50d5e0ff4mr8374313137.19.1742821098713; Mon, 24 Mar 2025
 05:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324092409.99430-1-p.pisati@gmail.com> <20250324092409.99430-2-p.pisati@gmail.com>
 <c874f648-8583-4c6c-9ce5-5ba369ccc731@kernel.org>
In-Reply-To: <c874f648-8583-4c6c-9ce5-5ba369ccc731@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 13:58:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4iLKT2edVs-LpyXULe_ENktiM_C=ypgM=_WPrLLA8bg@mail.gmail.com>
X-Gm-Features: AQ5f1JreT1hxEEiWCWU_4i_Py2L_6BPEWUHCH-0XYi7YhGWmcI9OlIw2TX7_VgM
Message-ID: <CAMuHMdU4iLKT2edVs-LpyXULe_ENktiM_C=ypgM=_WPrLLA8bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] m68k: amiga_defconfig: enable PATA_CSWARP
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Damien,

On Mon, 24 Mar 2025 at 11:53, Damien Le Moal <dlemoal@kernel.org> wrote:
> On 2025/03/24 5:24, Paolo Pisati wrote:
> > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> > ---
> >  arch/m68k/configs/amiga_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
> > index c705247e7b5b..feed92c95394 100644
> > --- a/arch/m68k/configs/amiga_defconfig
> > +++ b/arch/m68k/configs/amiga_defconfig
> > @@ -334,6 +334,7 @@ CONFIG_ATA=y
> >  # CONFIG_ATA_VERBOSE_ERROR is not set
> >  # CONFIG_ATA_BMDMA is not set
> >  CONFIG_PATA_GAYLE=y
> > +CONFIG_PATA_CSWARP=y
>
> This needs to be patch 2, otherwise there will be some bisectability issues.
> Unless Geert wants to take this patch and we queue patch 1 (the driver) through
> libata tree.
>
> Geert,
>
> How do yu want to proceed ? We can take everything through libata, or you can
> take both patches through your tree. I do not have a strong preference either way.

Me neither. We don't get to see new hardware support a lot ;-)

Paolo:
Please enable the driver in arch/m68k/configs/multi_defconfig, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
