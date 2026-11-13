Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535538;
	b=dXXyu3luiIpNOFISck8cHHPDmKNk1OxHi0l0zURM6s/mYn3WHlCFiDiyOgkoL+tW6RGF
	 uZkbBBUfRZgqYjmysbLM+bLQZX+8asreRC1E6y7oHBylJuK1MFcskMmN8nMzWtL2qNkSy
	 bMGsnRFmNY3t433au/GE2N8CZvfK6bLhzDF0T9GWxLan7AfzWtD6QWh+kx28OjXNFZ66e
	 PS44zI9apmLT1bnIjmZmCarhvdjfgExouo7nWqag9QZqHSk48b8zTmwd9BG/8iEEdTO2A
	 xUUKbsoLKl/t0fcRbyH9W0vKjVSH5xST9MezPbVK7cP5CcyW7FH30B7rdKtGZ56dKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
	b=TM9yAW0QNUTLd7TCHZ4OEjdqDOZmxo5kuUXeAcNOP+Jf8cvolahFxY8XR+KcAQQkk7W0
	 PZO14GMkQf05yijtPzxmIOLhqA9r09p961J4QcQ5DRiT6JSri9oDOoIhKBBG9l09TGLFf
	 Vyi5fpX7VIGhsB788Scx7026LNZsZWX0TJ9PZ1mavLvOzA6+oVdeWRbgANWFEn0n0q0fb
	 px61NS38go8SCyB8Pk+w2+QSXgMj4wOVyN31J6VSPO9jFMtxf5rVOmVDX7np9n1L2acTC
	 /2273NZxA8b3nXIDWRfxcACWqRVrgH+HHQCwM/SXIagV5sSJy/QV0XX3eXTuXdi0umA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWnm0WPf;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4A606A327
	for <linux-m68k@vger.kernel.org>; Fri, 13 Nov 2026 02:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC4A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWnm0WPf
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1086729eec.0
        for <linux-m68k@vger.kernel.org>; Thu, 12 Nov 2026 18:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535537; x=1795140337; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
        b=UWnm0WPfGRw9mYF/UemNGbctgOrYjn3N6rMqRS6w7GWRBITbt48RUqkF3EyLr15NR9
         KrjA20Ej3+31Aw+CtesnYsGy3+zt317COTexb00voSesuKJXUf00ErPdB08gaPIRgAc7
         LR9r3mg4xLKXXdZzACaJgOXeB0A5MKY2vCb2HQwahmS+Xk3FCnGWkNwV+Yon8PEFovXK
         QjjK1SYXeDpsYYAcCkuHTXpfdmBY/rjNzl/vigvsEijkv+/dPrsxQfbg87w7Do6RKTUL
         5VH8JdtEy8/f/K1N+fDuxHWN6Ymhqm4gcgHzVFh4KcyQ1NL0lPJQUmLBGTnD+HQ90LkV
         2S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535537; x=1795140337;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S4imppLOyvDXcuLb3YL+/0kdZASSKJjGPDiIRvfutk8=;
        b=1EzcFxxtJP8v2iHEoP8fQ6uJRX9TeGVnL28Z0iP90WUsH9BClDOQw8eCz0KC+smEck
         h73kqqd3TDuWPQ0sJPq7bonl5kpjr4+NSBmIYInUhlzEzlJtTjCO9BHMlFGPnptYW1w/
         8yyIiCz1xUz76t5nA/TkqvWfH4vm5dRQrrqZzgcQltPDVr8UXZjdQAIG9jYuTr0dm+Bs
         vDWLx+qmBBPpzqBJYPKVLGBIkK9wE8PhU4Mp3M/BpuenKt3JJ2w3eWvviwQ8K6UMhOO6
         EcbhZ8IxgTKt313Qw5Vyez+AEupQQqTYe5WOIyjv1+Kxl13cepyA8VS5Gti0/ACbvlBS
         2pDw==
X-Forwarded-Encrypted: i=1; AL+hErGH6ealzNBaosuVpxFZ9M8b7XJfupapvH6RoHx0a1B4c8WX4ZoT0kTAe0ATU5EY7kNG12NRHgZy0Mfv@vger.kernel.org
X-Gm-Message-State: APuU4Z9BDASd7VvmF7GIV7tgMFEr+UG/uWmJIecPkHr8WpYRw9A3XS8p
	6bG5kaZ+3flLJwbDmj8BOG8HX76Genj43Bvy3BsfwUKmIADsfkwJXZhO
X-Gm-Gg: AYBFou3vLd1Z3EecaxFHvrQTB3Szh1VpEun6EVLqgMn2h6c1R0os5iEEPPnYnp3HyAJ
	ghbyrWmVGCqvj7IfiPrcz/z84FYdun21aKSiAx1WdCDGY9jE5vXhdHRQiRpQwBsaDyf5BGTHfQP
	UG6swkfLi1Ugn7LE245i1JDCWiXyp/kq38ftuUUE4guKOx2JBlEvutyDqAtIEo+GoVMSRmCanqf
	3OFG5+sg22rruWYaLrm45babqvgX1G76dKfQ/07UfbO5mIWY1esmAF3OUkNvp8eFcitPez+/kQN
	N6V6aOynVYTWejMFzV4NmM3uqg+1A722XKshhA8EOvKB+YJYw4NZ80UepIfoS097PQ6JYu9SW8t
	Vtj2ndctCFb+d+pV2rXf+7rx2L3vjXyiLBA1j679mAgbFi/6rX6igGbqQVM/yVT7u7koK53x6ms
	WBLOswUinMDJmGgP0UpkJ73FTjYg81P40DjuisyGgEH6OkUznEPcXBe14KxSn/ZgTsAOvbFJzRt
	SuTfcYG4kBDR6pq7LFH18f4azqie7B/PwO49fvGX/9UKYj4I50qXr9k2kLy8K1VKqhm8H41izNN
	QdZuBBNDCSsAHZy418oQhf4nFmjGepyOhzOKKvBaVmxjuWPn2JGOf8izSfxd94AplnzF8g==
X-Received: by 2002:a05:693c:88c3:10b0:36e:4aaf:6c7b with SMTP id 5a478bee46e88-3796740c786mr885305eec.39.1794535537128;
        Thu, 12 Nov 2026 18:05:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm2342174eec.17.2026.11.12.18.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:05:36 -0800 (PST)
Date: Thu, 12 Nov 2026 18:05:35 -0800
Message-ID: <5a9a39b3d7b0e7fe0b1924fe0f97d14b@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	linux-m68k@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
In-Reply-To: <20261021022336.2232886-1-miro.kropacek@gmail.com>
References: <20261021000338.2160223-1-miro.kropacek@gmail.com> <20261021022336.2232886-1-miro.kropacek@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Oct 21, 2026 at 12:23:36PM +1000, Miro Kropacek wrote:
> Kernels are built with -funsigned-char since version 6.2, resulting in
> the signed 8-bit position deltas reported by the IKBD being
> misinterpreted as unsigned.
>
> The hook is handed a raw IKBD packet, so take it as a byte stream and
> apply the sign to the two displacement values alone.
>
> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Cc: linux-input <linux-input@vger.kernel.org>

Applied, thank you.

-- 
Dmitry
