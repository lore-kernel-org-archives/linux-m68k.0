Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086221B183
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431717; cv=none; b=DDmasw9RjHr9ujOUidRiAazRBN9HA9kjtRyqwUOG6pwyGhJZK9NXkR+fHySzxxR+2/3a2ds+M6l9rUfam+4dF7k6IyjvtbZOTl6ZV4LhI/LuVgVF9Mm+BUlKdikhfHW7aWx0zhTMq6m4HTg7YhXb3pkhDldQadeJHJCTdNBzhXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431717; c=relaxed/simple;
	bh=B6qG5ELju29P09aeWtg//nkuVWu7cmeEXIci6vguGoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsaPJRHhe8QtEwDemqqu8dI9vGIEF3INc1f1hKNmqleLLbdIcA+Hoe8/bQUChikQ4sR02QUoN5wHWspkHRPyJacsfVK0CcyeripkNlvouXO7BXROiUwVJUSGOqUArJLufkNsHigJLy8imzrkNkkd2+gBlXAMV5BmkBiBPqwaQSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Xp6I3ez6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Xp6I3ez6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso1664945a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736431715; x=1737036515; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyjaTzJ8SKrXkH1eLLJkEAmVYkqhG9zIzTl5FgUSnDI=;
        b=Xp6I3ez6NiSfi95iObUdv3v3FyWm+pSOcp4ALfmoRLBx+50ML9V3bPL3Ny2sF+XsnR
         JJsbKrLj5HAlhVIwJj2BDCltgFqZ4iJwO+esfVGGq0fAoSpbbU5q+Y4lShzESnKsSljJ
         puN2p4OGuKoA3zY2LPMqmgZU7Gop0G2fKjaTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431715; x=1737036515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyjaTzJ8SKrXkH1eLLJkEAmVYkqhG9zIzTl5FgUSnDI=;
        b=NTvlcta/zKqMlrPTwEMWnDF42+sLPm2gCLOiCYSpFDKYLBCJzWIOl1g/ACwSScst1o
         rK0ZcvgQqAUc2RbUXnwk4VfJyDurCIgCk/v4O4Pn2dUTfxpDcnBAu0qyJXo4FBcLtT49
         BEpu2ibLT8KoxBrdtYMdULaNXbR1Z2G0BAiw3bUmSa3njJFyFBP2EBSJXMoiV27kzDtK
         UpcQ2dj+Q9IbBc0YnD2Mk1DD6hHgWLQjMww5XCcyjWsV50OUH4OhTGCYI/Fct/C2jWKI
         Vbp6P5COEr6ajAiDfyVlT63PQhmGIoHxleeb3QzuO3fCPwn/5m/VKC75GWTNh5GsHboz
         kQtg==
X-Forwarded-Encrypted: i=1; AJvYcCXg6VNAk16pPnB06/2AswrQIJYoB47RtsjaZcqDx3GcT5O3hA9/v4Z2seZQMWPTlwQR7DzZmcMD9uhQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy2k2/uVBVtYPA9iBOC+/z0R+NKPT4R88csKw1hhdJJG789SlNi
	I9pYeUxbs8XxP/y9/a+6XmQjY2lrLmXMGeHnSCooGtCwUWcOt5FKk9y2rfYX+QjYV5YG/x5BbBv
	uQOIvAKB4w4pX6P1qOOLfTHQn0oSaylaJ/q3DdQ==
X-Gm-Gg: ASbGncuwFvfz0UE0kphXR4w4CKRYwwdGv1HNI2PayTOUXwksA7Dx5aDe2hYZaGcbrS3
	RPzGoKd9pufSuwRTjEHskDD7rSKX6d0autf1YU2p9qGAPMAgM5tH6xS1i4TPla3EY6DWIruR/
X-Google-Smtp-Source: AGHT+IEJwIC3/E06ibCe+s7Mr2CMOxJfYubKHCDirA8GlHhcCcr5MZrobeqWk/PkNcjBaQcZxNfKvSlJHbeEfzufQQw=
X-Received: by 2002:a17:90b:2dc6:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2f548e9f9ecmr10163051a91.5.1736431714907; Thu, 09 Jan 2025
 06:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <CAMuHMdXU=nhd=fQLSmZQPey=uwD11w=mm=Q25ZWwbNQC1Ys=Cw@mail.gmail.com>
In-Reply-To: <CAMuHMdXU=nhd=fQLSmZQPey=uwD11w=mm=Q25ZWwbNQC1Ys=Cw@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 9 Jan 2025 23:08:23 +0900
X-Gm-Features: AbW1kva0lLZL39vw4aEg4rMAnnLyk26Sc0e9cGUp2mr0DB12x0I5le3lCQw7UOQ
Message-ID: <CAFr9PXm5v8K9K0V474kNBnNfF8dK25-MA2PDZns0CbxcUkU8EA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 9 Jan 2025 at 19:31, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
>
> Hi Daniel,
>
> On Sun, Jan 5, 2025 at 8:15=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wr=
ote:
> > - The head.S code sometimes gets stuck setting up the mmu on my MVME147=
 when
> >   the kernel binary layout changes. I thought for a long time my new co=
de was
> >   wrong but then discovered just making the kernel bigger by adding som=
e printk()s
> >   also caused it.
>
> What is your kernel size?  Perhaps the code to map 8 or 16 MiB of
> the first memory chunk doesn't work on 68030?

Kernel is 3.something MiB

> There could also be some alignment issues.  IIRC, there is code that
> expects the FDT to be 8-byte aligned.

I thought that too but it seems to be something else. I worked out
that for some reason head.S writes values to memory but reads back the
old value in some cases. The MMU code was not working correctly
because it was constantly clearing the page where it was putting the
data.

I then realised I wasn't disabling the I/D caches in u-boot so I added
that and it started working more reliably but it only boots every time
if I disable the caches before doing the stuff to load the ELF into
memory. So there is something funky going on in my u-boot I think and
head.S might be fine.

Anyhow,.. I have everything including the timer and interrupts setup
via DT on the MVME147 now.

Cheers,

Daniel
