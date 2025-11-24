Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10550224FA
	for <linux-m68k@vger.kernel.org>; Mon, 24 Nov 2025 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943830; cv=none; b=gUi2nRFduyd1cBEQE13nDvQyOwlC4lMcE3UraMYfoJKcqhW2ysp/PoDutwRRXmxo2ekeu0OL/GGklWqWUTBr/13kBNkBPzdAmkq6P2lmTPY1sLI+Bxo46cjhs4Rsd8DjY6QpBEeTrveq8BORg2TlyyhMtcXKH3VsaHRt4847KIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943830; c=relaxed/simple;
	bh=ctJiVIxSSswM/DirKHo1uF6IBGPapc9r5i6eptPoGqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDYXbWDoG2YdrpveZoZsnf/5Jd2l3oYBNE8AOMqLlmqYhxUyQO0TZD5lxnUSe/rZBGMVByXRZ/DW6eyGXSxmMV/UacRIpaF3zbrzjMFrH/rQPzDCWd344aZuu1t3mRBXbVKcgzR9e/UAm73j38D5nzL1k5sKlMeQMFj2wa27f7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Sqqy8hS2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Sqqy8hS2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3438231df5fso4897664a91.2
        for <linux-m68k@vger.kernel.org>; Sun, 23 Nov 2025 16:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1763943826; x=1764548626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ctJiVIxSSswM/DirKHo1uF6IBGPapc9r5i6eptPoGqU=;
        b=Sqqy8hS2isW9qZtWSZIIGcAVTzxEY67RJ4Oj7M8q1kHa4aNxHUlCT4v6otKZ1+CmTy
         6w2zI/Vx8z2O+hY9CB76IWrjrcbGwFjdJQ+m4bCquvb5pwJKk4BBFfsj+ZFeuE88cN8E
         jHcRVlyKxyZhREWoIc0nsDaXlH19JeOy85EF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943826; x=1764548626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctJiVIxSSswM/DirKHo1uF6IBGPapc9r5i6eptPoGqU=;
        b=pOkMK0Rv9u78WiZmu39C3NxIaOMu+ItdY4JmoV+9wAo2kg3ML6jWVv9Uk1pQyzo0ur
         LSsQr9as99GLwFr3Gwkq1EFhbtPyXscPbGtnyHe2HYL95tnlwHYYxY05noobjgiy3ss2
         sJImA6klPIpZu+zQ1dE1vMLHbfM7eBU55F7u866uNLZpyeDCjZrFGGPTLxak0fws0SMR
         CGi7G3QeSwn3kQhkDFT9M8LayV9IKkBYx8nuakEkhOcgtDGMfYU5b/ggNa8SFv5G35CE
         DkYe7QdmuHL/hljIg8TKRuRQwb4mQVmYuGtEu35UveGjZtOg0bZSAgYDKCoqBXtB5Q8g
         N3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX9wauDfClQxOlF8r4UzHiVTaGJcOmdWzF5KF66+b+S2ZbnvcbpgTxFABAtm9oHUrcmfGcd/+/uJ0Ge@vger.kernel.org
X-Gm-Message-State: AOJu0YyOzSeZmSM8uwEaMUfWeEBhSh0cIrQ3K1J6hlscLPESx1bBl/9P
	ztQjHxrWHs2IBlhHP32/Zfr8ZkxBorv67CIWfntrTNyEruT/qLIvjurJoZG8fDlN8eP3Uurw0ZO
	nWm8bagOcvQxNy8A8Ojo8j3okSOOWxfF7TQMXMavS0Q==
X-Gm-Gg: ASbGncvsmqF4U8JwBEXc/66VhpAvufkG7NWR5BzZHQ2JB1r9hPGHxRot9lJrzJlngYE
	gPj4yIceYnevaOd1wBe/v+YZ9w8SCcN/h1GkGO7iJF0YBQQXSmXU91fb08ATH3os8S6PQopLwHl
	lwsR8oZ5C8LV4DeD3vBG+OxA5/kLybYwmQe6tsZpePF3xKDHerOyTsFDlyQDsKqwnqOIV3ALtKU
	vINLHO6AsE7OafWwstSjcaDUJe2Lm+cO48OMXWz+FPFuuXX941WnDlJUKymYQJCcuH0M9nLiUa2
	v0v+kA==
X-Google-Smtp-Source: AGHT+IHB9op3daY794dPLTeV21OWyQsyLGvy/5OhyQ93d1a3QxTXfbzrEIyu3bdl3t9zonqX+aNxZEadjA62xVKNMZc=
X-Received: by 2002:a17:90b:2d8d:b0:343:5f43:933e with SMTP id
 98e67ed59e1d1-34733f2a487mr10157658a91.19.1763943826435; Sun, 23 Nov 2025
 16:23:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760999284.git.fthain@linux-m68k.org> <93055d50d71662261fbcc04488536e7330975954.1760999284.git.fthain@linux-m68k.org>
In-Reply-To: <93055d50d71662261fbcc04488536e7330975954.1760999284.git.fthain@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 24 Nov 2025 09:23:35 +0900
X-Gm-Features: AWmQ_bldRq0iekvVOlcL30LaBFzAfFhfpZdrV67w6EpuQo-NUSpJtS3YYp72TN8
Message-ID: <CAFr9PX=MYUDGJS2kAvPMkkfvH+0-SwQB_kxE4ea0J_wZ_pk=7w@mail.gmail.com>
Subject: Re: [RFC v4 3/5] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 21 Oct 2025 at 07:39, Finn Thain <fthain@linux-m68k.org> wrote:
>
> Some recent commits incorrectly assumed 4-byte alignment of locks.
> That assumption fails on Linux/m68k (and, interestingly, would have
> failed on Linux/cris also). Specify the minimum alignment of atomic
> variables for fewer surprises and (hopefully) better performance.

FWIW I implemented jump labels for m68k and I think there is a problem
with this in there too.
jump_label_init() calls static_key_set_entries() and setting
key->entries in there is corrupting 'atomic_t enabled' at the start of
key.

With this patch the problem goes away.

Cheers,

Daniel
