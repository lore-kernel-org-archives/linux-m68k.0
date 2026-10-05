Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445E41E6B6
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194790; cv=none; b=C3PjszH6xqqvg8p8lZg9i1RvLeSw09ZtzQM5c00Pi/qYJFpnxYakw3zLeLqknFOGgeF8urbyIDpqtkjUlxmHPPanumTV1Fx1+MHeDIRorvVQYxuZUYH3XR8imf1zl5mbDsrFqIRQzNDE8TNRQsZ0nOuFeDYWw5wfmplC5u7xWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194790; c=relaxed/simple;
	bh=tQRX/FLdNvERNHaTAed+MPY7J7geG2lCZiYEYToYdU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IWjCROKfRVbkHULTYeNJNoLVDDWwzL0YnB7sURBivx0l0D1u+1ae9Vr3wXS3Imaca82Gk3swP607M1kEtXgsAGVx0S5w4U+YwtRCHHtaUM3adUiyNY+8rTefypeZKUrkDG8bfQw41edCG0prrANJCzfCRkffBrqaoarvKjwQ8gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XKk2iN4w; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XKk2iN4w"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so1895337a12.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Oct 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791194786; x=1791799586; darn=lists.linux-m68k.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0tbK+LhZVoVA47l+6TUiqPvZnN/HfVJIxHV+cXh6bK0=;
        b=XKk2iN4wZft08hEsZ8VNmTWoVOcFduyPppawkNVVaTaJD4zEKKKd5rnhdGQK93ndT2
         vlA9TPc7EmkZNE2uv6Y27jMKMc4bIbQdoFvyBWgtsSveHHbaW3jsU66tzB2RAELsEolY
         3Z036u4MfdTauDk54IE43hS2ULtzQUT9VYTknGORIHcKa2LjMMcqVp0ISfCblKn6MBLp
         aYe7oyeMK7QMC5zz/+jOJ/1iL0KJi4kQFqgs4SEq9wMjLFowPfm/tsqHFjFzdUkvxolx
         pU40Nc5mlDD2qIq8Y2zpI916x3PiYhhsY9nsojuEKV5z97BphgtawNWtqqWauig8cJnM
         s2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194786; x=1791799586;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0tbK+LhZVoVA47l+6TUiqPvZnN/HfVJIxHV+cXh6bK0=;
        b=DOZn7LulFMtwqfRagru/c3B8pabhkKLDPfrNUuC7SGDCBkTDtDnXNnvlxJBwa+pWpJ
         iUkFo7uQDt6zAvkzwNkZ+O4iGFIi9hQO7JHux7qoiEoVMKqYwMAbTRhfyRS52uDFMN8d
         6er6nD0MK0zYDXFHVFzF7qbSeBW1VyU0NPRsGKHNCL16RG0ue6kRN78tOxMXSq9Ok/wd
         aR447UMicGCgCB++LM7evPua0dkQaO+UOQCvDFSRKVjXrHcQs3+jgSpRQyuJfblQ0HkC
         E5xMdwtAkxz6Ly2BtPcKRFtj/v+zkctWsxhN6Szo8RZjeh+nyBEf/ATSn3K0QHW4xysk
         d/nw==
X-Gm-Message-State: AFuF++mQWmF9g3P9dGHTOU+d0mDS2zvhlfzLKKGUGHT/P9+CY31YGpE6
	hzA7OgjzrnNnOi5D0NcLDUUwBw0CVQFRaPrzJLeaTFVlJ48XEmC4/dYrwHZgMFHV50k=
