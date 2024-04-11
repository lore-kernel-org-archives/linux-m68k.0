Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FE14AD0E
	for <linux-m68k@vger.kernel.org>; Thu, 11 Apr 2024 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712837449; cv=none; b=YvHufoMUpMNTk/nm7XUlqaKEeLWcgAQ2wTgPDrZagaJM72QUtGHvKfA4aY2N91pYVhKNw2HrLMaPlSBuhXVEVVrgQlP6BJcPbk3vKrW8abpEQoKwNxYg6Mg4nSBhb81c8WoCRZjooXFmTb9p5z1h4VTyhsFHUdBZmzF8d7bwjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712837449; c=relaxed/simple;
	bh=beKobJUX2QmbJ2Dat/dzVrXgvy1nTK6NOAmrFPT6FCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCH+Nr6c5oW/x5Lh2dGjYOooMOpTfHXE3I5m/fS2hLx5rfDGJTcA5T5Xa75M0N9IK6X819TYy28sM0tN5OQCgXmRkq2sGv3mem2HaXwaUDNnKQ35cFYdX4HVzvzF0tUwh3jpU1N5S2+ACekXxXj99RsYFiWuQGmBYRgjgYeXngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDWR4zhW; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDWR4zhW"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa3f0fcd46so2504742eaf.1
        for <linux-m68k@vger.kernel.org>; Thu, 11 Apr 2024 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712837447; x=1713442247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40RKGOz4iRvB6A9MNjyEjeAi9bIYm0VhTZMAi0D5ow4=;
        b=SDWR4zhWIqyFSHNMQCjMGjS/VVnyPwy57wXK2N5+PBzE+RLF6w/YNOan4QlQL31pZ7
         eg5GCz7QnacX6CzQ0l7HiQlOVOmlLK7f1LKxlP7QNf42FdI6x0wpnuhMWZdKCX35bBcp
         Ma8R+yda0+vF0SKq7lPh3IzJTWsYeVe2Ifn2+gPejoKSXNchzDlf/jGaAHKSJMm8d7Xd
         0N1yl6HG+w7pwxSMyx4rEqtLTkgeC3ZO5cd2t5a1NLY4T3ITGWjYRE2GYohWMPND2eZi
         xxUwNCAX7T+OKBiFn53L7tdi5qOdFGAmeiX0+7NGgRi0rLDhZjjLtk6wKrGBkqcQ7bZy
         +b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837447; x=1713442247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40RKGOz4iRvB6A9MNjyEjeAi9bIYm0VhTZMAi0D5ow4=;
        b=ghCeWam0DB7GI/jOaGo2IZoknt7UWqKnyCnLjI3d7WupeHLDdgSxk8w+260KEMcm45
         MgXjrYY/kqtCXP+AiqNHH9iHkvFJMPFDuT4JzAA8kyws6zFfj+A/vO+k/ldUhdVSSmzz
         3AVgtldQHkiK5qji/AcBKg7L6AeHHK3166xSBd9IIRJowNYddQ3yYa9PrEw0QsGXuluE
         X1amqVY1QlC5aN3qgcKrloyzls+05+pPrpn9IZo4AR5nMcqNz4y3rCdH/fsb1AbUbuyO
         vGN+xtG+jI8ggi0T9xJ/qcD3dEPFJ4Z4TiQeToNwNApJ6ggYcCabAGAFqik6BZr77Ezr
         TBHA==
X-Gm-Message-State: AOJu0YzcebCmBgWMqhm+7/zjfJslJxibTbaFWNISdkB1wOnyuKKL6ZdT
	9OeqtRNU3u5HCMZBmaYBSwTOjVh/3xUnH6kZFcJe1zXhCMXBkhkbCczOpQ==
X-Google-Smtp-Source: AGHT+IH4oeJOinHif1AEbnTgRFL5PTG/8pV4dYkfbr8q4EthXyttTeTU3E8lVvJuQD4leLY7OhdgZA==
X-Received: by 2002:a05:6359:498c:b0:186:2a96:a5b9 with SMTP id mv12-20020a056359498c00b001862a96a5b9mr6931921rwb.6.1712837446663;
        Thu, 11 Apr 2024 05:10:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bw36-20020a056a0204a400b005dc507e8d13sm812404pgb.91.2024.04.11.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:10:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Apr 2024 05:10:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org,
	Finn Thain <fthain@linux-m68k.org>,
	Al Viro <viro@zeniv.linux.org.uk>, stable@kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: fix spinlock race in kernel thread creation
Message-ID: <1698da3b-ef5e-4f34-8b3a-868e6e110743@roeck-us.net>
References: <20240411033631.16335-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411033631.16335-1-schmitzmic@gmail.com>

On Thu, Apr 11, 2024 at 03:36:31PM +1200, Michael Schmitz wrote:
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
> Link: https://lore.kernel.org/all/07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net
> Fixes: 533e6903bea0 ("m68k: split ret_from_fork(), simplify kernel_thread()")
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

With this patch applied, the problem was not observed over more than
1,500 test runs. Without this patch, the problem is seen roughly once
in ~100 test runs. Tested with qemu's q800 emulation.


Guenter

> ---
>  arch/m68k/kernel/entry.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 9933679ea28b..681c008270dc 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -446,7 +446,9 @@ resume:
>  	movec	%a0,%dfc
>  
>  	/* restore status register */
> -	movew	%a1@(TASK_THREAD+THREAD_SR),%sr
> +	movew	%a1@(TASK_THREAD+THREAD_SR),%d0
> +	oriw	#0x0700,%d0
> +	movew	%d0,%sr
>  
>  	rts
>  
> -- 
> 2.17.1
> 
