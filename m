Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473833C5525
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472826; cv=none; b=Vvj5UvVTxcknALkFPFbReW8RbkJiys3lkO23d9hO8bF5410S2w9Qfa8GV3EapZw2HoWaMYai/r+euMjSDC0XeLu1qF2BS6K3Tk2Uz2GP/h3xWhO6BFAnpwi9MkM4xe+3v4Y8HBW77Ti7DswJmixaBxdvmecxt8RlwidwyxFNi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472826; c=relaxed/simple;
	bh=1FXL4Jf8yBVgDdd94W09xM8udoaJZ5UUF8s2j4f47FI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TwgxT45k1VjkA4q4RWMzIQgHiNeWKtgKkt94Hur5iPnp2kTA+Hhy8RaexCR+aysMIGfYOhwNyuSLyncvjKl/C64tnoPgMUqzZ4Cd2sWMDwGOJAqUr85a3M3fUjc+5x5zbBeiT7kx1OPx9qRnGkO+JCY3pSDozGh9NwCmrVpZ3oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ2fNNJC; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ2fNNJC"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65AF9600D1;
	Tue, 15 Sep 2026 11:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06AB1F000FF;
	Tue, 15 Sep 2026 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472824;
	bh=1FXL4Jf8yBVgDdd94W09xM8udoaJZ5UUF8s2j4f47FI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QZ2fNNJCuZ/sDU9+NThrbq1C/6AJLSLjjYgkUbk/7nyMpmrJulfwzYoTCnnUhGe1L
	 CM809wjln9o8pUKvHaoaakBSdFe1J5tqURNyqgIGcIuV6TRA8iPD7jKUcKFqitGx8q
	 oytUrD66lpaS6duQZikdiD0MeK2wDhNbj/m9eIQI7ZfsqhvaTsVLdZ3ePpFdtQU9w3
	 reft3HQkQjN4ISX6sjFZlRkikFCalaD/JcuYF22HxwucYna7hJWQtoxtZdruPzMFDI
	 MwYt7lw+eOd2EaBTBnZye65X6XApTnuMpo5CD8CFs/K5wRHgdlLP4ZJrnz4u511/Ze
	 ZevBo3IdlwroA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 07/50] csky: commit fds on syscall exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-mm@kvack.org, "Ingo Molnar" <mingo@redhat.com>, virtualization@lists.linux.dev, "Michael
 S. Tsirkin" <mst@redhat.com>, "Jens Axboe" <axboe@kernel.dk>, "Peter
 Zijlstra" <peterz@infradead.org>, "David Airlie" <airlied@redhat.com>, linux-sh@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-parisc@vger.kernel.org, linux-um@lists.infradead.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, "Jan Kara" <jack@suse.cz>, linux-hexagon@vger.kernel.org, kvm@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-7-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-7-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:47:01 +0000
Message-Id: <20260915114701.C06AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

> Add TIF_FD_SLOTS and test it after the untraced system call has
> stored its return value. A task that reserved descriptors joins the
> traced path, where syscall_trace_exit() commits them before audit and
> the ptrace exit stop.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D7

