Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9BF34EF15
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649726; cv=none; b=TACgrwjeS4eGt+8fVKOb1FfJDxVxFa9lneKS+0HtGQ5JcC15B/FmYBqVSb04Q7y1bNIi0eQ5Z+nRiRWPLcy8tZI23DotbESbkgav3TsHrRAN9t5aynoyhZSJZekco2CmqaPBrQ+TFgbjk0aZ6KC2sMBCH9cY0B+ZB7UysSYI7Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649726; c=relaxed/simple;
	bh=sB+68G5TyhUbTBHuY/fxXBg0hu+t1K7GrorNplIzAls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0TjkSN9fsO4IHURe9mQ16TB4Qd8SoxaGaoGuB2CacJCUNFPOLRO0UvU+aD4YJ7Ma8oQN7Gw0igzxPB2Xg4tNPcT+AkOlxM7lepyiFKhRlpE8l7qDV+7vJN1LMLm8JQmHNlh1q84XVfWZMXSgTMijQWRDrejfK1fZ/ZNRwHVNoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56af30dde0cso1600157e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 01:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649724; x=1774254524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kiZijVIYa3Iu7kf4oG3dA3csq9o11yni0AFWpiW4q8=;
        b=o8zBkz1DGZUNhRLsmgfctHilJgVtalHFSAOF4gL9oAAkL5mPTjarwGcsnZH6q6hloY
         FpKu0L1tPfQSWSa1TA6ogSyjXEbowWdg1DR7WVSS5emSrGo3GEIUSvqMuE3KlvPFpzFr
         C+6asRtb1rCvRXS6YIIyB6lqoBSzd9Y4ps6W6bUFown1YcVviXuPxReo0j0KBv5GjGgG
         FwZLTzcD0opdPvd7SGJeshV3nuqKPeb7J74T5i5ZMnxqMyfxIPTH2YuHULw6uvQMdF6V
         D71gdYA7dCEABaRqjJXma4OIXodUTWAByPhcgPnDz8lxRfOWelhCo5tRVWIoxz9T5tHH
         JrEQ==
X-Gm-Message-State: AOJu0YyGar4w/3lt8ozEu5qFXLSfyQhQDo4251VUwKxGHINOupj1+mP3
	S1/2imiGzdo76YzD0xWB7xVzjk2NIt75KgVPsUmkkowD8Eu+HKIG8AupImSh7gyB
X-Gm-Gg: ATEYQzzJi7vDtvkS22fCwzXgbGPwc5ErG37kItbZYQVz7MQbE8i2bSiD10BC/SQjNRT
	Fm2Ojc/zckCpTDEbw38GaNgz7FiiQweVQ7a13Idh29Jy2YEdVGOM3YajkyBBKQrBFkFV1S8D12D
	Zy6GufipW+j3N3n1Dms5+CryI9L1VKKmNUCfKNR+F4omfeNOctlcNEgGyXfUh7YtDY2v56DT3f6
	DyEb8Ky48EttKj0SI/xCvnCjrOzw7YQbkC9f5CrsZIHAcrR/M95BwG006C8UsIspw1n9K+jEOJv
	PS71G6Csda1xTGeqCZ4jARFwN34UNjUkDmCRk9Td4vvlxClGhcHV5b4pL3u8lCLa1PcaCUKefQx
	lDvTjW0KgEyY+KzB/tXdAyQ2LxGs4aGgxsDJhhs2okP4V5qYe+zJSJWnKoQq4Olna5+FnF/3uE5
	80VxrCoboe38vYhMe1UrsOJcMRWMLPg0e+Rk3NSX2cjc2vEkkBYRNUbPUq2HFp
X-Received: by 2002:a05:6122:2981:b0:56b:9083:4331 with SMTP id 71dfb90a1353d-56b908344ddmr212405e0c.12.1773649723689;
        Mon, 16 Mar 2026 01:28:43 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d132sm7408103e0c.11.2026.03.16.01.28.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:28:43 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94de664b541so1083430241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Mar 2026 01:28:43 -0700 (PDT)
X-Received: by 2002:a05:6102:26c3:b0:5ff:2426:94ed with SMTP id
 ada2fe7eead31-6020e576170mr4436500137.28.1773649723101; Mon, 16 Mar 2026
 01:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-uapi-ucontext-m68k-v1-1-1b8b0e082b79@weissschuh.net>
In-Reply-To: <20260314-uapi-ucontext-m68k-v1-1-1b8b0e082b79@weissschuh.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:28:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM1TPWCQUa=+MwyCa3F7gS_CokJ8tPGtGbe7F+eM79mA@mail.gmail.com>
X-Gm-Features: AaiRm52Zp9DjxcditE36VkPx_xsAM54TFJKLwPTQmU72_Xc-0UJ0jsM7VeiDJPA
Message-ID: <CAMuHMdVM1TPWCQUa=+MwyCa3F7gS_CokJ8tPGtGbe7F+eM79mA@mail.gmail.com>
Subject: Re: [PATCH] m68k: uapi: Add ucontext.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC andreas

On Sat, 14 Mar 2026 at 13:16, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
> ucontext.h should be an UAPI header as it is used for the kernel's
> signal handling interface.
>
> Move the header to the uapi/ directory.
>
> While at it, also add some necessary includes to the new header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  arch/m68k/include/{ =3D> uapi}/asm/ucontext.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/include/asm/ucontext.h b/arch/m68k/include/uapi/as=
m/ucontext.h
> similarity index 82%
> rename from arch/m68k/include/asm/ucontext.h
> rename to arch/m68k/include/uapi/asm/ucontext.h
> index 1523a8e5ff22..ffac691604b4 100644
> --- a/arch/m68k/include/asm/ucontext.h
> +++ b/arch/m68k/include/uapi/asm/ucontext.h
> @@ -1,7 +1,10 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  #ifndef _M68K_UCONTEXT_H
>  #define _M68K_UCONTEXT_H
>
> +#include <asm/sigcontext.h>
> +#include <asm/signal.h>
> +
>  typedef int greg_t;
>  #define NGREG 18
>  typedef greg_t gregset_t[NGREG];
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260314-uapi-ucontext-m68k-2d76bf79e949
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
