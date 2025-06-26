Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC625F7B7
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927145; cv=none; b=su+37moDpaNUnvd0UaB/yewq95UTlM1QbON3i5PKmrj8DW4e7iQyvmQ2rFQBjv7YoV5Ruuzi3Vao14mJ+jC1gyrpoWSzWkVjJg2RgwLXWrwOBe4+flgv55uQuP4VqYqqyFJ2yTq2q4gez34ZJe7GkGr/W+RPOYYdxnqcY/rjo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927145; c=relaxed/simple;
	bh=07vUsEyMksdmohfakBhz4xlamEj3Jb2m/86V7iG/J7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pA5grof92yK4QOsnMDUJsj3OyDXI4aQmC1/aW0C7fzDo43TsjQ3pNHdvNJfdW2NoV5gJJv2Pels3l7vxukDz2WrVU2cN0y5b7xtkCKh8bZnrdx5A/gqA3nri8g1dCpMEfUqp+oTVYjxmWvQ8F2GgTB1juuejsHdmWdqTM62MfB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so244830137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927141; x=1751531941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FKr6SOJmsMSyWxgl87rxUfaSgqLues1OApSM1lNIyA=;
        b=YCooAwWR+zMn7VBnOLNuGc73gLgXS1vs3G9dVFWwVJcLw+fIW71di8INF/rN/iyow5
         8HGRtRWcV4bCqL13z8loCUw/ycQHgF/Pw8YX6A4j25DdprNNrE+4P7P1Y0my0NFT8+EB
         gigqCtG+KdkOAguxJsSGHyBtnjy9pKB/fAikLXj2CoMPRjNgaJ42eBxCXp5lzW8w7kQL
         0a5gFRzJ0q8qyJmbN0KjRfQxn6/OS90DSQf4g1FAdKsGE3dzIeL2BP940kRCFIWvACn5
         QEwYszjZJx2M1F3msL4NAlLGJ4tKeXjlEIW7LqWwCd7qdUWbBeOwabgApF0+7s8rkmdk
         6Vgw==
X-Gm-Message-State: AOJu0Yz4YU6hWt5ZeEvrKK0Tk6ROSt8PX2S2Zp+3SUaHHUkUUb4YhGBy
	ihvOsBOGoAQfoVTa4qICzbAon3+nSv4SmaT5thJq/TOwR2i72kU/nOlCVkGD9xI0
X-Gm-Gg: ASbGncvO/NikKOwhPhTGFw9jTwc7NBuW9uhcCdwX6wX88/Du4istNQc4/d4xbAfdxAc
	+akFMwCqRJhCUCZSu32DhwyaxTNcuLSSZefq8QurhFcmqg83lVS6EszC6mKk3Mn7Bany7HPugNy
	qp/zuRn1N0IIAnWfCefDs0/H4d26ot+uSZ8EmC1lJ8OXQNH+HoawOL0hZIybMsL/6OLke/KLdDh
	4O4Vk2DNq+gLmdZ5Z03MTHyO+rBcXGoGeX1S6H1w5G0sfr/U/JlDF7+JVyvjjbyrbN9W1+D3NUl
	brNUGdmpKjYxRl2DDPWoclpbMdIrPLKyifIhYSStopkf0CoVbzsqaQrN+s7QJeqrMEiNjN67j7z
	dp1c3jIgyhzXH3PdU71WfwkTU
X-Google-Smtp-Source: AGHT+IGg5Xo+Z8FgbJxbhOcmAecjGl+H+x/o8TVsAndSoevnnLvOwlOjuKFwQ9+ZqiM3F7elHkf+qQ==
X-Received: by 2002:a05:6102:441b:b0:4e5:ac0f:582c with SMTP id ada2fe7eead31-4ecc767318cmr4581199137.13.1750927141027;
        Thu, 26 Jun 2025 01:39:01 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1db7935sm166610241.33.2025.06.26.01.39.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:00 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87f13aba2ccso137282241.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:00 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:4e5:9628:9e39 with SMTP id
 ada2fe7eead31-4ecc6a7750bmr4213230137.6.1750927139785; Thu, 26 Jun 2025
 01:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-2-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-2-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:38:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd=eha_pRNGCFHN7sS2OOh60cj=c=yPUyg_-J0S8V8yQ@mail.gmail.com>
X-Gm-Features: Ac12FXzbd6ICmeY6_N3sDigtBp9r-6oclQKShUI06FUTJz5bv9x-2knTpcY-Rxo
Message-ID: <CAMuHMdXd=eha_pRNGCFHN7sS2OOh60cj=c=yPUyg_-J0S8V8yQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] m68k: mm: Convert get_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vishal,

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses get_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17, with the small changes
described below.

> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -148,16 +148,18 @@ void *get_pointer_table(struct mm_struct *mm, int type)
>
>         /*
>          * For a pointer table for a user process address space, a
> -        * table is taken from a page allocated for the purpose.  Each
> -        * page can hold 8 pointer tables.  The page is remapped in
> +        * table is taken from a ptdesc allocated for the purpose.  Each
> +        * ptdesc can hold 8 pointer tables.  The ptdesc is remapped in
>          * virtual address space to be noncacheable.
>          */
>         if (mask == 0) {
> -               void *page;
> +               struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);

I will move the assignment just before the NULL-check below, to ease
applying the WIP preempt patches on top.

> +               void *pt_addr;

I will move this one line down, to follow the reverse Xmas rule.

>                 ptable_desc *new;
>
> -               if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
> +               if (!ptdesc)
>                         return NULL;
> +               pt_addr = ptdesc_address(ptdesc);
>
>                 switch (type) {
>                 case TABLE_PTE:

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
