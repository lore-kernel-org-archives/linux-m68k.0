Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA33033C0
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880480; cv=none; b=mpMBWVJlqx3FbuwZ9HreuPFHI6OIFECEwQ+UhVOZUNzHJcg/fbGE0JQxmQvo0P/YW479ys80VEa10PvNojhoKUQL+k5Cam1EKV4H8KAoilV7LZa6cx+vCOA5bAnxa6bbI2jchah7Q1efDIwYR2fu6cKLyoMkOZ6PAG/w16H1mUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880480; c=relaxed/simple;
	bh=I8nSwelY096TgXzlNsEKd2VhMa2fBN+hHLBja/Px3q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orOI56H/Qye+YCozvOT66blGWhPzdR9JXiK8JqFVXfZR++YCgN2EFgxOcOqIlA/1oP8jhuegE5lzIyGYGp5Q0EQd5078FHWoYSwkeYTirS490aD15cjbjHPPt+Z2QboJ6OgQbYVfF63knlLF87mKcug9p4SZFsuFBzrSMdKj3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5673804da95so1246060e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 00:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880478; x=1778485278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YHiOEXi+KwmonXdJIlmmmZ9Y2XThFqvNCCLSv1OhNI=;
        b=ejw1mD150fUKLAajApkXZfV3uPidfctlfwQTYjtA1f5dAbHGaKV3g4VrjLDb17G2ZK
         fgIiDgJZpg0vZoNR+DxX3rx0s+0CJI5L7THWLqnF+dn2/wveEqD/vwkHSo8VRilsUurZ
         Hx5SI9IY82Wb372nnIfY073GVm2V7Fxk7o/jE6W0RUReo/YW2Pv2uO92GjzrCjKiRMmG
         rTG3h8wEYTV6e46MhRkrhqNj8BHjCyWxPRZc+yB+or21JP+vhHYaX4SzsJ8JTN0/+0Mg
         xe5IKHVKx+8e8i3FdgF+psau+QDsGGRb8BiL48znK+X7f5UhbJdTKnrGsywLc/PlDeKT
         a4eg==
X-Forwarded-Encrypted: i=1; AFNElJ+ElhdnXTQm5GYhKaai5h3RWpKZtslMBYTqy8N+DoDPScwj2vDxzQwxDYMxlNfRyz5R2ItfjhvpQ3rl@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyqLwp03ItVLSY20sk/Z2L36G71jLRxdLQErXXsUxa4irqaPkNA
	M81tc37+7RZu7mrOGcOqeX36u2UOhJsuxryykYHxHp2Go3ujTmbLUecHv4oIEs2t
X-Gm-Gg: AeBDievIQe93CcuoHWbt/N3cfNlmDTOtHVGue+lF4XLyjS3ojVH/jkeHiZ9NdxmjoEz
	N9TcQfT28y8o90VeAZlw4UIzb2+V1Y/sBHwQJtvH/sayba26kXqzbHd6JL6TcqYdNRHSu25zS5w
	PVIJM1fSZyqL3JYGoCTsqjqjCQNzl7ehEHFQqAmoh+KI3i/ldOtSUs/Lb8DPdXiFHQMA7WQrfPj
	P6Psbk3XK+c6umORg3UHc5d0YlLTorDNns13nv+4xCIwKhioX4FJZplPisRqS59RjAy4d8cx40z
	gN2bNnGvuSMN7/YgIyuYWtw8Q7vGVwPhSZJKYna0g23Z55ASsVlQWTiO6YMq/k4E01AVd5KSaAq
	ClojGTnF7zkk42mfGl3EhhYnhVd4u1JT3+ibjfP6+1gmugyS66dtvB6m0xGxXkcxd23YU3ZUVLP
	SdHdHV7jzoqLd4e5DeDagHIS7tujd6tYemU5NXxDPrJLJG5XSA+q76w5qeFOsK59wbTyBBqd8bQ
	4Q=
X-Received: by 2002:a05:6102:4a8a:b0:607:b901:5d71 with SMTP id ada2fe7eead31-62d874496ecmr2643894137.24.1777880477978;
        Mon, 04 May 2026 00:41:17 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0894dc8sm4874748241.2.2026.05.04.00.41.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:41:17 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513733658so269552e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 00:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cZ6wgG3JugbYQ0tzgmp7wR4dkLXqX0M/IbzsgkDtapVWWBgLm/x9eAiNup6HykdBcYzwwox+K957z@lists.linux-m68k.org
X-Received: by 2002:a05:6122:a5c7:20b0:575:3433:bb34 with SMTP id
 71dfb90a1353d-5753433bdafmr291581e0c.7.1777880477350; Mon, 04 May 2026
 00:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424104011.2616970-1-johan@kernel.org>
In-Reply-To: <20260424104011.2616970-1-johan@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 09:41:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbe-8MiTSe1t3tRmgAcOPC94yDM1xyogtKogswba=JCQ@mail.gmail.com>
X-Gm-Features: AVHnY4IQ9cO1LnOsqdYvMTxRYY8Rz74a0P7uco-JVFQQMiwBl1yntxULnjYYcKo
Message-ID: <CAMuHMdWbe-8MiTSe1t3tRmgAcOPC94yDM1xyogtKogswba=JCQ@mail.gmail.com>
Subject: Re: [PATCH] nubus: switch to dynamic root device
To: Johan Hovold <johan@kernel.org>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Apr 2026 at 12:40, Johan Hovold <johan@kernel.org> wrote:
> Driver core expects devices to be dynamically allocated and will, for
> example, complain loudly if a device that lacks a release function is
> ever freed.
>
> Use root_device_register() to allocate and register the root device
> instead of open coding using a static device.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
