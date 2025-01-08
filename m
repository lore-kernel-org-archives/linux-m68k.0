Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3951E570E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325760; cv=none; b=k1UCcumm4cqkXKLkGFpHBVfkcDPRUEiRATjHzhDEockH8zAikd4hZQnUfYpjdTSSrdTX5yNLlKftNQ6kYwPwfGgyrCzvmH5CJSmLriyFV85sE8PkgRzGdbZIfA6pbcwTnuPl79IeYzwwLoxFcPQQIUqIhl3feIII6R5V2ZMNy54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325760; c=relaxed/simple;
	bh=u/I1Txgz8D4/dpVipPtWRukejMj1KNo7qhhuwp4aj4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5ItSTcr00iff+WD/daq/lZYtLxwhlARbk6qyToAGRGVLjWnETn5EyuXABSFX5+OL06EJ6PpdWcdDqSwzYqmoPG1PVeNrphYu0oB0B6WyQiggOCRm1+3DVYKm0lfUo2of4eaQ+TknxFeGUd0WS6t5PDpbHPkDgSYXfEZg/A6XNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe1009960so4836070137.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 00:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325757; x=1736930557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YTCl0q5fzvKpBTqyz7MhpPwaNjXxXKAu+YJaNyy1Bg=;
        b=XJRzT0aRRagoQRs7/8Wb3eDDPoAuOO28xNiMrFbFUHSx87+C53/bnCz30HKMCjNyuZ
         uptK3riPCxZe6pnpSj/KcnsJX/xuFdFv3F1QUrlCAzOgvymsCcrOojLdc5QGgx32ZEnz
         ERPmKVVmueWmcO0PGswsYTFy2zRBpbq7/iYGXTDLv68GWz84FzyZjUiwbDvhAjC+Dl0t
         o1/KKOPWUotO0Yrrwiand3EUtsUqDw0g4dRoMpX/+M+Oo1j8w+Ap3Il4b6b3WysDXS5P
         UeKCGBvXkI5aXvWwnhWh20PjWndz37Aojwqvrlt3W0eHsmB3RqgqRa1ixMsc5MMhqul9
         VqfQ==
X-Gm-Message-State: AOJu0YzacKywJYZ/3KN9/FXC9d2U5XfK+2IQg8+iE/9snA+hkM3NMXz3
	9zrZSlbi1RcAh3gZMmJCkDf88qXuBw6RX/jPmSMOtjgPVrRXeRoYFVWGqIyT
X-Gm-Gg: ASbGnctMycK6XSM4C+FdgqeFLctXdCIdPLyha9ofyyLwelmtXjpYr+ZITNNzWuNpto/
	7KRjdbUvKQJlAYrEF8ztJKs6TiI+Yq8sh8nFU2jlLEzSFy2/G3u15W5WUZkNNSn2mswk7eARUat
	Amm1cMUkUp1CtZae6KObptXCfVzSabvFhIi5fZCrZMsxtiilxlivsCs7osdjcPFRcXN3jpBELRn
	NL9qt32timugDoq2NdAUEjSzJKa6wfBSVYS5kFLLkQrETQHzJ8DknO6et4vI5h3cD4guxqhGAPr
	lFcI/GF0L4i4zOf+9BE=
X-Google-Smtp-Source: AGHT+IEuAXb2XZSlj1QFgHFdqIJdZ9FD962x+aZ2M9+BTOLITKFGpEiqXowOYf/RiK73kZVQ7FiCow==
X-Received: by 2002:a05:6102:2928:b0:4b2:bcea:dce2 with SMTP id ada2fe7eead31-4b3d0f1475cmr1374228137.10.1736325756639;
        Wed, 08 Jan 2025 00:42:36 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4c4dfsm8446258241.14.2025.01.08.00.42.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 00:42:36 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso2748326241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 00:42:36 -0800 (PST)
X-Received: by 2002:a05:6102:c8b:b0:4af:4902:153e with SMTP id
 ada2fe7eead31-4b3d0f1624dmr1312054137.9.1736325756279; Wed, 08 Jan 2025
 00:42:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206115634.47332-2-thorsten.blum@linux.dev>
In-Reply-To: <20241206115634.47332-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 09:42:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4c+rDzyfu+XhNR8c6F+Z3CUJ6EJSY8ic2DQzLokSSjA@mail.gmail.com>
X-Gm-Features: AbW1kvZd0EDG30WxDJeGIoMqmhgh5cfYdZnkp9o_lZgi6kaqC-oXkuw7FpPsAQA
Message-ID: <CAMuHMdV4c+rDzyfu+XhNR8c6F+Z3CUJ6EJSY8ic2DQzLokSSjA@mail.gmail.com>
Subject: Re: [PATCH] m68k/atari: Use str_on_off() helper in atari_nvram_proc_read()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 12:57=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
> Remove hard-coded strings by using the str_on_off() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.14.

I am adding

    #include <linux/string_choices.h>

while applying, as currently this relies on lots of implicit includes:

    arch/m68k/atari/nvram.c:#include <linux/seq_file.h>
    include/linux/seq_file.h:#include <linux/string_helpers.h>
    include/linux/string_helpers.h:#include <linux/string_choices.h>
    include/linux/string_choices.h:static inline const char *str_on_off(boo=
l v)

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
