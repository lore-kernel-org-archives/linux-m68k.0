Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11164A5EA0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473776; cv=none; b=NCq7NxWnYjiScjubFzqXDPKu3nEtaO7UeoVE1vG64vfskH6hhhWCGXSDRtANGBWzRQK3PiNkPFV5+sFaORgYQWRl4m7h4WpJ8KtHC0FF9l0sYb3X6rnrkr8PMdfUZbUkrS0ds4oY8DkS3nIrh7aTL/nz2m5ICImxGgTstjjcCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473776; c=relaxed/simple;
	bh=DKmKc8nUgnveY4UghGsysLXcnr7yvrf1lajtZ4j0caE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dS64kqK5IQSRQAgQyIYHS5nEc/5QhSZNK2BCTn4TzZOXdWo4HBADzxEvXGG8JpfrX+f4Xk9/7Ni3k+BSJ5FlTFn3HS1GyAbWM8eXzpTRluFE2k1GTyoOcEcICBslcMrzDoE4vQc6Ker8+Dumchz5jU3DIQZUfrHaRqp5W8BzUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfQU5nin; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfQU5nin"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B76E41687;
	Tue, 15 Sep 2026 12:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A091F000FF;
	Tue, 15 Sep 2026 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473774;
	bh=DKmKc8nUgnveY4UghGsysLXcnr7yvrf1lajtZ4j0caE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfQU5ninsS1IF1iFmSCoi9zf6HJdPuTsj7XVVosHw24AZzhEXM7lUTSHKfoNPHRdo
	 ftBPV2UxXZ2x35Xuh5jkFihXtOZzfFYSs5oMx5CREjLOMipaTe8AZXg3ZWUkHTE9VL
	 3gNhL/WjsyOkNox97h2tfNc5eOHIstmUUtbf7Kt7QK0dzF9fCvXokT4Z7qzy3LnalW
	 L8pIgSgRVoLl7LNk9qv23YKEL97Hvnx60zhcjswEXimdWiH3nyH090Y8Tjh1FGnAql
	 aHkyZipO2f+jnmDQAYZHAx+8OnX8dq3pE0GKnLcYYqt6qe+Wm21ZPjEtaRgeSDex2F
	 1fIq73PDJ4NnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 13/50] openrisc: commit fds on syscall exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-csky@vger.kernel.org, io-uring@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>, linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-mips@vger.kernel.org, "David Airlie" <airlied@redhat.com>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Ingo Molnar" <mingo@redhat.com>, linux-hyperv@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Jann
 Horn" <jannh@google.com>, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org, kexec@lists.infradead.org, dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, sparclinux@vger.kernel.org, linux-gpio@vger.kernel.org, linux-um@lists.infradead.org, virtualization@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Oleg
 Nesterov" <oleg@redhat.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-13-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-13-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:02:52 +0000
Message-Id: <20260915120252.89A091F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

> Add TIF_FD_SLOTS and test it together with TIF_SYSCALL_TRACE on the
> way out of a system call. The check used to rely on the flags r30 had
> been loaded with before the call. Reload them. The syscall may have set
> the new bit. A task that reserved descriptors calls
> do_syscall_trace_leave() which commits them before audit and the ptrace
> exit stop.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D13

