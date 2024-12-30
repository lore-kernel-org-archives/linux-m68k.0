Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C661096F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735548825; cv=none; b=jCFBMuRj9RdtCZ5y+yu42x/+7NlMhEmsJuROvT5mgX28ezhdbGCZe13zuyDcsJFCw995h865vlyL3IoAhBdF/JajahfgdyT3KiUElrb/WORsP3lzIwHtwCA08/5HflS7YAz0I6lmNREn+IVo9akR5WGP1EJziqPXU/FkExxqipE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735548825; c=relaxed/simple;
	bh=tpufIMUJMo4LJnps7FRsWQVjUgdzmskVznrwbO4o1Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsEOOVlIFWdYqaizpM8XwwjVVPNvA+VlE/7+lXWvAAzZbRRMEkKEvWMUyhU2anstj0UVkToGELdi4wFRpmRVsl4HriMWksWK/Wxmum8WoEjwbLSGdwP/NtCcwh5OQ1fiuurOEFt2HQwtKU7zcAeICw+f85fCMIoNrVJdXWZ63/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-518a861612eso4128539e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 00:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735548821; x=1736153621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTE+tGULyubkwv4JEUfd0/vW2ZHf8AF/8iXBbgSPl7w=;
        b=kYwZoaU0LNBdN7oKxqdUxCO11OtGq8+BNqGAja9ywko0XFKUcG+YiEOpYNqFFI1XAX
         RrX9MmPq/p0wdarQPxN785Z3snaTd7TzEchnY39XVgVOCB2vJY3WBQ2h4BXhc/gP84Bi
         N1m9iHOYhtHoBC2iITwuw8rJsebHSDDEzEYT0LqoPCHuBPHw1eS6QjftAweqmDCccrEY
         ZzixMyN52x3yqC3LBdSfmqJTOyzOvFvNd1j2AH17WzbDy0tMiRQbS8dZ/2mBca5UK1FX
         5HKo3XaK1iWbxmXcvxhX4qmOChKrbBvUIMgYcGHoPGzypiJxD9e/NikUrlh5MGvDdfnH
         Yr8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2EKyGkF5ly53BZcH1hpcvJRg4/ye4fg5pg4luoOtE57bMiqZF5A89qijCmzN+7rxkqHv/ukGHLqqd@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx13z9mGP7nf3ibImoDxRS96KMg8QwXOnKZVOCSFX84gyB9cqZV
	g2y6PxBSUBZEcyDxBFyLy2lUNCotC9aGm9pFrclaa8eokiYJv3okX9jMmWTn
X-Gm-Gg: ASbGnctiTyt8WeXrUAs5Qu8YBFNF552T1GCium2K1ec81h/aHjAPcp4wpCEWyQi1wXh
	uKFypVfEUMiwJLADNbmM34QM0cHXEDJNlzDZxNlCjY9wN7N3zEM3+CjyFyktdbQnoffWRnko/BE
	QVaeroch8eEpjXuKPO/Q2fVY/flO43k+Sz6QQVmTzXFh+G9ACFLniuhLfndL9Iw4dY/DPaSgp1a
	spqEvU0pQF+/F5XFDrjOLBPLo3lSFp5O39TltGLPDvfsJC5jkfjNDlN0R0jVCeq3zWaYg9G49as
	ZdZfyNGF2kqsBnZFYDn3VEI=
X-Google-Smtp-Source: AGHT+IHB/se+bYGOtScPuWlhOt7TOIOq63eS1RL5s0LpS/vTEo+Q4K2XptTu+HZmrGRWRCQfUX3jKw==
X-Received: by 2002:a05:6122:3484:b0:518:8915:89ec with SMTP id 71dfb90a1353d-51b64ab5c8fmr30211321e0c.1.1735548821158;
        Mon, 30 Dec 2024 00:53:41 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bad50dsm2386032e0c.12.2024.12.30.00.53.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 00:53:40 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51873e55d27so5054693e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 00:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFrGtHalTLUcDTyAiX2rBWOHY8o3yqnmlFbWvJtlbf12S/zOCp6g6+CDYx2PerWierVQjFqQvDQoIC@lists.linux-m68k.org
X-Received: by 2002:a05:6122:608e:b0:515:d230:f2c6 with SMTP id
 71dfb90a1353d-51b64c3cca4mr29130718e0c.7.1735548820772; Mon, 30 Dec 2024
 00:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229134848.0a1d9719@windsurf> <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
 <e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org>
In-Reply-To: <e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Dec 2024 09:53:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
Message-ID: <CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Mon, Dec 30, 2024 at 9:30=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> You may want to try,
>
> $ output/host/bin/m68k-buildroot-linux-gnu-gcc -v -c /tmp/a.s
>
> As that will print the full assembler command line, among other things.
> E.g.
>
> ...
> /usr/libexec/gcc/m68k-unknown-linux-musl/as -v -mcpu=3D68020 --pcrel -o a=
.o a.s

Thanks, so it fails when -mcpu=3D68040 is passed to the assembler.

Oh, I misread "caar" as "cacr". The latter exists on MC68040, the
former does not. However, that doesn't explain the failures for pflusha,
which is supported on 68040.

After disabling CONFIG_680[236]0 in the kernel config, I can build
it fine using the buildroot toolchain.

Conclusion: make sure your toolchain supports (a superset of) the
CPUs supported by your kernel config.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
