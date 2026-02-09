Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E297339843
	for <linux-m68k@vger.kernel.org>; Mon,  9 Feb 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770623880; cv=none; b=VtbKyy4J412N+/TWmvC97osund9gopvztf5QqGo86K7589GTzFMSuF0BcMfb8SBGAu/di01oUcFJCUJwD9Libcy6HRjfLUFeHGYheO3X0Z4G0Ijr41DnEZS7UJGYLJQC8nmjDRQ+mY7DgEm0XqZmFpjnIbmSabbuiCo1C3QGYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770623880; c=relaxed/simple;
	bh=13PZgL9juvMZE/bL12LU87JCclz46Q+nyA5P8hWaysY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h260O0XqGYtfJ4kMs6gj9dRNpzZywIaAENU0I54/iQV7zP5BmhFDzV8zOAMzoKl26UVEN6gyYUjrIxMcTyn2Krdhl9Lb8T82ODynZ24PnJ81xNWaH083eAm/Aw3bx7eKS5/Gt8K0le9aKJQCXmvVAeXGR9Qq1A4X/lHsmodpEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56367a388e5so840970e0c.2
        for <linux-m68k@vger.kernel.org>; Sun, 08 Feb 2026 23:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770623878; x=1771228678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4D/rUfBgEbHjBEA1qwbU74Nk1aEVnneXDJbowEUMBT8=;
        b=HhKomd4sI+CZhHLweBYPZkP4AaOy7+8s/dfcfC76lFBF0j3Q9qB4FqnAFTegkZDKUy
         FIPEs1PrDKakEqW8J9pRHpoFQm4VcxG+Gpi2c0r1t63dHSJVig1OITaUgOuE1RHOMlRy
         DweyZFxLiZgHOUfnS2wgIbnYRWPsr8SV60ULnosM1/KnLoAEXCEWSaxKLAH1oZyJ/znu
         DHKMNrp4+2J5m16jZtFRPo8Tk7/ljSqruO4n5slpWmhI7resMeQgdwY4Xp8A34zBiURy
         KonNlBlz/PsMpbx+bNK8S2D6+wBiRp0t+VteNSbi7uiq5hWjtlgGPBdPhHILy6sphml+
         8Z9A==
X-Gm-Message-State: AOJu0YwbA0TYbVt0aMSG93rAeo6d79RslNlUmnpvbFB4f/EYvqkxIz4V
	LooIrbuKiAWzwq+MfLfVbKZPZIcyx+ykFYSusGUO3hxadvYohLjDVjHAJ2o5QJgj
X-Gm-Gg: AZuq6aJYg012sEMbkSwwybhXX71TNKH9la84OJM/LIuI0PE5wlQR4Cjg6NF30g2iJTE
	ahbNXMujvezG1txc8HgNdreuVFalLjmrCfiwR+mgysRMCLUCJSLWIoIPhdtVAhb6rVmjK+pzUvf
	EChxfa5K6G8wSPkc8Z4vc+CC4TEsPq8IOYJ13fGVywn4Db0BKZUcluDK1j3lcwr0m9KlB4S/a5H
	UtCpbEOO3ehK6MySSiXZUgJSliW5wM/L5ZbHHPWyivHjfKfTonjS0binfLWRtPkZazmGngnVEOM
	8KCG8L9mSnRo7ja9yKAyJb+EJqurXw0wEjcBHSSTV63HtEoHO5ukP/HMW4A/PrhWz+sQrTNWOUC
	Z/0sOrrS44FkSmD3kbjlxLQbvg1y9Js8WXYaaEVbt/q876QqwxkQjJUHRp2Zyj+nTkHk4jILY0j
	lktsqWF7u74WtjKw7Vl9rmFtYypZmMcMlCvtqQemzWYwMU8asV
X-Received: by 2002:a05:6122:3c4e:b0:558:251:f0e8 with SMTP id 71dfb90a1353d-56705fd05c1mr2354150e0c.11.1770623878093;
        Sun, 08 Feb 2026 23:57:58 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-567073123c4sm3689738e0c.7.2026.02.08.23.57.56
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 23:57:57 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f178c83a3dso679180137.3
        for <linux-m68k@vger.kernel.org>; Sun, 08 Feb 2026 23:57:56 -0800 (PST)
