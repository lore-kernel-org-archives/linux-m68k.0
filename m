Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E853803C7
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354349; cv=none; b=aJMahRsA/vzAFHij8+NLdIw662bB5p6muH2o8TzmCWMJK4ukWxdU0twIFm3Zj454OG0NuRnQF5ubyhxZ98/c4gaEj2p4a/8ulVwvlVr6XP+Q4d57KhoTXtqvobPNnxsB6bwqb3uIieNb+T1WC2MiCdZO7UIPgkXSElPZDG+Gld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354349; c=relaxed/simple;
	bh=6HmBU3g9zX4/EeGKq0T5oS5ffeyl9I0wrf9IE3dRnz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1ZFs1BuB0tp55u9Rchybd/WiixbF6CXG31qqjBFP8rua7b4HcqtWK62telddWaXPxyFMwflQ+vCp5KgBR0KbQDZCmL8vQb028IJzgNmAwak8qsVsKlDVj/vJwLiWicRlHc885PqvL/5pzP0Pzrsp4DMPEGzKZgwcQ+nbxNbv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so381548137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 02:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354347; x=1786959147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iWpKryeVmKmKhBYQWps9hhi3GQAPoNmmBMB/3gK4ivo=;
        b=O+3isHQs0HdAQulTTMOfdb7hPdi3Q0n2WOIEUx77r+ogn/bCliTmPVDxbDLJS9HLWv
         5v6BRwpYwGYpCi/8z7L52aC8YHTx6FXW/P80CKpO4dK2wx/8qgKarkChw3+MGpWrjiwj
         6Kh6Qr8x44FtLy8A/lr/Bsb1QeFcxvjq98wEcmgqTMscsGp/WK5i/EH+Ya5Fnr8J9XE4
         x07zQQtLGSH8gnT3+XBy3L0gHmYQ9O+ArozbADQw0LaXDySZSRzvXa4n0DFm4XLmiuKe
         tVZPIJrFpenIO3g75R/4BDQNZEfxSdnGdYPr1hHGXGk5GKxt+AkQSvGf0Jbpc0t25IUc
         ZSVA==
X-Gm-Message-State: AOJu0Yy6K+OEzX3BWobZC+qVBOuZ+hoAcSKWoEBjxffqYNns8grkww1J
	zRnm5nex58smTyCj++TghsgEEBOy2IaBtmxyaS8egFbTxFEbQsnGuVgzYh02Mr15
X-Gm-Gg: AR+sD10nph+n47wZki7m4NRWchiNse/t1hX89qZlnfxeLZadAT+aUd2Yc8S6D7ArhuT
	2EPOBvDuIKUpmGuJJMuMK+YWFbnmUK35SUncWkCO2tkLrxMhIyw5kqK8n4JDA7M7dzJT2jqSvZo
	pt5ZSGQ2FSz5UxqGaywakUWi6sDs3rc6uRy1bcSjkQGasWf6wVZ/r95QP9YxnpV+fkavhdXE29u
	AoSh2iAyw1T6SYsHbPA2N6o3qd18SLdDKwtCtsxG9k/BG0CG6HKM3KmqeoWK1FBoebcvsmAsw6f
	il/EaNyUxOGTeAram1j0jhhJG7Xh91a2g0aEZ8pvCd9rjYv1LmGz8wuJpBALlAESD8dU8L8vP1Y
	TyCP19J+6nMSKh/eRk5HgRZptB49sXW4kA1HcPripgJNcZ/BZIWXREQhHunms+2gFihRVaIMydO
	cUWic+GSqM500wNjVH1PfIgL/R1lInkcNXKuaKXUvGYDIJgzr62kk+09tDj3FQjpGnitoSQx/3A
	V1a75iQLqUuXRULTX9K0OO30B7B/Q==
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id ada2fe7eead31-7642d16f34emr5160084137.1.1786354346593;
        Mon, 10 Aug 2026 02:32:26 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979ffbdd8besm2479509241.2.2026.08.10.02.32.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:32:26 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so681219e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 02:32:26 -0700 (PDT)
X-Received: by 2002:a05:6102:f82:b0:745:7f23:a876 with SMTP id
 ada2fe7eead31-7642d16f34emr5160066137.1.1786354345814; Mon, 10 Aug 2026
 02:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723041055.47289-1-kmehltretter@gmail.com>
In-Reply-To: <20260723041055.47289-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 11:32:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb2+-poTFV28i5EtcSuxFuoPJnEdSoVm78LY_eeazm8A@mail.gmail.com>
X-Gm-Features: AUfX_myU115DT0o_o9ELAZmE-18Oi91D-b3dslXg2mJDQnwwyTH_vVEbtZhlP4c
Message-ID: <CAMuHMdWb2+-poTFV28i5EtcSuxFuoPJnEdSoVm78LY_eeazm8A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix backtraces for non-running tasks
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Thu, 23 Jul 2026 at 06:12, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> When no stack pointer is supplied, show_stack() starts at thread.esp0.
> This is the saved userspace register frame, not where a task was switched
> out. For kernel threads it points to the zeroed frame created by
> copy_thread(), so sched_show_task() prints no useful backtrace.
>
> Use thread.ksp for non-current tasks. It is saved by switch_to() and is
> already used by __get_wchan(). For current, start at the current stack
> frame, as is already done when no task is supplied.
>
> Tested on qemu-system-m68k -M virt using SysRq-t. All task dumps contained
> resolved frames.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks, LGTM, and does make all SysRq-t dumps look sensible, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
