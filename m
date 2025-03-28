Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6251DE2D4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Mar 2025 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151813; cv=none; b=U6JeFvKRJccwOeQukqCMAMauEBaWSnLEa78laJ3kRwzZBdeJuL+KdDBAFFmF4C31OJz6WNOrMaYuZr9rTkovWLhkJSf8DQLUyE5mzaPrnjkdm2WMMyY9EmZdAjs9sgft7FW57dPHet6dqNMBsZ1vGfEKVUT/Q/kNIi5Rr19Tc/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151813; c=relaxed/simple;
	bh=+L94eFi2uDp+TIXCc3hnZ2vtGNEe9Tc6lJ4xzdwbfVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9cAiFyCnwRZHiVqekUVKEQSA8XaaUS1CUPbfXr3lMVDoooEvUDoESTEENEXZznHzfebW3LQTBrYjqy2XqdNvBzFo9soW70PiYJ7KTk+C6HCXOVNlF19CV2UMspy9JO9MCNozcenkaTkQhxkodUJV5AcpE0bsmOXmdezxN7Wtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523eb86b31aso888031e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Mar 2025 01:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151810; x=1743756610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpAT1tp71GtIV4y+dKOaxRDAz6+mZM4xo94aujVs+Xw=;
        b=Q5rDjrVvo9kC4fuGR/TyJ+VJdRnfnbPl8qAmNvCU/hoHx9goYFDlNh7M5YyfpCdqpe
         mFZhqK9YIueMPfF+62wwOl3v2dGoceKY5WokuBYbaHF6s21beL/E0OgVUYGwqgHpfqy+
         C0Uvx9vNoaDg91VlKaLuON+gUjaFJbTR8abrnS0KQh44gkqAJ7p+IVY9pmg1WCr4IXyx
         Db69yJrGBbaR+nsUNT2GuIDkF+eyBkGq+3cxZCNerZuRqOHPw+M5ROy5F5kpucojSaRu
         ZiLMFSE/ofpDVMrn9OOW/csWWQTqcTG5Zs1Z8RtD1gojoTZuSIdqtXkl6R5nMPrbp1nq
         kz7A==
X-Forwarded-Encrypted: i=1; AJvYcCVGCw4Pq5lZXF4BA4uHVJwIQOCnS6ySiVUWkO1bVvmQOrQjOyJ78IzUtA4PI0uRc21e3XZbzUNFtloX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy4KUZLnxRAht1nH+gHZbWtRTXp4NpELvMiJ60NDchYk7YmCAOo
	I3+9x5tymoaBU/ltLPeh7bnZpzij+vU3qreJSElrpAiQypPyf/2YyvnQOxiG
X-Gm-Gg: ASbGncshxJm63NsWvkF6wPAOAcgy/JsD9gB2EkeF8UtZlf82AvocekKWYrWUbnL9Kgj
	wXoQsei3BGK+Ce0DpuWAUATMkw2EQ68dU1RNBWjNTaVK96YEBZ3FbOL88adVhH5GbhxiNQDnMVU
	kpvpU/bs0yPn85J/tElnREcwabThhgsAneVPjm/dylGgdraHq7/FemEZ5/UwbT5Jz95Cd5RUBfK
	BRe7HKaJV/JV2bSU75ap+4RY3zvioQVjWf0Sfv0K99IEP4tbtRRiaOg+qBXVfAornAeYwT6n9Ub
	fMMND3BIXbXpo2uuozh/5l+my6+M5e2mEnb+zvJwo1+kMjOdvAGYHKqaCAwaJTS1I79EMY7Xn1v
	Ux0zjCv9J4oM=
X-Google-Smtp-Source: AGHT+IECQVA3KD60TUUqP0oDpODzJidOSHTOTdl4Nrkx5EdCytMa0QCimUfuCC9kTf7AQs0aNUV+yw==
X-Received: by 2002:a05:6122:3289:b0:525:aeb7:f22e with SMTP id 71dfb90a1353d-52600a324afmr5842799e0c.7.1743151809914;
        Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260ead70c0sm319741e0c.43.2025.03.28.01.50.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523d8c024dfso783027e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Mar 2025 01:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP1y8/UraW/aW2LWd1hhjKeJO2FCSLVJS8DrnWdRwPBbuoHoDR6A0Ga2Lp47+I4xp8kNNriyqXMI2L@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3e16:b0:4c1:93df:e838 with SMTP id
 ada2fe7eead31-4c5870b7dd5mr6510011137.23.1743151809258; Fri, 28 Mar 2025
 01:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
In-Reply-To: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Mar 2025 09:49:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
X-Gm-Features: AQ5f1JogoBv3k8B-Hk6th8seQNyRgUeRzbavl9KEknZeWimUvBFTQJUJQ3kzQ_s
Message-ID: <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Thu, 27 Mar 2025 at 23:39, Finn Thain <fthain@linux-m68k.org> wrote:
> When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
> generate console output. That will continue to work even after
> debug_cons_nputs() becomes unavailable so there's no need to
> unregister the boot console.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/early_printk.c
> +++ b/arch/m68k/kernel/early_printk.c
> @@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
>
>  static int __init unregister_early_console(void)
>  {
> -       if (!early_console || MACH_IS_MVME16x)
> +       if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
>                 return 0;
>
>         return unregister_console(early_console);

Perhaps the whole function and the late_initcall() can just be removed?

When the real console kicks in, it usually replaces the early console
(unless "keep_bootcon" is specified on the kernel command line, which
causes all kernel messages to be printed to both the early and normal
console (and thus may cause duplication, if they are the same device)).

Or does that apply only to earlycon early consoles, and not to
earlyprintk?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
