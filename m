Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B42D6E58
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958831; cv=none; b=oiW/apWG5sju4SEIieE4NJxZcl8o3S/T/qC2885U8ALF/V9QKHBFtK1Iik1yxzmNtsqE3ABgSCN9npO6Rt1JI1ENgLv+a3Pwp/J15IogS5wJ0KOZUYKjDzbf85KJdqdse5Uc7pf24seArNUvuPfdI2Zyiqx/Dqn335ojjauaVNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958831; c=relaxed/simple;
	bh=EFq0cP2vyw7H2TNf9LZlP4PIeG6g1xnzKlSjNWO0LIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5oukz3Qey58qoUYUTkU2O1QZij3ksrYV+02WuS/Eh6ULUyrrlnm3nFwys71Ewz3Cb5Bepq4rzwrDJiwGaiknpjpdo0ovLgPpuWU3zGen56ki0/hNf6/NeHNVCeuQX/VnNXqRar6nIF+9Sko05AyJabvXKlCH6WVeVK/Mn1rwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so1305411241.2
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 02:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958829; x=1787563629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzfTLtGkzMq8n3eA9+papZ2SONMrcut8ItlqmmafgrU=;
        b=lilZdbHtz16xtbOvjGQsO3Wez6Y16whwNQLsuKEp0pqJnkgwJQsQbieeNECYKfQDfX
         IMp001bFASnabkNnadS6Ufrh2AmRi7efnSwd1Zi6hRD3k57orcFoaGB9ZetnzILM02AU
         9twVNZop1dTp1zRcv1IH1NxoMuGP11suhrqMDFqenoY0+o5gH3ZEt91QkfuD3GdpDBCv
         Bbz0I6p0J3pOg9iZ7hqtCS59oi8UTeC/4bbPQLuVHU5GPNDadGyi+99oLZs/WXxUxHrQ
         mfgzaLVdt+bHEv8oeJR9jjUZodTp8TR97UllKalNylEHtq6vmb2gPLnWpDtQvMT2B0VP
         lIfg==
X-Gm-Message-State: AOJu0Yx3bUegUr5ZifaTT9AaA71kImziG4prvT4Pebln56/otA1WGzuU
	KtVtJPjt4Mim+Ouj8pcxLf0nQY4+SGC+pIDTkExiAnyK3PVbOVagnA5EyAFrK+Xc
X-Gm-Gg: AR+sD11LCBB9Ugo3xsUSw/ha6GeGBkyjHshryu+MSapBtNM6vLCdkV/O9MbuOojT+0v
	qXWs9EZsCyZcPaiLFdNc2V7sWLk4a+kCymeL2ZgeJWo8hXy1jG0raR1J2OtQBT20UIoJ6qyZ854
	6zFmveXbJ4DNTyCniEYpd/ThwX54k63c5C0uALOUf3yowR53JRQ6qTQNHWySBdJF940oZfo5q8S
	GO4vsEk282W8yEd/zHViM3k1fdkief/9rnMefSCMylruAD3qol7g/Jks8gcH6mCa3W4gMz5VunC
	D2cT1RMfcnN+rfJpuUqAGr4sCLb+1gOZbKkPAo6QsgozFlN7Vd7e9kbdVibYKK+dBHKOQywrND/
	o/85SPP44uc2s8zQx/tQpODgOMDm/FQAXdogZxVqJmORdbLmgcXYsqcdOukfUbcA8INwGWwDkru
	rHPwk/vK8bY775JRii+pcrdkCji6wZaYVTOs6w7BM0gxrHfXyv+PemRyojjYA4Z3ZoqebA9oc6m
	mEdPzPlLIFBXRTvsg9gECbD1PHi4A==
X-Received: by 2002:a05:6102:8541:10b0:76f:eaa2:6f80 with SMTP id ada2fe7eead31-76feaa27880mr2707712137.1.1786958828925;
        Mon, 17 Aug 2026 02:27:08 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c3111330sm478391137.5.2026.08.17.02.27.08
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:27:08 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so1808912e0c.3
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 02:27:08 -0700 (PDT)
X-Received: by 2002:a05:6122:e467:b0:5bd:b27c:bace with SMTP id
 71dfb90a1353d-5c591fb8a84mr5496977e0c.14.1786958828527; Mon, 17 Aug 2026
 02:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecfzsv6h.fsf@igel.home>
In-Reply-To: <87ecfzsv6h.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 11:26:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4C+W6Tpsn3Vr_kqmuU2Vzg7ExXhspmB5qNWMZ3Wnfeg@mail.gmail.com>
X-Gm-Features: AcwNN1X8U8C-rcgaQUE3aE_ZprS7KOY_E0tm_eXFcwDXgVn4bX7wNfFwNA64GvI
Message-ID: <CAMuHMdU4C+W6Tpsn3Vr_kqmuU2Vzg7ExXhspmB5qNWMZ3Wnfeg@mail.gmail.com>
Subject: Re: [PATCH] m68k: nfcon: don't call console_is_registered in nfcon_device
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
	Petr Mladek <pmladek@suse.com>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

CC john, petr, serial

Thanks for your patch!

On Sat, 15 Aug 2026 at 09:33, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Since 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list
> synchronization") show_cons_active calls the device method under the
> console_list_lock, but console_is_registered tries to acquire
> console_list_lock as well, causing a deadlock.  It should not be necessary
> to check console_is_registered here since the function should not be
> called in the fist place when the console is not registered.

Nice catch!

> Fixes: 7c2af0f634f1 ("tty: tty_io: use console_list_lock for list synchronization")
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.3.

> --- a/arch/m68k/emu/nfcon.c
> +++ b/arch/m68k/emu/nfcon.c
> @@ -49,7 +49,7 @@ static void nfcon_write(struct console *con, const char *str,
>  static struct tty_driver *nfcon_device(struct console *con, int *index)
>  {
>         *index = 0;
> -       return console_is_registered(con) ? nfcon_tty_driver : NULL;

Interestingly, that call to console_is_registered() was added in
commit de61a1a3a0830710 ("tty: nfcon: use console_is_registered()"),
i.e. in the same series that added the extra locking...

> +       return nfcon_tty_driver;
>  }
>
>  static struct console nf_console = {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
