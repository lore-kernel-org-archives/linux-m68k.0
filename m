Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060B178F24
	for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898493; cv=none; b=sQU7jLXbpkcbdPoK6yqLsL2HKpJHWn0JZcG1JhXaKFT29lBHiM28/dga7JqsZSVlQ1Y0X0znCERIQ5yOn/muGy1G/nENavhxUzeyxWo0SQ4SQjO0+BWdEgde3cKlOcM6GSJh61Fva1RLdjQVfxsMcziu8Qf4STegayj8Mr9pSlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898493; c=relaxed/simple;
	bh=PimKZV/vvpya6qk4QcsOlAInmmFkcQUXGB3xQOYFJ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzUmbFUtJvxAMu5p6/J5Y4AaLzNYstaGrb5PeOTi9yMMrba2dyukMmumQYBL+3PcWZwtLDtQ5xGZlf5RNLWdGXqU21Kbrmn8CRt3IQ7tOeVHIkH9IEvFCwbcj3CSvXgeYEVzmulQ45WHb8LFxFnZCSVxhrl8yuCgIEttns6e3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52e0d047d31so2953887e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 00:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898488; x=1748503288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pm7W9V2mmyzuHBQiDodlGveixXiKksfY8Pj8Y9T4Ts=;
        b=QdpTC5zQHVdC+nQ5+z2Br/WkNrz0012JIV8rq/LaNzYfh1Hsw21LuoBtbtU/rt0saU
         lgBfHi1NXb9GYHYKxAiF0inMkFOdDTjdVXF037H/RxPM4p9cTXrC0GBmQZWnXYkoqlP7
         lF0VxPMYd6lKuplZw0mOsxaW/ZbU3B1JSUw42mDeNc21QmGWP7mvnlpOotAfsZ9FUKvU
         hahS98q26IJ2eZYSpb6CKyln92NqtsDrUVtixTF+IeWFCz1cKo4FajEVtaOP+q9ZBdQ/
         gGSYVEU7j2V0boE30F1VRSLyA3SoIsSy4Ck99LA0yfCgN0nq/UnVKmpGCRkbZAK5THPa
         3unw==
X-Forwarded-Encrypted: i=1; AJvYcCXsVEVO0XyB+jNTglrRfcw3SLKEQjxrMTGqi4p5s4B9TIkQ6oQD618PL98Hdhl999l21AE1JMVqjzym@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywly2w9A+BGv7czjg+dIj5wTmIfRAJnDVdiWZoWMxpbeD41pVNg
	S8Dgjr73+5oINuvhgF+z4+9baa3fxVBHfphb+r7I2pBSuuwhpK2PXZDwOTIsvq9f
X-Gm-Gg: ASbGnctlQtVhRZyBMEclPgtoKiHZP/fp5F7HwnGfagcGFXS0h+Bimzu/OCW61Rt7fXu
	ODxsCVylLXLJwGPyBkzOMohNNl736Jk6LkSdlU3dV+5cR4oP33kBObtGWUEtH1zisjqimaC4nsT
	VwFBYYeM4FGtZmvt24E/ksfVolcnnE8OGEw5bfkHqQOOMM9L8PBWRHJbav+9srNrt/uodsz5zWy
	VKu4Nwfqj4NoJLeM+vohnNULVQ8AqCe56Dzml7cx0Dqd3dQFGoSYo9egvHnxYYm5KuWkaFqLUVI
	PjVKVjISpt64W1o1ZSYB8IxmMif9nwbE/1WM2pISSiqNeIUP4gSCUvC0w7wzbf1JMEZxeH82vSY
	R+ndAniQR/f19FA==
X-Google-Smtp-Source: AGHT+IE2UlW1MnSZyUkwoTbqIUI2q88DvWisP5kNRxBlgFyMlUYCIy+18VFYwnhEiTqWBGak+f3MTw==
X-Received: by 2002:a05:6122:4147:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52dba83b425mr21412642e0c.4.1747898488424;
        Thu, 22 May 2025 00:21:28 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6d102sm11535678e0c.45.2025.05.22.00.21.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:21:26 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87c02437d02so2342888241.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 May 2025 00:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWI7MWFdvDAt9mKii6yljrUmbOXvrbCjBpM1wvRDUarSLNSQKyejUVcGJEk0aRXW3FjtIp+WW7BLQY8@lists.linux-m68k.org
X-Received: by 2002:a05:6102:14a1:b0:4df:a58d:9db2 with SMTP id
 ada2fe7eead31-4dfa6b586f8mr25153206137.9.1747898486254; Thu, 22 May 2025
 00:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 09:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
X-Gm-Features: AX0GCFsqKFm6qJMA3hsMqbJWzZuzklg0ynX2aADj_Q8qeZ9nB2XXIFQN5G6rIkM
Message-ID: <CAMuHMdUgb92D5Vp0NpfboAW6YJnmkFTtWj0wCL7QDM55xkzGEA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/ code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for your patch!

On Wed, 21 May 2025 at 19:42, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.

"CROSS_64KB" (also in the subject; "git grep" found no users at all ;-)

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
