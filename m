Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F63B7B88
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865159; cv=none; b=LgiVR5mEOD4yJAb3YNTqpBGo/rVMvGVIzi6oiKXKiYI01ftJ/HFeBRhDOUlR1Sn2OMD33P6D9PXr11eqX3ehKvBA9031471GRn5P8G6TXGi1P6f2Aye0DQj+rd6Xs0KpA/thl7Pf/2petjSEcAEumocM+EqO5jMOUsIxitOWrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865159; c=relaxed/simple;
	bh=t/p6pg5N37j4XsP0RERCYKy0U9g2vLdzNnk/NeNZ9JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ky1lDxmmF3ydBEMU5oxt3rRdIGox991I9/3gt1yhcH2Fwm1DTl9Z7yANp+T27tFxSXAUs0zipEmCZicxVPA6smFTB2Ca3oUBXalguJxGaLzyaAvIWZuocxNmio6hEjDwv26NJUuy0zsE+j3Mjo+13NUKaKxANEENUj4Nw7C1Ci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-951a0e3cdabso2362623241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 03:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865157; x=1775469957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGT2qUAkzwZifDbm3BEiD81eZzx3mHurHJ/fojUrWA=;
        b=KwY/Mkg6Zfwj9U0p9TYNAx1bdDzAy2x7TpXreoEi2yljkQ3Uq3s/3WukAW6/uNLRVR
         fOfKeg4T/3VTDxqQdiBIJSN+PnunxhmR0BnTVMRQSxsCE2FbHf1SSENCq3sBITgEyF3p
         I0n6YVraPX+cHa0DuDxNPAFWBfpUiGjXMI3CpuqOApFXp5o892QWRoowpufJH9l2ZP8Z
         eVAw2Mw+Fcz0O7UO6b4uXYoR1mmZWxIMEQdl4Y9Z9g0IFtwQ6Wi4Hen67MS9Jg6KlYJf
         XU9PxrTRuoV34f6kXRaSBYMFYZe/aTiLBZFGYkbGyTH3uRN+WxM/7vhOmjmM/vX1N7IL
         W7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV5MIrxey+Hp528DyEpSedw5Hp5SgYjBedtgzqbyNML2ZVB4PWw7atrvslYEol3zQZtrn0b9MQNpUd0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyURSwd/fGOZV8jHZpd60gGUlWrxNvBy6N/J3pHSd0BkQvYiVXA
	QTxYFtJV2Q7H/e+YeY6r0owpAwaiI4RS/OpjdHfpM8X+rIm/6aH20jC5xr7ayX2e
X-Gm-Gg: ATEYQzxTZT9hSZmdJE8VsZpdvbVY2CEjEo048olC73psnBH7vRpQsa2r49NQqYfAeoT
	CXVf+SCGpQFtQogQetM6B2Z30ZssLAxQv9Jl4/Rqmri4a4YNNRDZnSzYTx1NXmn2BEOBSEnlTb/
	rMnK3tqRC73yMwvl2f3hc2mYl4XfCeZRsA99Qi6z4JwHXP3Yb7/IgGaOGoFizOkqGI6U+emxm7G
	gGWzE6TWPSCnekVFYcivWBejMO7xqdJ6Kfc2gbbU0hmY3e9Q5V/OzzJfXGMiLeD78tNN9fYEUAS
	8gWDOAxDruTcewh5alZ8uAhTINzwTXGP9UzDYPEaACNH7uasJBzmQNkA4u3i8XLCKVrMTvLt/Re
	LrPe0hvgZ2Wj+oIvcCu6d4FNu7ZxRGx5dbPnBvF7dZFoOERu6nObZbB8ZvVS/TcnrQ9f7D6qAkR
	cEW701Vcs2cKJAysbnx3IImI7xrBT3HAxZLDQd3W8+UM8Q8Z1lelrvwEoS+BSMpoWBPPqbgcewT
	bc=
X-Received: by 2002:a05:6102:571b:b0:602:aac7:b8c3 with SMTP id ada2fe7eead31-604f92a31eemr4283647137.31.1774865156688;
        Mon, 30 Mar 2026 03:05:56 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512e693aesm7820547137.12.2026.03.30.03.05.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:05:56 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56ce1880202so2961696e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 03:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNLeB1cIwuJe2Cuafh5NWdllG7FLBAaKYKW2WYFHYAcRdbsDf0ltktm3Z0laIwPAqsJJSE9LtZxdx/@lists.linux-m68k.org
X-Received: by 2002:a05:6102:e06:b0:602:b037:4de8 with SMTP id
 ada2fe7eead31-604f8fd6073mr4592435137.4.1774865156162; Mon, 30 Mar 2026
 03:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223074311.322070-2-thorsten.blum@linux.dev>
In-Reply-To: <20260223074311.322070-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 12:05:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZYH8sqhgJVwJ_qEW_Ptfq=SNSZHxwc1u7m9KWd-8XtQ@mail.gmail.com>
X-Gm-Features: AQROBzCujVwM7KgzMewpJ1KhLPt4K731R4a9M5WRcStOeZGW_08TgIo6KX-upHA
Message-ID: <CAMuHMdWZYH8sqhgJVwJ_qEW_Ptfq=SNSZHxwc1u7m9KWd-8XtQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: q40: Remove commented out code
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Feb 2026 at 08:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> The pr_info() call has been commented out since 2016 and printq40() has
> been disabled ever since commit 1da177e4c3f4 ("Linux-2.6.12-rc2").
> Remove both.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
