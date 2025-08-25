Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45227A917
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Aug 2025 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756154905; cv=none; b=u5qfEsYW78yMUkJQEaz7mLnqDTyfaUaXAXv1X0tP0c2D3XhHGC8D+B7cGWrGIhDRUQoV34m83hOt6Mq6x+GczJYYhsiG4ysmmrDXLL/5iI+7sq0MmDsEV3j/xWjHOnIM+G6ztwm5dmmv2UxhRBfOgYQgLDO2BZpHDzaFjxYTc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756154905; c=relaxed/simple;
	bh=ws0OH/LPbfD0uWhZ3//ck7/pwntfVUXedOFJRthyTE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fBYHY5k1T3kp8yZmaWFXjONiuhdqrGtyfMwyY1r6Jvvjx2VQABzhGA69bdc4xwJOwDReUWGElNjF/bJf5JbUJ3c5mQ8sBwLPYdmBCdPsVvNN98yvY36Zzp8fOIcqkRzlJV181N/wuh9l9GgY1vP69BJCUTuY4ZyE9GvyDzBjoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=d1A/Y4de; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="d1A/Y4de"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ea8b3a64beso13897065ab.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 Aug 2025 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756154903; x=1756759703; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=d1A/Y4de87ou1nsbcvfKXafa7UrGuCUySJGgTC/BZ798OQcepz49wkulo25MhBtI4R
         Sqrj5M+O+vNoFj+fYxNWJ1o65vTON+YBKaJqO9C+63/xWrZg6piEAOvGi+9JDWJGa8bj
         R+E5wYOMZ6iCIhB/XQS1USwJGltKJjheE3llv2bI0Cg0uEsy3CDxchHKtH0bzrTlEmSI
         BBq/6OrEVjjuA10TvAuWeICBSLeF3Zpz8/vQiskd7xPSO3X/Xxog/9K1sQ4DRo9DJqfh
         nDvgsrpxSP+8rqvvS1q6A6/gLanifXyAya9GwnCdMyjNPVDiHzIPCWPy8s9emBHPoimO
         6E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154903; x=1756759703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=sggdw/RP9KnQPxTQFd1iMfkpjXy31dZPjoFTk4Tasi4dgrkH5hhWBNcXSjRZU7AHvz
         j3ZHEvczGrU7Jm3G46ESexKrK4vHlLKXTXApB9HAEcl6mP/eGeaMM/bh10fdxRmAneun
         S6LXATY0H6n20iB+IoMQf6/mWTn9WQOeQvbR0+l3FtzjFZUPGTJcjZuJhXB+cRnzppGX
         Y1zFjegylqz7LuSIOqAwqynF5BH8lFLwh7dELljx4cGR/kLUH1tLNTWorBec8YPeeZXv
         6Yc3sCK8rI8tEYwThSOKmqj62A8nGJYTmMJpv93TcA8KfkEmfmE5gY0yCjmhgsASnBV0
         cRTw==
X-Forwarded-Encrypted: i=1; AJvYcCWCeHHLBeXBm9XOoBUGdyZsl3fimM3BQyqihdZJv9SuPCyZethWPw9bK4nn770GgbSSwZ2W8+BsL9gb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxtXliKCtjQp76cgcsmtfBGVmmGO58+i/nDu5dT/BfnWCgIBU7W
	KznMjHoKv/JiFWkDkMriYU9DXWWDx9Hcw6H3Ka7mlK0Qprc87ZMk8DvYToMor2XAZUU=
X-Gm-Gg: ASbGncvnMxX7yI/9rdq6mSfYg5lx8hYAsS1MdhSMJhtj5GJbJuTpqztdCpXVV9vY7OL
	ZBAbBMWpuAOsR8iI8XXqdzezjlVx1J0YAasDwaJAfYoHG3NG86B4Fg2i41AT+QNAwVnaA5/zY7s
	ogyLn2oHsmdK8klwz1slb6NlvLYBP3cUi7/u+gnWervjCBVL2cjtH8dHbiIX+J6ijJnPESIvvAR
	EHPkZ7aKW+KAwJIZjrzQlsKR1qnCUQJWKrzmTfRsupd3Ru4KwgkxweDjhf1NGOh00mGp2B/egxZ
	zk4RGc0Y391I6+Kd3IvopWZ5I30x1Jnp4e6zoQj8yAaTyDA0JZ7Y/HF0Q47EAQZeP3Xk9oLKPXx
	iUlKulJydi+6aJw==
X-Google-Smtp-Source: AGHT+IGz/OLusjKqnvYuytsepj0QasUaFhQNGeebbI4cWxx4cpCIdsaTdG9b8SEzhdQW1utDLqTgxw==
X-Received: by 2002:a05:6e02:1582:b0:3eb:cca5:5586 with SMTP id e9e14a558f8ab-3ebcca5874cmr83676445ab.17.1756154902655;
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4effe70csm53084775ab.51.2025.08.25.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-Id: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Date: Mon, 25 Aug 2025 14:48:21 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> There are a few places in architecture code for the floppy driver
> that may be cleaned up. Do it so.
> 
> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> 
> Changelog v2:
> - combined separate patches sent earlier into a series
> - added tags (Helge, Geert)
> - fixed typo in the commit message (Geert)
> 
> [...]

Applied, thanks!

[1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
      commit: d74968780bf287958e2815be5f088dd6c7b7aa19
[2/3] floppy: Replace custom SZ_64K constant
      commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
[3/3] floppy: Sort headers alphabetically
      commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

Best regards,
-- 
Jens Axboe



