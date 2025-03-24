Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C118B470
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803453; cv=none; b=YOC3oYGit+B1TlkhcJWt754SoYxsc7iqfqBEj7cKovbvmVBbSb6nxmLWk6Kw7iOGH55h+7oizXO0dGMGM4Eq30vKPlquACSvXXn6DoOu3cEWv4QaDQECbqtC3K+Qn/MOFUS6LzM+ljKCrX4IOd4wcGhUi7+hPpWXBpbGSlBlexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803453; c=relaxed/simple;
	bh=waIDTzfJeGprf0IJDgI4ophvCidcyEBtX1rhBS0R948=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ma3QH216lXT7Q71Ld8bxvCPS7Zy0wib+Qsp6UhiAetneEgoV1v6TDT0NBt6OWbrxhzXlzZhlhnqBJn99admvdkhP4SjYr16DzIW21dC24oskfRuOE3CoCUc3jyCxcMJgUgYO/XqdLugMl/FBJu3P/1B8ic6f6kLuUS3Uwmibha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so4174620241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 01:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742803450; x=1743408250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW8fSp8pDr8IytbOKxU9Ce5slmJtka15/u9Kms9+eGM=;
        b=ZMKvtDBS1gtvhCj4HeLw75A9b8crFqBUtwHMcS5S5SNd3Bpv7FdwjJjHfqjt0667Qm
         YIObw13NY9rIT47+RE22UXRnH/j4WuV6QTBCXbow6eVATNv+jjV5NgvVKOpThtMEEWYD
         +lgA8tRdav26cpbuD5pT+wmTisINJdRuTprZ1b8b2wbf0ZHBOF9XgtmWgvBGdeSmLTtS
         uoRLcVj/FOERQrJmVQvgWSuQdzExQCngl9WvZclXPi6T+rlIJ4n7ycVqRwg3FHo+fSOc
         Gk7QWsA/o1VETk1QlpVCZw9dCrdfw8qw1DwzIWRX+o9mtBKIIJDb0gOqwP/l9EbkCoSP
         YknA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ioLia9tMlKore8sKSYMHSFcKO2B//o4hi0UIjmdwbEWHrmLl1vrV22C3q8vRBy1qWrKpKNr0C/Rq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwgH9uy6Q17pVxHGEfju+5Jtna3DSuNMIw4RRJqQT0873IjQfh+
	0e09lNPLeIDQ1iR4aTaUKHKMjPw1RcJlq3l3GE59rdHuNOus04PptOBAY6Po
X-Gm-Gg: ASbGncs2Dxm4himJPQhOg/6KBdyuJ8G5Vg3JOgE4VRYytaDWv42TU91OMrZ30jr+FqM
	gvhB5bheBDrwbZgc5RPh15a7DwGoYOdYdnI7GIc3IN9EpUDm/pCTnlP4S2aAAfjH2tdjD2OaDnI
	EGZPsQ6OxpEus5rcMey1VrZyUXMkPc4BqJVURI+CsAf8h34iP1zrWgCMEcg9VG7mZe/ILAYtkvS
	Xa84QP0q1cjwYe/RxxZUnR7g0dJrjr1on0XceWB3XgUP2774UoIrAsqs7rdGOOfLUhgim5bo9gK
	D/2E1SuRvcSAyeIYpqld100nWe4x/neiS5n4AAdEvGmCkngDHI9b7rBxovgzjDMQKRyDCHji3zs
	yO2HZXWY=
X-Google-Smtp-Source: AGHT+IHsrMwn92ibt0KzcIkjVcmjWbrLMkuRdaFdgt1KGbXDWweZwdu1kxtL/9vJkh2wENef9RrXlQ==
X-Received: by 2002:a05:6102:f11:b0:4bb:c24b:b61a with SMTP id ada2fe7eead31-4c50d5e0ff4mr7917620137.19.1742803449750;
        Mon, 24 Mar 2025 01:04:09 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3c4833sm1496297241.15.2025.03.24.01.04.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:04:09 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d5e42c924so4174601241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 01:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwdW/V4VEozHnOZFShspyZVHab9elGwVe0qYwmo2mPJpeMbYN/gI5tI9c7IBTnAHdmUe2aGVUrbFEf@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3f0d:b0:4c3:6979:2ef with SMTP id
 ada2fe7eead31-4c50d620e46mr5828890137.21.1742803449228; Mon, 24 Mar 2025
 01:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321151416.338756-1-p.pisati@gmail.com> <20250321151416.338756-2-p.pisati@gmail.com>
In-Reply-To: <20250321151416.338756-2-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 09:03:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzNdJesbKeWBrJ88rHBWP36k23EQo80TjYbe4V6vprhQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqPior9Jo9Nzr-fOs-iHqTJa_bcQoKsPvZY5OyLpkGT1K3mjUiFtrnvQgA
Message-ID: <CAMuHMdWzNdJesbKeWBrJ88rHBWP36k23EQo80TjYbe4V6vprhQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] include/uapi/linux/zorro_ids.h: add more cslab warp id
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Fri, 21 Mar 2025 at 16:14, Paolo Pisati <p.pisati@gmail.com> wrote:
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for your patch!

> --- a/include/uapi/linux/zorro_ids.h
> +++ b/include/uapi/linux/zorro_ids.h
> @@ -450,7 +450,10 @@
>  #define  ZORRO_PROD_VMC_HYPERCOM_4                             ZORRO_ID(VMC, 0x02, 0)
>
>  #define ZORRO_MANUF_CSLAB                                      0x1400
> -#define  ZORRO_PROD_CSLAB_WARP_1260                            ZORRO_ID(CSLAB, 0x65, 0)

This removes a definition; was it incorrect? Please explain in the
patch description, especially as this is a uapi header file.

> +#define ZORRO_PROD_CSLAB_WARP_DDR3                             ZORRO_ID(CSLAB, 0x3c, 0)
> +#define ZORRO_PROD_CSLAB_WARP_VRAM                             ZORRO_ID(CSLAB, 0x64, 0)
> +#define ZORRO_PROD_CSLAB_WARP_CTRL                             ZORRO_ID(CSLAB, 0x65, 0)
> +#define ZORRO_PROD_CSLAB_WARP_XROM                             ZORRO_ID(CSLAB, 0x66, 1)

What do these represent? Please explain in the patch description.

>
>  #define ZORRO_MANUF_INFORMATION                                        0x157C
>  #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I                  ZORRO_ID(INFORMATION, 0x64, 0)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
