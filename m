Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581B41442E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055985; cv=none; b=tEnIV5I6L1aTL4wwjhQx8AiUrADeE3IqAtxRp9pignBQGRmp0L2uYJwDW85cToFYF2hlOWnZWV83hBcE/RCEZeftKkAw1kF6KxmthxPWGGBndhrbR3x6WaPgxiNvziNNjsWtaHSMy3v33rEH4/1wjIotKIynwYDJNObO8wjkM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055985; c=relaxed/simple;
	bh=5lFr6N6uEmNx4LE4jroObbL0ac5PVnqi72D4Bu9Q8zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpJNg28KF4dR82vVEY8suoeM83xzYVOa+9lS9nlx1DEqVnEAkLz7FMYYVC7aeWCnXulk2x/1Mi09kPKSQ5idBDdn35H38ncMJ14rGPD+McsslsbkrcScIB2gLSt2jDvY3FM6WEEdUqVVM1s8T+OcrhuEBrvCvkx2h7Y37xhu7M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5d7daf06158so1785946e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 02:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055983; x=1792660783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2OmWvdxf6P4clpTOVRX+yvdQN7bAC/slAXj+OD7VnrM=;
        b=hSeyugQRKBgb08+bAOzZ/xpzfAw9CF2ne03MW4PWC4MvQShxY6U9EENccNkHb5pcGU
         I9yGqEe8YBuswl3Tjq8YCgp9xpz5nmCGA4+rXefEiJ9awNt3+1NENk6Qmh/smb91lgAm
         PYtpnKDIo0zZX6v10i21ESykCIYMPpE5wTBkxYi0mk1c2tzi1YcRjKDmqRKgq+gMAonQ
         2kDooHFMuDq1gqzrVaGK2NMLxG8p/GZCBXOKuE/rGms+sSf4v2HF9eoLfFItSsBZR7A0
         AMjZFOTTcKHbKUw2WLP5eS9P1DDuRu3JOA13/iIHsxC2Z5ZI0pU4ZEmyQ435Z8YG2VG4
         TYsA==
X-Forwarded-Encrypted: i=1; AKwUvBxZnwpPkkXrxnJs8pKsbYTHz4WMZ6aGUg/reDKka/Krn81IizxepHmI+OuIk6AczkvVdUeZMACwmB/o@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYK8hvVu/esmYyGLObMGrYGatMDnOqpkqOEYMXC0XK1wUxkEyJe/
	T4Bc5w0vlZBrGcshW5qP5wR+IlflkcS+CTsC3FMEB+tMlj+FWxdfZjISbUVZzMzkn0s=
X-Gm-Gg: AYBFou2XideqIzvqUHY0vBdQpu1Xkwum5/q8u9c7WfibsqoaFVN9c2dgMOk1YN5qzMS
	5lyy93nAwUQrriJHCzaTZLcHEGkLh1/FjwBYblyYZiTpo7lvgkm8TG4Z2D5hyYqXBJYjJnCVesh
	Y8rXYEKN8kyDWZSt9mpyHtHqlcu6NBLeiLp/jryX/DyC12/8SxY0uCIqvL/mMsXHSPid2t/Sz/R
	hCCXgyaZo20i+R7CdCUcAGWPz01qwSSn9kd4QfN0Fn/ioIL5dZ0IduNrZjdKbu9SnM7TeQr2leZ
	hgGfQxPebiGw9CjGUP0jUXY/G7QvQAKCSBsOs2OHp7co39BD9vsVcb+676j6VQmmxB2cdTt4bGd
	GakDDVRnFdGyNsg7Ee1sQbFe91MvmmHZpBtjNJLSR/anyl1pnA421MASutwX+nMsU3TJ1IsO01c
	wdFmeFpOBcRHQ9O8uTN+xg0luJoESLMS1gfthKfYV62ka+hnxUOD12f+l4oMXG1fdlVds6VLTSh
	kRhk03WUo8ldfN0K3AF+ApUaxLl6kXjq7ddgvufjG/8pqM39Zg=
X-Received: by 2002:a05:6102:8494:20b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7cc056a6517mr151406137.21.1792055982600;
        Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb353f7ffcsm13206797137.6.2026.10.15.02.19.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5da7a39e584so1834497e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Oct 2026 02:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1aArpOtRGpW0daJcBFeF0r03EAgqhSukMPuEyng3tLDsq8PiykN9+aRhAYszvhe/5u9Pqg5E75ZMX@lists.linux-m68k.org
X-Received: by 2002:a05:6122:54f:b0:5cf:54f3:6106 with SMTP id
 71dfb90a1353d-5e91f5016ebmr5648393e0c.15.1792055982192; Thu, 15 Oct 2026
 02:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013120831.1046590-1-gerg@linux-m68k.org> <20261013120831.1046590-5-gerg@linux-m68k.org>
 <20261014-expensive-shrewd-nautilus-abcab6@quoll> <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
In-Reply-To: <d256f39c-6ed5-409a-a7ed-224165d00521@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 11:19:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>
X-Gm-Features: AclHuK98K0mB4QAA_fejEAQ7EVeEI9XZmFZLvangzoC3l8jcNy_b9wBdp9Fm0to
Message-ID: <CAMuHMdUcGt7RBc0d1A-8O1Dt71RL=epPgmnetj_4NGCPvCj9LA@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: serial: create binding for mcf-uart
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, 14 Oct 2026 at 14:56, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 14/10/26 21:24, Krzysztof Kozlowski wrote:
> > On Tue, Oct 13, 2026 at 10:07:02PM +1000, Greg Ungerer wrote:
> >> Create documentation for a new binding to support the Freescale ColdFire
> >> UART hardware block. This is found on pretty much all variants of the
> >> M68K derived Freescale ColdFire family of System-on-Chip devices.
> >>
> >> It is not compatible with any other known UARTs.
> >
> > You never tested this, so limited review.
>
> It is tested. It is working and running on multiple ColdFire platforms.
>
> >> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml

> >> +properties:
> >> +  compatible:
> >> +    const: fsl,mcf-uart
> >
> > What is the SoC name? MCF? Compatibles must be specific (see writing
> > bindings doc).
>
> Yes. MCF = "Motorola ColdFire". It is the SoC prefix used for naming of all
> ColdFire parts (which is dozens of variants):
>
>    MCF5206
>    MCF5208
>    MCF5307
>    MCF54415
>    etc
>
> Even when Motorola became Freescale they stuck with MCF on all ColdFire parts.

I guess you want:

    items:
      - enum:
          - fsl,mcf5206
          - fsl,mcf5208
          - fsl,mcf5307
            [...]
      - const: fsl,mcf-uart

As no new (possibly incompatible) Coldfire parts will appear, a generic
fallback looks reasonable to me.

An "mcf" vs. "motorola" vendor prefix might still be a discussion point ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
