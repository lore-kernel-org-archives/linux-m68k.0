Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821B295DAA
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927191; cv=none; b=MyNKzpWfFyNl6/PPTrLHqnBTs/xVSjOYuwBK94bNJFjigKvsaNqtv4Z+96XlHcWsf54MEDpFvzs8/30Y8XM8eyY8OkKo5w1w1C9swpd65RSqttgbLUPD4VgG1mSLgKnGLv+Th9GNXLA3wYTghDRPkBvS1D5JhTmSXCBH/Ry+OBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927191; c=relaxed/simple;
	bh=WUU7H5N5bg4FTysBPqopoztkT9yebyoBSgc2tc9QetA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHQVffrfomHsTwP662rlmlaPonXwMV0pLdm6Nubaet27/6ZSkgiSO8upF/3D2KXkxedjd9X6urBv8eRCHDAYK62CdyvlzzrbAchHsikXDFwgfM+66uhslHh/lp+8rkw8HAtkPHt8bgmj1kRkjZ6GNyXn/pGRdFXAeL4ANhQiTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso161133241.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927188; x=1751531988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CXXrh6q12709fq3ouPkXeXw0fUYo3PeMNTc+UDJCbM=;
        b=Q6ZTSxj/i7suEd/TZ7u9Ltur7+d4uak2/GX/YOw03efapGO9K2GwPnlRjtCkOTBf3P
         Cvhp/lLeD6dnXZzS8FzCV6knR+1c1x0J7JdX+17VZzs88KAfzNvbHeMB+JxiBRE2/Upu
         823RmErfWyPs56L0vk5N13xawyzAt/jbVkEGcsTOUa7ehvoLluQ4/CJX/KyQq6w9f/RM
         /zcd9Pu7+RknnuIsOx4A20tjSss1vM1aoJiyIg7B5rVmfy8VUOMR7TlkiB4paJWvwS/U
         Fet9hG9ZlZ/5jTqv1n3peYwspchmCEwS/gEzsQNoh3BmN8flgo19SoUP9yCRHLDalIzP
         y71g==
X-Gm-Message-State: AOJu0YxHuMq/efK8Q0ZESrDVd+WYbsg1tIFeHUOqzgb8qxY3sPc0dT+u
	iW5yAK83cEVZQ4pi3pJgwu081nL+xZB1JQfgJK6m/CUnNeaH6yJbF5qZH9gy4kT3
X-Gm-Gg: ASbGnctPqNYDpTSFBbUvS/oKRryFKfyp7CGWTh8Hcjan4fK+J2/6D2MGaNDKQgnezT9
	iOmg5au8WMyD8eLRaCwI2WoOWg9QDZxbnDWD2smbQRO30WV3xeas//BhX6qbTcvkLbDvZGlQodC
	870+nZBaqroFS/6MI2u6MF8/vx9DtHI0mUgEsKHcfyIVWXVIXYUhRi3HQM6anFh0vv2Gjph13Td
	0+iG7EgAjAm+RqqRHUY8aIE/Ee8pVasJOksnliWErHE0mrWWkxg2LCyaxzhrES5FOkzI4OHra0K
	WHml502ZlpCI+u1VY4N3DNROVP4s3pEzSX0q0zfdQxWNj5W1PrgcjXfoqaHzf3oV81IYkh//FhM
	WoB6dMTwbNnjTtzLyzWcDslq9
X-Google-Smtp-Source: AGHT+IGgjlFvBr8ayWIDn2t99+ZqGfz/1EILYnjg6URENMlQg3eLQRrt2jhB79hYX30oPxBHfVroYw==
X-Received: by 2002:a05:6122:8c81:b0:52c:4eb0:118d with SMTP id 71dfb90a1353d-532ef39f81emr5082785e0c.4.1750927187981;
        Thu, 26 Jun 2025 01:39:47 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab3501ecsm2230919e0c.30.2025.06.26.01.39.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:47 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e77d1333aeso195946137.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:47 -0700 (PDT)
X-Received: by 2002:a05:6102:1610:b0:4e9:a2bd:b422 with SMTP id
 ada2fe7eead31-4ecc7682529mr4585520137.15.1750927187429; Thu, 26 Jun 2025
 01:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-4-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-4-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0ERhb8KTmEJ-QQdix-yt6iP3SPvvc0hhRj4kjTCVJmw@mail.gmail.com>
X-Gm-Features: Ac12FXx11KF5_uv-y_hIKWSdWLzp2qstbKTBUYUc-2CxFIYYvesDwIAbfVm6Hi4
Message-ID: <CAMuHMdX0ERhb8KTmEJ-QQdix-yt6iP3SPvvc0hhRj4kjTCVJmw@mail.gmail.com>
Subject: Re: [PATCH 3/4] m68k: mm: Convert init_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses init_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
