Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AF4C8C42
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473307; cv=none; b=YCwC8zoEHIczEWp37gQaeVbcYBprblb9q6vr6ERsnf1zBI/2ZzvJWwlZysbjwwVQf+jUeJqIjnp7X1MoMbBbmK/YomFUBz++wlxe+JdM1lXZZgko6hl5lq9kzyKHwUnHi0E3DO/OB/tLWdLassbN6mAw8ahYpOnxXwTo3DP7lvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473307; c=relaxed/simple;
	bh=z5q8YTazTS0g58MAO23KPqH00t77+r0Qm1szy+uSGx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fsfrw5f0NlPAtH0Luh5o2QmePI7KqcInLidlEpzDzCY4qC4uVnXz0AnxXW2XVu4HfU/sdt2CXNoxQho6fX+EqP2BZx/zKaoF8hwb245glEQnLv326HEgjo3CnDs7v5YKgYHPAHYmCsUbpFGAm3P0keRVQRHXl1CIa1KAuu8ukCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuWOcXAx; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuWOcXAx"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F6A44503;
	Tue, 15 Sep 2026 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148F91F00893;
	Tue, 15 Sep 2026 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473305;
	bh=z5q8YTazTS0g58MAO23KPqH00t77+r0Qm1szy+uSGx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZuWOcXAxSUf8U369yMDLM5CrTH3NJo6vFF48Zf7qsB7e9dLLAU7rmbvFKGtSwEN54
	 mrXyu8/sUo7qSyMhvbEGo+56h3zo92SZrUdXQDVHKmZsSL1yip9FieQwDFx3xFr6W4
	 tBOqKBhe78D3RbDLNy/MZGAQn79PhMCfv5ZbZLoxyQiJCVFGpeYe2T3W8SPiGli1OE
	 NJ9s1R/i1hoZ9yPqcd3D1GgTWMiPLPMS4hdNI6X7OCZH/p2PAhMdHWisK0u0w1/QXC
	 YOxwO8oP0q6Czx2WnOyHnYHMCetkSnm/+kFJHxdJpz1jYA9qFglwCwZ6hc4JzfujT3
	 h2LUQd6qFe6SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 01/50] file: install files on syscall exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, kvm@vger.kernel.org, bpf@vger.kernel.org, io-uring@vger.kernel.org, linux-alpha@vger.kernel.org, kexec@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>, dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-openrisc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, "Ingo Molnar" <mingo@redhat.com>, "Oleg Nesterov" <oleg@redhat.com>, "David
 Airlie" <airlied@redhat.com>, "Eugenio Perez" <eperezma@redhat.com>, linux-csky@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-mips@vger.kernel.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "Peter
 Zijlstra" <peterz@infradead.org>, virtualization@lists.linux.dev, "Jan Kara" <jack@suse.cz>, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-1-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-1-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:55:03 +0000
Message-Id: <20260915115504.148F91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

> So we've spoken about this idea quite a few times over the years that
> we could reserve fds and files on a task and then install or a clean
> them up on syscall success or error and get rid of most of the
> complicated cleanup dance that we have.
>=20
> My original approach to this had been to implement FD_PREPARE() based on
> cleanup guards and use scopes to make this happen. The other idea was
> what I'm illustrating here. It is overall equally robust and makes the
> install fd and file pattern work even if it there's a ton of cleanup or
> setup work happening in the middle. This is particular evident in the
> conversions of various dma/drm code later in the series.
>=20
> So this lets the syscall path do the install. fd_prepare() allocates a
> descriptor like get_unused_fd_flags() does and records it in a slot on
> the task. fd_stage() attaches the file to that slot and returns the
> [ ... ]
> fdtagble with outstanding reservations. Kernel threads never return to
> userspace so nothing would commit. Anything left at exit is a bug and
> gets warned about and dropped.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D1

