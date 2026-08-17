Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D53563FA
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953658; cv=none; b=n+UnMQON+OUgbQTXN9o8Jtiup7gxancQpi5MSpYcAhSB0DtFsPsnBIqkpGs5InM86rd/7JTh8YaziEJejAWLZxXCCjU1vRXxfz8OcZcb8gXzBXjq8TX/ES44FugDsAaLLZey5DYRgYO1PDsOLcSMtsDhqVvy4JOLi8Ytg6G1uKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953658; c=relaxed/simple;
	bh=o4GCnT9Q7KKtMGlSItfIkAisf6gdkc9OYv2RNknuqSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRi5SSSvlCn3pnyfbiNVkZoKlCvhO4iAedrBRhkwOpoqBVBO4gmYixFvF8OaH549fuV4ClXsDCZ1P9bHfQUqD3npFU8V6Lf9OkkZoVuY7Xc94BYuTQyrubKyuOOoXmuLakiuDpJkkbA24H+eYktqD2Wolm9L/0NBLvSmwmyagEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-75e2905c09aso552182137.2
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953656; x=1787558456;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/+yV80fX1YIAnHqERFUO5SmbBJag9Ryono5118GOFQ=;
        b=kcAMLlm4nb1JUZNFfdXd4CSiuh/h4Rq/orpvkmRjrlQy74+CY+UZMaFljAFoZHdlON
         x1M23RnJ+h590pVDwzsiK5LxaVzuz9yX1O+nMamLA9NSYbDzQxpIvcPFNlu26cWnaV1q
         hjuHVBO/ctfshBTIsPuN0P4v8OulttI5oSrN+y/t8pBG+kOBg9v2REpdOjauLhywAO4W
         tLlVjcUfkV8O3yOMYw6C9ZfRup53axcgHJg0keqOCqULH/aAIoap9JK7E9x0b3fPd1OG
         lsi8ZE2wdZOOXYAG1PObhuVPCKle72RCt0wRltEMhZI54B3Fz3gGSUTP1kfVeVFWPn/R
         EmUQ==
X-Gm-Message-State: AOJu0Yz+RLeLEXHYQ9i+W9EsZLhhg8D2Tv4S5vOB0vzB4PcUnkCq33Ga
	+tmn3rB5YC/ek8Xl16pUFlXrDtq1t7tnFIpCvZ4UM4URGm0LXZd1If+uMiMwfp7K
X-Gm-Gg: AR+sD118xB/kT78rgti8vqak5Pnx5cac+uwnzpP38vGtY+MP4tiI+guxhYTMWFp1hnP
	z+4ihh1g+bVpaLtKtP+h8sRSPdxVy00HaHUXr1KIQxJKy5heRnLwZXZ1DcIbj7szpLPpxe3oa5h
	7lcvy9Hq7WffhGDlRS+2hArpKGu2bCIhs0nLgKtG3hYyzQZSWYUi7hVAxfrcDXi77DCzByoscfm
	Eb1YPoBqU7zg3loZ/EkFoLhvWmpJ40HxY/4QpdVzWc3ePN1HjP/L1ulfZwYRolRv4WWM0c7CuvL
	ezNMisvveGOsZBdxIgYI1VdccU2Bjx2GJ9FQm2HCJKb8Vu5xD/xWZ7F+m64k29P+dRxFzOA97Bc
	OuB9U4bBwgRHh13FN1i5ULLVqRr5CQ0U9QuSe3UJ8Q/RaGt3LT0qq9b/ZafGuo6MrAFB3E1w/AA
	oT+Zp9h8Wr/fEyq5R/qIYXREapTsyYRwr+zIf8uR40UWQwpvb1gDspIvl6rTvthoypPuef35oy9
	CCcqNPO6dRgYvtLZ1teHRodDCuECQ==
X-Received: by 2002:a05:6102:38c6:b0:74a:992e:84f6 with SMTP id ada2fe7eead31-76f2c643710mr3777001137.10.1786953655944;
        Mon, 17 Aug 2026 01:00:55 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c2cf06e7sm391599137.1.2026.08.17.01.00.55
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:00:55 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c38565e774so904745e0c.2
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:00:55 -0700 (PDT)
X-Received: by 2002:a05:6122:f05:b0:5c2:c0de:f06a with SMTP id
 71dfb90a1353d-5c591f9f1b0mr3909422e0c.14.1786953655176; Mon, 17 Aug 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-2-schmitzmic@gmail.com>
In-Reply-To: <20260816073752.16656-2-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyOSOahXjXbJksXgrNY8WOjwf-cqx_HrtcLy9s_Yfz2w@mail.gmail.com>
X-Gm-Features: AcwNN1VGXZC1fvEFifX8RzfaBRusZdOtGYs2dpCK1ZiPNulbOW5iHL_5W02SOOQ
Message-ID: <CAMuHMdXyOSOahXjXbJksXgrNY8WOjwf-cqx_HrtcLy9s_Yfz2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> Kernels are built with -funsigned-char since version 6.2, resulting
> in signed mouse position deltas getting misinterpreted as unsigned.
>
> Cast deltas passed in (unsigned) scancode buffer to correctly
> interpret sign.
>
> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Cc: linux-input <linux-input@vger.kernel.org>
>
> ---
> Changes in  v2:
>
> - change atamouse_interrupt function signature to signed char *,
>   drop signed casts (Geert)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
