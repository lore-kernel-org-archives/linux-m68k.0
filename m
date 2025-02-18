Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D126FDAF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739901479; cv=none; b=sScMQBqSVdchRZgNIctDaVQwPGj+YCXyxGSqZCoP7iM/ln4FazuqsT6NxwhaMXDaGZfjA4eZfqAEfHkyBbmguZPMYBdXJ7rV06ZXDNe/0y1AQPdM3KxOvj8z2JhXl+maRMrBQ90L4tguq6HmX/Cw6JGkYpJhb0ESIjim/BCxYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739901479; c=relaxed/simple;
	bh=SKnjvoPaAHGikEYH0U8N6QZO8ST6XHXeB5oJXKQXdvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmN4e+NndxSu9BpImmn7hoOw5kNcFN92OZk0R0CsWu0+wdb4YiadbbzamiuWZN6Z6MI/1OxB6iaI2+zDSc/wbSuORUt2wMfz8AAoPEyf+mzR4NLtr2cIGforOvL7TqusfpDcGc2jfJGx/JxuytUPGoNLvReykX2nSyL3FDERpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7pLsRHm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7pLsRHm"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54622e97753so39361e87.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901476; x=1740506276; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=D7pLsRHm1K8luo32GOiGGRYPH3/7nb0huC/uOogfneXy8OddiFnQBrXYKFHZeKd5Vv
         7wpUdz1L2LcJ7+2TaLGNODV3mM+Nr35bPN+v0nSX2vwV3+CuZ2qfSnpHH4JCRnn4SK14
         MRtOmUtsagcyQAZrf7andhxglL2e4+9wmiyt8CUR3imehxKbeFSXpucCHauFxpVINR4e
         0mU1q6xlhru8us0AEzkHXss7jxM0DN679XYoXTi4QcM08N7J4lmLmrC/yFe1X6hSFScr
         nP8bVfjZ7DHIqRqGrDxqQNtR54aN8Y1S71aNQkXtd8oD+G2ydBdvoqMB5n4cfzzqJeP6
         2J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901476; x=1740506276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=baCPCixml/lZ3fC9vX77W+uDeAsf5a7ZQIsste6/7BQzTF+IqsOmF8wD/c5Fwz/hQb
         00nd9Ceyj052GMhco9fPFxJ3tV3V9WwjjuseGuelNiB+UvQT9nMrUW3Hz6mva09AWwtC
         h+8zTQWtHks881bCDTot2OMtorPaFiBIJW8huyW7EthGIE3B8kGKAnGtPCf09GaxVq5N
         LVJULxH54PP6fbhd+fid1bFZo2jh5eV1NuNsegCTD4WJ4mTemzlV7w/AwpSnQkOt0qFP
         Z9mu2+ZSxt1Aqnd9K1HeIkIyHCjC+v3imVvYqBrGK7AWrcrQJNW8bNDC72+bKQGQj/so
         McDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBiNGUz11l0Mck1OOZGzxyUywYK0YUsXR7WnYHXV7BEwlvRGokv8lpiqY855vt0wSkqEWxXYf3gukg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyMuTOnboc3YAPetGzckPfJsCYGSB7eKwjXASoX6pEY27ZKPCMu
	RHvuawUa8Jo8+/GOibmwKhQChZi2vcvjRnoK96v4uuwqQY57rckl
X-Gm-Gg: ASbGncuPRFOub5zZKzChCbT6A0iKXEymxbACzDbQpASZaY7BeyF6f6eEC5tvT4UegP1
	UO5kLvCZzTdVGtT2oOO6QMB+3y/SI0Q6nM5UDPBvE7Zpe52dXy81QNcSmnZfre9r/Nr+FdhdtAq
	Em4PPqRbS0c0NdTv068pF6nFfiMlYgw+M0D6kR+AifBjuHNSU+s6WYzzIwSF2S9iEUVXOu/7EVv
	BjRryMUsMTCCVEd8jqjA0xxAu9LRCWGrdwOsuQW4zZutAsQoCEHUWoeW/eXsqKM351Mv7gI6w2b
	CRK2A75NWHlY/OU8RqJCdtYHxCwae53LbX0Mwbb9ZZZUk7aoyKrrcYlzU/VLxQ==
X-Google-Smtp-Source: AGHT+IGfFBi/u9SniGtV33nIqkglJaUtkaaAX/KBzbUXSrhxIdAk38ItpiS7x3PdO+hl8rMx2A+8sQ==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5462eaa1f1amr241343e87.5.1739901475583;
        Tue, 18 Feb 2025 09:57:55 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:54 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:13 +0100
Message-ID: <20250218175735.19882-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first version of this patch intended to fix issues with swap memory on
alpha, when swapoff fails to writeback exclusive swap pages and gets stuck
in an infinite loop trying to do so. This problem appeared after commit
a172d5128706028ac07b8db709728379ecc72f6e and as far as I know only
affected the alpha architecure.

Changes in v2:
As suggested by Al Viro, rather than doing a bit-shift alpha-only fix this
version of the patch makes pte_swp_exclusive return bool instead of int.
As Al pointed out, this will also better reflect how pte_swp_exclusive
is actually used in the code.

Best regards
Magnus Lindholm linmag7@gmail.com

 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)
