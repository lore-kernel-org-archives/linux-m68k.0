Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907036;
	b=aPcF7mWrjBg7NXoJSo2I31pMPP1yccrufP0UFbHB550/dv5KqGz0hF4/o0diWkwu1hHk
	 u6uiWGEO7vk0aTW0JVBeVOH4xgWS76WjhY1UfkN4clNEpc8Fb9SMLzUGJ42Uq55Ljddv3
	 KR55O8CZefTKrWwC/TEu/QuS2emSAxGhE/jjCY8vCe8byHVJBgH0cOvENOvh/c0V4T3PP
	 t/o/JH2eAHgf1eBAtcqcWwkr73GBPhY5zd5qGZOQsg1KIZdkBSiTcTvtGGFoob4Qn7Xid
	 M0MXhBgP+NDlzDVlg7ebwuDY9Kr4CLuxWc3XBTy6zCWgBio+gWSvmtPZkR71jAru8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907036;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=hhNNwe04L4FKYQylx+fx8GowXeOCuwfY4bU4uoMs+Zk=;
	b=wC9ZeNwR8fJvfK23P0lyMYgI65q+e1ZHJuCiLJCVLDMzLu91wGDQeCKs/L4rNPplbSP4
	 GzbXKxcnPJj9mJ9Jand1Zi2QxRxNm/5jpIkcLOBmHxfeNwKG8EQn+hA7FvYarTIii/CjL
	 xvCWUFo/vl7nEjNeA6JLVna0CnRxkgWtkGVALpxpYd8Yz9+nDFXfAgCC9K/LjJzuvjUB/
	 sJ7ezQM2uR2JsU0zSkk2y3hj9QI3fpt7TYQPh69lQ8eEd9zBepXq87E0pYjPQIDS+Jt5G
	 nQ7GRKsPCakwVq5Gojr9Uarru64p35Hl7/R3JDm5JZKmtBcBt6N2xsF1Lm/z+r9JwxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H5d/fGZi";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AFE606C8B0
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AFE606C8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5d/fGZi
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E07601F5;
	Thu,  5 Nov 2026 19:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA2F1F000C1;
	Thu,  5 Nov 2026 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907035;
	bh=hhNNwe04L4FKYQylx+fx8GowXeOCuwfY4bU4uoMs+Zk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5d/fGZie/GoRN7MHtK+vOB/Ap1IgYNrnS7OIFVYrIl3BAh2twEoWoV2v1D1ANr82
	 Z88cSeALKxyTaNGZMcx6eAjOqVsj7JMMVVHDzaMXh9vzmIx4JwInJVfr9Glo3L+Jbr
	 EcyVSXsNPriCocoRBtla7Tbb+aIbDHKYiN5X3R3O6c36//3BOWw3M4U+PaEq112AWQ
	 9c6EaQ95R7dZEkoNxWPFXpR5y//vT+nN/V5TXpwOF2BZ/cJsAVeFgDgQAnT/m8f7XF
	 3V3fQRCNlNmMpcBNkB0tSssvWsyXhfdHIwU6LUOeywmgh0K3F4lJUnYbrVCAdczb3x
	 LI5cY1vDJVFeA==
Message-ID: <sashiko-outbox-199914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 51/51] selftests/proc: check that a faulting
 readlink() doesn't hold up removal
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
In-Reply-To: <20261104-work-procfs-bugfixes-v2-51-021c84d852e0@kernel.org>
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org>
 <20261104-work-procfs-bugfixes-v2-51-021c84d852e0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:30:32 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Add the symlink case:
>=20
> - readlink() /proc/asound/<id> of a dummy card into a buffer backed by
>   userfaultfd
>=20
> - change the card's id through sysfs while the reader faults, which
>   removes the symlink with snd_card_mutex and info_mutex held
>=20
> - expect that to finish without waiting for the reader
>=20
> Skipped without snd-dummy.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-bugfixes-v2-0-021c84d852e0@kernel.org?part=3D51

