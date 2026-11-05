Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895450;
	b=Z+/kixKxFs2VioMowc/AWtLC2MrkYATPnHWR0stZgWGhpOVjKp69l+LcDu/ZG3UsBgZs
	 Cme3GMJFf31zdo5/2fuqfNNQT403RZptWxGPuvW6ah7l7LQ9LH98zYYuxCZ9IQUOufy9+
	 euEftLkU/r+aX2M0xTXQNxhg/1MC9fNIoRnEEqoy8CLk7XjMG5AHCnXfvndRrQ5a8s1Rb
	 jGQRGMNzpjJFrvJ0R+X7atuBmamxQvC8qzOTdWRqKB7zaU5xhJMUg9NFo6jg3tN0mW1sL
	 NH7gYP4UWlRSTEcoK8P+XDZdDd5emTNXYNt7IJdajuEXoaZx8F6/54APtWNAD/rV+bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
	b=tiWVoFgLf1e6sS20ZxnaNvl907wzvYRU67BwFZrMeZ77FnXLndna1tbPPyS+ss5Z2X7s
	 fSr4ZBV4Q7PNuXlD5z749gjSp07V5/QgJRKl5WYacOKyitq5G2lFR1nktZZhx8CoukzBR
	 UcW5AgWs6yDIu9m3iwxLwYKG1GDWTBdAcT+0XpJuepoCSgoFlArWUWq/Qvt8DrJwKqsQT
	 MLV0zjaj/yfhH0By+2Ouwoy/QTX86USoI0aPQcTKjlr5xUI+fYRzVxJu5XDivUokWbUCg
	 17moz7PeGklK4uMh/insOZAADHf36/7ZWeGwKtKKfdELIoLJGjsgY6s5rylHMSSRryA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p22FBjGw;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFC606A328
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBFC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p22FBjGw
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1391078a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895449; x=1794500249; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=p22FBjGwJIA8cXI+a/2hrtj825Y+5KIHRhkeNFBHCXG0kOojPpAtyTVK0tEiwlLM5R
         yVes7oJNSMTjohJS4tqSEUrjK8gBdcNYD7MS67HtxHuQsX9M0VynzNfWLEPrNVW5Ej6+
         hGFzDX+mi2UEUXDdi4q1gwhOjdf6GMU4M9AgESZcd/jU8xOGnHk8AlidyVomRngszy9B
         letCC+fewKMjeuXn0GMP/YrpdHPlYKpffg24OODIn9WBnEQuDsKPlbl/yPDPd1dWEd9o
         +WPLyYZfM9Rh4XzmzBVJVWyJSseVgV979oANztET8v+a0kRUwyUCI0ZszfdsXc+cBq0D
         CvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895449; x=1794500249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=0C3r356fs0pcycgCR64R47RHTYqDCdq3Ba55x/e+y52l1Ky13uPsths2noFPpIVpBv
         3RRqM/FiYZrYfFCjPU7Yn71wjr/DM9GH6Hdxu9fBoO0km/yiY2unz7wTm2RvaWg9ZZRD
         3iKvg2i0pLcs1SYJrBN2au+DHlWHCjTXNdRi5dLTz+klCSYbP0u+DBWL7cTZYvVWXB/o
         d/httJ5shlwIGOz2+FoWrvGrteF+Ug5/OoSVXW+rWKxhonmb+IfRFR5SymPQn587tMjw
         FJ9vld1LIQd6QYlNToZQGy0nk/uA9jKL7vAu5+6St7UiN+Ehgl6LpPkM7HAdHRVAFign
         /j+A==
X-Forwarded-Encrypted: i=1; AKwUvBwfDvC8LnRN7D1gxSbt3ML0HHoGvpAXg3z7GvOeSDKIuf2YdjNxBwvTzIVA4f/FicBASIuQyOJS9HCr@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9GuzQrrUQlxKoCwLZ3asMcaYmj/NxeL3wpy4XGY3Ohh2JtX1PF
	Ha5IFTnu6vzfLO6bAl1rg0cqlgk6eqjKffuh2rhMk1vRot+9UZDY/FN6
X-Gm-Gg: AYBFou1kP+wn5Xq5MPAPVc2L8c02EfMnwxGZYSXIurrOAr3O1lheAs45cT2kFjGx7rK
	q5Ypw1XM8GsoSQHw8Cgey61fgyFoIl4TR6mj0tvMOJqPwxxamYrEnt1xLtNMO+F7UJqFwDh4f3Z
	PdsNYKT22MCXg7CoEULOmUr3F6DP6r/11vLH2UzfOOSJQrZzD8QCcXsdvf2O27ewGqi4+5whsPc
	KhgxuwuOct7KwqEEjAlRwJl+Taa8dT2LzvwkxpBPDzQwFVW5yYosAybnwlSn2Hyag2iRI6ONQat
	paHtkGe/tRv+swRCcR2jeObt8E2nESwG1DSF1r6vMESDgC6kFxGOfwwfpF/25O/KPLCGoBJ5/cj
	FnwTZ50nH47fnPYGsLS/rKNzDJAxL3bRHBbrlfxWtgyNwo5tFSagcGftwV3Sma2CwJdZmrEpLBF
	Rph8ABPRYDyJV1qnoR7nxqCnpddITXiDz20WG2kWK7m4r+jLff+XuXVnNLWV5ovb1tMbFZXvhoq
	NRFFXRCRWDDSV7VBfX8MDlCR3dNY4VXgpyFxpgZVfKaPbIBGOJMS1auBuV7jGCKh19gETOInytu
	wW7Ialc7noPqZLg6VulrjvO4QWHSHVYGdKK7vkHTQahI4Q1GpcvzzfeUiqwluHS3c7uw3ZQSTHB
	F7LU7xyLbi6Kil3ysbo3ACVg=
X-Received: by 2002:a17:90a:e70c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3ae89835d94mr17591365a91.40.1793895448800;
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/8] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu,  5 Nov 2026 16:16:54 +0000
Message-ID: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goldfish timer driver was previously only used and tested on
single core m68k virt, but the same device is also present on other
qemu virt machines such as riscv and or1k, where running on SMP exposes
several issues.

Fix the concurrency, oneshot, and registration bugs in the driver, add
device tree probing support so it can be used across these platforms,
and add a MAINTAINERS entry.

Tested on qemu m68k virt and on qemu riscv64 virt with 4 SMP cores. On
riscv64, testing was done by passing clocksource=goldfish_timer on the
kernel command line and locally bumping the clock_event_device rating
above the architected timer to verify both clocksource and oneshot
clockevent operation.

Kuan-Wei Chiu (8):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 113 +++++++++++++++++++++------
 3 files changed, 99 insertions(+), 25 deletions(-)

-- 
2.56.0.398.g882cbad275-goog

