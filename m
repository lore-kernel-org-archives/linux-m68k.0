Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D03BB55
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163159; cv=none; b=uNy22xt/b10tueqJY3pc8pMU1SSXnRCnbBkNbctCWYmDsqakQI6CBRASMSROGae63qd9tXG9/wpWUso3QfpRhgfowVi7EcoaDeqdzE1+Jd6H4RCQ4Xp4FGrtgLG8+oToQ89kXMD0MUhkUEJNU5gQ977KRjKwkpipbKUbM9EttoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163159; c=relaxed/simple;
	bh=TrQVnMFqRdKxy+Ab7zL92BC7pRmGTjw3QeWTZWzAMBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkiE/gRVQMRhpGP0zqjkg1vL/vH+vxzgqo8zV9+tIJOmC3MnVD/GtY+Dcdvslr6fslAlcsSbT08d6IKFZaLQPI6w65lwLJ3pz1fnF8KTq0qm4aVPofA3fewGvlAhesA60cBb31BPc5I+R33MNnDY0JzF44Ke2P+gXXdSeYwyAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609ed7ca444so29959157b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 06:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163156; x=1710767956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7ylCimAbNAWM7sZ5YD/p6CSqTzWJSR4W2A/mtEmsJ0=;
        b=aXTApQigDhERmw+FFmPEme3QaUWfoUpsIHQZFBlyf1F6RTPeDeeTG0J+GO4NKtCNmB
         o2Sbs1wFjr1N4st7iUlfWR4plvgnQMmTDIL0opmI6ffGaPLceV+gY2fLCMJBZou2GSx9
         5prRh+McnF3kQstjJGbP2cJv9Lg7dQrwQmQsGaWLEVjj20KC1fuddnClbWzL+vGfUmjv
         yeSPM3/i06QC3yXfxw6dPU1Uz/sEpMamsx7f3SboDDwjk8t40W3UE9IiJokn4DujW+jH
         VkIGHvaRbuVDEEiOn9JxGZQtrtTy6Ik45Yv6H7ByDg9UZF78cQeVHqu8n4hU+gRLejx1
         7svg==
X-Gm-Message-State: AOJu0Yw4KIWw2vRj1VS2ichS8ss3BE3D4HC8HkfBS8rEQEtn6EN3LwVp
	0nryUElIsGpDFrVU0ES/4kQgl7eYTBQdnHTbmuUVWXSF+tCvQmfCqWK+p59OP6k=
X-Google-Smtp-Source: AGHT+IEvSl11otk1I7UOF+S+3nUbgx4mPPIXO7lWneKz+j41gyzSy8qukYs9F7VxNjLliiAm0OnvZA==
X-Received: by 2002:a81:9253:0:b0:609:a55b:805c with SMTP id j80-20020a819253000000b00609a55b805cmr4225895ywg.46.1710163155830;
        Mon, 11 Mar 2024 06:19:15 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c18-20020a814e12000000b0060a1b30a45esm1148465ywb.131.2024.03.11.06.19.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 06:19:15 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609eb2cbeccso22927407b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Mar 2024 06:19:15 -0700 (PDT)
X-Received: by 2002:a25:ae56:0:b0:dc2:3113:8700 with SMTP id
 g22-20020a25ae56000000b00dc231138700mr3507486ybe.24.1710163155413; Mon, 11
 Mar 2024 06:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304085455.125063-1-dawei.li@shingroup.cn>
In-Reply-To: <20240304085455.125063-1-dawei.li@shingroup.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 14:19:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUW1gXjzHiczHKe=O7fv+qPn29g5UYN41v_-3W1qSax_g@mail.gmail.com>
Message-ID: <CAMuHMdUW1gXjzHiczHKe=O7fv+qPn29g5UYN41v_-3W1qSax_g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Calculate THREAD_SIZE from THREAD_SIZE_ORDER
To: Dawei Li <dawei.li@shingroup.cn>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 9:55=E2=80=AFAM Dawei Li <dawei.li@shingroup.cn> wro=
te:
> Current THREAD_SIZE_OERDER implementatin is not generic for common case.
>
> Improve it by:
> - Define THREAD_SIZE_ORDER by specific platform configs.
> - Calculate THREAD_SIZE by THREAD_SIZE_ORDER.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> ---
>
> V1 -> V2:
> - Remove ilog2().
> - Calculate THREAD_SIZE by THREAD_SIZE_ORDER.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.10.

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
