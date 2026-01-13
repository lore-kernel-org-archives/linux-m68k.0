Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43012FC876
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290976; cv=none; b=ZN9o6T945Tb3VmiDknNjQ/z44xGXEUtIzYYuev2fL+utmCggGN2b+dH1O51EufgaCSjioNLNTBAwJ6YJ+3lMM9yhIKMLU1OPzjFE1ULYZbgRgJxo+GDatMRVa+g3w6uTXJ5UylfL+YPzftNXCW5KJ/TOWUYkX6VwKQhEZHipoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290976; c=relaxed/simple;
	bh=n0dF2Fe8tSdrXokCIMgp4lK4sPjCkU1ooCoSBypgxBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHWzqERLAbb2BFYK5ZJE7jCRkst15ISIpiu0Kjb+fAFOYDQQLpV+PxQyok3Eo357ECbaMasi9sBYD5mb+7pA0XHeF7yg+YNTFqXmnirMcJehMN/QjivK1OPiy1MyYw0Pdi9eNNko2OnzEb5VVY69XQkeT5+AGPMKln+it2xfZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so2200598241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 23:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290974; x=1768895774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmIOh9tePUcFI+zdOYsAhgLlKNGSbSvD7MYXL084Vks=;
        b=oZTdcsZ60rHsH2ZGpZxet1ANBWNUoooUnktXFlG1+/dMio6u6Y8A0OiKDb9N1X70jK
         Wk18f15QhjIp7NoS3D9c/Z6KpCi+hjl83CQ3vqQNVBtwVRL1kKieAHVPJx6z4dnA8T8v
         6XvozFMZKT029alubXLSjIpGDrqaX9M5pYFQZ7bBTwKo9QETGL18NQr7M5nCgbv7/Pcf
         eficFXK6LzufcTRwquU41pMrHXlBlkHyB5wT5zHnQleb6/7+AMHOrdgiT35xiW3pdZI2
         gE2bUxOPfXxvtYI6jj9jo4JTNcEIhUtA3eOH1QaIWM3ddJR65NZKlJVHLRhvftez1oIs
         0juA==
X-Forwarded-Encrypted: i=1; AJvYcCUjo15st5WyrFIXfeTldL7Q42aG02LNigT8AVZ+olaQFuom/XbVVXl+Y+UV5KuoMJsjy6pc/Dz2IEsY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyFpbDaXN+JEKO3XPfZX5shmxDnzN2iD06ZWtQH5WlLZzIYVpnm
	HzX5WqLJQMDxeWi4r2j1G4U3QTkmT/OOR0Pc2Om+iJih/gwsdPAUfz+LDuaiBZbsxME=
X-Gm-Gg: AY/fxX7LcNHsrRxeyAxFgZlsuvsLbBVYJDu9ZbMECFdchLGWJTkJgul9o5vr5NydEFl
	N2/kjeG+QA+9gz2OtV9Lmk8WRq4YxZ7Ul7TwU1oZUNqG3O8fUC02ugwUtoSGApQ4m8P+VgDeZkK
	6ifHdgwsn/YZACO+yZ4aFAsih2OVBwZHQWSME/c9JaLn5r5qWf1YS11WZf1CkmJsbEJBK3JI/77
	CptCW3NVf9qJMEeMpLpk5BFuHSd8nLTsJ78riKZo6eJll0Kx03tcmQuZV0TNZkIBjyTre0h5ZZm
	QiFCtvRBGmohXOA+zQIocW7enMD/lrZoOCaxDTEWytxpuVWnY/ZjUpP9OhXCyIUyKxgaHKJkQDg
	Nk2YdTce9fZy0a/Q+C0Jfnf0jT3SfZdv38CAewxA8yWOh++ZSWiX8cgs2t1SKzgK/QfHKmGcxnd
	PdpR3rDlKttVYynyjKZMOhWSZXN6odk+PK1OVOQ1kgGxXrVkof
X-Google-Smtp-Source: AGHT+IFMSVx3PuO2M6mxl72cUmVQgIlK6DYrkuZIauZbXV3liTNg+8EdC3+bx5dRClcpqDtvhacyrQ==
X-Received: by 2002:a05:6102:1629:b0:5ed:f13:e58a with SMTP id ada2fe7eead31-5ed0f13e8b0mr6829514137.37.1768290973680;
        Mon, 12 Jan 2026 23:56:13 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm19557642137.11.2026.01.12.23.56.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 23:56:13 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5f1726c2a72so94134137.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 23:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiyn0O5d0MwVjSNeoBA6Z2Lo+pp4eDO1rcnkSaABYhSibTMtG5D5VFCWMKi1P4zwOL+Py0PUle9ktq@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3a06:b0:5ee:9fa4:19d7 with SMTP id
 ada2fe7eead31-5ee9fa41a9bmr5674729137.35.1768290972875; Mon, 12 Jan 2026
 23:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768281748.git.fthain@linux-m68k.org> <51ebf844e006ca0de408f5d3a831e7b39d7fc31c.1768281748.git.fthain@linux-m68k.org>
In-Reply-To: <51ebf844e006ca0de408f5d3a831e7b39d7fc31c.1768281748.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 08:56:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSXcxzhgfFyc3sBdyoJ4vq9sMpzLBLcZskqtZXdAjH+g@mail.gmail.com>
X-Gm-Features: AZwV_Qg_Z9QZfAG1qbe85SkafzpcqvnHvixniNVcQY02OLTaoULqX8NYTMrQWAM
Message-ID: <CAMuHMdXSXcxzhgfFyc3sBdyoJ4vq9sMpzLBLcZskqtZXdAjH+g@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] atomic: Add alignment check to instrumented atomic operations
To: Finn Thain <fthain@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 13 Jan 2026 at 06:39, Finn Thain <fthain@linux-m68k.org> wrote:
> From: Peter Zijlstra <peterz@infradead.org>
>
> Add a Kconfig option for debug builds which logs a warning when an
> instrumented atomic operation takes place that's misaligned.
> Some platforms don't trap for this.
>
> [ fthain: added __DISABLE_EXPORTS conditional and refactored as helper
> function. ]
>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/lkml/20250901093600.GF4067720@noisy.programming.kicks-ass.net/
> Link: https://lore.kernel.org/linux-next/df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org/
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>
> ---
> Checkpatch.pl says...
> ERROR: Missing Signed-off-by: line by nominal patch author 'Peter Ziljstra <peterz@infradead.org>'

Alternatively, you can credit Peter using

    Suggested-by: Peter Zijlstra <peterz@infradead.org>

just before the Link-header pointing to his suggestion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
