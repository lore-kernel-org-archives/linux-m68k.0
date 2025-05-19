Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B43269AFB
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642089; cv=none; b=kRZJIXTbycB7Vxugchfe39MKqK3+fB/cjtWhYdclz4/MiWM+NuEF8y4u5py7aYj6IKF18oaNvUoL4WlYqAxwYmtJNfo/j77LfZwO8Ybb6OSyJx6ZdchzXHalwzFshc2MS6myOjQbzwSpX1dtOm4qOg94a7yMgyxLPW71Qu43JSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642089; c=relaxed/simple;
	bh=61NfTbPG+srXwjj2WjviGapQELitvtbMiJJ1yWcVO00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G85+iciaZhqH8FVCKBYGVXfEtjWyWt+5ksmHEkHp5LsQawKTwiQYzgqPzViz4hG5hjn6J2bhg5szKE+H/WQgPXkn4AElQjIDIjr9KCzZNncDOyzHlS+c+qTGrLSD+Bmo2yslvUKvne62RQ+gGk9TTLMg3hG/FgDhl4iDzLKb8zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52934f4fb23so2875269e0c.1
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 01:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642086; x=1748246886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l5ihDVS9PQ2vVWaesxTAXqW/G4rvzLkPd7A5ArugWg=;
        b=ecpaeVdftc2xfdkkwKcbgzzlfCU3BKCLH2OZu4Y3mMkZxQ2/RhPmSWWgjdMVT+/ENw
         /Jo/g438zyJPOHgbB91twJjLzpk7N22MKV54nbVcgVCowzwp+IvyhcxTt1RYtp2MlEl9
         5B8QjKO81aicUIAnQ0sPj1CP8OC77KlRl9IEyVcfGlAe9W9C76jl7I5zrWNv1YHdx+Mf
         7oDCu0kZa+yGsn/N9Og5j6x0nySqH6uSQD5iZVMJp8nMHD1GxY+3za9ty/zN1NB50aA1
         7thRji1ywJFjyurygNFbmf7a/VNFmyZy5xChJK6H/ylKahOA1dbmZ107fy8wNbwuBXe4
         UKXw==
X-Forwarded-Encrypted: i=1; AJvYcCWPDB96XSc7RQQuGWDVGrcbUndzXCmw0iVMzSDoj2M642krPdjrUx/OS3UA0jYkdTzFZk//nYTEHj39@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4qp+byZgY+szFC1fCvO2eX69ZiMjnDQEXBfyyNr+vinybdIf
	nNpNFlv5gBD4EVGU6CNqWksJTdWpB4YHyGyCEdUebCiax87JScAC6+0AY4QxnE4L
X-Gm-Gg: ASbGncsmjxmPSN6TJtymnM9FkBbB6ozrONmHJQRQQGypX1Vk+PRwhro8rk/ROcPFd/9
	LhnHCUAkjNQ3AWuIq3z4emZ99ryA5ty/Mt6kFXgfBLgklONOFl3wNiQ+lx+/oF1FNrlMCt1z//8
	4u0WAYEyBIrbrFJtRQ+NAZEUljrqjM8oN99tamRiZjIahyvdSv3qvQitLVe8YSuk75Jnay/BznO
	yOESTj1jQY/cKVNzDJlCzxaXuCeXCVyUHoL7UamfJxpmeJ++Z97d9JMJV46WY0Van/Z2GAP+nQx
	JN5h60OujivLlZ+Sqwqz5YSBRRH/+OdwXDwrWWlE7ctYInslEJmh56hQ8tPHIOXgVirT/eIP6Fg
	SWz/uSI0X5X07/beo9pVMSRtW
X-Google-Smtp-Source: AGHT+IFVIFzE2OSk5BhwMnwSdxZi9MIP2mIKB58KyavmIHcy97eQubOKedOOaG5ybpOobc6iuep2zA==
X-Received: by 2002:a05:6122:8c0f:b0:520:62ce:98ed with SMTP id 71dfb90a1353d-52dba8d0941mr11926092e0c.6.1747642085891;
        Mon, 19 May 2025 01:08:05 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e9a7sm6201550e0c.35.2025.05.19.01.08.05
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:08:05 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87bee00b392so1756007241.3
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 01:08:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAIRXPGnqcWxDyMysDRZysiZAZspLh1BUhr0ycDIqB4y14QW/v2Wmq9y/utUEXmPI4D7bOIUVPMiWb@vger.kernel.org
X-Received: by 2002:a05:6102:5706:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4dfa6ba8f5emr11124410137.9.1747642085486; Mon, 19 May 2025
 01:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
 <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
 <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com> <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
In-Reply-To: <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 10:07:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxxRBP+2o6vh7JQpLEWC1D5+n8ZFsy4Jo6f6P-7PD4HQ@mail.gmail.com>
X-Gm-Features: AX0GCFuz6StjY5nc2NZtECkwXBlsN75INmykoGEWZL0NBJkmiJIThDUoRHrsOis
Message-ID: <CAMuHMdVxxRBP+2o6vh7JQpLEWC1D5+n8ZFsy4Jo6f6P-7PD4HQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Antonio Vargas Gonzalez <windenntw@gmail.com>, James Le Cuirot <chewi@aura-online.co.uk>, 
	libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 19 May 2025 at 09:54, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2025-05-19 at 09:42 +0200, Geert Uytterhoeven wrote:
> > I expect (the history of) the gcc sources would tell you more about
> > the default alignment on other (legacy UNIX) OSes supporting m68k...
>
> Good idea. I will do that. My assumption is that on Linux, GCC developers
> actually just forgot to switch alignment from 2 to 4 bytes with the switch
> to ELF unlike NetBSD.

Linux/m68k ELF and a.out were deliberately kept compatible, and
coexisted together for a brief moment in time.

The NetBSD kernel and userland are a single system built from source
maintained together, so a recompile of everything was never considered
a big issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
