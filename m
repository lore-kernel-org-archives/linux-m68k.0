Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AAE1B4F02
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387708; cv=none; b=g71penajoMWaGPL8y9fiQdZEe+LxSUSE0pUi4cQyThf7BsTV6w9S3TJWORSajJ/MRSZZatQq657M0UQiGSLjkKAGCjYclONe57Mw+l3o1L1KUIxnd+wWMASVlP83a23546iFuGzLAIJuEm2/5j91gtnSMnGc8KulaFhUlcEsZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387708; c=relaxed/simple;
	bh=uGv3CJq7RmlcrPZMuZrno8F6WHY1c5dW6h51mwsA7VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQvIu+DaP0HMNxyDikbbj2u+NvtybU5I4y4OCWVxQzUMPUZC0QOYfqpW/E6dsUa05p1yZBH0+g0j9pCALLjqHOkTnfds4nq0uryQ7pr24yuTdxJngdq9rQ51vqmNSQ8aVAltzPJkK5Wam2VLH8z5dGgwYPxWEQuwVaxLc5/enQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afe7429d37so990138137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 07:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387704; x=1737992504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHsZQg8artRnFj019hcav0lgBvT94byFTKzDZNCEMsI=;
        b=DYbGEhgqIYH+RTVP6R4gdenwc6T5Q6a3haG5wixnxylLsO8oGsbOUJ8wEYhQuD2P3J
         KOkruyFN21VkXvT9iZpaJX/5hXcOxAfVRhSnixp+6oNG6/KSiUBsyg958rl6lAZz5x3T
         07eQtkD9Yggtvv6BtxUZNIFe5BXwqv60G5fLMNnEThRgHobml9qCtgJ4ziUWtuF1UI7a
         cBWcI3EZZlXpU13mjJDHiAbFNw3RHLRBS1nsNg4i9/P9/imB1f2+XhlMcreWUinVlIyU
         OsLPgQU1KKYwSHQhAFqxneF3Ms/Ld6N1ZOT8zFTXtsyHkuipWnNjL5dDMk/UFCARCdEb
         HpZA==
X-Forwarded-Encrypted: i=1; AJvYcCXWHNGdknjsE0wCt6fcWiXvKlbjzqa6dmxzNNVS8MkHveblXXoj4MC0YfARdOcnKpp6m+VChPSGT7YW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwrRLENwVqMznaAkGO74Ew6JeQYcIdqt7S9smYD3DiLyfNv7xnx
	dh7ny/jGQzmwgi856Cp68CHP1DoLK7mRHpri2RxlMdha28DoEc6xTUt0e+FW
X-Gm-Gg: ASbGnctJmVcuZ64Ng7oG2RkbRKJ3gddWTMLf5pI6in9yWxiyYPySryqzAVZ5b+bAoKm
	M1hLmMsfNj3VLir8tAUIMj0aJx+eAFKVAdLOXfGZeWjFqpxL1lJpblveFzIKYeOPfclXDpHEqVc
	0G6tYFrXHweSXYNTV8N7F1EU92JLiYP4FbY2PE9PkF9tN4SO9Tqr93gtHOJ59iitkV9JUTFasHI
	lhYtPg5O4X+0gs0BJqfiO2yp4LhbGUc7DpwYRQbN49OamhQPgtXD5jBD0tf+rbdrlkQcbHw8z/c
	nIxSOH1pAVkN8OxKJ15H5MuI7+TvPHts
X-Google-Smtp-Source: AGHT+IH1k218zSzSmhEyQvPRX5BCT/VNnyf75tXQ8dzje8o7wkdrjvv4KFQvSvn/ppDsxDrLCJ9KhQ==
X-Received: by 2002:a05:6102:442b:b0:4b4:7cb0:ac58 with SMTP id ada2fe7eead31-4b690b80749mr10019662137.2.1737387704364;
        Mon, 20 Jan 2025 07:41:44 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a33f605sm1739714137.26.2025.01.20.07.41.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 07:41:44 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so886544241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jan 2025 07:41:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/d2hIC8s3k4uZh0S/hNMXR2nfiMdVusGvsoBCwfnCQYHlLx2LsLblKqdwUdpFbQfnRw7EVACCgTVc@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5129:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4b690ccbb21mr10247039137.22.1737387703853; Mon, 20 Jan 2025
 07:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117120605.126941-2-thorsten.blum@linux.dev>
In-Reply-To: <20250117120605.126941-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jan 2025 16:41:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
X-Gm-Features: AbW1kvbhfvBdB5zYeuJ27u1XkM4YmHyzKFaFb-4u-6cS4LHHMgGXZMmuTfAcrZo
Message-ID: <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
Subject: Re: [PATCH] m68k: sun3: Use str_read_write() helper in mmu_emu_handle_fault()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Fri, 17 Jan 2025 at 13:06, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Remove hard-coded strings by using the str_read_write() helper.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.15.

> --- a/arch/m68k/sun3/mmu_emu.c
> +++ b/arch/m68k/sun3/mmu_emu.c
> @@ -371,7 +372,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
>
>  #ifdef DEBUG_MMU_EMU
>         pr_info("%s: vaddr=%lx type=%s crp=%p\n", __func__, vaddr,
> -               read_flag ? "read" : "write", crp);
> +               str_read_write(read_flag), crp);

You haven't really tested this with DEBUG_MMU_EMU enabled, have you?
Fix sent.

>  #endif
>
>         segment = (vaddr >> SUN3_PMEG_SIZE_BITS) & 0x7FF;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
