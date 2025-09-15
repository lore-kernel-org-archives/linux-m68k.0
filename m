Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494D301489
	for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Sep 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757937283; cv=none; b=kBy39Tu2EDVOeVloyWDVBChI/ai7jSkhz95beF9be6t+u1nti6u1cH3E9hlRzVrEz9D13gAlTQhBqEfKeSio0DgRQWzjevrHFJYPuVsG8WSJxOACwv43XeBE75HTV+hAppjUeskX0/lJPjYtj9Kdo4zWpZVbkpbzO/k1MJoEUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757937283; c=relaxed/simple;
	bh=X1mJ891dQWSYdtfoPDMNxd56dDiE4l7XqS7hxKPA0zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIl6LaqXrqzy2aKzeF4kdNRaiZ/psdxlwic/bwnjAVjM5iwfFJP/AQnuH9Qfm1SOFpJPCIzuthQktSoVDLOiUyEAErDQvm1Hwfx1HXz0ac7w33A6+ANlqjb3/s7jeMJx6c+dx6Okt/hIN4c3/oIkxgGgANInNDhnjNAppQYpmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5448c576e3bso1418217e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Sep 2025 04:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937281; x=1758542081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8j9g6khBudlWCULOd6eX9KmZnbNuYyJvR9k6Ybie28I=;
        b=cJeGEpK5ZPS0FAjIp/9QPCKHddWMJLWlfMdEP1pNGp1gZCS7asPSN7Y5PIZHNWmNYM
         /tq4IrTqvPY/mdmPx6aigvlhqc2IVS/JlChybcN6+C+eBIuBT+UIV2flyxr683Ttv1KC
         ngRpUtcLmp6V/nsZ4aiaAD1GfI0dNpnm5Klgu8s99jh74MgVwHdzrQyzh8EOB19yb9z4
         Db+h0Ct2yGqox550VxYpxUi3rvtKdrTo/ZZUyq9ShBMnxXQ2VOC657VkyseuEfW9YR3v
         rSGtzZSEMb5eHJMKGSx8Ib+pBm9l1+y0Fse4FjcRLWmub+JUNNOwwLjs2u+7opAMAgOc
         gJ0w==
X-Gm-Message-State: AOJu0YzRXHG3Z5zyMuL+RutFWf7XjSYxc2GnZpvalrM9y4heaU9biTBu
	kef/83AiIK20/9ga4WFA86e11BDgruKzwoZTVcPsuei21O5EWxQeIArpTVRM2O9G
X-Gm-Gg: ASbGnct1Xg/8Ouuh5XOsn9ZXOmSEeJhHkSWjkLhzFSZ9yCgyQg8D6bAr9yw8NT9WdCn
	dwHTvvAtmTNCKMgGZS1kD+wSfnajD0vtZGNlyNap8fS9HSUFzMKNCEVIzHlq8g9HYaqntfoH08n
	G63+BW8mSk376D75DaPJceZK7eXhkt+N/Va44tCy1tr3eYJVHyOjgR+K0EcHjDVgZMpoUQ3WhMy
	gK8XPZ1HqqLNyE8wijLELbJzsJgxsgrMGYFCXrz3GAwUzLIYZb0MoVkWgYlFHnog5EcNF3GNDO2
	c7Mc+Z1TzpovSjjxykIk6b8P1IOYEE732pyaBTPhBbeFT3AsfLpYmrykIWh+1Ak1xyCeJCdKZWQ
	BouyG3pdbrqglbOwMwp+miZbxkSfwqEYCR1ib/QnUpqUlZC8ljGgoJpkEecocIOestYEtmEc=
X-Google-Smtp-Source: AGHT+IHIYsHQZLq9AoSrWVg7FIP9Vq6vSDqTRKHJ2Bme8ufRrkdgFIIGcdlYKRLwstrHG5vMG7EJdw==
X-Received: by 2002:a05:6102:d8d:b0:555:56e0:f372 with SMTP id ada2fe7eead31-5560908d470mr3932221137.2.1757937280761;
        Mon, 15 Sep 2025 04:54:40 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd640cb5csm2194202241.21.2025.09.15.04.54.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:54:40 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-890190c7912so982835241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Sep 2025 04:54:40 -0700 (PDT)
X-Received: by 2002:a05:6102:8098:b0:527:4113:6ad6 with SMTP id
 ada2fe7eead31-5560a10e919mr3310852137.9.1757937280011; Mon, 15 Sep 2025
 04:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728071452.35171-1-jogidishank503@gmail.com>
In-Reply-To: <20250728071452.35171-1-jogidishank503@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Sep 2025 13:54:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpn8VhFL3RF_NEEdK3-VuHuHHZ6PFBcJi+kYCgbnwL8Q@mail.gmail.com>
X-Gm-Features: AS18NWBDv-eagQpa9zzAr9IRsIYBMwlArzoXlxqRod7XiXKpYRxYZJ8lRHiHNyU
Message-ID: <CAMuHMdXpn8VhFL3RF_NEEdK3-VuHuHHZ6PFBcJi+kYCgbnwL8Q@mail.gmail.com>
Subject: Re: [PATCH] zorro: remove extra whitespace in macro definitions
To: Dishank Jogi <jogidishank503@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	darshanrathod475@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Dishank,

On Mon, 28 Jul 2025 at 09:15, Dishank Jogi <jogidishank503@gmail.com> wrote:
> Cleaned up the formatting of MANUF and PRODUCT macro
> definitions in 'drivers/zorro/names.c' by removing extra
> spaces between macro names and their parameters.
>
> No functional changes.
>
> Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>

Thanks for your patch!

> --- a/drivers/zorro/names.c
> +++ b/drivers/zorro/names.c
> @@ -36,21 +36,21 @@ struct zorro_manuf_info {
>   * real memory.. Parse the same file multiple times
>   * to get all the info.
>   */
> -#define MANUF( manuf, name )           static char __manufstr_##manuf[] __initdata = name;
> +#define MANUF(manuf, name)             static char __manufstr_##manuf[] __initdata = name;
>  #define ENDMANUF()
> -#define PRODUCT( manuf, prod, name )   static char __prodstr_##manuf##prod[] __initdata = name;
> +#define PRODUCT(manuf, prod, name)     static char __prodstr_##manuf##prod[] __initdata = name;

You missed removing a bogus space.  I will fix that up while applying.

>  #include "devlist.h"
>
>
> -#define MANUF( manuf, name )           static struct zorro_prod_info __prods_##manuf[] __initdata = {
> +#define MANUF(manuf, name)             static struct zorro_prod_info __prods_##manuf[] __initdata = {
>  #define ENDMANUF()                     };
> -#define PRODUCT( manuf, prod, name )   { 0x##prod, 0, __prodstr_##manuf##prod },
> +#define PRODUCT(manuf, prod, name)     { 0x##prod, 0, __prodstr_##manuf##prod },
>  #include "devlist.h"
>
>  static struct zorro_manuf_info __initdata zorro_manuf_list[] = {
> -#define MANUF( manuf, name )           { 0x##manuf, ARRAY_SIZE(__prods_##manuf), __manufstr_##manuf, __prods_##manuf },
> +#define MANUF(manuf, name)             { 0x##manuf, ARRAY_SIZE(__prods_##manuf), __manufstr_##manuf, __prods_##manuf },
>  #define ENDMANUF()
> -#define PRODUCT( manuf, prod, name )
> +#define PRODUCT(manuf, prod, name)
>  #include "devlist.h"
>  };

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
