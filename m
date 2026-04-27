Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016473AB262
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327087; cv=none; b=LaEBzLJPn2/YLVSMjruCtkPG25aXIPb+6/aa8vWVZqvdrJJDLvXHdQ87RIdfOqULMwME5lYt+iwBYjb+pwqyqqjKHQq1rzOfo6F89H6yt6qzaM64dZ0Lv23OkrLh66nNB9tE6sLpQGVaZ8kHnDu/Ly9DjaBwHI5kmCGZtcFX5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327087; c=relaxed/simple;
	bh=7P7VU36hQu4iMsGekLZKiPL3rBFQOW0TOaXA+fXfycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ks70JuF2hPIH7/4Lp6vUlzANNOJQ/TFfWa3gIIPdbQjL8Ud1pNJ6nIZLbfDv7Ke1PdLKX37NFx5VcM+504Z4HLONOGN8WGKcBgemt1Y+EkLvjd3lJwL6OHAfrO/TiArTtzmxArEn1F0T8pgpSW9r4uDKVolm9TXEuZmhegTzrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DvnXxuiu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DvnXxuiu"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so16198930a12.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327078; x=1777931878; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=DvnXxuiuYToKICXUfzuYEL+7/jdIR0bpPZYJTKVgBjHaLp5wZ/gIW5IXDFKWTwTQCy
         qtWgCLhMpebLGne15MXFQYt+sWG8LmAlJOjv4EvodAhYj+jw51LVWl43jRsvUYrJjvbC
         PjRFlppgoQl7o1n+74vI5KuzUAt8JnW7owcVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327078; x=1777931878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=lU+gWiFR2HB0msv01PJJ3bpbgBkUT6UnHZztx72NQqwWyDi7K8vnwyXJwJj2q8aPWx
         3X+i881z3BZknlWw8BJOoLkr1sqFFBPKrHat4n9ONNWxZ/4CCaIY3HavRLXpNacsk7a4
         +pQNzO6JcyQTVldA1nlS1UpYZtl6Nv7AaWSb6NijKBIAi/sUr7YIVHCxzmGKBdWGcPuo
         roIoYghwMIg3lXPD+JfsrUUK4/x91szZr1re1SY/RgRs4oLulyu1qZ04wOXtNaQ8wUk1
         J+IK9Ebos43W8tfWfZOS6NTJwYiU4tYSD7RYpLmesbBJoiV+v0o3hRdRteev4WPBG0lQ
         nfPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NmGr3WI939zjdxCPUZuJtmcccA/x5o1liVYdhADJOJMDJW99yAe1Q8W4KeDn/Tp4/3UVKibcmGo91@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywfe5+1UKXCFRZxC0chE151s4WsQ2XSPA1zWcgLzEYgVhQVimmz
	wZrx4LGGX0CDDE4tnxTJpEqXGKzIm4TOWU5FwjgZveZ72PayQcCYmIA9NddleZ9UpOBUf92Onlw
	xBv9EGPmUXQ==
X-Gm-Gg: AeBDieuHj/Y8e6BzGwT1AuC33oRlCcgXsSdmn5v5035SRt9OrTweyDNmVUUIOJbTd4t
	mj8nFobcSdijiZToGjMhIF6JbcMD9yaP36P3PqXKiHo/bC6b3Y4hOWk9WrGYLuqiczGo3byYy3m
	h0xBOwmBtQdzhG5jr2PyFZFjuTG0svRSAXG73EJ6zoJKuUF1diBrADcqxWsKgLpFdPdnqfGiaTY
	qcxVNIlIQPx1r4pUtunquHPWaZi8lf9OBaiMVNYzQrA+WNJ9JX/PsLXrYwvLLSMMXZSoVUzMttj
	F+syFpr+cOxiHueUJUDOTU6ngwo9CUxnVlEtRzoIIr+cRTJWngVkzURReFzhtqHHWRWiLuOGqge
	Lac+CMtv+l3VDi93/w+hZ1rJetckZyEePCCujNJHdezUDEBACRfQnuapm1rwSfFC1JprN+yTg6m
	xX1T6WDW9dN1VSl8PE83mDi8fNIX0L+3+2tXWpOeTvjDkbaNhJXbDkARQpVdIT5h7lcm85j0Z++
	Lomvj4ZaBg=
X-Received: by 2002:a05:6402:3510:b0:669:cc03:334a with SMTP id 4fb4d7f45d1cf-679bb05f7admr181794a12.11.1777327078385;
        Mon, 27 Apr 2026 14:57:58 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67638ccsm168099a12.0.2026.04.27.14.57.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:57:58 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10759164a12.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 14:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80B39ScQjLTIHth0T4At6Rz+ug0On3iCw1nZoEdzBF2e6Wt+aBXea2Ip/eCbj9e9yNVHQgRBhBXzOn@lists.linux-m68k.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus
