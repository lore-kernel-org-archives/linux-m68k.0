Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE63370D5A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150914; cv=none; b=DtiDrCXT/eovzyvE7ZCSTb+DO3+rex8WLlEeYC7Exeg7TbVZtUXmvZNYgCUYseb3eriIGR5kD0RF71wM7xI0FDfivEJuqxtkzi4RemvTyfRzNv//NrWKVdvMJd4AUh6UI2FdyIH46tB8zHMmHOfYBoFHwn5YeTrX+eTGq6tagy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150914; c=relaxed/simple;
	bh=qMIdqmi2sc9qZNkuZKvLD9HwZ4KLHQoEe5VNMfi4bbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ok6r6aqKOpwCjDTGl1JUbpgPHnHmqo81meJFDVhhSvNumTZ/An2ZhQwxVztZ/f7PDiJuKBMhHTO1TZQ8tOZNTC8Z7sdy1VR8NcK98pZeIxWVfc2n4BWPhE5txTwH7pxxW2lwWf5Aks6oSPhsX10ekNFS1UThWTmZb0Ba0ebFHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso840884e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 00:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150911; x=1776755711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN4rbgAYp1mE8oFPfPME05NkCvNa36r6TXaXQWSDlC0=;
        b=aHLYt0ZUVXcMbMyZb3t41k86pVU7k9KLzAPoUjo8UUy5/p+X4UtQKeCFwHoA/A7B6Q
         u62E3UXlXXsZlnnULDwwjexnxqNt2FHOIcfpmYQVKXQjFak2ZDNR2IYu5zoNs1v60Xpo
         Pbv+B3HNeNLkPg90lDr5jGQzAYvHknMhmF1UyfmC/8AR+NPsOJeM6rYgkawzJgSf0ICJ
         U/LDHeYvTSViHxsaTU3QQTru1Jps4bgYXezb4YlsuBQGcOWtRP1j1s8qIyElohs7mHS6
         F9in7PO31Jp28ls4csQaMzlOd4MJpN+VqNodlb/+Gbms1RH9jy/QX+64GJHy7WNuwLfy
         7YjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gylTlohN/BlPD3WswB6Rb3JxYcWGT0xZyWx/csvuTV4qVZP5giiNjfUpb9Ijom8y6oa7d46rap8AT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyQPz0tkV/vtkRYEy7CrrTvy3cruOeN87U1JsxWNSwdsIz+W2fZ
	iUGsR3aWRakaCGasK0zHlyX1aIrFUSgwZtnDArKz+G8avk/UgmEVgtPyeHlxGDBT
X-Gm-Gg: AeBDietGtBdn1MkGjdnAVHGMwrkgtVb7MEsc5awrn5CWzrUy7p7ih5lFlZGqGbpLxFm
	vuMzn3hPGJKr8dgFzbkEjiGAMAs0D17h8zRa2E5ini8dluMgYo5DmNtMUaWUrnca47JuJbcvQTF
	43GE8wWzcRo3PJKIeXvHU9PZ7DjyTp9cdXa+NpCLvT5yFl6ithvpvzoNKDg3RVZum5jd6qQaPNe
	s28Pt7axmJ0OgbJFUusIMXI15FVr1RF/n/rMM5NZ8VrNkyq7zvUZ5aB+XRw9X4VcyuKccS0912y
	AgFP/N8nPSiO898VKVVx42RlUa3XKm41pi6N4OFjgg2jY6w4ntC5WuZMzRlQhJhcs31pHgNmNKB
	EGvu+f+ECZngyzrHeNsWpPbKGTlw0BhVkFQvoofZHgS5OY4ttIrLekp+JJpmdBukm174wZ9hN4K
	Y2PyTExwk4Q/SwZdJXj9jgt/yZeL/AfzdA0wTw9lgZv9mH0kAxZ8BGZPTb6tTE
X-Received: by 2002:a05:6122:6301:b0:56b:9534:c06f with SMTP id 71dfb90a1353d-56f2906fedfmr6099802e0c.3.1776150910835;
        Tue, 14 Apr 2026 00:15:10 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568dfe51a0sm2712031241.12.2026.04.14.00.15.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:15:10 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-953a5defbbdso3036455241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 00:15:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vcvihY/sDMqV8FpWjpSZTmQasTCzhXU2Q/FmGnnmp1hcKGjti/lVGXR87LhE66XdamEZDLXR0uFCq@lists.linux-m68k.org
X-Received: by 2002:a05:6102:8015:b0:602:8742:1fa with SMTP id
 ada2fe7eead31-6086efedd35mr7122144137.9.1776150910233; Tue, 14 Apr 2026
 00:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404024658.2496519-1-daniel@0x0f.com> <2ee820a1-4169-4345-97cf-d481fa3679bd@app.fastmail.com>
In-Reply-To: <2ee820a1-4169-4345-97cf-d481fa3679bd@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 09:14:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVj3YJowoYhxnW094MeAz4UX0CCC=d63N5SxTRAK2gw9w@mail.gmail.com>
X-Gm-Features: AQROBzDyKB8OCL6zrqN7JKQ48a4rJ4-udJv3n5CeiWeZMo6uhVAOE7BQvPKCdxw
Message-ID: <CAMuHMdVj3YJowoYhxnW094MeAz4UX0CCC=d63N5SxTRAK2gw9w@mail.gmail.com>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Greg Ungerer <gerg@linux-m68k.org>, christoph.plattner@gmx.at, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 13 Apr 2026 at 18:52, Arnd Bergmann <arnd@kernel.org> wrote:
> On Sat, Apr 4, 2026, at 04:46, Daniel Palmer wrote:
> > Currently for 68000 readl() and friends are broken in that they
> > return the value from the bus as-is but should be reading a little
> > endian value and swapping it to big endian.
> >
> > This was found using virtio-mmio on a 68000 virt machine. virtio-mmio
> > is little endian even if the emulated machine is big endian. This works
> > for MMU m68k because the io macros do what is expected there, but if
> > the kernel was built for nommu it breaks.
> >
> > Potentially this will break some stuff for nommu non-CF m68k users
> > but since there are probably 2 or 3 of us in the world I think we
> > can work it out.
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Link:
> > https://lore.kernel.org/lkml/ada73dc9-edf5-458c-8849-9f9db23ff304@app.fastmail.com/
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> It looks like the non-swapping readl() on nommu-m68k predates
> the git history, but apparently the coldfire version was fixed
> in 4d5303787627 ("m68k: fix read/write multi-byte IO for PCI
> on ColdFire") to behave like everything else, and dragonball
> appears does not support ISA or PCI buses, so it never used
> them.

Correct.  readl() and friends were introduced when it was deemed better
to use accessor functions instead of dereferencing volatile pointers
directly (which is what several m68k drivers are still doing), but
before it was decided that readl() is little endian for PCI everywhere
(there was no PCI on m68k at that point in time). And of course that
was long before the introduction of ioread32be()...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
