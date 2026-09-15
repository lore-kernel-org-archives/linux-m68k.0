Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F844AEBE0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474519; cv=none; b=ubdmY76YFv47uPAxxzKdgHIMy2Pym5RButam4+LWKplg+nxws0w7fIAS38zFlBPNy/fqHKy7wS0ioPrdElmAPrBHzreWOk/leG1MNKAEUtSh+rIQ1gmUV2tR4YOoBPRlFVl3SmFrAEXundKXGJOiwLFpBtCIABeDohTGRqY40wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474519; c=relaxed/simple;
	bh=7Ki6bSBJwaxJJeHi7SKUuFLkbZmfL/7uuTnWaWs93uA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OxARgLsgVihSBBx+rCso9jg9lhkMvCKakoSV8SGdg6Oqa5Z8U35/lvrq4oyXFbJn7A1yNwbrFTaWQAGVka4fuYCs9I6Tn40wC9+6i6ddhg/1xX5JxPGkIu2z9pcmZgWASs9a6CdAabz2MzDK3UL5LIbzEo4WQXQsrqH7mv3lWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI77b5Cs; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI77b5Cs"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4720D60261;
	Tue, 15 Sep 2026 12:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295751F000FF;
	Tue, 15 Sep 2026 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474517;
	bh=7Ki6bSBJwaxJJeHi7SKUuFLkbZmfL/7uuTnWaWs93uA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kI77b5Cs1CCH5C2TVxPIT8fy3wL5A+5GVvFbNqnc8ywtIl1xsP+kz2+YtB6oqe4rq
	 l5MIumARVSkDXAKZVkJf4FmmuUstog7U7WkwkoO47/GequtFboDqXFKBhm8gRVl+8O
	 R05h3rhCE8VlU3e70rQ0v5HNwr7mByz6nbAUN2qjsZ4EdPZrSzKMrkSw0ptkltPWdD
	 1K9aNz+rSv8p4Ksfg6V+iO9PxpNKvssHsTIw8bHe/sGHatYYCzuFLzRvKplACIwjle
	 MkbJfnFHm3eFE1Z3cOPmlWvybtFLHN5O2L13O1dy8fXdonFCUhJlZiezPlMPDhpdxP
	 QdqQbUTSLLEqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 44/50] drm/etnaviv: install the out-fence
 descriptor when the ioctl returns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: virtualization@lists.linux.dev, linux-parisc@vger.kernel.org, io-uring@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, "Jann Horn" <jannh@google.com>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, "Ingo Molnar" <mingo@redhat.com>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, kexec@lists.infradead.org, "Peter Zijlstra" <peterz@infradead.org>, linux-csky@vger.kernel.org, linux-openrisc@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-44-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-44-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:15:14 +0000
Message-Id: <20260915121515.295751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

> Rely on the fd exit path machinery.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-work-fd-re=
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D44