X-Received: by 2002:a05:6102:26d0:b0:5ee:a3d3:39ec with SMTP id
 ada2fe7eead31-5fae8ba7ed9mr2144888137.22.1770623876657; Sun, 08 Feb 2026
 23:57:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209005212.32370-1-enelsonmoore@gmail.com>
In-Reply-To: <20260209005212.32370-1-enelsonmoore@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Feb 2026 08:57:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPX_ynhX_t8GtB7eRqF_6W4BwqC8w7SRpro-1Okxd70w@mail.gmail.com>
X-Gm-Features: AZwV_QjWJpSBZb0k6kXBVmUwqWQVDJxSuYpk_vCif3y4EA-71mYU8BrddtYWH5U
Message-ID: <CAMuHMdUPX_ynhX_t8GtB7eRqF_6W4BwqC8w7SRpro-1Okxd70w@mail.gmail.com>
Subject: Re: [PATCH] arch: m68k: remove incomplete, unusable Apollo hardware support
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-m68k@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Thomas Huth <thuth@redhat.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Kees Cook <kees@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Wei Liu <wei.liu@kernel.org>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sukrut Heroorkar <hsukrut3@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ethan,

Thanks for your patch!

On Mon, 9 Feb 2026 at 01:53, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
> The m68k architecture contains very incomplete support for running on
> Apollo Domain hardware. There are only timer, console, and framebuffer
> drivers, and no storage or network drivers, so there is no way to

3c505 Ethernet support was indeed removed from the kernel a while
ago, and upstream never included the Apollo-specific parts
(CONFIG_APOLLO_ELPLUS).

> practically use it. It is not even capable of rebooting by itself (see
> dn_dummy_reset() in arch/m68k/apollo/config.c).

I didn't know that is a requirement;  one of the advantages of Linux
is that you never need to reboot ;-)

> arch/m68k/apollo has only received tree-wide changes and fixes by
> inspection in the entire Git history (since Linux 2.6.12-rc2), so there
> is clearly no interest in completing support for Apollo hardware.
> Remove it to reduce future maintenance workload.
>
> There are no uses of the removed <asm/bootinfo-apollo.h> UAPI header or
> the constants removed from the <asm/bootinfo.h> UAPI header on GitHub
> or Debian Code Search.

Seems like you missed https://github.com/geertu/m68k-bootinfo...

> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/m68k/Kbuild                             |   1 -
>  arch/m68k/Kconfig.devices                    |   4 +-
>  arch/m68k/Kconfig.machine                    |   8 -
>  arch/m68k/apollo/Makefile                    |   6 -
>  arch/m68k/apollo/apollo.h                    |   4 -
>  arch/m68k/apollo/config.c                    | 240 --------
>  arch/m68k/apollo/dn_ints.c                   |  50 --
>  arch/m68k/configs/apollo_defconfig           | 595 -------------------
>  arch/m68k/configs/multi_defconfig            |   1 -
>  arch/m68k/include/asm/apollohw.h             |  90 ---
>  arch/m68k/include/asm/config.h               |   2 -
>  arch/m68k/include/asm/irq.h                  |   2 -
>  arch/m68k/include/asm/setup.h                |  32 +-
>  arch/m68k/include/uapi/asm/bootinfo-apollo.h |  29 -
>  arch/m68k/include/uapi/asm/bootinfo.h        |   5 +-
>  arch/m68k/kernel/head.S                      |  70 +--
>  arch/m68k/kernel/setup_mm.c                  |   9 -
>  drivers/video/fbdev/Kconfig                  |   8 -
>  drivers/video/fbdev/Makefile                 |   1 -
>  drivers/video/fbdev/dnfb.c                   | 307 ----------
>  20 files changed, 19 insertions(+), 1445 deletions(-)
>  delete mode 100644 arch/m68k/apollo/Makefile
>  delete mode 100644 arch/m68k/apollo/apollo.h
>  delete mode 100644 arch/m68k/apollo/config.c
>  delete mode 100644 arch/m68k/apollo/dn_ints.c
>  delete mode 100644 arch/m68k/configs/apollo_defconfig
>  delete mode 100644 arch/m68k/include/asm/apollohw.h
>  delete mode 100644 arch/m68k/include/uapi/asm/bootinfo-apollo.h
>  delete mode 100644 drivers/video/fbdev/dnfb.c

Apart from dnfb, this only removes code under arch/m68k/.
Is any of the removed code blocking further development for you?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
