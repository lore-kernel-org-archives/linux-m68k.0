Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1956493646
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473305; cv=none; b=MmJWLgBfLACyx9FrJeXWmnvI26pvPLI5EfKkr044/+xgyLzqOvYAhJron8KoQKoRerFQRsuRWDhfYCWHMFr+QVjAgnyXcIUwsR8k1Y4eh17mHoCGXHJOnqr+ZM1b5GpARsmidi+F2INtNpuEvpF4S4AqG9d7xEn4mdg0SR7vYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473305; c=relaxed/simple;
	bh=D7g9xDZ0omvORxToAZd7wz5+AlCcHiBcOzmxibNhlVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ehwg6kDtHAipTDzr52NVxtoi5zEjak484AEOS9XkMCOtUmh8A6aWjx8Km0PfebSz4QrDkVl/t7TWY3JznKcipy3P6GuFpt3HktnXWEjz1HGIAlgjdUQJNWRk2pwpb0KGOLN/ppMTbZ8yzl2mz+Jbq/puSkkyzeiqxw/Awhvq6jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyJu22BU; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyJu22BU"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A243943B4D;
	Tue, 15 Sep 2026 11:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D521F000FF;
	Tue, 15 Sep 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473303;
	bh=D7g9xDZ0omvORxToAZd7wz5+AlCcHiBcOzmxibNhlVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyJu22BUp/krcHqRNTq7jKcZ/omh/8BK0J0GGcmbyy5eXF7HLUhGysm81swJVRcRo
	 fJATPHtnqwBnOk6PWVqaIPLWcfH7MWcD4yqz6G7e3EGCMvuO13BOVBnpv9ez1pkoHo
	 h5dypooXJxYBa1oPbCPR5mUV6AbHtDqPpwLdNjZnOwcsbqEhQDByZ9Y6IWPAHL+aCB
	 IGdiRVZ8zo4AG0M9gKDQBs0eP2aITK9r+bHOxAfCyl+sA6VP5e3n+m73i2wu6dE27u
	 SdD2cWl466lslpt4/j2EFsvQA0Pnw2GlUhysF9C6CVND6+HZdKJG2WejdsdT6gvwdV
	 rDjhEE9s7krJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 15/50] sh: commit fds on syscall exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-gpio@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>, "Jan
 Kara" <jack@suse.cz>, "Ingo Molnar" <mingo@redhat.com>, linux-hexagon@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Jann
 Horn" <jannh@google.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, bpf@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-csky@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, virtualization@lists.linux.dev, kexec@lists.infradead.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Michael
 S. Tsirkin" <mst@redhat.com>, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-snps-arc@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-hyperv@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-15-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-15-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 11:55:00 +0000
Message-Id: <20260915115500.C1D521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

> Add TIF_FD_SLOTS to the syscall work mask. syscall_exit rereads the
> flags after the system call and goes to syscall_exit_work for any bit
> in the all-work mask, but hands over a copy shifted right by eight
> when the bit was in the upper byte. Reload the flags there and test
> the full mask, so that the bit reaches do_syscall_trace_leave().
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D15

