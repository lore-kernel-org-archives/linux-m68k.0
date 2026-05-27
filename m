Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C808405C4D
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887916; cv=none; b=chXKF5M4b7RZMbv8PaBu0enG+IXQIwHtCmOYU+gXs6/Kol69tXOQLTDuEFHSTIXYOsfW6shyeT0Om0mEP8gVfwOapfOeRl469//OAh2mEx/lmjhOZ6ZhxmY8q9VIriTZTWtAfELVan1Y8Fj6lzoKJtORC6l/vrLQkSALIEFZmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887916; c=relaxed/simple;
	bh=tmDU4VguE+cwpfpInPS+PXjfh3XEe4XV+vkqOU8kHK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwxY/yJRzpZ3q5KrkZSQqYrhP/xxamVCUQ9GmQp90kVNZNrzklutHBP0HvRUgo2UFtQ1P8Jwhgq6IrrML14fPVGlDYsKl3pjV0r7TaMkIT4E7TiBaqu9cropqN119Ihm8wLN8xuMk0OUDm/5uRHvGokoId8fAOi3WSbV6Q1rQKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95d0476492bso8596727241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887911; x=1780492711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MuSPc8y576tayBCaWdrNcab8/lH09ziazVq9lwM/2k=;
        b=gs8gAndI4OJcWb2OIP4D7ml/Rxx237Ko0i3o6CIpQlGXzcKdqgQgPzhlgph3g78ejo
         LS5VinpdDT++DBA32rTvQk2lrJiG1IXpp5ZL5IB02Wg2BQcvNEYODVPIiJG/6dqJBg/t
         Amuf5koHNEwuEoXTbC95BlNsI00Odk5X5KlbCamQXekjDFeY49t5hhWabBwKLSexg1Y8
         G5TK7LX+GVzlLrfp/Z+YmKqtSt4X4HA2wSTutabqhezAtl6ljLjQf/rKjmteiiEOyzbt
         1CYQkJtiR5XNwcgAXJV0Jn8SZISCtOdv/jx/KvL0JFtvUScOTcLBDAGhVah3VndMroXk
         BULg==
X-Forwarded-Encrypted: i=1; AFNElJ+WHBqJiwr0MV6iG7u/TKgc7jycnCZKqlnzF9Cp9bLNAlcM7xmG/D2JsUcMwjJWtx6qiXeWEcaVfnDy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzevWVm0XO0DuKne6ZH09jHwXMDivYAY+t5eTgxv+B9ANvhzqoc
	DcCKW51yKu/M8Y4Ix3DCSYMJghxanZPVmyblhdbExVDIzJfuVgQ0MEk/oJNINoZsqeo=
X-Gm-Gg: Acq92OH6PrWZwOidFv3b6Afg38ESmZ/IAKB3fc9SU4AyEmU/xbKmG55rES0N5hCc7+Y
	6fvO+8SyD+QpCl/CPuxSeJe69NaxilThxCfTfwzkQLHB05MvxbjvM4YTdpKvUtenv4RhdmY1BVA
	lgjqmyM9AO7BeBLH0VEy7aUVxEdjd6nQzxTN4GaQvssuQYmzhtGRV6RbVlPuhQKqbgJypk+YZRu
	ZXWyKtbciq9QW4OsuCj9Vcc7A7bhajtq8f+KOpuO9V++f2BQ4nU24LCx1obNHsMHT2v/KuhhmNR
	R8hA9NeY/SLEFkCWMUmYCULYJ1hKaOQS2MXXslJcV+lWyQQOQLZrBxGDX5FpDI+6gYZsjlj8mB5
	f9RukNMVtztssSlfDQEIKwUOiKc5mnuducW4AL4vyyYnkHpi0l4HEIWuSFDx05WdhFHZ6jkybL7
	oRPbsdx86Izz7E+7sxCf+YJqT9o9Krc1LdmrfoRxfSwru7fhptP8Wx+4biyifkTazCXfekb6ZWX
	ympmX5fzD23mA==
X-Received: by 2002:a05:6102:809f:b0:632:a084:c0f7 with SMTP id ada2fe7eead31-67c85b3e92dmr10997160137.17.1779887911400;
        Wed, 27 May 2026 06:18:31 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8851f5bsm16591764137.3.2026.05.27.06.18.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:18:30 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56f75445470so8992777e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:18:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9osZierRJb9eHdntpdzuBGe2P63ikfiMiDbfoHwMaeXjUnaspxnYiaa6L3Fr2XjMLLfyxEHwcuCTKL@lists.linux-m68k.org
X-Received: by 2002:a05:6122:3102:b0:56e:e9cf:7134 with SMTP id
 71dfb90a1353d-5865ee6c055mr11675886e0c.3.1779887909452; Wed, 27 May 2026
 06:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:18:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFCGKUCDBLiX70bLBUGxU7iZRGT0hEipkrM2FkjE3v6Q@mail.gmail.com>
X-Gm-Features: AVHnY4K9MKooRiuSGEh5fNQ2eTKctG0rOT_zroLTx4bk0lQkHEgucmZG57_gNvg
Message-ID: <CAMuHMdUFCGKUCDBLiX70bLBUGxU7iZRGT0hEipkrM2FkjE3v6Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] zorro: Simplify storing pointers in device id struct
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Max Staudt <max@enpas.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Helge Deller <deller@gmx.de>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>, linux-ide@vger.kernel.org, 
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Technically it is fine (on all current Linux architectures) to store a
> pointer in an unsigned long variable. However this needs explicit
> casting which is an easy source for type mismatches.
>
> By replacing the plain unsigned long .driver_data in struct
> zorro_device_id by an anonymous union, most of the casting can be
> dropped. There is still some implicit casting involved (between a void *
> and a driver specific pointer type), but that's better than the approach
> to store a pointer in an unsigned long variable as this doesn't lose the
> information that the data being pointed to is const.
>
> All users of struct zorro_device_id are initialized in a way that is
> compatible with the new definition, so no adaptions are needed there.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
