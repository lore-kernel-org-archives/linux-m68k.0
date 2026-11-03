Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717270;
	b=M1ln/GTSJZvvJxIRrV4atSx4p1sAMFlK4Zobh79G+NAnGhcDCniTiQAZ4oGXYkK5Z1Dv
	 uSDo+5ryrCk2vM+Z2L3nH+tRc1/Q4F4V6fnhTtEKHQ9u/rKlV8THGrFA6pU+N0d8U9aEU
	 IWNFVcwAyIg0y3qdLYfW8Vpmd/9by/BgD6WuZtTeDfyfkBNhzaG01BXEKqwCwDYDpjLBu
	 WUpT/6adswmE8wozRwoJ+oYMqxMDUVlewsY1OAFZA+tVgeAn3IKk+u9L1O0iLb+j0fVZ2
	 VH6zK2PYtyoCSJ1OBmUF6h0n7qqU2Ae7ipe7ck2lC3cIZ1L0Fk/TGnsztCSvyBiBoQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717270;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:From:
	 Subject:Reply-To:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date;
	bh=zBynH5IZYgyQFUsVAjOAcJ5nfcoP0yn8vY+uG73McmE=;
	b=5cHgQNuU4FpCxdkZ7S2imrdmj7ckSaKc7bAQwSoNdeOK0cjxXSSApfw6O41MUNkeo3f3
	 Q/GD5a+NzSI5pnRr0m+Qs6FXqPrGHxx2aSS/HM4HCLYdFxYN1skB4qavdi3WbShjKmjnc
	 pB8C+OeeuWqwTi8lsQPIfbp+h65bBUtoC3Ph8mKRwKobSE9aL3FC3Z+AwnPJDXdnyTXeN
	 8s8XQXh2C2msC0cE0nyPLPnLD1B8serzmqABTfO52e/Chr4xStdoUxk4clUsdMRmFBGxB
	 Sxyrs+vOzSl0ac/1qB6IGK1h5ZYr8kqE5l1X8/iFg10TYg8UnKbgT50pB2gzXXp/Xeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W0+szZ/z";
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412086082BF4
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Nov 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412086082BF4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0+szZ/z
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E48D605CF;
	Tue,  3 Nov 2026 14:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E265D1F00A18;
	Tue,  3 Nov 2026 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717269;
	bh=zBynH5IZYgyQFUsVAjOAcJ5nfcoP0yn8vY+uG73McmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0+szZ/zwo28wV5zF2parBxS+5Nv/kl7A3/bt7jYI1tQbVGOtht65KKFMl44iJlKb
	 2TsWpsLSka7w9uTEaPdP7Iq93P5+V8D+quzXN7cHPAigbIaOZxzDITokPt4uHJaCNg
	 63AB4FZAZv4geP5M1V/KUv6syj9b+HqtMj2eLetkjO/egjQ5GEGunX1BwoJl/O8Ssu
	 bKnmaipZkZoedWba9JzbDTT+nON7C/z/f8ds/5jZpvBiRwvWwJzoQ2MgoQoUa4qgE6
	 52QWD1McR+13+jhrpxi0bhfJwC4UaAH+mXNUbzS3lo7La95FoBwBIRwe6n61kWLXjB
	 nsC1eCFGZzPow==
Message-ID: <sashiko-outbox-195483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 11/38] scsi: ips: don't return 0 from writes to the
 proc file
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
In-Reply-To: <20261102-work-procfs-bugfixes-v1-11-59422ed3e465@kernel.org>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-11-59422ed3e465@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:47:47 +0000
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list

> ips_write_info() ignores what is written to /proc/scsi/ips/<n> and
> returns 0. Writers that use stdio, echo for example, take that as no
> progress and retry forever. Return the number of bytes that were
> written.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-work-procf=
s-bugfixes-v1-0-59422ed3e465@kernel.org?part=3D11

