Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AED23E229
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773477191; cv=pass; b=qKanG38Utlq03IUEsGP7znwaNpPs+9/Zg1O49TWlYmDD00iIIH2edXQhlANWP/chx8SzUzK6e0OFbbonkt9x3JfxC1ZzTpMjvg4jT4R9/FPhhv/1VfoA24AbIwFzkDFJ4YQ9jW4eKOQgZ0B9285ACgi8TTCka8jO0UimXbvWUcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773477191; c=relaxed/simple;
	bh=K2m29vFYhTa8suMcX35xG4/CJ0THa7o+u/MUTTc4DN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJO/TtNVlr7qNa6gsH4lKuOOrfZVe66qq9wfMj3zEjaa4xqcu5nMmiXoa8b1zAJajTG+8YSgbxSVMpY3iXbS/DtFQZVK5AeftkWoTnNrj61G2yWzhSIHsVoepmAizfZJyt4/p78UAEaFcGMdYuPZA1QSWtMXZ2BmbgC7fwUBVr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=O5LU5S/0; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="O5LU5S/0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so360229066b.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 01:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773477187; cv=none;
        d=google.com; s=arc-20240605;
        b=WsV6KOT/6ffyQRMsZ3O28oB8T7HJMoECdgJjUyFnYgrlbgdKT4KsU4d7cbP1ccFEDi
         ez1G7HswV7akc6YBH7N3B9yZLD3HFte0Lkt7HtIxbwi8SXZ6f1fX+fgW+ZW9NzTP+ZnX
         CpoHp7RvGguhG5u6TiTaS6VFx8nLgJ9N1//BlRi+jk+UfzMASr9GwGH1JToYNFWBzjc4
         3QsdXHsWkrflF7nwc0ffKNUIxd3Nm4nYgf7xdZ9D1TDyuhHUL3LrSTfqJbyJr0b/UHhZ
         j0JSXd3VnfDaLw50R9lg+EQVl5woEEx5jpRYPiVMfFTfJnRBuxhiS9f0EtTtWEGM2k+O
         SdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dtJDuSnv9xup9mKfpmpv48fCVeZrU/FJKeoAzNll9L8=;
        fh=gxlbXfVDHB8BpmmfuWSygGpk+4CzSSX2bDeTkPVq4dw=;
        b=F+uKVZ5GNlnd7sqMfyBcBVlE72pT7LOMeT7joYgpXq98aIMa/cv5gfaPXZZUVimwJL
         72Cz6k48594RjeM5La8NqjsY/0XsF9jkYZ8CInYnHOfvkr20YK48XBHb5MkJhr4wLfyR
         Djf8m8k7sEe/J7/ii3qVBsVmxHvbQohmmlAVvjWMFBcpBhX/CagNtij1Izqgk5Kkww1U
         s7YAFigScAlO1iQaVUJ9mdioV+RYc0xNVODtGjNAmLQHRG+D/TrRByS9mPFWUOEjjJ+7
         WV709fO7s0hC4u5XjvjeBx1svNy2Cb2Fx53ghNMshM4a+DQYAk10hn41wdquI9YlwRoT
         vNog==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1773477187; x=1774081987; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dtJDuSnv9xup9mKfpmpv48fCVeZrU/FJKeoAzNll9L8=;
        b=O5LU5S/0tbOjArWfcyfDQrUSV5NgUn5AQCQMAGeCjJbPUo/YANZ7raOtee9+uNt3og
         3yoA5e+sZ9s0gq6/KKVJRSWwDIaewNiveZckSlVDEdieOSeU0+UdM+UOlGTmqx52Aktr
         kQloF9dP74E2rv/MWjzgVA19ZpIyZhIygyEVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773477187; x=1774081987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtJDuSnv9xup9mKfpmpv48fCVeZrU/FJKeoAzNll9L8=;
        b=g9dd00DpYQjg8p3S2yxdjh/fE7FGpBvMOKjTVnKW6ns8jTJyPpBBmOah0+48dqeeW+
         C9SKJiL/wiWvqYWeVRKwPr1qnvlG4rqHMLMIOAP4T1pEzd7IKiL6/UTmSvkTJTSgFrhP
         TjPckLfStzlonte1s6eBP9/I7PMc3rxkS8IUBejWh1Y1UOJD09svtefDoOfz1NCIRA20
         HF1yNiAnRMEUCft/Wzfr1/+ZPdZ98kYRqxFbB/lO1RA+VvotIGO+TSa+q6bq+UKLlS43
         i8aEg19om7diyKEeSSFU5TtQXHwxHb7az6X/SmRv0Cv8KcCLlT3KqkcW41/vrKmSNGP7
         Qeaw==
