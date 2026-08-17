Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8B3B6C05
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950881; cv=none; b=uY9tmM2aa9/7EETBYQg9qGtYx1B05HaINbi+Gq3aO3szdc7I8MmMqAaW7b23tXW/dh//oiLNYVM052NhAvyjoCgiavSeGDHAwQ3YogrepiYW4pElCpnEZsoTS+YZI9Lrl3mQ4Oha7BBP1SP1pC5WU1r7pRW4ilqVPlAPcMgMUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950881; c=relaxed/simple;
	bh=rhcKn7P7+daroZ0EymJrJyh5GDUjK55CBlCJ6zc0XXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYKehocE2fhsfdSpcK2CtM76ytQw5MyQWvHxSrQUhBKkGCbyLQRZPs5BCUDdgU/tS3WuXuIkaGgJvFuV4lEIn/pC+yKIgLtbjWCd4XdxnlpOcp55aPvvQj4bTGqSU/y1BmcteGx6QfS+lhb7c1PkjcTdSWEM/zMfmu76Nbn4irE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9696319e14dso900691241.3
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 00:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950879; x=1787555679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITsAABxAI5h0El64I4dev9aDBbByb7ZVn99HnruYO/M=;
        b=ZwpK7doqAVbUS1upCVGcjPHKpVIGC3UUMRzhED9GTFgJ/FSuSPrUBNRImnIviw8J5c
         ouiqXKbFFNmsjqbjtBLGRPVD6/QRYfxWXevJbFOeyGqxm8OSlWP+iAxZkU4VGFoi88dC
         ++UffLJtynTlmtf373ck9Zd7y+N/bVimaQYA6m+SK7Jui4hOJ0XlCN0YwbU4FSQdM1hK
         8zy5hd2b6C3X9hELRAh4atsDwl//rONV9kox2NYfNVHqrv0aL8hGlZaFg11Vvw5WHNLe
         sunX9Cr1rnQd1DpFTtn4a+rSFNswRQns9dU4d9itSt3NYLbYuPSzO/eK7f5qfbyFnOUv
         ZeLw==
X-Gm-Message-State: AOJu0YzeWxElNw9ovNaiQ7fI/LZwjE3CG73i+hJXDQr5PFvJXc1gcjs5
	u0+72n2BM1qYz+xzPPazS6rNWsmpqE6fQDie4iLyeI7mAmNhkK9/vwfAn6xCADS+
X-Gm-Gg: AR+sD122rDDMBTzTcN5yb7HCLZjYlU43+iRw3+9WGSz3lPCzBnpsSYP5FadQaHJy2Cv
	0i0ybnTgmouMG4oqlI1cc6jjG9/Zv9rBOGtWAAR4Yy52gEkZhkgC68uzePywzYOUMcaVtwHcrbP
	8lrBy1Ph7uL9Y9/OvtRZ+5BVAaN2HKIRn9jFoy/5ZO2jfQFr9agw3XEdsqIDWB9wfaqc8u2WvUX
	69AwUw+rKO7sKFnnuKOd9ADZ+pjiBDAIvesgbRP2wsblfYnI0GAsNoEDznRX8HA6XRG8/SvGzj6
	Q2bx0iODuARnEcsq3GVHGGRbaQ2gshZuKci06N4JzFg4QtqoiNjXvgDgqgmOFCVQv4yzQ0DT++b
	C4WquvmCYTEo9xwhygpZS4DOgCiEQl2fyAA27etwH9ctbxlK+ztL51SU4tmNI+54rZ07W/CSMgM
	wVMRetnBC+sWLETGkD0/OFAAUVgMrcTb0G9uOI/YDb1QL4YllarEMJagWKtvw9Ncfh63Cv4vYBf
	KjG/S2TMPAbFfC9/b2jl7TiUx79nQ==
X-Received: by 2002:a05:6102:5e90:b0:76e:e529:2fcf with SMTP id ada2fe7eead31-76f2a9eeef3mr3527814137.6.1786950878801;
        Mon, 17 Aug 2026 00:14:38 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c2cf06e7sm352548137.1.2026.08.17.00.14.38
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:14:38 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so1038500e0c.2
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 00:14:38 -0700 (PDT)
X-Received: by 2002:a05:6122:c93:b0:5c2:c0b2:9889 with SMTP id
 71dfb90a1353d-5c591cb424fmr4347333e0c.4.1786950878387; Mon, 17 Aug 2026
 00:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-6-schmitzmic@gmail.com>
In-Reply-To: <20260816073752.16656-6-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 09:14:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
X-Gm-Features: AcwNN1VxB0H0J7CwWzTSAsQ0j36Jm2ROOwQdcHKrVvjdI_q52SwjuI6CywI54LI
Message-ID: <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Miro,

On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> The SuperVidel FPGA contains an OpenCore ethernet package. Add
> platform device data and other necessary definitions to support
> this device on Atari.
>
> The ethoc module must be enabled separately by the user.

ETHOC selects MII and PHYLIB. Do you need to enable any MDIO or PHY
drivers?  I don't have the hardware, just asking for {atari,multi}_defconfig.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
