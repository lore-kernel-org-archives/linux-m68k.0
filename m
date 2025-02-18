Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266A2417E6
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888028; cv=none; b=jCaQXHB2Z01VCFqx4p8DDJxJ8147k1Va44+kKU405ON6RRyqYYgzCUf/iJrvyjihkwwbx0n9m1HeMmESqFbN9Bu+ztq8NU/YzRYYYAN2HIWvIyYZMKPjeUGSeCBBXqKKAbVM7VVUJQJI8EkFf8nA46vtQ4qtktastQ2/hA58/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888028; c=relaxed/simple;
	bh=GU95lFGcor/jEjChW240ELXZRh0JYb7LZci6IUdhpok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bxrd4td97NxBKuG7q+fJES5XbVCdbttoHvtPTNNcAj1x1mYVJ6iBCh9AwzCniT1gkKPQI/gysD3+Tw/q3ncmuMeHDJYeIovEzaSfQ8cEpJpg/jhNejIAzaqe6NurlWM+CvMGH/qhVM/knk1FRqKpu54Iw7b99ALl1vi8syyqMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-520a473d2adso1717418e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 06:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888025; x=1740492825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=welPK9uUk6TPPZEsep1eDldHA81BmMQSGld/AT5ISsE=;
        b=UMURpeF/hT0TCXFmjNUPARYa3u7dBE/xks3iSrcrEBCAWDxU0nDJLBInYiJn3ieYCR
         XwUKjZDKbqp5gx3jtBIY90CRna+orWbu92E7RH5CRH2ZkSTYXD2Oh3NVbl2uPYcwdwCm
         BxFvZa+PbTKwfjGs8FunzEhbOsZ8ZM48IWP05yGOiZbpOxnSBElhIE8hwe3IdAictjPJ
         /4Jsw5l9rnQjgXKh6bdHbtYF9AU7nrCl3JC2R7FECirpQeOrkk/nAW72s4jKweHb2ify
         uNjD+2VLXzshGpOLBP8QLJGuhB3MZ9kIA5lLQDpoQk1z853rDArJAagVUFKJfIf1QqNa
         Rdxw==
X-Forwarded-Encrypted: i=1; AJvYcCXgZiCTdpFe6wOX2tHJbp3uyHdqT6KFVdBI1kM1HOldC2ZhNFHLtes51hTNud7EW08LAylfbbosy4a5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyUi5Fwiw11sbMFwO8uzKuVjiY+i3Tz6XZevjPkKrciFf8FhVPV
	InKHNIHJm4KsDaNsCfP3AX5DilikSzRHz3DUs8uWsoVlA1MkDLcdPtL/Mmo9
X-Gm-Gg: ASbGnctjVS4wOAjYDMy6mB87xgXUsMaWdwAXUCJkmewFAv2UBt+aWKaV2jFDyVIFIiL
	X32rIxUwyAGJHG+46ZvdwMgWZrdN8D5luDYaHM8z4zzaGZ4sDCbSLc4mhj83Qa/UsDewTRvnDYs
	JGIs/Z1IXJCrdyFuSTXKlSRLpfv/kYXAXNR1ZGqkXUsK4QO7mP315cM7jNyq0VyzUOcMrC/ddWl
	zgIP1IwXx8zuXTao9DnNlyU7Nv6SN8YeT1WrDgSE0jXCvYh/2rFzq6o5kzGSNJFi1VlxKq2Io6B
	UPBAjqLDRqAadGGf81rN8Pp8JheA5kzPtEkLEnrrfg5Piw4yJHVaDg==
X-Google-Smtp-Source: AGHT+IE1lj8NEUbB84yCPlNcTYLnB3LjHd32AV4894Aa+rfSnMPgCygbrb0i7jHnd9UEyILBSXnhWA==
X-Received: by 2002:a05:6122:1807:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-5209dc5f119mr6885794e0c.6.1739888024848;
        Tue, 18 Feb 2025 06:13:44 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86cae65sm2435442241.30.2025.02.18.06.13.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 06:13:44 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4be7f114996so244431137.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 06:13:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2t9bR8cVQ8Y57xM/vI1F/UfjDFn0JHD/n6KyyzwT64Hy7eMjxqpNcPhFQ02XesrbTTu0xFGj/WdBA@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5e91:b0:4bb:d062:422 with SMTP id
 ada2fe7eead31-4bd3fc8be75mr8565480137.3.1739888024406; Tue, 18 Feb 2025
 06:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213141037.50394-2-thorsten.blum@linux.dev>
In-Reply-To: <20250213141037.50394-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 15:13:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFaudnOhwXpYJSwt3R909D8GLV+bLK7UhnH1Z3NB3ZsQ@mail.gmail.com>
X-Gm-Features: AWEUYZkKbv0Ikcr7vDWTODLeRcLURgXx3Q90nK_z6xouR-EVJTD8ZQrSq2ruLFU
Message-ID: <CAMuHMdWFaudnOhwXpYJSwt3R909D8GLV+bLK7UhnH1Z3NB3ZsQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Replace deprecated strncpy() with strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, linux-hardening@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2025 at 15:11, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> strncpy() is deprecated for NUL-terminated destination buffers. Use
> strscpy() instead and remove the manual NUL-termination.
>
> Compile-tested only.
>
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
>         setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
>
>  #if defined(CONFIG_BOOTPARAM)
> -       strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
> -       m68k_command_line[CL_SIZE - 1] = 0;
> +       strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>  #endif /* CONFIG_BOOTPARAM */
>         process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>         *cmdline_p = m68k_command_line;

This seems to be used mostly by Coldfire, so I'll let Greg handle it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
