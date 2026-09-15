Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C084A8403
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473879; cv=none; b=Y9l2a+zMChaO5Niy3PmzGDKNoJYAG9M57UY/1sCEl+poCqKpE6VOOZ6pQII7uXxI/FJHLQp0Ppz7iDQTuM8bvsJkBcDTbz+RPJHzxD/8ogH1Zur4B7XFkLe6f2ac7iZWbNlCg6lWtX1udPs9kjfMVx8z3eV+814abBMhTR13MgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473879; c=relaxed/simple;
	bh=J5fP9X9CyVcuvKEYfpMseQ+In05Wp0Z5tRJ1lE5PSRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1uUn1w1kJ76q+pRYuPsomvsp7MWf0skTvi8y4eCw5a2y3ZcvvYy88/0SmpRUgRu6FL+iZlncdjAyCIqGTCkzmhKGT1i2sgNJrVAnKkhO4I6EWqHFS8BuaNvvSCS3W3AJmugGaQ/JoACSrfDoP2V/cW62cVHptwdCddB4mGldwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuq2lBlL; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuq2lBlL"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3B4360261;
	Tue, 15 Sep 2026 12:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E9A1F000FF;
	Tue, 15 Sep 2026 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473876;
	bh=J5fP9X9CyVcuvKEYfpMseQ+In05Wp0Z5tRJ1lE5PSRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cuq2lBlLoUw0Y72t9bFSWoR4MpMhbFj50xeEgbG3mMkdmknSMptpwSK3xFErl6Es+
	 ul9rPuaoVaEF1rSc09McY1HCQ8/KvrsXmDJngtm2g8pGOkK8SksKn5c2XZu2qd6neC
	 /n8PpaNv6M0cIf41/P5ePeN8jF4tTMI4A5SgldO4z9TVfn+pUHuseWjwq3FPjMZVL+
	 /A1Dp6mNtF0UCTI50gLLUPpKDrqKyRhLmvgM/WajGKJ4JWHsivD3qdtc0trmEiG9AU
	 uvPQ8IW2ncEh1yY23HCpFM+zP/B5XadcfTF+40CtiH7dhqHPX0XUxaPv0A3g/x9nid
	 zNRhKlOBXH0Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 28/50] drm/msm: install the out-fence descriptor
 when the ioctl returns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: kexec@lists.infradead.org, io-uring@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>, "Jan
 Kara" <jack@suse.cz>, linux-hexagon@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, linux-mm@kvack.org, linux-csky@vger.kernel.org, linux-um@lists.infradead.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-gpio@vger.kernel.org, "Oleg Nesterov" <oleg@redhat.com>, linux-arm-msm@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-hyperv@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, kvm@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, "Jens Axboe" <axboe@kernel.dk>, linux-snps-arc@lists.infradead.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-28-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-28-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:04:34 +0000
Message-Id: <20260915120435.28E9A1F000FF@smtp.kernel.org>
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
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D28

