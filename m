Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3473B0AF5
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Apr 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639463; cv=none; b=Q4wWHMJr4wUK+hcUJIk0IidwhiIbjR3UxQ1A/9o46/AobBJl929NEBeIuq88ay98WYYflp7Jx4cODV/HbLXcLuW6p2JNKWEVrMdWIAltD7tLT8OuudGK/+PMFCqOAn0PO3s33HYmMx9eUp6aG48kCTvcZ2iPX4MCfaEHGXsWZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639463; c=relaxed/simple;
	bh=6f+jnpEHgb/hkxjXUIwHPDmvMZ0/IajHJJ3bP4FLF/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQqDC9FraSYL9jl7W2IPkwHmh2T80+6l9HlsYjYkqm14IOtK7BGTiuGX4mLQialpFxoLtnqYDmO421BExjwtSekkWnamIYpbU387Y7xwhiQYZs3uPlK3gzKvdLoiSTMBHRIHpdzU0va5ImYlOKK/FviZXVfQeuEGs2vCdnWJTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso4664972e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639460; x=1776244260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubu8sHm6i/hOiW9sxIWJt2iDAR71LSPf1yhT9f9dW3Y=;
        b=QdgbWWA2oJqyIdnI1swHXolOZ0YWaTtg0KvKxVXIaeHNnn/gjSZiLWuaCzy41EhzfX
         6eu/hZVh8OfxCDnbpFz+Q4b9/cxm6ppkWtW6aFa885ZvkUE8i8PrfzHw11smYHyPL6En
         ZcNH0X7rDiUOTuymp8rLcih32ImgBLAc4S6Yg1l0Dj6txoaDd6gzULy77aN7lOWnXl+R
         EcY0RMvnb3sfdfG3fvTY0pLV9SMzT0SwdWufq44BQ2FND5j5sF7GwrcWflQS7L9Qo5FH
         oQMh8Rink2bWNs+94DuFtfarIYYp0WQNviPwhWCt5xvEacj1ndfSWzQGmby78xhjvN/y
         oaaw==
X-Forwarded-Encrypted: i=1; AJvYcCVrknmxz42PzzUl29pAsWm1HOx3iLIZVDQhzOLlrHxjm7gw62ZIXf6/itkIXQLAvEEld0BQ4GLKYCxi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyprmHL1KaJDZtTqGQUagsZEk6PnHTtp4IiMCHmdzto4/nSLjcv
	tIm2hFfOXhYy4Tv90Ux9IZ90wK28Wz+nmcTe9OpkcnAC+HoXBDPlZMxsl0OAtegL
X-Gm-Gg: AeBDievyMPfW/VaryBXG1znK7eP2674gKanOx6u3W26C9m4Th6MI/CJmLEIeJM2uT/r
	TuZ2PMzXd7wqbsdb5HFjmY7Z0gx+vhkK/bA10Dk0Srw0FsWLT70sqUDNzp15e8AswIW5VY0/wt2
	ak9l8pP7dfqiIdfD6fVnK9IRHyI88/bBqEhVYFtq6AzMzkEcDuFPWwz9piHGEXeZRGbcdRRT2rr
	6Ccg3BSLpKSCp49DQ4AOM9OgmCKxqdcdLc4Dc+5bo+ajl/5iijv7VxloK3m6IcKb22pCW+GpeHk
	SkDmD9wXzA8cKYQMdgVDEnrw+y1yl8LfTLMMck9hM+P/tUzmq/5soEQ9HyBUD1DXO1eoZ74saiT
	Ab4u+wy7V3AVp5z3IpGP6hKvp6mWk1giP9obG6vy1PS32QvMlKmHOxD9xpd4hvOTW2yVV2cgFco
	5qOXp06Fn8t2cg6vtO/BxNX3l/pqyT1Gv8yJstiEpYw3KpP2usjHyjxmIw86ZjuXFf4NV8jwg=
X-Received: by 2002:a05:6102:c8f:b0:600:a2:138c with SMTP id ada2fe7eead31-605a5053cdemr7751034137.23.1775639459794;
        Wed, 08 Apr 2026 02:10:59 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac4aa9sm15559440241.12.2026.04.08.02.10.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:10:59 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-953b15c764dso3425755241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:10:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCF7eVP/gEeFaLJvzgc63960uSVB0AoiaYZQIJbG3joE7wrwzHi9uhzSaFO2ddsNH4YyBa+spJF7G7@lists.linux-m68k.org
X-Received: by 2002:a05:6102:50a2:b0:5ff:fbe4:8a8 with SMTP id
 ada2fe7eead31-605a5050f24mr7833147137.25.1775639458863; Wed, 08 Apr 2026
 02:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222173225.1105572-1-visitorckw@gmail.com>
 <20260222173225.1105572-2-visitorckw@gmail.com> <ac7kP64nbhZzwbJV@venus> <CAMuHMdUSTdrv9Dswez-QrcFTPwnnFy7m5gc-ScMwBfQLDayQZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUSTdrv9Dswez-QrcFTPwnnFy7m5gc-ScMwBfQLDayQZQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:10:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3mkoq-u8wfTFZLUsr5m4zhydz6F0SCYousB2sGh1Kvw@mail.gmail.com>
X-Gm-Features: AQROBzB4597n0SM7aHpi6opYDxhH0NOyPaIyIfwdGHz1aqfUQiTn2K-ymQ4LNtA
Message-ID: <CAMuHMdU3mkoq-u8wfTFZLUsr5m4zhydz6F0SCYousB2sGh1Kvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] power: reset: Add QEMU virt-ctrl driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	daniel@0x0f.com, laurent@vivier.eu, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 11:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 2 Apr 2026 at 23:52, Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> > On Sun, Feb 22, 2026 at 05:32:24PM +0000, Kuan-Wei Chiu wrote:
> > > Add a new driver for the 'virt-ctrl' device found on QEMU virt machines
> > > (e.g. m68k). This device provides a simple interface for system reset
> > > and power off [1].
> > >
> > > This driver utilizes the modern system-off API to register callbacks
> > > for both system restart and power off. It also registers a reboot
> > > notifier to catch SYS_HALT events, ensuring that LINUX_REBOOT_CMD_HALT
> > > is properly handled. It is designed to be generic and can be reused by
> > > other architectures utilizing this QEMU device.
> > >
> > > Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> >
> > I think this should be merged with the second patch via the m68k
> > tree:
> >
> > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>
> Thanks, will queue in the m68k tree for v7.2.

Oops, v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
