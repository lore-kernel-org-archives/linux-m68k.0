Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908662;
	b=GqPCJ+Z5CUxWEmLDNDnmfa7EpRa/M8ibB4JNUQ+7mfFcAstCcCDXBJ9cig3seMxCO7Zs
	 FDill4uOJ9jiIMbrnLW/8A6ojn1XfnPPss56amrwXRcd2MFqKAF2ae7yno8GaL+YVBFlw
	 bBXElqdL1ty7H+zXNux7mFq9HlYan77tFGg8GhpBVYiJ1qyPaWHCBeJhdj3SQxhk+n+u9
	 qMzBmKPUUW2FWe681esmeb0vI51FNxEeSK964c/r7tGjMdjxhkLlYiTQZLQeEroN784Oa
	 nQSuIwJl0imDWLzfD8pRj+oxE1maItv6LaIcIJKeiE4IRi3kKv3P0+CosGS+4YVBbMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908662;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=1ucq80d/HBPFI1YIkIEFNdSOXOIK1pX2sWoSRce4LGk=;
	b=0AfcWScEAY7Goe72jZdQNDvumbSYzIUknMX8zBghGFAauJObJG6a3jR0JjDekjlcPiOb
	 UcBJeLA/+SzkPijZ157g8dcAZhAPmDN2aEtXeRP7a8m12pQLPInv/Yb3j+zofFQre2pj0
	 AmVKaGeBtgfIMRv6pi5o7VwesA4Li/ITZDckqEAzwMkoM40SfeOaJNUPJZTUocwCdjvmS
	 x5HpWFr2O1FLx1SkukFvlbYLkzYXt56+0yW5i4u+oj/ZUE1UsGzKWBazCXkEzU1SE/VXR
	 kaTh/4iMY99Fcrt8xK4QMGRtA74Q9NDyKujdnCbvAZtggb5Kd+e1YN3j8oCgZ5bEMPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyklZAYd;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A80606B068
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 19:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A80606B068
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyklZAYd
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BA8A406BF;
	Thu,  5 Nov 2026 19:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CAC1F008A7;
	Thu,  5 Nov 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908662;
	bh=1ucq80d/HBPFI1YIkIEFNdSOXOIK1pX2sWoSRce4LGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cyklZAYdu0ZVZTXCtdmNiCr7HiuHeOQyL+0S7CFmQsIMMFfQNly59rhkWaVoLt25u
	 GJWHmTWEJKwUQ3jEJYZRj8f0gumZIfwawo6h0vxZMknc3/HmVH0Cy+FDJgc4U1e5Jm
	 T7qHR2VsrYj78ByH806qRFBswbz63IekHv3Cvnq52k0GiBF4SJQjnw1YKFUxkcxM7V
	 f8oPRK0Sk4UnkzaejQ6R5LFelnNPmHaMgfodZ9a79DjRBdXTM0VSqVCS2MZtqqfHSG
	 VITqB4tE5wR5v6/XkuPGTmojFSNSLFTaqw3nVHzkB1jGn3Zm8qRlfF/iUUSqvdE60Q
	 I7YHfXHpobwTg==
Message-ID: <sashiko-outbox-200040@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 06/30] nfsd: let procfs own the seq_file of
 /proc/fs/nfs/exports
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
In-Reply-To: <20261104-work-procfs-fs-v2-6-319e0f9a8aae@kernel.org>
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <20261104-work-procfs-fs-v2-6-319e0f9a8aae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:57:40 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Declare the seq_operations and let procfs open and free the seq_file.
> ->proc_open() and ->proc_release() only set up ->private and take and
> drop the reference to the network namespace now. Reading the file then
> no longer holds up its removal.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-work-procf=
s-fs-v2-0-319e0f9a8aae@kernel.org?part=3D6

