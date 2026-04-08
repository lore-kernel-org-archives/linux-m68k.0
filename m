Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC52DB789
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Apr 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639557; cv=none; b=kLfhhR/xZQbMSBYGmFiomlgIFHzXxKcoMx54u4HXZrdP5XIoxXgaNT7QO4bUM8CXgqbzO0tMY6v87fLBXLuEmycrGZUHTtbdF/36hbxmoFL0L82FpY6BQGW3aoL9kGOERKTi0v+7YZt1V+9dvrlXoxM1XX5K0offPA7gLKT8D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639557; c=relaxed/simple;
	bh=Q2G7W1Or0owdtI91ZRcx6VNbMUQ8in8tYFieOZJhux0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GU3B9x4vkgDAe0e7WbYU/ov1+CqRFFFUdX4xxMYsMHT5NkgMjmWgInGzIlyQUktSfbiTeGdJZpqNmTaHgDXyE81iuAnkKsUq9vRFbaH8s4n65Hz6hGmGkoaBfp366n2YRA6xErBGST/XiHWWkhSu9HKErADJmFpcVztHdgLBiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a857578a8so2257596e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639555; x=1776244355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1RXcXFvV97L6lA8OeKNobEBQHOghflyQaM3zAQGEVw=;
        b=k9AZEOn+4JJoaFYjZ9qDwIT09QqW3glZVydVm/JyPYBjr/7mCNinXVHIrWLiZSu1pJ
         71PcK/TqAggsP5zW6Ytt2/HgJsyPgSETNM1IQ2CrhLDXdTtyZr0+NLaGoYuoyMVTUS7Q
         8AT1Vxj/G1Y3eGjBpUyk832t4ubOC6yKQZQl12bV9jq+qxuQYBu2bKMZI+BFZLaXfyLk
         fNs2mHt6k3O9rnAzMRazEoXJ2t0mJ94878mNfJvbuvERLsWRgI0n//07e1/gIJS8MZEx
         feV0Od9J24H4UEZNF365t5Cb3trFdk6Dn5XDtOKHiaTvMgkOmes3UfB6k3NiUL1b743i
         8vCA==
X-Forwarded-Encrypted: i=1; AJvYcCWNPfNIm2+v3pyNQrvX3Mphg7jNMcuzmmh0vDGXXEpFmtiHrgOhtLK4HzTDQIVuUslFeXIpIuMbbJ5v@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwRBk86LS28ScXnQygLOetadY2KbPCULhMvwgSSpd8IfH+LcqUL
	HCQq9zWFHsWIxP8ec6/V4BUi/7/jpHuD63X7lErS22MxHI7dZiirjCZVuAw/NQ7B
X-Gm-Gg: AeBDietUn3s3rCM1q9G1Gf1IVtGb1S4mmmL4AJjDW9wzdz2sFzbIIoyoA8l24KF6gsJ
	cD1HlNGmHaYp3CQTgEhfYbmKkSWE4k6e72SyieTNfgweJfWwlcXJbuftcFs83XRbw0FvWurGIJc
	LlISHrUXBaL8xN55Q0o5oUcsR/t8Ym8rkEAXxw33gtNiZ9rNOahdWqrWy0wZMmU9lAmRWGdikCK
	G/wOX322spvk5bTkATQ7hlKlz2LMf25HugfqObTOkHyEvJp8dcjlIjMQTp8ShYI14sr5Lre0YBi
	pYTaCJhTSGzAwehrc9PswfxBRSTBeO+q/lx2/Y0yLeiT3zFSNQVRqWP66Zaob8fT5bzPtZvyTqb
	CsIvwyoa5R/yq7TWBdxFO+KMDwjEC408g1aevkE9Jl2jSTDyYn8214SJZBxyKTMlx7gnsS5B+JI
	NmsBolmGs5htQSj6exMr/xrYAgarTp+2WxgxvYU8Chczgu2F+aLstBXYwsfeyi
X-Received: by 2002:a05:6122:1817:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-56ef2629433mr5004687e0c.14.1775639554730;
        Wed, 08 Apr 2026 02:12:34 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bcd5ca1sm19618862e0c.13.2026.04.08.02.12.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:12:34 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ff05af29b4so1990453137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 02:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCQyzFP0v9pWFc+967vDJJuO8n9THZ8yk2KqFuX/smT67UNTTBKpjQKklBgEPanO+qR48qWMXIvFVK@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6443:b0:602:8c16:b24c with SMTP id
 ada2fe7eead31-605a4fa88f4mr7481687137.19.1775639554157; Wed, 08 Apr 2026
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222173225.1105572-1-visitorckw@gmail.com> <20260222173225.1105572-3-visitorckw@gmail.com>
In-Reply-To: <20260222173225.1105572-3-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 11:12:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW11i=un_A=JPas1k-jROJg9rhgSPVwbuvpZUBUsc4mVA@mail.gmail.com>
X-Gm-Features: AQROBzAaKops8_lV7H3mM8_tpi90ZdHT60MZINI8ktN2lE8IabpY_mK044Ym5uc
Message-ID: <CAMuHMdW11i=un_A=JPas1k-jROJg9rhgSPVwbuvpZUBUsc4mVA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] m68k: virt: Switch to qemu-virt-ctrl driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: sre@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	daniel@0x0f.com, laurent@vivier.eu, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Feb 2026 at 18:32, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Register the "qemu-virt-ctrl" platform device during board
> initialization to utilize the new generic power/reset driver.
>
> Consequently, remove the legacy reset and power-off implementations
> specific to the virt machine. The platform's mach_reset callback is
> updated to call do_kernel_restart(), bridging the legacy m68k reboot
> path to the generic kernel restart handler framework for this machine.
>
> To prevent any regressions in reboot or power-off functionality when
> the driver is not built-in, explicitly select POWER_RESET and
> POWER_RESET_QEMU_VIRT_CTRL for the VIRT machine in Kconfig.machine.
>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v3:
> - Add 'select POWER_RESET' and 'select POWER_RESET_QEMU_VIRT_CTRL' in
>   Kconfig.machine to avoid restart/power-off regressions.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
