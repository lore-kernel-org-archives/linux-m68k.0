Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719140;
	b=fYosaK0y93FCLEyif62F/RajKj1CE2Csfg39ctIaVcYnS5vAzIEUO3TBheOOQpdkrwWh
	 eC9olszn+Ny1klJNaFboe9J97v4ra7g4GltXpfZQEcBJVx6JHvlKczjmHCyj7qAGogLWp
	 hhyKgc1Mr0zJSGiRKtDir00MqZLNBQaTI4g5WZDTmtAKDLng10lyPpF4E93GNbJ0Tsb58
	 j3WEqeAlQW2qwYAO7QU9KamrcDlnDRS9yeNQ02VmFSQedqWUynGsnr9DLClamn0MyRXUJ
	 4IFaLkcilGjW8t5gWrjBUgjJr6ftLSc/21VHlZeZyPr4mEwkm823ot4E0tXTQoVn8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719140;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=y9ivFE+8473vLZC4u44E0uCxK4vp/F+9XJkKNyMDnK4=;
	b=3oWogTDhopTtnpZk5SR17T/M9d4xLFKcEfFNRSoPt46ZT4Kcgjg3Z6CMn32UsrFcHJBv
	 kH22VBe0QreUTPy5KQ8xzQ3M1tmKAklbUs39W2r66tiqlTN7yrZB4u28zUJ92uFq6Cu7M
	 EsICrEBzXh8mcDToz7iovjeh05aU0bP5JzFxMhE+VrCDBpgfqPLRkNwRPjXz2Eqcu5VjN
	 dSLV8Js2482aTWMZMvUsZsS1PvcZ+e8YWrgJfzz7g8AW01ceYYD1KJRmZBpzY7OoWh6wG
	 YJcgvZTIZRbRvt0mM3e09nXd5bFBWUzaHvFjSBOBWe5FKZfFtMqAucZ3jfcAtVzxKjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmtyXin2;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD76083622
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9CD76083622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmtyXin2
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D6CC4394C;
	Tue,  3 Nov 2026 15:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A541F00A24;
	Tue,  3 Nov 2026 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719139;
	bh=y9ivFE+8473vLZC4u44E0uCxK4vp/F+9XJkKNyMDnK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmtyXin2yjAbPM31f4YaReEle+vN1wPD4L+slbEGaUF6hX4+kf+dRrnuROs6GNc6M
	 DRv8HDwijzmWY/67jIDFKq1BlkuwcODaUmGuLQwnpIvt9LjRoXP9PaI8gflmJ8i3wP
	 c86SuDRl9Wm977S+NSsKVjwbigdIWRtwQE8i9H86bD+J23omOL2nXMQrYU7YT8HPQP
	 GH2X2ncA/tHy+HPvYNSWnLpaZkCBCsb8oTwbY54v5R3heuFMWJyAAY4y1Iwt7Y5a72
	 oJfgpcEoXbI+/0/Hn7wyfvMmS2DTYmtRsWGQMfw5jCqWG1J8Z46CbdL/IgCX7u9auF
	 QiW2pizk1QYYQ==
Message-ID: <sashiko-outbox-195595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 15/23] hwmon: (dell-smm) let procfs copy the i8k
 ioctl arguments
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
In-Reply-To: <20261102-work-procfs-drivers-v1-15-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-15-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:18:57 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> Implement ->proc_ioctl_buf() so procfs copies the arguments in before
> it pins the entry and back out after unpinning it. The command numbers
> in <uapi/linux/i8k.h> encode the wrong sizes, so the table lists what
> is really copied: an int or the 16 bytes of the machine id out, and one
> or two ints in.
>=20
> A NULL argument fails with -EFAULT now instead of -EINVAL, and so does
> a bad pointer to SET_FAN from an unprivileged task, which got -EPERM
> before, since procfs copies the argument in before the entry's own
> checks run. 32-bit tasks can use the commands whose numbers don't
> depend on the size of size_t.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D15

