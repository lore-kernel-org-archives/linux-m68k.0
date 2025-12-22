Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50AB665
	for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Dec 2025 00:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766364498; cv=none; b=htQi07BBwYpQxAMyb/YDZOhJ7OD8NkQt/N1h23zvVxYS7VH4CgUM5Av8T9txI+UYyOCJ0XSNtMwq0LXLUjLO7UjacfaqwFM9iMYDAyhMUdQANwrGbnOo/n9e5JaxYyaFG6GAFYGUTeLJ5vw3/PIFeV0GECxs8mFh2OtqIjnPBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766364498; c=relaxed/simple;
	bh=VzAGgsB4CZ06CGGPAwW0bd5B76P5Z0NtwLbnSPzY5jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/bJhNDPfkdJnkuwFgwR2aW8mfEPxSS+X7IB4wVG3m2ygZuCYPpPuulPXcoW4YMEee+tkoBCK4qRrthvZzREt4vc4c48xSRus1Pj37TbyZ4QKMRhRmzvmkrohsEnmdHmkN9U/TVN408nMBkri94s4Pa6rgltPFL+maoADJTp7xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=asuZoBoO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="asuZoBoO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c565b888dso3905989a91.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Dec 2025 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1766364495; x=1766969295; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzAGgsB4CZ06CGGPAwW0bd5B76P5Z0NtwLbnSPzY5jI=;
        b=asuZoBoO/M7aH/OwN/8nFEY1f3fQjPhlx1qp2JPIkPiPfdjPSFwR5M65j/eQBatfPQ
         4oLSBJHOv4DFi66p9ncZVcwE/44I0vvgA/ff3W0HPxj1T6WVyHRVMM7ljAvOy3Nd/Tj3
         7/ApsqqCCdHBDpszCHa/iuILKfSgdG+tpS2Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766364495; x=1766969295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzAGgsB4CZ06CGGPAwW0bd5B76P5Z0NtwLbnSPzY5jI=;
        b=w2SSLnxQara4hMxNTfDwF8qBCNqW4EXQb4ZdcRgglvVdWt6+FintNkjW/XC5Pqo4J0
         w0f10cIOKXLIlD3GxkxJx8ORe9aHxX8DW1p5zDC8nEPhrWkwrs25nXM7UridK20bk8rq
         DU2MZ76xc3VakSbQCD6n7tfIUWLSy+WIfYTYDSHxYxy8L05sT5wnhYKp8HbqDACDvBdq
         wpMc/yxfIU7KWNpGmbWIGbhgL3sCtbfZP6R5RXiTWd0kjnzHTlt2f3O9WOOSQLaePf9M
         FGMgBjYgYLI3m6IvgC5VX8UcqtfZP+dpZZXwY1nQxfe2IJj926cvghOei5TGpMvu1K49
         1mQA==
X-Gm-Message-State: AOJu0YzD1btaww5ilrOMysMQ6mK7tIm98r1mrsYBppsy1XXRDIIDZX+6
	Kr0PWA/H4O97ndQC3W4RW9uOtJSFEAAdPAyROLMXVgVc1840DFU6kw73aNd4HRu8Z2dDa3EWnR2
	VSxu+2e0bBM0mMgT5PBLpWnBjVW37pQS8wJkptlGQ924jlEikLcD9
X-Gm-Gg: AY/fxX7+CUmC2djSDBfWtq7MK170nczigDuWzHVQ9yfFS6cTZvAID/xT9dyzBSTzRFq
	WbxG1aU9TtRnFdUtekePz5exHqx8E4xm/Hd9jWjDjkJ4ugYQ7HjZk1H3EStmEwnJh9DFLDbEbFA
	H67ldYSRJ3cii74hk1sjlTjfdxT+MUSSJj5v3JLKQOTq9f5NeQzXdFpYJF5HsxeX/yH4Dlkt5pq
	6gAE3G8Q7QBxJIdvw5UlzCSRBVpVsf5lu06t7tCx27YYdPpw8MPbB8YSb3GhW3d0rkSzbeP
X-Google-Smtp-Source: AGHT+IHzVyM/40ciZAsCxy/ddiLlkKqq2cgj3h202JuCFPcdOLOMMM7LQnZAmLChlKwYmrGf8w3bKo+1dkclrEQjmFc=
X-Received: by 2002:a05:6a21:3282:b0:366:14ac:e1fa with SMTP id
 adf61e73a8af0-376aa6eadfemr9825083637.76.1766364494780; Sun, 21 Dec 2025
 16:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213120401.3992567-1-daniel@thingy.jp> <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
 <CAFr9PX=hfUoqyiVwA5CRoC6mmr4KmYbxvodMmFFk_k8-NGp9cg@mail.gmail.com> <5a1242e4-c8a6-4f31-828c-07bc64df5f3f@helsinkinet.fi>
In-Reply-To: <5a1242e4-c8a6-4f31-828c-07bc64df5f3f@helsinkinet.fi>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 22 Dec 2025 09:48:03 +0900
X-Gm-Features: AQt7F2oZqGQi0KT4uO8vUHWVUjmZ5vfB05lZ1y621zRt9dDhp_Ppn4E8A7tUTZ8
Message-ID: <CAFr9PXkfY=v-OGibxWBf_-wOBX909Mqsy=KqUpfmDA2hNnS7yQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Eero,

On Mon, 22 Dec 2025 at 08:54, Eero Tamminen <oak@helsinkinet.fi> wrote:
> Both WinUAE (Amiga) and Hatari (Atari) emulators emulate 680x0
> exceptions just fine, and can run Linux.
>
> (They also emulate 030 cache and it's even semi-cycle-accurate [1].)
>
> Hatari CLI debugger / profiler will give you kernel backtraces even if
> kernel itself could not, see: https://www.hatari-emu.org/doc/m68k-linux.txt

I have been using WinUAE. The driver I sent for the A4000 mediator PCI
bridge I sent a while back was initially tested in WinUAE and then
finished off on my real A4000.
I have to turn off JIT to get it working under wine so it's not very
fast. I didn't know about hatari, so I'll take a look.

I'm using QEMU for 68000 emulation because I have added a machine that
roughly emulates the Dragonball EZ that is "supported"[0] in the
kernel and I can use that to test most things before trying it on the
real hardware. It made getting u-boot and the kernel working properly
a lot easier.

Cheers,

Daniel

0 - GCC currently generates code that will cause unaligned accesses,
some code in entry.S is currently broken.
