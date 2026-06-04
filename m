Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D243921DF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jun 2026 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563490; cv=pass; b=op63+eU7VKcEhky2It3RoyKzrrF247oiDsslGbGKwmirYgbapazBmPlH61wludtlyjtc0INW3C1EeGGX9/O+POGmoW/NxZoroZOqTCy5qmeIzKy/DKEkwDWoVHDIElJIjzLylcLfPF8AVpWLEkVN2tX+2ifdKohgc+QdnwE/yrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563490; c=relaxed/simple;
	bh=up91JmqMm6fBD1sztk18avyQFds2B2RnY7K7PBfd8UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1f3RPYTcYRYRtS/YgyOWfEiOMAmO22jJlCLhAqrXt38nB9TsDAu0hNL45o7MUZgB5eejDgew7o7cmPboZWgQxWjYpDxqS5DH/+3CeEHJ6dSMyg6e2MfKJxzzXBwT9kcfrDwvY9KMCggJ0ExL5I7ZmT0ONBcLm7CsJucMAaO06o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=s4IXv0R7; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="s4IXv0R7"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137dd523634so688761c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 04 Jun 2026 01:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780563488; cv=none;
        d=google.com; s=arc-20240605;
        b=VLnXOEHJqSitlSbX+YSSnU+jFAECBHB3gmXflaohgtQRxAmavC/uZyQReIt0bQE8LS
         /gy8B0ybFdUAX6o8NqBmzW9/1rudyZRns/Q8dEXBzf86bqbkCfUarY3GWh3EDWNDf5HS
         Dx/+Kcugyxqw6fVJQylaBHKDYesNNDAtxfWwaLNdJI7SkrmJjg6Y/qfK4FUQhAf3WvTb
         EHLLg3TQ883zZxmOfK9OnrW6c8/ylRJX5nhaIj1ayi26WiKB5jkodozsz11W85jmoWgh
         CGlizalXcBMzEsgAUBZHsRQK/nrV15B9WdyblB1h8wnD+rvvV8atPofdMORmiuZ4ovWZ
         nlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vhprNsTGrZqLjRQRTcfxrBfeGkpWxX7xStP6cVyD7VU=;
        fh=XSIdI4ymfvFysI9tqbt+eM063ZhLWCWQ6bT0zkxOaPE=;
        b=Z6lO35yLZSZLZKc6YZF0m7Oi1bVtJrxsW52ckMYPxgCyjIPuifRS0CeFQ7J7xE6Bi8
         Jf4ibDLbx8TqvKD0KomFElh8aJP+EePSiSwX4Vh9wdUgytl2LRxsdzmMdZDrHigQbvt9
         TuMDHzkg48Cmp/PkbNpKEUBQ2PLXC0ausJ/OfsRIxM2PIO4KNy3m3QTwVCo393nzVEqK
         5xjOfAt5BZS8kHD9XjzrpZ26Tx5tCpCNTWaRXnMXjo/1jIOifGnV0d9p4DpJ29ttAa1g
         fhiIcE3dtS8vxVhZmr9ukLbPNWeQ6s/RZySup30CMUoEnmoxSMSBDzJCiFYWPPDUwpoc
         km9Q==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1780563488; x=1781168288; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhprNsTGrZqLjRQRTcfxrBfeGkpWxX7xStP6cVyD7VU=;
        b=s4IXv0R7+wyZ4izutf6S3RBBzH7gkRQqqBGBblpM1f70ctwLQjQlPmwCFttQZVSDaJ
         yrYC0BEoHYKJgHjGyJkJP2mI6t3LkoJ4Jxq4SFexF27+xWhIke4V8mbHMZPiljHuL3SG
         ookeYLwIl04A1pn55MS4/IvsHH6p8ZQ9SN5/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563488; x=1781168288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhprNsTGrZqLjRQRTcfxrBfeGkpWxX7xStP6cVyD7VU=;
        b=keSMYILbWv43NI1/HZ2EBR4KNJmTCF6uXtDO+qaAEHyv1DnLf34Mnrm8YOOyDMHuph
         Eswlu8pyKF9Td57t327fS01nFkTK28pwoXss3YKhEar22LVIGg8rUJLt/ydEI6YwulG0
         A+vFk932JtzCWrMEj6tz73qQ2CZbZNRn/qJLhxFEY2Bh3nRCcEOwGOMNnkux8IRQD1yu
         fX/z+tE4hzcYrdfPWW5dcw3daaGE6ahm6nzQB/K1am2ASDJENjSrQe1D2qoiaA6cby8D
         6/AQmaaA7AhyN5iK+wVLd1Jfoe7Zbp3S4vQIQFdnMq9zrJ1BEmCADzay9YEvgsqKHXtY
         rMuw==
X-Forwarded-Encrypted: i=1; AFNElJ+jdkSaD1iZ0xI+qB6S4eVNkIqHtz8FYmBmoWxKMKRPP4YIdHYscbVvJWt25NGcWhCC+7V/15xZNkx3@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyz9Ejm7D35W/oNzX+ugU61ZkatTihW4P9+lnFco5PaOleES5Ai
	V+KYA5mLEY966NwtrxYR1Dj5d4fZW+/CMhb9UwI6fX4l83XhsvblB2jPqQHwAaHVP4rP4AMZC2Y
	n2Vrd5QifpPiNsBEnoDhFFKi+8X8Kn0KYM3dAdQXxAQ==
X-Gm-Gg: Acq92OG02w5I02gVy1SMiePP5T2hL3fC74NYHdcweWX4+MweOwIh2XRVmN1aZTLx4hn
	TBf/E1joHsoRR6h0RbOCZOlEiAFR4ntA/LnJkIuG3Q3dVCoEkacrsk8LbbNRg/Xx2rjaWoY9EHI
	jnDb3mxcM3TquyCVJMGsJ7vFpxlYQcdutsVN6NHBp7gfmLDKw7rCLAr0oDsJAz1MBfaWsFwDmfi
	Pep/mM2Xa1dupSNzjIHY5bcgZNyin0Nka4imzcD4Br3UMqTk/KD3yfdOsEJXreKpHCA3DDiAT49
	6y2pyiMpT76o2llQ
X-Received: by 2002:a05:7022:6290:b0:130:6c8f:5aae with SMTP id
 a92af1059eb24-137f6a47ec5mr2544793c88.14.1780563487620; Thu, 04 Jun 2026
 01:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
In-Reply-To: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 4 Jun 2026 17:57:56 +0900
X-Gm-Features: AVHnY4LkoljNUzZOkyArv8dxrb7Zyk0Vmz1eVkox7BUZBubkRiCltp_GBjRXTUQ
Message-ID: <CAFr9PXn35O=iVKauEAJpj-O7-wytx=eQqyXUexQdu-1gRuwi6Q@mail.gmail.com>
Subject: Re: [PATCH] m68k: hash: Use lower_16_bits() helper
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Thu, 4 Jun 2026 at 17:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> No change in generated code.

To be expected since the generated code hasn't been changed but I
build and boot tested in my 68000 virt machine and it still works:

smolsh / > uname -a
uClinux smol 7.1.0-rc6-00147-g6896dcea2588 #140 Thu Jun  4 17:54:03
JST 2026 m68k nolibc/Linux
[    2.890000] uname (26) used greatest stack depth: 4744 bytes left
smolsh / > cat /proc/cpuinfo
CPU:            68000
MMU:            none
FPU:            none
Clocking:       3169.5MHz
BogoMips:       933.06
Calibration:    466534400 loops

FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
