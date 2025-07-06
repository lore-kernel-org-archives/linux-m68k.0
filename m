Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F71F463F
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793299; cv=none; b=vGSCdWd6UpgOvGeSyaix4bJW+so3GNnaLtCTjB0VYgqDhpp49RHo405tDVIDShGP+hSOi2h8jLbsNA48myPsnwcZ/8gMRcLDjOKWnE2qEiClTGVLazqzEJ5RANOarGIJpEjpafhsA9RVrm447u/93j3Uled04JlS7CVDwqueynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793299; c=relaxed/simple;
	bh=twZ1h0h+CQ9kTU/nw+VRZxQm4n4WHFaaH6OVkJMmsOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Et+Jux9Pu0XVI0IDp+tOzoCcPUZaJoyXE7KiHQ8tAxOxiG/pTXV9vAoRstzioA3IBbxJAMlM1qqjszEZdT//RW+XVkNContp9a6yIO8FEVhh8S8wCGwJGbgd3MRIauA3HeW90rED8P3L+MvVeWYzy08u1I/bxGokj4d+7eoCy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-531a1d5519aso732725e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751793296; x=1752398096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpuiKWSlRb5/DqpudyVJ+WdnWHVq+LpxT+xZy46xwLo=;
        b=Xqdb4LpH0sguFX5p0GSTtR+E1ZG/ahjF+98FULEITmG1GtXtgll7cm9m1pQRkpTM7b
         KQ0oEhwZ5QB0Y0t6jTcUZRyhl4hp/IWLNLn6ZyXpnGRw9ygYsgh0QknNdXjZRmrz6V8g
         9QZBuNZWXOsur0gpYXDYFOZXzT+ZBOmsD52hMsSCixcHGrdUzUShhIWEglBW5GS1xmTq
         Q0IwiJjgyoQNNRA3ywTzyGl2X2PkYppHG6fd0emC+ScOo+hvWkt/itnXSZtT0Mcr3o8u
         3k2cQobL+zNPk5IGo8WpeSdt9vRc6FIy2cE0+kKvxjcu4FUdXgJw+28cCnxKLSrFToqA
         v6oQ==
X-Gm-Message-State: AOJu0YwJyAZQihZAeAjmAOGg8GlRnNdjqleNEYOcvzwx5VXwfmsD7+jb
	QHmSewEMF+sE18ezfc/EoUHDK+sqojfQHOUKdpeHw6tG/XfOqoCW8p6cAC5mW6M0
X-Gm-Gg: ASbGncuPcksE57HWuxTNSpn2Vask0kzY7lb0QaFGDSG9M6CmhDrRH2kNmwt+VKL5iD3
	4CozMtUXAwo38EymLI48RBUy/YhsZO45O2DJDMHf5fhTEtiNautG+9gickreKRC2CauMdU0gzmp
	t8x4HpWEDuz7bnEWQY5oE3ARh9mZ/TzOLHBdQXiteFPSC2wYxl31O4+SbJwmxXXPDlezVeE9Lf9
	wsCNNd0J+KaOA8KMcP5aQ7dSKtxXRQyuwpeaBC0DvrO390ogb1Xns4g3wgN61QnVHW5FyuW8QEj
	e/e+mbu9ckgIn2kJSKf5oYEKy4YDrjiJ6SS40Iit17D9wDLhIGPJlWTt4HP3GqZ2SFwC6FYcuRJ
	jVBUAy1rY5NSXeE2HZ/rKMr2U
X-Google-Smtp-Source: AGHT+IEFKiK0rsdAG4CAmGd/2wdVfOlbO8xuFQQPvVwamjlH8x7Cq8KqoCEGKOvIkOKhKxLlqXhYrQ==
X-Received: by 2002:a05:6102:3c83:b0:4e9:b793:1977 with SMTP id ada2fe7eead31-4f2f198657bmr5026940137.0.1751793295623;
        Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e93f56eesm960495241.30.2025.07.06.02.14.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so549061241.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:14:55 -0700 (PDT)
X-Received: by 2002:a05:6102:2b99:b0:4ec:c53f:bd10 with SMTP id
 ada2fe7eead31-4f2f244587dmr4452386137.16.1751793295210; Sun, 06 Jul 2025
 02:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com>
In-Reply-To: <20250416114240.2929832-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:14:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
X-Gm-Features: Ac12FXyQW-WG3mw_EKqvXFLQCZ4RQUwBXhuOprCzm3XwKexOdAmS9FqFoXGWDNw
Message-ID: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 16 Apr 2025 at 13:42, Daniel Palmer <daniel@0x0f.com> wrote:
> Allow the experimental dead code elimination config to be enabled.
>
> For my 68000 nommu config this frees up a few hundred K of memory
> so seems worth while.
>
> Boot and build tested on nommu and mmu enabled configs.
>
> Before:
> Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
>
> After
> Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

Note that enabling this requires enabling CONFIG_EXPERT first, which is
currently enabled in the Coldfire defconfigs, but not in the Classic
defconfigs.  For atari_defconfig, I see a size reduction of ca. 150 KiB
(gcc 13.3.0).

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
