Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719157;
	b=Zap7pBhFLDdO7q3CrhZg5kiD8TFNqkQK/Bb1N/4Gc2VOfcLmNH0iSarctNk6x0Xzzy/m
	 Q71PjHxDaBhLbehc3MiKZCFYyl3p5nq+euSDT875F237JX/+b7apCAjq/Kgmot8R2S0hI
	 snk1/FDlTeJ/kb1K3i4NY91jX1FEf/AG+bKLBGu4n2PBDczoLLSzoLDDdcMqCpQ7GOnGB
	 b2DrBX+/cH2cSPXIRxgSybeBazqyxPTeGTRZNcMVpwwvLDfHAPiEPgI/RSSdaecAqR54+
	 YsPvxobFiL70LL+CFno1s4GEVPIK8HWYMlSq1Zn338nShyid8t3ecEbSCuQA+kdK0Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719157;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=08+d1qfvreEkjdhfCWoVI27IHQFdkJLNOAr+NI9qWps=;
	b=oxoIKNF4uAxwq9ji4aRMFtLFoeW5916pnAXc3tMgNj7Buv15OHWXRAwsxa0Wntw4zFKl
	 9Ueu173QZw7EZq3Hu6urI94C70CfHDlfpppfayzmlbBsI66Q60/VUHGiwlbU7PEl9TZC+
	 a7Gs5TPoZPiQcv5Ne3tzQ4ayC4MUoM9249t3EpBCxOsZUxLKA+47YJxutyhKvLFqo6jCj
	 wtliXDzbzhoJxtVjb6jUbnzzzcWfd5T88+DySdTWfvPHcS9n9fddGu10phUHLX1iA2W+x
	 h3m2HI+LBTDzd8NNyNdFBu6yL0J14JOdECgfxfLmfB8jThzto8GPjwszFEsg6ZoMOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1r9+8r2;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BA60A6F4C
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 15:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82BA60A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i1r9+8r2
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AB3843F40;
	Tue,  3 Nov 2026 15:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73B51F000C1;
	Tue,  3 Nov 2026 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719156;
	bh=08+d1qfvreEkjdhfCWoVI27IHQFdkJLNOAr+NI9qWps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i1r9+8r2Wy5ZjOv4fJ1GoSbUdruq+AKDakXdPym36omcIQj5oI3RDvQXQkk7K2pOH
	 aZOYNjI9zOi+rkLqyjgQUDVNg8zZ4OIRXHIivKTwUb8xi0sYaUhL8HtOq4hFDxlnsC
	 ugaWfdP1eR4O/X8dqLwIEm3+bKrgwf1ndJQeP/YdlN8NK359AzrXxLprhNHYW/1Dpp
	 vL847jEpl/4GoCymsogWvpPgMP5lTJjt0Z9FMjl/iXXQhlwp8eo243i8ta6gWDAkpG
	 R/CGZIXSyz6k4CMqZUTFX4EjDGUfogAbrkZmxlVgTnJiWhIG78B81lpdbWmuce6I3g
	 Nyv+90V+AsLYQ==
Message-ID: <sashiko-outbox-195603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 23/23] ALSA: info: drop the ioctl hook of data
 entries
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
In-Reply-To: <20261102-work-procfs-drivers-v1-23-a994bd4d3b1a@kernel.org>
References: <20261102-work-procfs-drivers-v1-0-a994bd4d3b1a@kernel.org>
 <20261102-work-procfs-drivers-v1-23-a994bd4d3b1a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:19:14 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> No driver implements ->ioctl() of struct snd_info_entry_ops.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-drivers-v1-0-a994bd4d3b1a@kernel.org?part=3D23

