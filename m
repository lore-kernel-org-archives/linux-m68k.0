Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC63AE191
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075601; cv=none; b=CBVrzXr7/xHAJhwzIYej8F/1eJMmHfELuM8mhZ5/t+7vmkRhOLxK+9kWjPeugOgzpnP92jS4FVRCA44iIY0dq68CwmQlPVhU/g9PpSk7gUIg1xXZqfKCvAgRvr1xX2lnpVn7bKpM0q4rgSxHrk+xJal3GBgnFxjNX44Su4ySOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075601; c=relaxed/simple;
	bh=28QyJjbyjZeUJ+wyftjAtIoISEcj3EZvHKoSQjTW3+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/T4DI7EgVlQeqCeV+xF29X8rxr2SDGM5LzHXg3P7YeTG95DxrmTy3H6EpF86Ck9SiB49VxHOEsuQOMsPW0DYFQsckQ1uQyj+0Ki/1FWDWoyTd2fuYhbyRs9deQHRzgeOvdgYSN2ftKpJ6UlXQfWsuIP+fVuBLUt/HihKO1aJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56eee0ba462so2818946e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 03:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075599; x=1776680399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPZdxz1u7ZIBqJLL1PcAHjT28ZRbPEEYLoW5ZWK78q8=;
        b=N1QlDd9N7QPpQkYrV2tBDspo+Bqmjm+JZkgT/dYnov26diQleGG0qOwQOgy9FlNph4
         SgHGwnyMD88y8Bs1c9L/gexHN+y+Pqmal8rRQmwWVPQCMCZfQ4UkucDAMKGJsyN6ZCkR
         Favah6ewXa8ZIl0IzmSe7FHn4nuDmdRVKRSAupJGr85XyJ3/jcZoF3Uj1hA+Dq8dhai6
         n9gJBOHIFp1uF5RTwIUUfctATZEqXFKORK2mPNe1ZVi0w/8zOPUL3olERIsHLnOaYaPt
         xaNr+Nf2s1uHgdUHpnDfa6xOXoWLj6VHNMXGjw/c8xDYmOnTzPtzRH4H5YZhvW+dFmx/
         riBg==
X-Forwarded-Encrypted: i=1; AFNElJ+x0kx1ChcG1WTOuFDE4JH92wY3+B2rkqhwC8rqV9sxp0cV+P/XouTfpPjy79cdald+VVwx48cPYzYw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxmDwWIGtXWlc8XSstzdXr1Jp9M25buxVf61zmwPS97dQR0UPAE
	2iugSVjNVE/mh48p2UyJGx9rRnZIBklBCUCBqXxIKm9HWLKyyay7zcELigaw+rli
X-Gm-Gg: AeBDiesGnVrMh78iUwGmpN0Nt9ruoyLngHvZRPUY8v9+exrvabE7HR4O0oaNWr80HAv
	W6FRLLIonWRqKeVlBId/19hqwy9nUUt/EhFBnNvcu/HjlpKW0WiuSagKCRFHkSsXRTfLbIz9RDD
	+Ie5wYZs8ThGiy81l3O0pXQ1Lhp6gdrhaELJtLk1Xtr8u4lIxvPralLjpUe94gqphs0maOR/Y6N
	OhpU8/PJl4+7UHD4472n6CucSxKeS3mFdHPnL2fQpgwOQRcqowA7BTxPTUp0b/8wdGwnmrrHRXe
	wG+gSDbfy5WiBa2d7Q6zLyVlfApLcsMmzmd0XjY1C8665MGbpOgoUu8HGLFikoWvPzts0z+CBgH
	2PbSiureyknLjjsHnHrdQZuTt2FbXNvfMaRULot9e8nvESA5F0ObeuKC9v7D0yP3+R6sQp4IuYf
	t8hHXpU6JIz6lLLFsm5iT5fEG5/djE3oe9YddFxoD9iw28ZOgow9wdqg3x6wZQ
X-Received: by 2002:a05:6122:d19:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-56f59038c7dmr1641048e0c.3.1776075599016;
        Mon, 13 Apr 2026 03:19:59 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f6a97b5ecsm856901e0c.2.2026.04.13.03.19.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:19:58 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60fea0840f3so261022137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 03:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/QE/89r0dhvP0dxLKT9/6HpydzVTBONV+EsXmRlVHVjUcXqK+0Pfsi1pWHK0cf/EsGlxgihDyR0UHy@lists.linux-m68k.org
X-Received: by 2002:a67:c50a:0:b0:608:cdd9:2bcd with SMTP id
 ada2fe7eead31-608cdd932d0mr4295352137.15.1776075597965; Mon, 13 Apr 2026
 03:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412211952.3564033-1-visitorckw@gmail.com>
In-Reply-To: <20260412211952.3564033-1-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Apr 2026 12:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6ZqQbofuXb7s6TpDWkyj4yDR-gvOVHVn0FfAahV8V4g@mail.gmail.com>
X-Gm-Features: AQROBzCazP8swmPqp25ZtXfW2wKEeJuq4VjtnjIDuNuOVbsgdU63ePr45b0CQfo
Message-ID: <CAMuHMdW6ZqQbofuXb7s6TpDWkyj4yDR-gvOVHVn0FfAahV8V4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add QEMU virt-ctrl driver and update m68k virt
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: sre@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	daniel@0x0f.com, laurent@vivier.eu, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Sun, 12 Apr 2026 at 23:20, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Introduce a generic platform driver for the QEMU 'virt-ctrl' device [1]
> and transitions the m68k 'virt' machine to use it, replacing
> architecture-specific hooks.
>
> The new driver ('qemu-virt-ctrl') registers a restart handler and
> populates the global 'pm_power_off' callback.
>
> On the m68k side, the platform initialization is updated to register
> the 'qemu-virt-ctrl' platform device. Additionally, the 'mach_reset'
> hook is bridged to 'do_kernel_restart()' to ensure the kernel's restart
> handler chain is correctly invoked.
>
> Verified on QEMU m68k virt. Both system reset and power-off were
> confirmed functional by invoking 'reboot(LINUX_REBOOT_CMD_RESTART)',
> 'reboot(LINUX_REBOOT_CMD_POWER_OFF)', and
> 'reboot(LINUX_REBOOT_CMD_HALT)' from userspace.
>
> Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> ---
> Changes in v4:
> - Fix sparse warning caught by kernel test robot.
> - Pass the struct qemu_virt_ctrl context to sys-off handlers instead of
>   the __iomem pointer.

Thanks I replaced v3 with v4 in my queue in the m68k tree for v7.1,
and will postpone my PR by a few days to give it some coverage in
linux-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
