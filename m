Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9A146A6B
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317262; cv=none; b=umOVBW3GXEfmU6jIb7iiVdktIErbgq1PvDbXNcGK5CzkEcSFqbBkrfzT8fLLyGPouT9rx4AqtK6cjXKBoyPcMArcvOsdCEQznzXdr2ksRyP3ySyswkZD9es6hup1EoiledXllPPcyb/wMoBZ3Rtxx2ZQ3WXue7em5q/UHie/CnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317262; c=relaxed/simple;
	bh=/EYlPQZYbG0qx2DDHeUItmP9wnSlVmM8158e/7RMOxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBAPUA7kvwiXuX7EZFMyLS3xv0S5Be6/nF10Ug4sh4ICJ0oJ0zr7DkeGjBSgOhP1Z2+Rl+A+zZPAgMf/8P24d/vdNFn8q/J6jwHNeU0tjMwrz7u6qW16305n1tVOim9B38wZXhie5PFrnihP0Qnv6zHr8UCigXdoEMtfFY8XTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e28fd8cdfb8so3999310276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2024 01:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317258; x=1731922058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEEZs1hubftFpA2mQvUEi2H6qdFebKUYB14kCvXL5QE=;
        b=f9C77qJ5aCRx9KzLoMIh9m3MlYMBQrPI9rZhBWdbBsZckEPkFfn6UQLxXdq6hiirfC
         ycTihKorJsUOL3ryQ4EphGVMNLnSYSDOt5gO1qpMqzDtx7jVXXn5uvNapoaDwOkPa5l6
         KCVEOnWX7MzpSKK2+4OdBRjH1leW1A5h0mhJYF0zDFb4tlN3WDhElbQDRDon3PmEAH4e
         ft8OGRgFCieftwgJjdMT1MHekmaW2I3QByK9NzQeHhA826RYTya/sak89g3TlSnb2Ccr
         Fdf8RvnYW+wNayxs4B8ly6/DnA4T1w8v037uRH1SLMV3D3mjjQf+J+qvE6JLj6BxjE9w
         Y+sA==
X-Forwarded-Encrypted: i=1; AJvYcCVr9oQWfMG5/3KOlDSJQAYXn71AJ3wQnQNswpfzVZ50hhrkKuWosdyj/dvHrlBanebQHliTzqftoG2o@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyuGRzqhCUObalGSr70FvoB1E6btr5qnWxFUmWCsiSA+QsCV7Us
	iksaRHe7YYqr/E+qRjcMRWtf2TfpC26EazItm+B+zVRzbxe2+w7nSOQHshFP
X-Google-Smtp-Source: AGHT+IFUbgDPvjLVboobeTRPC6mCIvL3NqkPNB/svlHlLD3EnGuBlhhSNvNAHG2SBSZnXrgfIoDE/g==
X-Received: by 2002:a05:6902:f84:b0:e33:2605:f80b with SMTP id 3f1490d57ef6-e337f8c6e96mr10661427276.42.1731317258383;
        Mon, 11 Nov 2024 01:27:38 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ef4af48sm2154628276.33.2024.11.11.01.27.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:27:37 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so35723137b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2024 01:27:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXq/lpjcYvNgVkhmqnNeJCkAzU1ST+/Y9HATVmu1Vi4dFT4qRAFhHOPJeTPa7JPzDtIUJGk7xELUOf@lists.linux-m68k.org
X-Received: by 2002:a05:690c:f93:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6eadddbd0d5mr111198207b3.23.1731317257635; Mon, 11 Nov 2024
 01:27:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728377511.git.fthain@linux-m68k.org> <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <a912689ee714d35c13f4a5fe05df58c662a6dc8d.1728377511.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2024 10:27:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU45SmMZ+OGn9yS9rrFThESAsFu5Leb_kNVueffM3o_4A@mail.gmail.com>
Message-ID: <CAMuHMdU45SmMZ+OGn9yS9rrFThESAsFu5Leb_kNVueffM3o_4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Michael Pavone <pavone@retrodev.com>, 
	linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Tue, Oct 8, 2024 at 10:55=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Both mvme147 and mvme16x platforms have their own RTC driver
> implementations that duplicate functionality provided by the rtc-m48t59
> driver. Adopt the rtc-m48t59 driver and remove the other ones.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> This patch depends upon the m48t59 driver changes in the preceding patch.
>
> Changed since v1:
>  - Initialize yy_offset in struct m48t59_plat_data.

> --- a/arch/m68k/configs/multi_defconfig
> +++ b/arch/m68k/configs/multi_defconfig
> @@ -506,6 +506,7 @@ CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_MSM6242=3Dm
>  CONFIG_RTC_DRV_RP5C01=3Dm
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dm
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme=
147_defconfig
> index 2248db426081..4a0928b3b842 100644
> --- a/arch/m68k/configs/mvme147_defconfig
> +++ b/arch/m68k/configs/mvme147_defconfig
> @@ -392,6 +392,7 @@ CONFIG_UHID=3Dm
>  CONFIG_RTC_CLASS=3Dy
>  # CONFIG_RTC_NVMEM is not set
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dy
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set
> diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme=
16x_defconfig
> index 2975b66521f6..481fb2810f1e 100644
> --- a/arch/m68k/configs/mvme16x_defconfig
> +++ b/arch/m68k/configs/mvme16x_defconfig
> @@ -393,6 +393,7 @@ CONFIG_UHID=3Dm
>  CONFIG_RTC_CLASS=3Dy
>  # CONFIG_RTC_NVMEM is not set
>  CONFIG_RTC_DRV_GENERIC=3Dm
> +CONFIG_RTC_DRV_M48T59=3Dy
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
>  # CONFIG_IOMMU_SUPPORT is not set

All of the above don't seem to be inserted at the right location?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
