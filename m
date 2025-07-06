Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C91FFC41
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797669; cv=none; b=Ani8KjpnM3AAU370acuc7h/WlJmAApuUekWQbL84T6F7wwzLf/KmoVHudicHtnNI9a6h36xgUkCWxPcf7YDFnYT09ZbnPnDKSNiGZKmHGj+T9F2k/YSlgb7w+RiDPHKSNm8KcKUQmPRv+ygeO0uesnVEmfVTCoCF+RpZnQESiRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797669; c=relaxed/simple;
	bh=/nxwdBn+lpkCytmZ6vCTSwJv3wDIKoB3tTZpbQXDc3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgW4vTP/QFrXEPL3oMLEmvEqQojds7Ml3rJ7JzokTAhWN5v3b/3E4U7qGHiPxqgWGl5cIw1hsYaRHXKmqYmL/mzJBoV20wjb4e2Ft/oYiVRvkAh91mUT8WovMabG/l2ntlzfW+YvT89r6AfOb/OESd1kKB4PFXjGz+Sd/nCUoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-532f9127978so696402e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797665; x=1752402465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgMNZt3qtoPt1r5FPOIURusfth1qbATvze1MiLyoY4w=;
        b=giHd9oRE6wtOfF9u92dvEtudJpWLYvSff8t9l1QaaImj0f+H+h1Jcz89ZhgLaimzqI
         DnVt45D0/p98PXAdtfgGtfUPOJeTtBD+2tllpqYK48KdZMcAuf2CzV6y6cRJ/owU9KVS
         qeGZ6kiQY/oQ2tZtTexJyeTbg/KO5gR+N/AGtDqQ+RNVZZpChT0O4DW9g8HSyv5uK7uV
         MTI6qiRlOi6GIhS8j7L470XzzogQtiVJlHPSSjJF75ntrb9xvtT+XQg2DAsGoa48LI0W
         gGyCZRhxO0i09Ik1WLpC8vQyM+rcZ4x+Ih/PByZs5GztKtiBRzkt7//LujNv9uOIG4CZ
         PJZg==
X-Gm-Message-State: AOJu0YzZ5jU69VV1htTA9HWyecxVn7dMdHNeqPA0KCPDim1e6tut1QPS
	oqrz0D6zRGDewsyHOAtPFaZlVGuhtNPo1BbW2drEjRIkBUHYVMtmHEVXutp1ObHT
X-Gm-Gg: ASbGncsltjLD59hn7HA+nFClsFVIOjbIQD7Rgxii+tznGkvsLUK8VC2U3HW5awtlT5y
	mQwbMFqrPED4C2zrfHxLN21PE+ioPYY8KZ9J3hYjPlo+0m5YoTw51O/7JFD/HqFr/H0JRa/TWxe
	wTg/070iV8zgNr8lB6kdNs6I4ilCv/uKVZIN0pdGfqOoSgtMh0h+X9t8KFWOXnxXsKbfUzKSsyw
	rH50Cjzhcp+lxXpnMA39DCjxbQ7J/2EAkQ/dkro5NEWpFeGRHJP4tbGGckPL9+C1/8Hv9o32mPR
	za4B6ux+H/s3zs12osRvzFxNGFXMXCbb/mAth8MbV6XpUQ+y89WeDDoFNRYL+FgxWokEAoDmFb8
	gWhWjaZ+nNSgXbOmlMW+Xahz0/Wmh
X-Google-Smtp-Source: AGHT+IF2inm1Cb91agnMr8WLElZhGUiWBNWgx2EDlAkXM2DoHVFNj2P0INNEr32Kge1n4xH7UZV2tQ==
X-Received: by 2002:a05:6122:d0e:b0:534:7f57:8e25 with SMTP id 71dfb90a1353d-534f00ba369mr2054693e0c.1.1751797664798;
        Sun, 06 Jul 2025 03:27:44 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53478dbb08bsm880851e0c.5.2025.07.06.03.27.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:44 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-532f9127978so696394e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5811:b0:4bb:eb4a:f9ec with SMTP id
 ada2fe7eead31-4f305b1dcfcmr2155700137.16.1751797664311; Sun, 06 Jul 2025
 03:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743115195.git.fthain@linux-m68k.org> <9d4e8c68a456d5f2bc254ac6f87a472d066ebd5e.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <9d4e8c68a456d5f2bc254ac6f87a472d066ebd5e.1743115195.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3Z-BH+c1B7wB7PBn+WEih35H77OZi=FarBiB9GkdGOQ@mail.gmail.com>
X-Gm-Features: Ac12FXxAKqZp-9JhrCCCQzH4l18NXnSOaU1JG7d5QJWuwU-BDJuAUpkO0gmTKNI
Message-ID: <CAMuHMdV3Z-BH+c1B7wB7PBn+WEih35H77OZi=FarBiB9GkdGOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] m68k: Fix lost column on framebuffer debug console
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 23:44, Finn Thain <fthain@linux-m68k.org> wrote:
> Move the cursor position rightward after rendering the character,
> not before. This avoids complications that arise when the recursive
> console_putc call has to wrap the line and/or scroll the display.
> This also fixes the linewrap bug that crops off the rightmost column.
>
> When the cursor is at the bottom of the display, a linefeed will not
> move the cursor position further downward. Instead, the display scrolls
> upward. Avoid the repeated add/subtract sequence by way of a single
> subtraction at the initialization of console_struct_num_rows.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v2:
>  - addil and subil are now addql and subql resp.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
