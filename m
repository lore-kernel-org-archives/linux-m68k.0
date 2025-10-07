Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CF43207
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829895; cv=none; b=S17m6cxqTcNR/yDk3p4gofVPBZWp/+r52I0Ff40TrwYoTGCKddoUXKzcyNXEfakwsS8xKTsJ1kDT6C80YDMZOJ5ZdolUCFqOzz7+Q/LLXRXrGZIMRzk4mFGsOszlzP/fXwDf+hsgxny2ASz2RKh6KaUh35lagTgBQiBE1yHe5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829895; c=relaxed/simple;
	bh=vM8pMTuLE07i2LEgmF4lMZLaKCtkOjD8GlbT6u/BICc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx1Knf5YGeXaLtz0W1d7CpT9juPvs35pnV2uNkL2xWMYfJOx+IzlPWt0ktASk92rOeXj9hYUJrp5uREZ9Qdn5UwyhfGguPN+Vmiy4pW56YC5gO3eznNhLpdZSfFaKwWV6w3Ranef7m9oRbxZfaNLxebPGBT5MRPcpkOYUop2vmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5a0d17db499so5589397137.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829889; x=1760434689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q+QEIFXqBPYZCCIeDe/OpyZelbNarCGc2Hc+hYBZL4=;
        b=qOHAEOS8L5XuDH12+kBF3ASAo2fL36rXZFBAYoso+NAYl6JQ+ISyONOIME0B/cTJYb
         lr1AToeH2uahMaF4wzK9OjoZ0RFN8xoKvY0tDdW7LcxFFunqIFztJwaxD6vCMLIvObxD
         JuF8JL8Zn4uSxCBBwGkkBNQhH0ifUwXuEUc4BUwhJXzSNJ8AysizvXHXFqvogH7dqbXU
         mqgkDtFs9KCUw/Z80z7IeHTKdN6pr/0Yo4jGxF7AQmu4TdhKDiDT4x4bXI+iMocIsKgo
         jQPo7yCJr3YcNQ8wrZZU3Xv5n2ikMMRlr3I7aIxqsNpAcjeuTh3AS+7IKqhGJ03bszW+
         oR9A==
X-Gm-Message-State: AOJu0Yx/g9w3G4/XQ+McYGnw5uI0EFMjEsTbMkEPcA/KjD0S+G54VH/h
	0PEva2du7BJUOdq11VGAzN2+yiawCyZP5cuRC3I1Z13PC9INiIcvUSKHOrkCN4Xk
X-Gm-Gg: ASbGncscXV56W57liWDeG1emHpFXNOlbHvPSAp919GEeNeyhSx2inlw0KdnHH6qfnRX
	AI4NNePbmCtIFT5I4SAti5R/295HwcCBmdGWaFJdfTqrtDSrh1mubhFBQ+8WcQuU+gaJz2uu8Cr
	FePwyr3mqBlU8vP8HhYprkaeFlYbQ6K68vni68mmo7+fAyPdKNY8LWvce/1cYWcdl20rP18sS2t
	OMbXVwpx/CLk7dJi4vvltxUL/obha14Q6Upec9kg8rE87n+SeBFVHuqgRp1klrykNCYWsNkVyz0
	fg6UP3MWqZdyzdt33W6hvJ4+Y8EA907NT0nwwLo64oWBY+7XeW4HWM4Mh/iHLs50ko2EKrRRJ8z
	spo6dwWUvWR7d1UYGVDS3Dg0++2j6f7kVMaW9qBUqCi5FUcRbqVTjBXVJ3arf+H6wJNVfN0yVs6
	8/OJe3lnWN
X-Google-Smtp-Source: AGHT+IGOVCnUc8K4nL5lbPiA8vHmy70nVb6GOgxI58YxaaBul6zNCykiva848lwCJikfEMchcUw3rg==
X-Received: by 2002:a05:6102:5111:b0:523:d0d7:b964 with SMTP id ada2fe7eead31-5d41d0588acmr6697319137.12.1759829888768;
        Tue, 07 Oct 2025 02:38:08 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4d83ed6sm3422206241.1.2025.10.07.02.38.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 02:38:08 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so5092991137.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:38:08 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:5be:57a1:3eda with SMTP id
 ada2fe7eead31-5d41d020b48mr6240729137.2.1759829888107; Tue, 07 Oct 2025
 02:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007092313.755856-1-daniel@thingy.jp> <20251007092313.755856-4-daniel@thingy.jp>
In-Reply-To: <20251007092313.755856-4-daniel@thingy.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Oct 2025 11:37:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDfNgUUh-uU7ZFKmmAccEMqDdfDpwRXQYmwjMG6O_Trg@mail.gmail.com>
X-Gm-Features: AS18NWCsRb9Pc5BA4Gs-2WvP7BRo3Mx4GNtWy6MFkPi8rKNsMmOdkKU4tfHRGL8
Message-ID: <CAMuHMdWDfNgUUh-uU7ZFKmmAccEMqDdfDpwRXQYmwjMG6O_Trg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] m68k: amiga: Allow PCI
To: Daniel Palmer <daniel@thingy.jp>
Cc: linux-m68k@lists.linux-m68k.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Tue, 7 Oct 2025 at 11:33, Daniel Palmer <daniel@thingy.jp> wrote:
> The Amiga has various options for adding a PCI bus so select HAVE_PCI.
>
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Thanks for your patch!

> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -7,6 +7,7 @@ config AMIGA
>         bool "Amiga support"
>         depends on MMU
>         select LEGACY_TIMER_TICK
> +       select HAVE_PCI
>         help
>           This option enables support for the Amiga series of computers. If
>           you plan to use this kernel on an Amiga, say Y here and browse the

This doesn't make much sense without upstream support for actual
PCI host bridge controllers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
