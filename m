Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0FB372B57
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474040; cv=none; b=FkU8kCnuakvaK6Od0puKCb1owHf6/Z6nwJOhCFe232DZjR7jltAdrS/qt6w6b/XYlrrRoeQKYXFv1UqN/wJH+Tt1/w1/yc+OwR/ZIaclC43vXhgHkYmFG5vpLs8xA3k4ht9j0ye2xLtTOyuoee//7EFhiRSdFa9aHCtFShl1+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474040; c=relaxed/simple;
	bh=9Lg/vD+u14ITJU8+go78ZuhkRlXcBzG+UGmK5JLRPZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=omNyy96AbYE6G4oelWslPHKWBiuBye+rHEFohvekxOYS2AdVM6tGewDZy0F35djuoJr7WJfbIgTB0NX3sdxuMJybiJs4bcC6wawlVNIMdWc93XGYF1XQcnevvTAuZoSVGR4TZl+ThHtxYeJg7dydGQbot5X2jCFy1wgk/ulDiWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTE6T1Xf; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTE6T1Xf"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A10AC600D1;
	Tue, 15 Sep 2026 12:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F5F1F000FF;
	Tue, 15 Sep 2026 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474038;
	bh=9Lg/vD+u14ITJU8+go78ZuhkRlXcBzG+UGmK5JLRPZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTE6T1XfEzcNIJ8WFiySWnwQP8yJBWzCe+zXTpLvevuGzn9lG1wMo6JkmfwwL/Yd+
	 v0620B9v7rVjPwqdf+dJBvrXj/aAzuqd39yYhvfUVwF6Y68DbvQH8k6e9kkxs5lDOO
	 T8fcWkBPfS2hGnM0lvlb7z4+ZX10iJvVylZm/YCij8A1eYUDStsAMbhEWNr7ZTNW0K
	 d0wxrxeE8FTve/JAmJz66C/VfP51gl+cT2S3btyqcJ0w7YNf/OBOpnS9KLaOzdPK1Q
	 PzvyZfSsvRdUn8CutJLqPgs8jEgY3WTHPuRHCKpcfiaY7lO9YqAql9ka1D9FfKpgP7
	 bePqW74CAgyKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 31/50] vfio: install the migration data
 descriptor when the ioctl returns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: kexec@lists.infradead.org, linux-csky@vger.kernel.org, "Jens Axboe" <axboe@kernel.dk>, dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, linux-mm@kvack.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFt?=
 =?utf-8?b?dXRhYmxlKQ==?= <brauner@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, linux-sh@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-openrisc@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-hexagon@vger.kernel.org, "Oleg Nesterov" <oleg@redhat.com>, linux-snps-arc@lists.infradead.org, "David
 Airlie" <airlied@redhat.com>, linux-arm-msm@vger.kernel.org, linux-hyperv@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, io-uring@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, "Jann Horn" <jannh@google.com>, kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-31-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-31-4d5217d6b246@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:07:16 +0000
Message-Id: <20260915120717.15F5F1F000FF@smtp.kernel.org>
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
serve-unify-folded-v1-0-4d5217d6b246@kernel.org?part=3D31

