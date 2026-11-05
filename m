Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908185;
	b=kNOice5cW+vlE6llS8PHGKbbkjaY2QURGUr4uVojHRU1WxdMWHkA+I/kOyOjA0VnAaM6
	 LC9Yc2Sv2qPJXmg0NSYDNKeDlQLpgE+uF7RYeq27fycOMfTNp4so2WgGtLvZHOad0d+x5
	 2Pl2suvoAUBfLw/Tw6XgmqAneMnVwpIOulila8cymhHAFxj7ogfaDI+YK6KfyB9l9Y250
	 N6FkaFqZS5sR8rHAVMfIL5+4cAnW66P5mptPlN3hpwguZUOgfixPoEdJ9BmZJW1RlVf/A
	 5Dljbw+f6OAG+RHl1xN5wiGZehwcYre7MU+K3lYuBt+xcbfk4+akPCC6pR7BUsLugCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908185;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=XSphZc3LyPS+EdceHd5ViHHvsF/QdXAOc9PSkDWrNZg=;
	b=r01XKM7fVi8O5+dKX5ecYx5XN7HWzrtci3UzLfd/MjFa69v6r66Ut2UA0fOr7XqsE1Ex
	 k54V5Tu6lOyYNlQ4TWYdX+3l7T+lPzah/2fSpB3U83j7cJTzkpXoGqBJpe1zJDPxtH3P+
	 xNpgePVrTVpBTTy1ViW01pMFhEtO6H+dE2BP8Pv/ge365l/uV/JCttw2KNJkck0saIErA
	 Vs+D2nFttj8ynstqYurv7rMbXtPxqBbHzG9g7XhRKfqDLw9l+FCB/h2xIk8SVuXSDGuOD
	 NRbECuQNTcfRSa5JFuGsjZU5Wr9DPabviLRetak5HwoSM7aDp30iwTcw0jw5iDghY3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FFKms/SI";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7956077286
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F7956077286
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFKms/SI
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1563440800;
	Thu,  5 Nov 2026 19:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DBB1F008A5;
	Thu,  5 Nov 2026 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908185;
	bh=XSphZc3LyPS+EdceHd5ViHHvsF/QdXAOc9PSkDWrNZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFKms/SIbzeZwhKUlN75YuSiPVFEs5d3cs0UA/g2kXDwykf+fHrTkZiutKodvVl5s
	 k8PVYi4oD9vM00fz8xUvAGWzS16jLX/MFftL4y0XPUzoW8QSqQmMM3gNOUv9jrXFFk
	 MKdcavDQjhD2d4vZDi9rRi9K9rq+HjNXd8Du8YLRwmh+mz26G8lGyG72TD3xa9AsiQ
	 Ky10EFHsLiFarQjEFieXK4vlUf97pAdeoK1sysGLdIMgSxZT8CU9hzK34lFdajHmCW
	 rYrS6SP+zYJOEJk7EoGn/FndrcpVApApmvOioKDCddP+4LLyE64jE/Wf1lsfwAl/KB
	 KkSBU/LxFA5Ig==
Message-ID: <sashiko-outbox-200004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 18/26] usb: gadget: function: rndis: let
 procfs copy in writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jann Horn" <jannh@google.com>, "Josef
 Bacik" <josef@toxicpanda.com>, "Chris Mason" <mason@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, NeilBrown <neil@brown.name>, "Eric Dumazet" <edumazet@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Al Viro" <viro@zeniv.linux.org.uk>, "Jonathan
 Corbet" <corbet@lwn.net>, "Christoph Hellwig" <hch@lst.de>, "Greg
 Kroah-Hartman" <gregkh@suse.de>, "Joel Granados" <joel.granados@kernel.org>, "Kees
 Cook" <kees@kernel.org>, "Jan Kara" <jack@suse.cz>, "Jan Kara" <jack@suse.com>, linux-s390@vger.kernel.org, coreteam@netfilter.org, kexec@lists.infradead.org, linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, "Takashi
 Iwai" <tiwai@suse.de>, linux-ext4@vger.kernel.org, "Chuck Lever" <cel@kernel.org>, tytso@mit.edu, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261104-work-procfs-drivers-v2-18-245e54e87116@kernel.org>
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-18-245e54e87116@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:49:43 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_write_buf() so procfs copies in what is written to
> /proc/driver/rndis-<n> before it pins the entry, and handle the
> commands from that copy. Writes larger than PAGE_SIZE - 1 bytes fail
> with -EINVAL now.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-drivers-v2-0-245e54e87116@kernel.org?part=3D18

