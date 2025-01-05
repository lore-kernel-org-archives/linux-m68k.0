Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE214B97E
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736074872; cv=none; b=rurCdB4+EPymC1xo1zURREMBqLv0OESklb3WeDnYPQSyj1Ykp2UVFPH+v9a1kUz1FUgQ9ffwtfKZj01+ueN8qzjfgjZRQ7LaiUcG2dEiwMu385LI4W8+n/EYr1otHSlx0RkJYPHaoTJMJH3/qesxqXcmZ8UhikYyhUlqEA5gDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736074872; c=relaxed/simple;
	bh=JCgsH9Xvivb9REoRqiNdE1IBl65mZv9uKxDL3qsJy3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPE5BYIybm1f+1csJpzuW/zZFRn8q/15M5ARd4ZoE+m76ZuceYRNbUHmigt5ooMBRoPYvlfU5GwkJO0e1OvKMZBjkTra/w9LFRsf1iSXvRVb7N/vEg4RuWVEjtl0ifEjKORuZHng+1o2Jbbrbw63+h6OjlcvgP1Y8BFjZ+WB2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=bZ5/pN88; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="bZ5/pN88"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f441791e40so15550441a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Jan 2025 03:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736074868; x=1736679668; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xzbwogIPqUy5J23ZOiRuyVOj1SkOLdIaIWO36Vc8T4=;
        b=bZ5/pN88HwZAtdneeJOaoNlwBTTkoG03Xde2soN7z45t7+XtDiJ8rv19qdT2dYMWnu
         oQwL5cPo2R23fFDFRRG7cudguHV+ggovtXQ/u1wXCxANg/ciuxKPDoOaBIXx2ym3aV7P
         qjV7ymrmEBwOAn17Wt91TTSApD2t0CyMQXxKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736074868; x=1736679668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xzbwogIPqUy5J23ZOiRuyVOj1SkOLdIaIWO36Vc8T4=;
        b=egPKsJKQw8DEHLIW4ROy8jWj4oPpPzvrGszBoHq6W5Y42cBVEQepwdDT+ocQAD5ypg
         7tSf06o0vDgvK7sEIGmK8s/psN5purHWhCwt/NG986yQbD/pkW2TfkyHH4Ky9fmXfWYg
         RY1f0QgeuS0esyQgI+jIU26USRY7Wlo9nCqQWDEZXTvtzAi9gMWbCgzf5YnhPYxALapq
         7FkizT5eAzhwBhn8CbT8aa6HMWwXN606JgQxw6rJTLd/Q6e1ET8i9AyIrt+MamaX4eM0
         gjnBR1py8xfcipSZF4DCOYGVyBdDyUKhxYqU3507TJi4akK9f/y6VOq5CCdsr8qAPY05
         F/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4B830iuKgkXwxiJkt68RLQQBWbaYB+KIM+MtAaSLe8LH4NacO22HQnKNOHY6XdG8K4h3DrRHaNn8Q@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzXxFDmoZ11vJ443Qje3va9G8i/1CarhuW0CsMsHVtq7jFuI7Yo
	Ob6R/FWaCkgk2XT1VnXC6rR7A0sv7tlEkYP4XF4o5lJIegrI95IJm//jgJIOXrd28CmQBsSKWt2
	n1aJOhJS4TcGX3ai6B9TMHlerzQr/vlBRsxDAnw==
X-Gm-Gg: ASbGncugeZs2y2jhjIDDY0nAnc6T9F4yEJTZCpvreBttg0DMmTdH/ILWWgkZTmJupHZ
	s+A+uh/yj9j1Fp8QDeyxF+XpITD0A/XIH7b6tM2BmULCkPXb7dMcSQwwDBU2+Q2G8xTOXrTA=
X-Google-Smtp-Source: AGHT+IHNU48yYzwjR1TxmIEGPvSFiIAamyPboAuKF4fzJ3ZJxGptBbwZ8UpcL6L5fqgkrs7vim4osSKRsAKhLx5im1M=
X-Received: by 2002:a17:90b:5347:b0:2ee:3fa7:ef4d with SMTP id
 98e67ed59e1d1-2f452ec37bamr81366747a91.24.1736074868223; Sun, 05 Jan 2025
 03:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
In-Reply-To: <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 5 Jan 2025 20:00:57 +0900
Message-ID: <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Finn Thain <fthain@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Sun, 5 Jan 2025 at 18:40, Finn Thain <fthain@linux-m68k.org> wrote:
>
>
> On Sun, 5 Jan 2025, Daniel Palmer wrote:
>
> >
> > What I'm thinking:
> >
> > - We initially add passing of an FDT via bootinfo for mmu
> > - Add support for a generic machine that can boot almost anything so I
> >   can bring up my new (to Linux) machines.
> > - I will migrate MVME147 to device tree.
> > - Some like minded person migrates a machine they have to device tree.
> >   :)
>
> Interesting ideas. I gather that you've already done a uboot port for
> MVME147, and I guess uboot could be made to work on other m68k
> platforms...

I have u-boot working on DragonBall (68000), my MVME147, QEMU Virt etc.
So the u-boot could be made to work for almost anything as long as
there is a serial port and a timer driver.
On virt I take the bootinfo QEMU creates, turn that into a devicetree
in u-boot and then pass the bootinfo and FDT into the kernel. :)

>but it may be easier to add your FDT suppor to the
> already-available bootloaders on those platforms (?)

I think adding FDT support to some old crusty bootloader for the Amiga
or something might be a lot of hassle.
Like I'm not sure if I'd even be able to setup a system that could
build it if it needs some old Amiga C compiler.
That's why I think embedded FDTs might be needed in some places and
leaving the bootinfo part as-is.

> > - Maybe embed a FDT for machines that'll never get a bootloader that
> >   supports this and use the machine type to select the embedded FDT and
> >   move all of that stuff over without needing to mess with bootloaders.
> >
>
> I like this idea. A few weeks back I was recapping a Mac Classic II and
> thinking about how I could boot Linux on it.
>
> Pengiun (the bootloader I've been using) can be expected to fail with
> "68020 has no MMU. Aborting boot...". However, the source code for EMILE
> appears to have ample support for booting a nommu Mac.

If you can write some code that loads the u-boot binary into memory
and jumps to it, getting u-boot working on the mac shouldn't be too
difficult.
I might even have serial, ethernet, scsi drivers you can use. I'd
rather port u-boot than fix up a bootloader unless the bootloader has
some special hardware setup magic that can't be reproduced.

> Most of the drivers for this logic board are present in Linux. Some are
> platform drivers, most rely on bootinfo to some extent (particularly
> macfb.c and misc.c). And head.S also relies on bootinfo.

The platform drivers should be easy to make work. I need to look at
macfb.c but if it's anything like
the DragonBall one it'll have hardcoded addresses and stuff in there
that need to be cleaned up but it's not impossible.
And if we do this the headers with the MMIO addresses can go away and
a lot of junk can be removed from arch/m68k.

> Maybe the easiest approach for head.S is to neglect support for both
> bootinfo and FDT in the same binary, so it becomes a build-time choice.
> That way, a first cut could be a new head.S that supports your "generic"
> platform, lacks bootinfo support, but has an embedded FDT.

mmm so have a different head.S for a generic FDT machine and just pass
the FDT via a register like I'm doing on nommu.
I don't mind either way so if a maintainer decides which they'd be
willing to merge I'll get that going..

Cheers,

Daniel
