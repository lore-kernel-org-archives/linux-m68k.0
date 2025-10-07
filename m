Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ADA264609
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832561; cv=none; b=PPAdvMdaatqLD1T4xBZJvgNLZw8R7R8dQQx+wnzHGXsroEP7hYCxqW+Slv+SqYH+C0NnJTytYhdQIcAg73aODE33C8KXgwa6n40PAjjlsoCNB49l6ExAFBrczaMtnhjBkTkkaiX1+1xPowbh84qLGX89ytD12klqiV7HGSA3wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832561; c=relaxed/simple;
	bh=X08yRMXxYQpEQFN6+DWg0rBxqMjXg4JwaZTEUg+jC/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9+Jhy/Ybp8k2BBpVTBShYQeIMePdRX5qsgF0jQ/D9I6DW7flEriwjp5xxEj+tTFiq6Edjypco2SFE6vBXJ0QX6V5Tpbge/RKwfq/SL/tEttvK/o6VGxlWCp/2q/at+l5kO5qvcIUjV/VhBQZn+3qV2v3poa8I1iPqGU9PQ5bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5523142df73so4356156e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832557; x=1760437357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UyUj3Qix+qDVReFl/Sm439a80dBofMDi/9/TOImgQQ=;
        b=OMHgNYKneRm12otj/gRkYMZld0gqDnmoyNrnCz2G30crHgPP0+/wqk8eszz3BLcTKg
         NKKolij6DrlIaGXy7wlRkxSOGTkzmvYfRXWI8gFmp90m9lkJf40VLYzka9RAb2qwr5zn
         ru4ljfI5EU8B41c3uhe4+r5CATHa5QKUaBepG2XohO0dRf2dLMaAP03n99ogwk5B+bmE
         gP9yjYmFcCRxb+kB6iVYpn2B1qqRbF0TnX5b0ahwd/lkPYemuBdthcHI1D6/hQCptQy5
         21d9BXqoPIZbsraZaFtI4USeqJ6EjUwf/i9VP36TF9IlzUh00DFbJzZOeQPaalQv+0kt
         YOQg==
X-Forwarded-Encrypted: i=1; AJvYcCVj7HnL69KkA6cKwASVZUPjaWGFS50AA2GLJqWDgwxstzuSPijIuwMCuEBs/WpKjnn+EiHV77RQmeyu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwXAfBSEBl1xqxZu1B/393ejJUfuJ47dznhjTpYwmDLFi31fnse
	nSuuYtpWwOsKiusdX8dx8CiX8M8StG+4qNt5QmwNsmBTJyq2IDMOSNk4ctCOlMdQ
X-Gm-Gg: ASbGncs6vOiwEn5lZ1hDUDZoFBP/GzzdYth5dq3q23Z0D9OprKMwynEsweUwbmKGyvs
	YarLBW4ACyJbE8iCbnWWOpz3ySr/ER17eEBM8hnjNE4d8ZyHSpx4RzyCl0zHRVTkjABfCyGtOeN
	AFdKAMwSmCblNme0QN7vPMmF1rFR1QizKr2FhRFCbU8h67xmtfYzyeXWsw6ewoy0FJgyhfuCVW7
	1R9Vk/WZR7YjLmHg/LCpZ99SFTwS7ChQUGLs8lTKxUMbTXRr6G/jblYOFi7n+W3fz8HsISv9edx
	0yWgYi6kAgeg1Au8sxADUo33a88FlOKhyEkGacXsBD2/yk+pXBWxGOWnr/uTuKi+4PoKVxeleAg
	hPtM2dplP86ItzQ0MOjs8PLNtXoJHQkU88nxY6YYSwjfg3CibZUxem7ApworZUAekPuF937jHVu
	xCi/NNZhrGFl4C
X-Google-Smtp-Source: AGHT+IG5If1b3R56s0nhUWR8kCeyxSIuY2WkSvisCP+lLYk7tK+mML+XK64fFEKmQvZZuZUkoOPf+g==
X-Received: by 2002:a05:6122:2503:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-5524e83e38amr5156712e0c.3.1759832556645;
        Tue, 07 Oct 2025 03:22:36 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e877sm3614705e0c.16.2025.10.07.03.22.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:22:36 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso4585716e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 03:22:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCvAa5oQQ5ze+vY639h3CauyRRbKE7htTafH7febZ98JuiKgCQKbUzI/lbMJl/1zP+kcliAWQ+f5KH@lists.linux-m68k.org
X-Received: by 2002:a05:6122:1e0d:b0:543:e262:ade2 with SMTP id
 71dfb90a1353d-5524ea6b0e4mr5683075e0c.12.1759832556074; Tue, 07 Oct 2025
 03:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007092313.755856-1-daniel@thingy.jp> <20251007092313.755856-4-daniel@thingy.jp>
 <CAMuHMdWDfNgUUh-uU7ZFKmmAccEMqDdfDpwRXQYmwjMG6O_Trg@mail.gmail.com> <46382bc6cab2196a79780a946bee96dde402ae31.camel@physik.fu-berlin.de>
In-Reply-To: <46382bc6cab2196a79780a946bee96dde402ae31.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Oct 2025 12:22:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUAEoN+KBnk=aY6UnkxXnFp8KY0BV8qQGfGip=nNtfaQ@mail.gmail.com>
X-Gm-Features: AS18NWAPkggXOuJ8Zyug-B_6vXxzZFwJxIAhU-W5_YEhuf5bM649C2kMw_p5v_Y
Message-ID: <CAMuHMdUUAEoN+KBnk=aY6UnkxXnFp8KY0BV8qQGfGip=nNtfaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] m68k: amiga: Allow PCI
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Daniel Palmer <daniel@thingy.jp>, linux-m68k@lists.linux-m68k.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 7 Oct 2025 at 11:41, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-10-07 at 11:37 +0200, Geert Uytterhoeven wrote:
> > On Tue, 7 Oct 2025 at 11:33, Daniel Palmer <daniel@thingy.jp> wrote:
> > > The Amiga has various options for adding a PCI bus so select HAVE_PCI.
> > >
> > > Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/m68k/Kconfig.machine
> > > +++ b/arch/m68k/Kconfig.machine
> > > @@ -7,6 +7,7 @@ config AMIGA
> > >         bool "Amiga support"
> > >         depends on MMU
> > >         select LEGACY_TIMER_TICK
> > > +       select HAVE_PCI
> > >         help
> > >           This option enables support for the Amiga series of computers. If
> > >           you plan to use this kernel on an Amiga, say Y here and browse the
> >
> > This doesn't make much sense without upstream support for actual
> > PCI host bridge controllers.
>
> Isn't this what patch 5 does?

Oops, sorry, I hadn't realized this is part of a series, as I somehow
haven't received the other patches from the series yet...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
