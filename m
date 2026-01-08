Received: from coreboot.org (mail.coreboot.org [78.46.105.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A782F3623
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=78.46.105.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910292; cv=pass; b=BNjkITUYmv08DvJYUqew/RWmAXQZ067TZ/lCy0htwe38Rj23gEMzz9q3PzDcsAai5s3DFxlByvRbjC/fZIyreUNvii1/lyQxGC5v/ux0BZaOdtKoLKMEq+QXQfJi8y0IRVh68xnpe6hxofTsVStnq//a3ItUSsX5iKCRJPxdYZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910292; c=relaxed/simple;
	bh=k147615B8Dt6REXHEW2H7oguTCTK4jCM3b6tk86cJrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCOUYvDnjtt7aPcwXTSkCRH+LCTcFXxLitSJr3Ltg8T6pen6PJro2PovTKVk4xPIvPey/hJtwg+ogD+vKDBQeV7MIt3D2Ez3ZCYIBLjxJdGGX5B32qeO4jpptybO2PA1l4r0sc2UlLMu3wHMXPl5T0EAApBOTJknheK5zcvEdKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org; spf=pass smtp.mailfrom=coreboot.org; dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b=Wpeqk4uw; arc=pass smtp.client-ip=78.46.105.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=coreboot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coreboot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coreboot.org header.i=@coreboot.org header.b="Wpeqk4uw"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by coreboot.org (Postfix) with ESMTPA id E9509817D7
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767910289; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz5zMz1SAn0PoXD9csrAYXADftXRKgPxMwQ47zEujWA=;
	b=Wpeqk4uwWiGDHsh4Wd+t4NUKLIbC8W5stzLOtf9U3HCnxctzS+es1Dbr1wqGOIAhmIfESS
	frAmUNOVSOBv+BM5SYcxf6niVeRleEMeim4PflGAEoGU0fwvVJX18bLq/ug2DTX+TllELd
	zt2Bb0A5l/vus6xOcTSceNF4NgPYAXM=
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jan 2026 14:11:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh1ha8M4rA998Hd2lvnH1F3XanelapVQwP5BqwX+awjDKiisPYDRSgM311bMxuPF/0zneUZLV4Dmtp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YziL3WcfP9N2i/G/Uc9UPDN7LT48bFW3SpSdoSGNdNCZ3kKKKz5
	z8WbC3ZlZjCsYxO8YNOjyrdW3sSEdE+A8569tPWUEQhqUhjN3t0dY+6afay46lmEX4YWPNkjVKR
	ZO7tC5g6beHCbwEDHKu9OINkZW5j6Hyc=
X-Google-Smtp-Source: AGHT+IFd7qSdMGhkheT6wmV4Byeuc/oTikjpZhY1JL41eqFVm69Fmfp7BPFC9wwk57fnHl7WLKkxk373S2N0yTo+GxY=
X-Received: by 2002:a05:6830:2e05:b0:7ca:f4f4:2bf1 with SMTP id
 46e09a7af769-7ce50be293cmr5383248a34.37.1767910287313; Thu, 08 Jan 2026
 14:11:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org>
 <20260108060533.3891380-5-stefan.reinauer@coreboot.org> <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org>
In-Reply-To: <3252e3e6-5eb4-3cba-9113-09e3febcc953@linux-m68k.org>
From: Stefan Reinauer <stefan.reinauer@coreboot.org>
Date: Thu, 8 Jan 2026 14:11:16 -0800
X-Gmail-Original-Message-ID: <CABq5eXGNQJQrHS2KCHgskwzppgVxfT1Lpt2MuWyq_PMb=Ap3ZQ@mail.gmail.com>
X-Gm-Features: AQt7F2r5GWYRXfCmE6MDLQA4rqquxT9eMB3s6_BsPz70Nk1wUzMtm-AkJdiu79s
Message-ID: <CABq5eXGNQJQrHS2KCHgskwzppgVxfT1Lpt2MuWyq_PMb=Ap3ZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64 implementation
To: Finn Thain <fthain@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=coreboot.org;
	s=dkim; t=1767910289; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bz5zMz1SAn0PoXD9csrAYXADftXRKgPxMwQ47zEujWA=;
	b=lOfl39lKMj3cOTvRVh9ln33DTUqHs0cbJm/km19foXoG19tBh2UcYlo93ktK2S6o5Wtw8m
	NifufrECQ4gXSGDpfQXbKiTrfRGo9AMFdl84sJKkjU+o4QNwmTUcE5m7bcrT44DcYgerq2
	m3IL6r5hmgb0sfCUlfnfXlTfLTTpQ4k=
ARC-Seal: i=1; s=dkim; d=coreboot.org; t=1767910289; a=rsa-sha256;
	cv=none;
	b=JIuwF0VMI6xArsGuTYir2c9Rm3dm4abZybQ+irSPsoenhLQUjtkBPcqGu6knIBnJnYbp/ORTBge8fcaP278P8YwOJZ2i1QO9+OnMzvMa9AUn6eNzv0fZUnEn6IFT1sDiV3c5Ot2Hvnpnvk4qq+EawJbJF3582GBfj5VtgNeiynQ=
ARC-Authentication-Results: i=1; coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
Authentication-Results: coreboot.org;
	auth=pass smtp.auth=stepan@coreboot.org smtp.mailfrom=stefan.reinauer@coreboot.org
X-Spamd-Bar: /

(Sorry Finn and Geert, resending as plain text.)

Thank you for this detailed feedback about VIA timing characteristics, Finn=
.

I reviewed the kernel clocksource implementations:

Mac VIA (arch/m68k/mac/via.c): High-byte-only (1-2 accesses),
sacrificing precision (0.327ms max error) to reduce slow VIA register
accesses.

Amiga CIA (arch/m68k/amiga/config.c): Hi-lo-hi algorithm (3-4
accesses), maintaining full 16-bit precision.

I've updated the vDSO VIA timer reading to match via.c's
high-byte-only algorithm. You're right that reading vT1CL would also
reset the interrupt flag, which would interfere with kernel
wrap-around detection - an additional reason to avoid it.

I have to admit, my primary target is Amiga, not Mac. I'm using QEMU's
Mac Quadra 800 as a development platform because it's readily
available and easy to test with.
For Amiga/CIA, my estimate of the access cost:
  - CIA register access: ~2.8=C2=B5s (2 E-clock cycles for synchronization)
  - Hi-lo-hi algorithm: ~8-11=C2=B5s total (3-4 accesses)
  - On 68040 @ 25MHz: ~210-280 CPU cycles for timer reading
  - Syscall overhead saved: ~500-2000 cycles

So even with E-clock synchronization overhead, the vDSO should provide
a net benefit on accelerated Amigas. I plan to get real timing data
from Amiga hardware to confirm this before finalizing.

The get_thread_area() vDSO is the clear win - eliminating a syscall on
every TLS access. However, with thousands of clock_gettime calls in
typical userland application runs, that optimization is also
significant if the math works out on real hardware.
Please give me some time to do more homework here. I did want to share
this code early to make sure I am not entirely running into the wrong
direction, so any feedback is very welcome!

Stefan


On Thu, Jan 8, 2026 at 1:56=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
>
>
> On Wed, 7 Jan 2026, Stefan wrote:
>
> > +
> > +/*
> > + * Read the VIA Timer 1 counter (both high and low bytes).
> > + * The VIA 6522 timer can be read atomically by reading hi, lo, hi aga=
in.
> > + * If hi changed, re-read lo to get a consistent value.
> > + * Returns the full 16-bit counter value.
> > + */
> > +static inline __u32 via_read_timer(volatile __u8 *timer_page)
> > +{
> > +     __u8 hi, lo, hi2;
> > +
> > +     hi  =3D timer_page[VIA_T1CH_OFFSET];
> > +     lo  =3D timer_page[VIA_T1CL_OFFSET];
> > +     hi2 =3D timer_page[VIA_T1CH_OFFSET];
> > +
> > +     /* If hi changed during read, lo may be stale - re-read it */
> > +     if (hi !=3D hi2) {
> > +             lo =3D timer_page[VIA_T1CL_OFFSET];
> > +             hi =3D hi2;
> > +     }
> > +
> > +     return ((__u32)hi << 8) | lo;
> > +}
> > +
>
> If you test that algorithm on genuine hardware, you'll find it is slow.
> Each VIA clock cycle takes 1.277 microseconds, and each VIA register
> access requires one VIA phase2 clock cycle. That's why the via.c
> clocksource sacrifices timer precision to gain performance.
>
> In the common case, your algorithm makes 3 accesses where the existing
> code makes only 2. In the wrap-around case, your algorithm makes 4
> accesses where the existing code makes only 2. That's why I didn't use
> that algorithm when I wrote the via.c clocksource driver.
>
> If there really is some advantage to doing this from a VDSO instead of a
> syscall, you can't really measure that in QEMU, because its VIA timer
> emulation is inaccurate (though it is fast). I suggest you try MAME if yo=
u
> don't have the necessary hardware.
>
> I expect that writing patches based on QEMU's behavioural simulation will
> lead to churn in kernel drivers, poor results on genuine hardware, or
> both. That's why all of my driver work is done on actual Apple hardware.
>
> Anyway, get_thread_area() is a real problem, and it's great to see that
> you are working on a solution for that. Thanks for your patches.
