Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756E1F61C
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798645; cv=none; b=qRWu6S6wUZm9j8OFVzfsOaRLIy74u6MrgjToAsM2v7Tt7Jwg83Fl5rjosxdxErLZTO56I3dx5gllRBS6s5KTHlGr5Y5CN7YGtHY1PSsOJe5sWzqwq/GqQICNf2CQ2DxZcGo+a0bH9xGiBWDt9biejGbcBxsudxz0lVC4ROYlPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798645; c=relaxed/simple;
	bh=ljVTvv3ylF1q9GeYuLzJbrJ2pdJMNqnHTJ3mlwUP0Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYjy/cHURFzXa4D8+kK4zBvul9llz2qrWwgiwYSQCfaa4/VHfyvXC5H1iIEAQuuimebamQaRjDGqUbMwN1jD3yARfwpO8hurevZI8/povlssWtYEuDDcsL3j+97tOVhI/KofohQnj6XVWb4dIuxtNxXWYDPSRiEKtUOjWg544kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-532f9127978so699381e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751798642; x=1752403442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fryjNABzJeXYbuU+fJLRsiqin0eN86NG1i+dXCSHWg=;
        b=Tf1o3KJUcvZ2KQzG+naMAITcJ8T19GAVSNSs3/as4l1N1pKIJUzLZRDLOvuQAihtOt
         6DuSECyj1b8xU9FQwunFQoST32uJreZOWNVYjA/4S5I2qRGFDywUmPxNsUFVCPE0J0ab
         2+Nq6TD7CGZ704svg7akbGCtrl17lg4l/vi3hl9SY3yPN/kvq86JFhm6Q+sLaQZWacpW
         RsC8avReaWmwLk8roeoGfvmBTSX7CZ9tiXmTE8iLEL0Ag3ZHdo0Gv97l8Cp+Qhi5xTUk
         iKqSMb2KPFvgB8CqOk1eX9kMBBJdE7MBJmMY3D7PEnOWlynKOEPZcXcRHly+31Rvjc/N
         3CRg==
X-Gm-Message-State: AOJu0YxQgy3IThlKhQj3GBSQ3s/m2kw6DxmAaprw3wQAv12txLkNxIts
	KgdPuAh93vyNK9SHfr3QiZgYc/UJGyhPw+8T8MNKMl4TbiWCdFnXmOqZmpzH6hgI
X-Gm-Gg: ASbGncvmRDPCla9XyedH+SjilYwGesjURsVPJib7M1dmrpFurHwPjUr9GwyxMv4h8tn
	9mquL4VUPjqWH/nieP+/4kjO1BNzKr9u85+jN9j6RCofrsxITkAIb2pzS2cDqolqn1QKbNpGSjc
	8cvMGMCsSV+/JnCCa4M8uWdXV/CtdzROWo/ULoc9Yq/dABc7fMT0Jv6RnJl2vXnHFcr6tDwPxXT
	6d5Am5jus3vAu9m3X2BWufSxFoxizodocoWcmpXBvk5DNY5t+CwpfuV0SYg1ATZdF4XghoKPaEx
	acbDRGoLTIsjzWkZSlFIlHjVa+IvBmJGpKpnnm9L6qMMg+1yUfP7VKSoYr+GR9R+84RHbJsNJfN
	v5vhDzyRibG1xn4LfYfukDG+9
X-Google-Smtp-Source: AGHT+IGKOF1EGYlgQDN9TkF9iZ5/65y31DYIr4o9EffeOZTTOgmlhfk3HflkffEzAmYc5bgvuOUjkA==
X-Received: by 2002:a05:6102:370f:b0:4e9:bb3c:7c45 with SMTP id ada2fe7eead31-4f3059d0a68mr2152120137.4.1751798642535;
        Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e927c999sm978222241.10.2025.07.06.03.44.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87edd8f4e9fso375107241.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:4ec:c50c:399f with SMTP id
 ada2fe7eead31-4f305a6fa78mr2353704137.11.1751798641763; Sun, 06 Jul 2025
 03:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
In-Reply-To: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:43:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEO+o0Py3ioC6ohbJooQdMhD9AXTHD1j1y+C_1TqSAAg@mail.gmail.com>
X-Gm-Features: Ac12FXwVVv9iMUPL5V7yTBrj-e-SiCiCS33sv508W7QTGDAo-a5WgiT62Pf5vvw
Message-ID: <CAMuHMdVEO+o0Py3ioC6ohbJooQdMhD9AXTHD1j1y+C_1TqSAAg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Jul 2025 at 11:14, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 16 Apr 2025 at 13:42, Daniel Palmer <daniel@0x0f.com> wrote:
> > Allow the experimental dead code elimination config to be enabled.
> >
> > For my 68000 nommu config this frees up a few hundred K of memory
> > so seems worth while.
> >
> > Boot and build tested on nommu and mmu enabled configs.
> >
> > Before:
> > Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> > 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
> >
> > After
> > Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> > 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
>
> Thanks for your patch!
>
> Note that enabling this requires enabling CONFIG_EXPERT first, which is
> currently enabled in the Coldfire defconfigs, but not in the Classic
> defconfigs.  For atari_defconfig, I see a size reduction of ca. 150 KiB
> (gcc 13.3.0).

Let's share the actual figures I had saved before:

    $ bloat-o-meter vmlinux-v6.16-rc2+EXPERT{,+LD_DEAD_CODE_DATA_ELIMINATION}
    add/remove: 0/2125 grow/shrink: 10275/32 up/down: 52254/-205419 (-153165)
    [...]
    Total: Before=5277826, After=5124661, chg -2.90%

    dmesg:
    -Memory: 265412K/276480K available (4345K kernel code, 486K
rwdata, 1240K rodata, 164K init, 143K bss, 10440K reserved, 0K
cma-reserved)
    +Memory: 265616K/276480K available (4205K kernel code, 484K
rwdata, 1180K rodata, 160K init, 143K bss, 10236K reserved, 0K
cma-reserved)

    gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
