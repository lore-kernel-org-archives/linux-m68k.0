Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC08460
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887826; cv=none; b=QWWBbtezjpZK4xN33gBHDW4eiBppX4oCvnQ6+oDawL//1b4DcGwAIGLyFdH09Tx6CZY/V8lKpYpvuh46N8wfA8oglAUJX6sX+l/Wh+SdomCdPQMIoUpslGk+jXEmhZ5PxknyzyhEP6jBDwNT3eRD/9wtE088fnWACE2VAdefbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887826; c=relaxed/simple;
	bh=hv1GNsCnVa8DXglzqcuOUo6o8VWT3L3pNEV00Qf+PWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2zsfq/8e2B0krl5MPpOQ01JOeKoxkxqwQeFabLSRNzQC/5O5TgmpGyPCJbElySWVZz4tg7LHod02LV/DtwalLVluZlTd7RHDPu6je13UeZ+74/uzbt6MVKW+Nw4CEAiu+e+ng3fFOQ6qAZ46rMg3s+BNejqrDnqqA47wZYJku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so8469047e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887824; x=1780492624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gkd1L4zxlfImornmUbtbRVRrm+vdeTTXymd/+9j5P54=;
        b=ERi39PEVICDxA+BG4dPalIYlnTBi8hl+BdvKQ3g5APhDhXL71XaiylmaDKgzo03KaQ
         G6yxs47AdJaax/hafAK3PcsB0DaCFmYE626Y1kxNeswYiP319EOADsUaRKH4Zb+P214T
         IVxmeyQPxcajziQRE9k2Zw6DpUJkIzIpbzK3xkQPFkNDeZ+mmyOoNvnuyfPvZgsQoLz/
         0Nk0p68mq+7VILHvjCUaoYL9pchHu0yjw6r7Q7j9zPwZ/rLqkhtnlZTkl16bXwdg5Mvt
         YktuewR0+KrATZlGkfl+O+IjL5LsgGQ1xGPXMB6ClPN6UmR7jIGxGYvDFxrvvGTuGnB+
         fETg==
X-Forwarded-Encrypted: i=1; AFNElJ/6My5PdU3jbqrhuOCmMEWX1YS7mS56mUN308rezPie/PTVFCFWuaZ3rOraRWgFIT+yqJdZ7s3lVKIM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxjjM9z1mHrSewuvpxxqUd0ZUoi2EXgrn8yd8Me9RVdQo2DVttb
	8NI8sFaJvu5Lopvm2oFOUA5jkEmouuoNgdY+HsHyiVww0nF8p6UqET+QcNqBfiynZtU=
X-Gm-Gg: Acq92OE4TFoWUfYRuZb3m3ukxlWHdfOVG5LiaDz0P0gwk1M+lSse5nf/XYzyykcMOa2
	ZCUjKphSc5foLhnaTDaVqeHp7r5Wej8aJPfZZqmA4yYAcwkf3tYwjKhcoE/evdLOWg33rvDPK2x
	EUaMIldxk42JAfuUP/67V1Au0JMhgH+1uXtgMjFul7/Fy+ZKVm540wCH/fVafrJ8gpJhMmkKa0j
	LB8vKhvV/XG5WLlMS57GqocSaDICuVpqo+7w0B0oeZlE4Lm8YzIwFY14k83fIRp+sj28Z+8ynLg
	vr2DKgFuEYg7dCf/vKvoFI3Sht0o8hmizmeq0GfH3c10NklG1kUlPSBsoKh0f2/5CCpzF3SYUVE
	1XRlGyz3fpUOi094d1gQ1LgW/TtMDUfySSXncGba2wYAPZyCyNBSSAziCEM5KoSVX5eNiP4cofr
	qa0xcyxqpEwVHvTbL0i19hS4wzipYw3ikJSjpdhJTbydutPRWLYAiqw0d13kfCgEVxXwUZZP/vk
	HQ=
X-Received: by 2002:a05:6122:2093:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-5865ea8bf4fmr3657497e0c.3.1779887823747;
        Wed, 27 May 2026 06:17:03 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm16915423241.13.2026.05.27.06.17.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:17:03 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so8469031e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//cZDGzJ5zOEAQiBzcITYhkvkUjQAyDdPogH4/7DVx2BhRzegz/LcGZ1N6WmljAfAAdZbM92Tbnwrb@lists.linux-m68k.org
X-Received: by 2002:a05:6122:4b14:b0:575:3b1b:ef01 with SMTP id
 71dfb90a1353d-58662aba6edmr12654435e0c.9.1779887822714; Wed, 27 May 2026
 06:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <3d7690c7a8948f977d6c50bd0c8010efb715fbdc.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <3d7690c7a8948f977d6c50bd0c8010efb715fbdc.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXC0stRLvApkr6g8toxu25yWa7N1=t4sdOJqAkbVFQyXQ@mail.gmail.com>
X-Gm-Features: AVHnY4I_rTDkVOOEISI30dYmOvsLT-ZXG0Ldql2WE6NFUnqw2e3rb4bM9Hxqiw0
Message-ID: <CAMuHMdXC0stRLvApkr6g8toxu25yWa7N1=t4sdOJqAkbVFQyXQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] i2c: icy:pick Use named initializer for
 zorro_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Max Staudt <max@enpas.org>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Using named initializers is more explicit and thus easier to parse for a
> human.
>
> While touching this array, drop explicit zeros from the list terminator.
>
> This change doesn't introduce changes to the compiled zorro_device_id
> array.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
