Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644F823D1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 May 2024 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169202; cv=none; b=Pc+oG2xxnQUELyvk5478Nf3C6ktDMxv2Gxk5qFGuMMT5VUmA1FKNNS6X41EYQUg6MycQpSrehUeNJYIkEnoMsQP755hKK+ruIADkACy/E1LlF/BAkHhvXDD0+Yb9lPfTupI1MXXOoszDQxDRJzFkQRicy4EBNl1fwf7jJqDf3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169202; c=relaxed/simple;
	bh=n1V1uhQdR4bTMVaxcHPNrcmclOl5r6tzkBE6NJTqPcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ0FV7EZiILAKrECTC0n7p/Dp4mSIlyhdDgoZDXoZhRAcNAct8qvSCWLcDRFZr8Gtr6+j7b/5Jr3T4x8Stc6EHc+eDge51G2c8XBJ6fwKSdTed2XaHLqhS+b6+2+NG67EF6wLF9H5p5Gz6RPXhd/I9zCmpQ2E5XtiScz5g0+Kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61b62005f38so43972717b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715169199; x=1715773999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD9oz7WhSRlpFYY0azaWjrj222fb3xZEIcjA5ffUT8g=;
        b=r/fR2D++uKmZUnGhaNmRxI/A6RbMq3uXlPUu6ydGCug5XY+CGjXox+PZcZX2hu9wVo
         pPuwkH8o0Ugn7qcXbiswZtP942vRfPwDAtxSWNBLQFeNdUGtPcJTSVvRu02ICv2fHQqz
         4hxCwbmqSOuTFnGMFMp9Tv5Hq/XN/Va8hbvHoBvHxzp3Hg40phHlXkoX1QiUOXPJDwve
         28mRheResx7Np1/me7wqaqkQUlu8UxNa8MjvmZrNjp8wiYaBOvq/jJxzt/6tklQ3GALh
         ioOx3kgWVAu3ak3RjLeVUjgdPzPnOgBTXKsEG5Q+D16qf7XDHCkG08tcKkmbmTfL0TsA
         scoA==
X-Forwarded-Encrypted: i=1; AJvYcCUJfMVK2TWy16V2fHD3zD9AiD6oqXxDIRZC5NW+qa2fG9aFGKC15UuKVF1RJjirojKfbkU5QuagW6Fvldcw2EMlYTi066Hz3tixf5TjlvOO
X-Gm-Message-State: AOJu0YyhmiY67Dzp5AuWovPSLnR/VG5I8kCF3DpkGPqudfCe0aUOCFIM
	+ooN15G6SuwGRjyV0n5kvl68zeVZ0XVU1lgcQ6NCr5B4v4zl78LqwNCWSyhywb8=
X-Google-Smtp-Source: AGHT+IHN7rfmQRfRcdiFiPuRCmN3RjdhXFLPDkvp7zW2mc2YGEVNxTyIpm1dcJYzr374qcqz7pMWug==
X-Received: by 2002:a81:8486:0:b0:61a:e947:550f with SMTP id 00721157ae682-62085c5d608mr26638407b3.18.1715169199568;
        Wed, 08 May 2024 04:53:19 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id z79-20020a0dd752000000b00617ca37b612sm3237328ywd.91.2024.05.08.04.53.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 04:53:19 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-deb65b541faso4204101276.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 May 2024 04:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs0H12tbhEVdR8S2748Pq44txrJJZTwK5373T0pZKVAtX8qFUCjCDYMVgZBjSlT26i56bXmZAUJ3RluSUajbmYxZ5Dg1B7v0R5znD2OyTJ
X-Received: by 2002:a05:6902:46:b0:de5:a2de:9453 with SMTP id
 3f1490d57ef6-debb9d4ac68mr2555862276.17.1715169199216; Wed, 08 May 2024
 04:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411033631.16335-1-schmitzmic@gmail.com>
In-Reply-To: <20240411033631.16335-1-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 May 2024 13:53:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMXdMOOf5idJVinO7TUWDH+Gf=JXw2-=p87YBYy+xARA@mail.gmail.com>
Message-ID: <CAMuHMdVMXdMOOf5idJVinO7TUWDH+Gf=JXw2-=p87YBYy+xARA@mail.gmail.com>
Subject: Re: [PATCH RFC] m68k: fix spinlock race in kernel thread creation
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Finn Thain <fthain@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>, stable@kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:36=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> Context switching does take care to retain the correct lock
> owner across the switch from 'prev' to 'next' tasks. This does
> rely on interrupts remaining disabled for the entire duration
> of the switch.
>
> This condition is guaranteed for normal process creation and
> context switching between already running processes, because
> both 'prev' and 'next' already have interrupts disabled in their
> saved copies of the status register.
>
> The situation is different for newly created kernel threads.
> The status register is set to PS_S in copy_thread(), which does
> leave the IPL at 0. Upon restoring the 'next' thread's status
> register in switch_to() aka resume(), interrupts then become
> enabled prematurely. resume() then returns via ret_from_kernel_thread()
> and schedule_tail() where run queue lock is released (see
> finish_task_switch() and finish_lock_switch()).
>
> A timer interrupt calling scheduler_tick() before the lock is
> released in finish_task_switch() will find the lock already taken,
> with the current task as lock owner. This causes a spinlock
> recursion warning as reported by Guenter Roeck.
>
> As far as I can ascertain, this race has been opened in commit
> 533e6903bea0 ("m68k: split ret_from_fork(), simplify kernel_thread()")
> but I haven't done a detailed study of kernel history so it
> may well predate that commit.
>
> Interrupts cannot be disabled in the saved status register copy
> for kernel threads (init will complain about interrupts disabled
> when finally starting user space). Disable interrupts temporarily
> when switching the tasks' register sets in resume().
>
> Note that a simple oriw 0x700,%sr after restoring sr is not enough
> here - this leaves enough of a race for the 'spinlock recursion'
> warning to still be observed.
>
> Tested on ARAnyM and qemu (Quadra 800 emulation).
>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: stable@kernel.org # 3.6
> Cc: linux-m68k@lists.linux-m68k.org

Reported-by: Guenter Roeck <linux@roeck-us.net>

> Link: https://lore.kernel.org/all/07811b26-677c-4d05-aeb4-996cd880b789@ro=
eck-us.net

s/Link/Closes/

> Fixes: 533e6903bea0 ("m68k: split ret_from_fork(), simplify kernel_thread=
()")
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.10 (with above tags fixed).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
