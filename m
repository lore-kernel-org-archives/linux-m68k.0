Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB291D358D
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 11:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805179; cv=none; b=aQeV3whBq/2dV2P0bKgWknX5DRhRCrm4VqlH6xILoo0v9IBQyNkEMG3rvFBrZaCRteBU6nZNUIl2RjfTX3oo3ejJQrNTqEW8SxIdaRoXPoSA+uaFi3Bc4LibZkzKH1a9Gtgzq7M0461c0oO5x/3EvHTMW2s4pygmMJAdnUA1rOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805179; c=relaxed/simple;
	bh=joG4P4jYyblotj9+AuYdZ9+B473TN45NIpAJQxIZkWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nleYV7IuOMFzEEyWVo8kzDdrwlH0xZUdf2tJsxrRxZ9PCUWEvJiwqLT8QIjTcxwGlzKCJkcIVaQ0ngB9DQ0tBAvCP/D19n6Y3uxBknujojjTaIK0wrvU2MxARLcrwUiwR7nzxpNPaz9iJyM+mO11u4bF7R8Sch3WGQ5yoizlQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea339a41f1so45521397b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805176; x=1731409976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u7cesrN6fwiNOOUz+RnFnfBh4Cv9POsXdrOPXkwZn8=;
        b=Ved0asKFFwFgg4KSNYIp8cOZv5qwdspEZ3ht/E6lMRxhLmscXu0DaniQG3gmN773ya
         wzKLmrDJrMHW4naN6gjHLZip5gvPNIT8hct3ICvItx5Js9XsaUTwB5CCMuQoh7yR17cr
         /B70RdU7QdZfbb4nNSLDBotdn7bUhFfV9XsQfm23imZyLJka+01Z6tV8IyazCaaVMv+x
         +AmD6deogTWdBoPuoskQfJz6Obv4Bq5U5bPWOnQUvK+q1KOcVSmFmJX3wnwIeDAtzNBY
         qJm9IYBqQqhyYJz/8x0xUVVIZ7SB/hjGs4RdPbacd8PudBhubGKBo7DRtGIewmJI+5yV
         bkYw==
X-Forwarded-Encrypted: i=1; AJvYcCUKh8kUz6SIHYXJfrr5NCUg1zJrxivYOKKGf+3G3QcJtxWd5eVMgMj/ULT71p1zIvpvmThWHSxXRDJY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwsDtjpD+vpLXauBpQ+9MQCyCtb9GF2re/t1kYcEiivlv0KjHM0
	sA58uOW+HPI7A1b3avIT8jll6PW23Lqy1kxlI+fv0yOssGVSBRHXrU6twQC/
X-Google-Smtp-Source: AGHT+IHQUKjp/ad3ZCbROyadcVDN2aUvIaLcFtv9Koc1EHGRxmvHcPdyLrtTtSnCEVSav1tkY7TQPA==
X-Received: by 2002:a0d:d203:0:b0:6ea:6f5b:cd5e with SMTP id 00721157ae682-6ea6f5bce2cmr110308557b3.26.1730805175559;
        Tue, 05 Nov 2024 03:12:55 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55aca025sm21909187b3.4.2024.11.05.03.12.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:12:54 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea339a41f1so45521127b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:12:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK1RLfqEPcDsuIWBbpHwJuenCyYOCyc2q/RkwH0uVs6ccgvYw+3+8S1Q/GmMhnJEa+joiFBJTQsVr9@lists.linux-m68k.org
X-Received: by 2002:a05:690c:9a03:b0:6e2:985:f4df with SMTP id
 00721157ae682-6ea52546b5cmr206450377b3.44.1730805173824; Tue, 05 Nov 2024
 03:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030195638.22542-1-arnd@kernel.org>
In-Reply-To: <20241030195638.22542-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 12:12:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXivFLfonRACeQC-VXQDg7Bnj+QYuW+8UH+ht8Bij=g_Q@mail.gmail.com>
Message-ID: <CAMuHMdXivFLfonRACeQC-VXQDg7Bnj+QYuW+8UH+ht8Bij=g_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] [v3] m68k: move sun3 into a top-level platform option
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:56=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> It is possible to select an m68k MMU build but not actually
> enable any of the three MMU options, which then results in a
> build failure:
>
>  arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undeclare=
d here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
>
> Change the Kconfig selection to ensure that exactly one of the
> three options is always enabled whenever an MMU-enabled kernel
> is built, but moving CONFIG_SUN3 into a top-level option next
> to M68KCLASSIC and COLDFIRE.
>
> All defconfig files should keep working without changes,
> but alldefconfig now builds support for the classic MMU.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408032138.P7sBvIns-lkp@i=
ntel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v3:
>  - fix coldfire+mmu build failure, by taking out the m68020 default

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.13.

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