X-Forwarded-Encrypted: i=1; AJvYcCXowwqWX6ZN9nicWHdtAc+EIbgkBRFdeAJGzPbDSvZeTNkOnyTTnawMez3PePAurNOTFH/b+bmEY5+X@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz1nPvVFVoBwITyfyUEXIbyydU2UuVKt+CZVa5sweIe5Ly3yN9G
	ISEDWLIxMWzgdSlvnGPbGmh9RihF0PqP2w5j0rwTRImaCGS6QHq2EpKSBK0W8HLIDKnQuGXC/pL
	sJMgOKirUKVagSce3MfHVfFg9F3ZpgQ35R7dYxMhQrg==
X-Gm-Gg: ATEYQzw0P1y/JtHPYCi3ZxrC26/T0qmxka4zTSltuHHkrDA5pqEMcCU/HuF4zBMjXtK
	8uJ9yhtn1w9C7WtkShwLSD3TGtkapul3rLwqBYf8otI3Tz5cRf6M2WnsNpyqcQ8VEeZeg1WA8TZ
	IsZg1NQ/UdwCDZH1tPLnWnth8YM1HDjNpUQGUqZaK0wEc40yzbNyZHMvyMCWRqYpOXHypswX7vY
	8IfKd+g3uU5VM0l1CQjJmDk097cDL7E0dh8HNOoHzKj2pgW4zdoZS3v3sR9IzeKwuIL/rGZFjRm
	zaH7cWBorg==
X-Received: by 2002:a17:907:e107:b0:b8f:9fe5:fd62 with SMTP id
 a640c23a62f3a-b976537e2edmr272498466b.42.1773477187531; Sat, 14 Mar 2026
 01:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314030612.1949420-1-daniel@thingy.jp> <20260314030612.1949420-3-daniel@thingy.jp>
 <32d021cc-0179-45de-b832-f122698211fb@app.fastmail.com>
In-Reply-To: <32d021cc-0179-45de-b832-f122698211fb@app.fastmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 14 Mar 2026 17:32:54 +0900
X-Gm-Features: AaiRm51Kr1QSkycBnZgGczxruI-DGv3kmXzfjqHYQTBTWCEMvQBsjIXI_N1leE0
Message-ID: <CAFr9PXmG6=NjscnsS=DHgyiyCsNSh8kaGyO1ujPHOsFySZhjMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio-mmio: Use raw io accessors to avoid arch issues
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Sat, 14 Mar 2026 at 16:42, Arnd Bergmann <arnd@kernel.org> wrote:
> I don't think this is safe to do in portable code

:(

> diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> index 516371d5587a..c39db8798ef2 100644
> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -96,15 +96,6 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>                 __raw_writel(swab32(value), addr);
>  }
>
> -#else
> -
> -#define readb __raw_readb
> -#define readw __raw_readw
> -#define readl __raw_readl
> -#define writeb __raw_writeb
> -#define writew __raw_writew
> -#define writel __raw_writel
> -
>  #endif /* IOMEMBASE */
>
>  #if defined(CONFIG_PCI)
>
> Can you try if this works?

This builds but doesn't boot on my devicetree'd dragonball branch. I
don't think it's possible to boot the stuff that is in mainline (and
you wouldn't know if it booted or not due to the lack of a serial
driver). I think I can fix my stuff so it works with the changes in
readl() etc but I think there are a few other people that have their
own 68000 trees for weird custom boards and I guess this might break
their stuff. Not saying we should force a change onto virtio-mmio
because of weird hobby projects. Not sure what to do.

Thanks,

Daniel