X-Gm-Gg: AYBFou3Dzs+M0s77n5tngh8vY+nfcdrYSoCtQGUJW5ZCoZJjJ4M13p6BRShr2LGdahZ
	rrzc2CjmGSAy8K3We+p4JcugRV5zD+kNyFv5nU+K00AqLtmI7jZGDgd+PUxFUZrsq3HsU/cP8HQ
	aHO19pz2YeIQaK0BkOv4QQs5o1GLUsZX7UeGNxfSZRdWpoMfq9OjEL5OUvMYewGPUyklFu9BLZD
	fkGoflWEGSDkk/N7JOW2IwZYzuUpphw0JvQ0nLj3W/D+w7JZ4535y+vJsYpMRJiVkkucQ7Qtrty
	nc+rWOU1OMKZ7YjoNVg0/EX0ezj2Z78+cAiQdLgAMMtLM65Sfjwjp13PiKsNEoeYFJhGJGlks7M
	Q1LzlwrnBS9vpO33bhQpBgYPeRO1GA/5mADYfFBXPxB8YCNTRgnQct34XbaAKFGGynxr7E2Bc3Y
	nOAaR8ZqmKfa5Ewqmw2R5E+C0wk6alrSPuBLywe0PFmPOGm2pljCCsx7TWwLXXbiMxhmcrrmEhd
	pSRxr7UOQ0tMeL61o4hyYhXS2CNIaj65Z9+XH1m0Qmee8KqAQ==
X-Received: by 2002:a17:907:3f1b:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c2e4a7d4789mr841351266b.0.1791194785779;
        Mon, 05 Oct 2026 03:06:25 -0700 (PDT)
Received: from [192.168.0.42] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156360832sm50800766b.75.2026.10.05.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:06:25 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH 0/2] drivers: pwm: add mcf5441X mcPWM support
Date: Mon, 05 Oct 2026 12:06:22 +0200
Message-Id: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIBAE4FcxnMWwgNh68j2Mh4VuFbU/gVo1p
 u8u1YPGNB4nmfnmwSIFT5GtZw8WqPfRN3UKMJ8xd8B6T9wXKTMppBGZzPjVt9yeeewqDCfJ22v
 F0RVgHZYqxxVLwzZQ6W8vdLt753ixR3LdKI2Ng49dE+6v1x7G3t+DHrjgRisLlBm9ytXG4v3sb
 aCFayo2fvTyo+RCTyoyKaQhU2JZgDJyQlFfCsCkopKiEaSyJaIz+KMMw/AEXAekVFUBAAA=
X-Change-ID: 20260828-wip-bl-stmark2-pwm-acd1bcaf39a7
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

This patchset add mcf54415 (ColdFire SoC from NXP) mcPWM minimal support.

The "motor control" (mc) pulse width modulator module (PWM) contains four
PWM submodules, each able to control a single half-bridge power stage.

There are 4 independet 16bit counters, i.e. to drive 3-phases motors, the
total counter range can be limited by SMnINIT (start) and SMnVAL1 (end),
in ticks. SMnVAL0 must be set to the middle (half range).
SMnVAL2/3 defines the positive PWM part for channel A, SMnVAL3/4 for B.

In each example, R.M. uses signed values. Reason seems to be:

"Control loop algorithms (like PID controllers or Vector Control matrices)
natively calculate output corrections as signed error vectors (e.g., -50%
to +50% torque or voltage correction)."

So using the same numerical format from this algorithms (signed values)
avoid to reformat values to be written in the VALx registers. This is of
course useful for bare metal drivers programming, but i have to maintain
signed values to have prescaler working (all-unsigned way works but only
with prescaler 0). This seems to be a possible hw bug.

In this initial implementation only output A of the dual-output (A and B)
works for each of the 4 subchannels.

Validation has been done on stmark2 open board, checks by oscilloscope.

---
Angelo Dureghello (2):
      m68k: mcf5441x: add PWM defines
      drivers: pwm: add mcf54415 mcPWM support

 arch/m68k/include/asm/m5441xsim.h |   7 +
 drivers/pwm/Kconfig               |  11 +
 drivers/pwm/Makefile              |   1 +
 drivers/pwm/pwm-mcf.c             | 646 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 665 insertions(+)
---
base-commit: 02156c061b7dfe437f9054b3e353c69fde0f7a58
change-id: 20260828-wip-bl-stmark2-pwm-acd1bcaf39a7

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

