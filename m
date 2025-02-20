Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90891BC4E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Feb 2025 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060387; cv=none; b=i9EMjAwnJQnquLZiPCxj2vt6ecfBwUuR57+QM7lmH1ztxp1BXhM/vFA8m2sPWSh6LygmhvLoFxruLW6wrqpgg8WFFpwqJGk/IajeuA3C5KeV25oHiwUYP8jIf4uysSicpVn+u7if5dE9zaarvHkTQVC+CSriWSDmFetuW5omvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060387; c=relaxed/simple;
	bh=5c+g4u99J+/DT0zZQT+jeFTwZIFzJSrGs8U0qBmmCA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm7rSR9ZglvYk7Pc+pXqn8dfU2mJpJGWcVdVdzzLADwHaYIYfE3QWbfAagsLfgJc6+SAtNUzjuw81Rf7o+1pir+3kneQ41b42qaineDPcRzCMduW8HjymHqYZTWK0wCaUBpJB/MqBLYn3mvznyaIUKmCwwqD+NQ0GiuzuObgeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c08f9d0ef3so54655785a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Feb 2025 06:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740060383; x=1740665183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1q9+Em+6K7sYpmivjEGUccl0krgxXYO57gX0Wza+y0=;
        b=tDEZESxmry2iFj5YlQrbCUzBKxV4x0YXEk5I4TAV4DsZO8EolEMxnWzHJw4dyNn9si
         DQY2OxZo5gw/bf/v8HPqef7m5lMVUiaNolY3wXDucNPPlXe6iD3pB+3Hs3zrV6SUdZzc
         G0iNX6JtrkBlzbbhwaGpD0Mdgvgn6ZxU5skB5BIpcsNOm7nXou/MMTLzw4WZuW7TxWNc
         8t/pIv/VqqUaUY+Anlu/v4eNS4r3WrrncOea2YSCva9QAuV8XwfgbAdD280VKW5rMpTo
         yhjXK5R6dbUeftyq/yXMz8RBlULU8i6NrdNIvWVwp7nRZZONyzNRL6nE4kgPXVIH6Y6s
         DL9Q==
X-Gm-Message-State: AOJu0YxKkCQZUAmTX7Smlz6nEFDP7+V5DU1XI88siOBf0oD2lbM56plf
	CEo/LCsWSfgLTiMmz178Uh+kqcYv73WAG9f9lSysJInNrCwnv3PN7+AZDur+
X-Gm-Gg: ASbGncsJcRE069MQdWHaEPvCWfYPEAV1PRFvWaTvKKmA1H8h+ZHQhtDctof4OA2cYB1
	BDK6xSJQiiW5zMpaJ7FJaFxUfayrcb1hencm1GsGif7hFKEYb5my8ZjNLvZQvxZDofC0qmZRDEw
	XnvcVxLXgtsxq2PWmKRyQn5QAsoyREEqG5RdDlnjMRp+raxA6riJKToDNo4y1O52O+eI45dp3iW
	HKJRH42Y0vrV+Jux10dg1xtFAhPze1tQ0bd000yqGg1SM+W2hSWQjfNB2vR7FQyo1LAMwmHkMGp
	xTj6Mj94eYS/RD+2WtDjJfm4BHUM8noEJEKJVwViFGBBtClPhJ0jiRX2hw==
X-Google-Smtp-Source: AGHT+IE4gbhK7jyUEbo17UpXCpbyo+982THqBMmpu+zl9uD9v/WA927gPBXSXuOkGGepGVVPFCkbgg==
X-Received: by 2002:a05:620a:4628:b0:7c0:b3cd:9bc7 with SMTP id af79cd13be357-7c0b51d5296mr848438685a.3.1740060382673;
        Thu, 20 Feb 2025 06:06:22 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65daffd66sm86276126d6.107.2025.02.20.06.06.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:06:22 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be8f28172dso57137185a.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Feb 2025 06:06:22 -0800 (PST)
X-Received: by 2002:a05:620a:298c:b0:7c0:aa35:c3b7 with SMTP id
 af79cd13be357-7c0b51d5234mr973515985a.12.1740060382037; Thu, 20 Feb 2025
 06:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218125124.2692982-1-gerg@linux-m68k.org> <20250218125124.2692982-11-gerg@linux-m68k.org>
In-Reply-To: <20250218125124.2692982-11-gerg@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 15:06:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYKyv9rrFgoik3Rc9YGsKtRizxPq5K35_-YLOYOszp-Q@mail.gmail.com>
X-Gm-Features: AWEUYZlhheKYnd9ywIWe12n0QjcLls_xBVqEm4M6AijViMJDzguXAfjCAE0WG3U
Message-ID: <CAMuHMdUYKyv9rrFgoik3Rc9YGsKtRizxPq5K35_-YLOYOszp-Q@mail.gmail.com>
Subject: Re: [PATCH 10/13] m68k: implement an embedded devicetree for nonmmu
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Tue, 18 Feb 2025 at 13:54, Greg Ungerer <gerg@linux-m68k.org> wrote:
> If there is no capability for the boot loader to specify a devicetree
> blob then this option allows for it to be embedded within the linux
> kernel binary itself. This change specifically adds this embedding
> support for the m68knommu targets.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -144,3 +144,14 @@ config SERIAL_CONSOLE
>  endmenu
>
>  endif
> +
> +config EMBEDDED_DTB

BUILTIN_DTB

> +       bool "Embedded devicetree ELF section"

select GENERIC_BUILTIN_DTB

> +       help
> +         If there is no capability for the boot loader to specify a
> +         devicetree (DTB) then this option allows for it to be embedbed
> +         within the linux binary itself. Typically you can do this with
> +         something like this:
> +
> +               objcopy --update-section .embedded_dtb=<filename>.dtb vmlinux
> +

> --- a/arch/m68k/kernel/vmlinux-nommu.lds
> +++ b/arch/m68k/kernel/vmlinux-nommu.lds
> @@ -70,6 +70,15 @@ SECTIONS {
>         INIT_TEXT_SECTION(PAGE_SIZE)
>         INIT_DATA_SECTION(16)
>         PERCPU_SECTION(16)
> +
> +#ifdef CONFIG_EMBEDDED_DTB
> +       STRUCT_ALIGN();
> +       .embedded_dtb : {
> +               embedded_dtb = .;
> +               *(.embedded_dtb)
> +               KEEP(*(.embedded_dtb))
> +       }
> +#endif
>         .m68k_fixup : {
>                 __start_fixup = .;
>                 *(.m68k_fixup)

Please use the existing DTB support in include/asm-generic/vmlinux.lds.h.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
