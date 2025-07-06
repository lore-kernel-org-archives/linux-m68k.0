Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFA78C9C
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794795; cv=none; b=fJnOSggwRhdD5FPdM/FvPi07VtT5nxm+GH2TNgI0MWX9LdqSQCTGSHYzgYSDnDYnuQBNHCNpnndKy+c5PdVf64gxpFuPkHXVOr91deLoIizMMIf6pPsw4vvLMxa1ju8DTkk1SpD5DzVg/O1kA+d1IG96bPcvb2p1VrytAHacXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794795; c=relaxed/simple;
	bh=mQVRJD/05Itehd9MtTEEq2cthgYKl7gTh+wqh7fS93c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRMrSgvNpJnv3NgvecgQEYPA9p/7TCNtHtcrIRy99655e4PSCzLHNvjmlXdEVgLJSo7Rty7NFn9ghHwxhJnFgsPejINZQ67f5WBzNQKhmmK0w167n8umhmEdO2MkVFXEy2NUWiG71SxR9+hfmfgtIQkazsykEcv65sSAmWhPJqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-531b4407cfbso673693e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751794791; x=1752399591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjnVbnikM6LXvEzzZHZ60x+VCLdIvjuoXFVN9qPH50o=;
        b=MjwyL4tTuOn7fcxXZcpZdHFZPX1SIiSWgQ3fNZBLMGA5UOENmdF8sbF+UV4970lO/p
         iT3D/fnOuRvPlt2+/ubXb7X8Sx2YBVLsH5PgS6NdEyJ+k0OClEGC0lfyBrudoh9uLYmS
         IBsgWkrQkdESB7lV/PJOZE3O7iKEIXaiIrfq8Es365+CVf3jxo/eydH5BMtT3zxqmIJx
         jWebqdQ0Ytt6mZF6e+3SRAvA4CDV4BqfSjyAemwyG/m9TKDInhRdW93CVflXw5yE/pyy
         TGAtGAbHSBHknnWzZ/8pFgtfxHmWW6u3yRsKKQ3yBvgcgo2kUYDWQhvhQxb8bKhmaVtz
         cGvw==
X-Gm-Message-State: AOJu0YxTIy19g9Wc0WgqsTsPsZBVRtKXRgyHG7GwwpO9jpFRC1DLLZmY
	gTsUBI2vnp4JTbT+wtFexbWoqQkgqWNaW4wgnYkHOCoyC/nb9CpFN5B97Q2bvMGX
X-Gm-Gg: ASbGnctJsGGAazQf8nYqipiz71+4PBv9PfhUChZ02LMgLNt/K5dM+UGIbAkcFlkmaI2
	JjC9ADk3Nzix8RPgQBaLeSiaZ0S3oE3AaSb3sVaHW6kbqCO8j+wm4nNHVaSCQxs78iJRCctuEK7
	VI8dHh2lc4CeNhdt6KBozGIGtQipQzCUA5sGz4AA0LB+RfmoN73DlO5ueomqCYjSkNIAu6APmil
	R83Nbxtop7sI8oe+iqmvhueUwE+xn0yrSm+ELqO9dErXeY1v3I0B4bCTrYRiJqxYHJj7SVjw0lZ
	i1Hrc+f9mmi9NyI82Gl7yddURw5h341DAsmBHwnuXm3SUQu4seaworhkARWUEgz/A7giorUYJcI
	7ckVH9dSCn38Ip3rlr+UCdyxA1rXD
X-Google-Smtp-Source: AGHT+IF9UTkuZDX1J0BuC78GhK7m2fesTqysE15eN4XST2qD+hQdlY0SfJP8VV7kyncIAM7iGnBX5w==
X-Received: by 2002:a05:6102:8029:b0:4e7:3d55:5212 with SMTP id ada2fe7eead31-4f2f1e27d43mr5712332137.11.1751794791349;
        Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea543116sm780262137.9.2025.07.06.02.39.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-531b4407cfbso673691e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:39:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f56:b0:4e9:b0d4:1133 with SMTP id
 ada2fe7eead31-4f2f23f8c1fmr4901561137.20.1751794790891; Sun, 06 Jul 2025
 02:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611114056.118309-1-thuth@redhat.com>
In-Reply-To: <20250611114056.118309-1-thuth@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:39:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGQfHJMFydTWE=adavrzeoSdzP_n2ht_Co96z_7M6GwQ@mail.gmail.com>
X-Gm-Features: Ac12FXzR66yOpKegCjVjpoxMzhZQsAXs5Ry7pu0ZIFAAJrtDwSqC4tfQbM2Zo3k
Message-ID: <CAMuHMdWGQfHJMFydTWE=adavrzeoSdzP_n2ht_Co96z_7M6GwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
To: Thomas Huth <thuth@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>, 
	Sam Creasey <sammy@sammy.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 13:41, Thomas Huth <thuth@redhat.com> wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
>
>  https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>  https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>  https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>  https://github.com/riscv-software-src/opensbi/issues/199
>
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
>
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
>
> The x86, parisc and sh patches already got merged via their specific
> architecture tree:
>
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
>
> So I assume the m68k patches should go via the m68k tree.
>
> v2:
> - Split the m68k patches from the global series
>   (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
> - Rebased the patches on linux-next and fixed the conflicts
>   and new occurances of __ASSEMBLY__
>
> Thomas Huth (2):
>   m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>   m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
