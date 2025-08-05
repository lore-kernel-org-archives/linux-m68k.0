Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1FA244679
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Aug 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754381591; cv=none; b=cUkrtlF3qkxHi9D5NtZobXSOvPMHH7hJwsTvw0zMFVKE4b8uiHcaVYht/hgwI839HYJshDeKXqp3NbArF19CiwQ7G+8ge0hUd0mzTx2cTg4LFa/3lUgiGdHfdvigIuUgeQybNJEYTZKLVsaKXc1PkEA1Xb/Dt7yMEIkjheR6uvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754381591; c=relaxed/simple;
	bh=XY5X8rTqj6KCB7z+WOowtTK7MrFk016Y1kqMLEFIi1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHRSZ+1Z4g0m99MD1JInJYq4o3ZWJMrRR7kJzMex0AhMypvGThTaPnT0InBI+YmALutmflYlV+BSvUZEfOsOnuw2yQbcK+mdmlQgHNyrZzGVsplV/wj8C1GX5qtCJtfUPENhmuSw4vED3SUAb1ZJYSQauqzfv3V86VcX1+QHt4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-539613258e8so641493e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Aug 2025 01:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381588; x=1754986388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYbREyEF6GDi+6BqzkUaervyY8mSRtfMj7JERduR6Tc=;
        b=frJE5HXANwI9uwflOUpcZPtf3dnzxVZeF2LQQSdPutMF4dUrGKy9X5kRASmCx2/k+0
         dFJFGrKMTyXspYBi1dyWmZGQsTGyMHubqeg4eWkIPYsrqNc0SsCweudQldGfy3D+8hJa
         L8R91ftbtrjJFsDzLfum+NiErA0N+LMj+EeV8e38gJ19mgcfOsuzySZM8/mhuEMDzEZH
         A3q5shI+gJKamOKtlJwWMo+//lfuGgI1IbMFyvcpjQl/nB5cEy6c+i39doXlyTIQF5FR
         BNfyu8KzTruJkxfse+CKyicjUKV1KQu9f38c8ctu3rBbWLt+zJLvOm9zqDCGOIwG1zJO
         83XA==
X-Forwarded-Encrypted: i=1; AJvYcCUEjrhKnX5Kr+8uJ1N+EU/e+4CD3TuxR2hkX2XpoODj//4J25HkLJPTYJ5wzuMXnNo8kBjWI35GHRuw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxkmdaKi5GwZ0dSFQAZDhAZ9+eK1PtncI5uorepq3yaag//avYO
	H8mkGBg/rU2vUZvD0QkMydufP9aj+5Hu6JDERgbKLzacy5eAQSRCKKPdhG65PQaS
X-Gm-Gg: ASbGncuY9ow0HOYk8qu0BYJX7M3IHxqzLJ6XoJi31/Pi2Ch4ZuauRRmAUW8e0AXOTlm
	LXXiz6vkyrKUQHBJGbZU5s/LPYDs8FamdfMaXtZtpNgFCZ4Ftdd67gHC0TxSZeZs2VPbwQawPH2
	M864kCaXRy+k7dB2W3ywsW/+ERXm6Ibx5El/b6/3q3u6bpD36XtGKP4REv5sgBAPg4GYaYk+k2V
	w3WdNWkEEdFaFO3p2rujViS6bC4JnV9NUGDaOsg1RNABhT2XPFxdiFdLI2VydZgin+akh1nF70T
	fjncc9xWhH5QdPAqRrM7ZujhHjN8yeanP/oE2ymb/3U2bBHYzekpz/+WjmE6sO3536lv0FxvDej
	PD3JDKIa5PpgGMMwxK7z+LBC/XzoQA3ol/xEqMeRLlnEqTRgqUXIJRSIqZTIO
X-Google-Smtp-Source: AGHT+IF1TVNN7c5XQ6RBe4H1vN3h2v1R+8OAylKD0DojGTkdoH2nTWiuXv0dF1fvzpGVBNSIzKGpDw==
X-Received: by 2002:a05:6122:1697:b0:535:e789:6ccc with SMTP id 71dfb90a1353d-5395f1f80f0mr5374494e0c.3.1754381588347;
        Tue, 05 Aug 2025 01:13:08 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936cbbc29sm3333648e0c.19.2025.08.05.01.13.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88bb3eebeacso1223941241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFgoc9+0GLWBNpxG021czUeaaK1POGtQIJVWSvEtO73qKiv/+t8jI6gHz1+8jqmal9+YZFM2jw4AoV@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3a0b:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4fdc480dc77mr4806207137.21.1754381587163; Tue, 05 Aug 2025
 01:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804163910.work.929-kees@kernel.org> <20250804164417.1612371-11-kees@kernel.org>
In-Reply-To: <20250804164417.1612371-11-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Aug 2025 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
X-Gm-Features: Ac12FXxoASDmKZziFEtov1BZOWBk9xds-hH6z1CBqhINtQO4YVRNUk0c1YQzJUM
Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
Subject: Re: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 18:44, Kees Cook <kees@kernel.org> wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> Add missing __attribute_const__ annotations to M68K's implementations
> of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
> pure mathematical functions that always return the same result for
> the same input with no side effects, making them eligible for compiler
> optimization.
>
> Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

# ffs: pass:9 fail:0 skip:0 total:9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
